Received: from mailapp01.imgtec.com ([195.59.15.196]:53316 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008727AbbFVLWUAqgr3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 22 Jun 2015 13:22:20 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v3 3/3] MIPS: MSA unaligned memory access support
Date: Mon, 22 Jun 2015 12:21:00 +0100
Message-ID: <1434972060-8865-4-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1434972060-8865-1-git-send-email-paul.burton@imgtec.com>
References: <1434972060-8865-1-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Huacai Chen <chenhc@lemote.com>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-kernel@vger.kernel.org, Jie Chen <chenj@lemote.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150622112100.OnM1uumsqf66qHp50aXkLlmlC6q5JlWQlLXueHlnfLs@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

The MSA architecture specification allows for hardware to not implement
unaligned vector memory accesses in some or all cases. A typical example
of this is the I6400 core which does not implement unaligned vector
memory access when the memory crosses a page boundary. The architecture
also requires that such memory accesses complete successfully as far as
userland is concerned, so the kernel is required to emulate them.

This patch implements support for emulating unaligned MSA ld & st
instructions by copying between the user memory & the tasks FP context
in struct thread_struct, updating hardware registers from there as
appropriate in order to avoid saving & restoring the entire vector
context for each unaligned memory access.

Tested both using an I6400 CPU and with a QEMU build hacked to produce
AdEL exceptions for unaligned vector memory accesses.

[paul.burton@imgtec.com:
  - Remove #ifdef's
  - Move msa_op into enum major_op rather than #define
  - Replace msa_{to,from}_wd with {read,write}_msa_wr_{b,h,w,l} and the
    format-agnostic wrappers, removing the custom endian mangling for
    big endian systems.
  - Restructure the msa_op case in emulate_load_store_insn to share
    more code between the load & store cases.
  - Avoid the need for a temporary union fpureg on the stack by simply
    reusing the already suitably aligned context in struct
    thread_struct.
  - Use sizeof(*fpr) rather than hardcoding 16 as the size for user
    memory checks & copies.
  - Stop recalculating the address of the unaligned vector memory access
    and rely upon the value read from BadVAddr as we do for other
    unaligned memory access instructions.
  - Drop the now unused val8 & val16 fields in union fpureg.
  - Rewrite commit message.
  - General formatting cleanups.]

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

Changes in v3:
- Remove #ifdef's.
- Move msa_op into enum major_op rather than #define.
- Replace msa_{to,from}_wd with {read,write}_msa_wr_{b,h,w,l} and the format-agnostic wrappers, removing the custom endian mangling for big endian systems.
- Restructure the msa_op case in emulate_load_store_insn to share more code between the load & store cases.
- Avoid the need for a temporary union fpureg on the stack by simply reusing the already suitably aligned context in struct thread_struct.
- Use sizeof(*fpr) rather than hardcoding 16 as the size for user memory checks & copies.
- Stop recalculating the address of the unaligned vector memory access and rely upon the value read from BadVAddr as we do for other unaligned memory access instructions.
- Drop the now unused val8 & val16 fields in union fpureg.
- Rewrite commit message.
- General formatting cleanups.

Changes in v2:
- added a missed assignment in double-word case of BIG ENDIAN conversion
- added a missed initial allignment in block of assembler mini-functions to get/put MSA register.
- added a missed preempt_disable() in ST.D unalignment processing

 arch/mips/kernel/unaligned.c | 72 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
index af84bef..a2e680d 100644
--- a/arch/mips/kernel/unaligned.c
+++ b/arch/mips/kernel/unaligned.c
@@ -891,6 +891,9 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 #ifdef	CONFIG_EVA
 	mm_segment_t seg;
 #endif
+	union fpureg *fpr;
+	enum msa_2b_fmt df;
+	unsigned int wd;
 	origpc = (unsigned long)pc;
 	orig31 = regs->regs[31];
 
@@ -1202,6 +1205,75 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 			break;
 		return;
 
+	case msa_op:
+		if (!cpu_has_msa)
+			goto sigill;
+
+		/*
+		 * If we've reached this point then userland should have taken
+		 * the MSA disabled exception & initialised vector context at
+		 * some point in the past.
+		 */
+		BUG_ON(!thread_msa_context_live());
+
+		df = insn.msa_mi10_format.df;
+		wd = insn.msa_mi10_format.wd;
+		fpr = &current->thread.fpu.fpr[wd];
+
+		switch (insn.msa_mi10_format.func) {
+		case msa_ld_op:
+			if (!access_ok(VERIFY_READ, addr, sizeof(*fpr)))
+				goto sigbus;
+
+			/*
+			 * Disable preemption to avoid a race between copying
+			 * state from userland, migrating to another CPU and
+			 * updating the hardware vector register below.
+			 */
+			preempt_disable();
+
+			res = __copy_from_user_inatomic(fpr, addr,
+							sizeof(*fpr));
+			if (res)
+				goto fault;
+
+			/*
+			 * Update the hardware register if it is in use by the
+			 * task in this quantum, in order to avoid having to
+			 * save & restore the whole vector context.
+			 */
+			if (test_thread_flag(TIF_USEDMSA))
+				write_msa_wr(wd, fpr, df);
+
+			preempt_enable();
+			break;
+
+		case msa_st_op:
+			if (!access_ok(VERIFY_WRITE, addr, sizeof(*fpr)))
+				goto sigbus;
+
+			/*
+			 * Update from the hardware register if it is in use by
+			 * the task in this quantum, in order to avoid having to
+			 * save & restore the whole vector context.
+			 */
+			preempt_disable();
+			if (test_thread_flag(TIF_USEDMSA))
+				read_msa_wr(wd, fpr, df);
+			preempt_enable();
+
+			res = __copy_to_user_inatomic(addr, fpr, sizeof(*fpr));
+			if (res)
+				goto fault;
+			break;
+
+		default:
+			goto sigbus;
+		}
+
+		compute_return_epc(regs);
+		break;
+
 #ifndef CONFIG_CPU_MIPSR6
 	/*
 	 * COP2 is available to implementor for application specific use.
-- 
2.4.2
