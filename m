Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022186;
	b=eD3phGooPw/YUrj8+ziBlg25iTJy+jo5mfLZuq3yG+DtlGEfL7aT+EhnjcHrX6RUxYEp
	 QUV9kw8yU5Vd/627MLrbLUSW1LGVUbOALmIQESptFZ+i3/Zf9f1t4lPtfECzYmwBqlyud
	 j4IpB5ypeieKFamoRSU5PP+Rw10/KzHAYULTfQdQ9JMr8079+j9swXx5te1obvL+6+06m
	 TqAuWPHIwBeVPH8kNc7LB4tzDHE5vbBExZwLgeHKSugx9N6DswIRtKYD/6GFO76l1Uj45
	 ue3QkWjEZgIP1j1k/+cQXVot1qHBHlBwh+YDKCs1heohkimRRV3LSu8WWiilVGGoJ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022186;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bTtTCr/oA5b7SA3jxnX5wrCk7AUepNaXODTXisiM12s=;
	b=2r/NSnuodmU8ZQDYlAoI/d/jJGrjkqhDV/vW7/O/Nr4iFwltkU6YQjaHfXx7D6NTkX6j
	 gw7ma2EphqyNC71sx6NBwHUU1iulGE1x/7rNqOQxDEmUa+5ZPMIsNrdSMOL/RL88n6GlL
	 4G6G6Yzyt//wgPSalai3sgKylvzRypILY/lXR+pHmtEJ3cCj4zGcOR69fTtTVOt7OjqrA
	 De0ihz4mS8M8BbyMCsR7nZXzCCsjp0ifzaP14Odq/TYUnl1pel31aHPv/JTgUpiicuYzq
	 SC/j4zrnMNMHV1HIkqdRWIK44DW9qmzjX14ajQIFOZjcy5CGyAr3kaWGB4jLTlWMmcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E3dEOAkR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5720B606A330;
	Mon, 26 Oct 2026 13:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E3dEOAkR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044CE1F031E2;
	Mon, 26 Oct 2026 13:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793022185;
	bh=bTtTCr/oA5b7SA3jxnX5wrCk7AUepNaXODTXisiM12s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E3dEOAkRL9Ctj3IkS7preRn+tPPr2TU/529fNYw62jv0TivRaNMbpaDEoGYaXR7q8
	 rKu4bmL1p1pNf3G8uz7IW4Wa5MtjB53RTOYf0+fgRFFdn9/D/YK7H0nfaNgEgWEiIL
	 4mmsM1pSLE496C5aQGp7TxjruFiSffJQ/pf6lu338hy0x2XobI4wly9i+LVL/0Mcfw
	 AjLugBRFlAkEA3+Lxr8Ivg+UN4WjWdyrXZ4/Zjt7mDirjO5y33u69da+Cvbku4wvpT
	 VXQ1NPlsLY1WSyKoQAAuEdRQIty4r2BaVwgpxKaTgzKhB8h+DpvFmfyVwyIBwPMA+r
	 b9NAsV3uFhx0g==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] MIPS: Select the R10000 LL/SC workaround at boot
Date: Mon, 26 Oct 2026 14:41:42 +0100
Message-ID: <20261026134147.15988-3-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026134147.15988-1-kaloz@kernel.org>
References: <20261026134147.15988-1-kaloz@kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only R10000s before revision 3.0 need the branch-likely sc retry of
CONFIG_WAR_R10000_LLSC, which the whole family mispredicts.

Patch the SC_BEQZ sites to beqz at boot and module load unless a CPU
needs it; once patched, do not start such a CPU.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---

Notes:
    checkpatch reports an ERROR (spaces around ':') and a do-while WARNING
    for SC_BEQZ. Its body is assembler text pasted into inline asm through
    __stringify(), not C: '9999:' is a GAS local label and ';' separates
    assembler statements. The new files fall under the MIPS entry in
    MAINTAINERS (F: arch/mips/).

 arch/mips/Kconfig                 |   5 +-
 arch/mips/include/asm/asm.h       |   7 +-
 arch/mips/include/asm/r10k-llsc.h |  29 ++++++++
 arch/mips/kernel/Makefile         |   1 +
 arch/mips/kernel/module.c         |   5 ++
 arch/mips/kernel/r10k-llsc.c      | 111 ++++++++++++++++++++++++++++++
 arch/mips/kernel/setup.c          |   2 +
 arch/mips/kernel/smp.c            |   2 +
 arch/mips/kernel/vmlinux.lds.S    |   8 +++
 9 files changed, 166 insertions(+), 4 deletions(-)
 create mode 100644 arch/mips/include/asm/r10k-llsc.h
 create mode 100644 arch/mips/kernel/r10k-llsc.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d7c67cebe065..f27d189922fe 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2540,8 +2540,9 @@ config WAR_TX49XX_ICACHE_INDEX_INV
 config WAR_ICACHE_REFILLS
 	bool
 
-# On the R10000 up to version 2.6 (not sure about 2.7) there is a bug that
-# may cause ll / sc and lld / scd sequences to execute non-atomically.
+# R10000 CPUs before revision 3.0 may execute ll/sc and lld/scd sequences
+# non-atomically. Platforms that may have such a CPU select this, and the
+# workaround is dropped at boot when no such CPU is present.
 config WAR_R10000_LLSC
 	bool
 
diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
index 0ed19ffed076..e69d5fb6c1a7 100644
--- a/arch/mips/include/asm/asm.h
+++ b/arch/mips/include/asm/asm.h
@@ -335,10 +335,13 @@ symbol		=	value
 /*
  * Using a branch-likely instruction to check the result of an sc instruction
  * works around a bug present in R10000 CPUs prior to revision 3.0 that could
- * cause ll-sc sequences to execute non-atomically.
+ * cause ll-sc sequences to execute non-atomically. The address of each such
+ * branch is recorded so that it can be turned into a beqz at boot when no
+ * affected CPU is present.
  */
 #ifdef CONFIG_WAR_R10000_LLSC
-# define SC_BEQZ	beqzl
+# define SC_BEQZ	.pushsection __r10k_llsc, "a"; PTR_WD 9999f;	\
+			.popsection; 9999: beqzl
 #elif !defined(CONFIG_CC_HAS_BROKEN_INLINE_COMPAT_BRANCH) && MIPS_ISA_REV >= 6
 # define SC_BEQZ	beqzc
 #else
diff --git a/arch/mips/include/asm/r10k-llsc.h b/arch/mips/include/asm/r10k-llsc.h
new file mode 100644
index 000000000000..0f0e9b3b03a0
--- /dev/null
+++ b/arch/mips/include/asm/r10k-llsc.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_R10K_LLSC_H
+#define _ASM_R10K_LLSC_H
+
+#include <linux/types.h>
+
+#ifdef CONFIG_WAR_R10000_LLSC
+extern bool r10k_llsc_war;
+extern const unsigned long __start___r10k_llsc[], __stop___r10k_llsc[];
+
+void r10k_llsc_note_cpu(unsigned int prid);
+void r10k_llsc_init(void);
+void r10k_llsc_check_secondary(void);
+unsigned int r10k_llsc_patch(const unsigned long *start,
+			     const unsigned long *end);
+#else
+#define r10k_llsc_war	false
+
+static inline void r10k_llsc_note_cpu(unsigned int prid) { }
+static inline void r10k_llsc_init(void) { }
+static inline void r10k_llsc_check_secondary(void) { }
+static inline unsigned int r10k_llsc_patch(const unsigned long *start,
+					   const unsigned long *end)
+{
+	return 0;
+}
+#endif
+
+#endif /* _ASM_R10K_LLSC_H */
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index 95a1e674fd67..cd992852c31d 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_CPU_R2300_FPU)	+= r2300_fpu.o
 obj-$(CONFIG_CPU_R4K_FPU)	+= r4k_fpu.o
 
 obj-$(CONFIG_SMP)		+= smp.o
+obj-$(CONFIG_WAR_R10000_LLSC)	+= r10k-llsc.o
 obj-$(CONFIG_SMP_UP)		+= smp-up.o
 obj-$(CONFIG_CPU_BMIPS)		+= smp-bmips.o bmips_vec.o bmips_5xxx_init.o
 
diff --git a/arch/mips/kernel/module.c b/arch/mips/kernel/module.c
index 37dea772fd78..e47d0d530790 100644
--- a/arch/mips/kernel/module.c
+++ b/arch/mips/kernel/module.c
@@ -20,6 +20,7 @@
 #include <linux/spinlock.h>
 #include <linux/jump_label.h>
 #include <asm/jump_label.h>
+#include <asm/r10k-llsc.h>
 
 struct mips_hi16 {
 	struct mips_hi16 *next;
@@ -423,6 +424,10 @@ int module_finalize(const Elf_Ehdr *hdr,
 
 	INIT_LIST_HEAD(&me->arch.dbe_list);
 	for (s = sechdrs; s < sechdrs + hdr->e_shnum; s++) {
+		if (IS_ENABLED(CONFIG_WAR_R10000_LLSC) &&
+		    !strcmp("__r10k_llsc", secstrings + s->sh_name))
+			r10k_llsc_patch((void *)s->sh_addr,
+					(void *)s->sh_addr + s->sh_size);
 		if (strcmp("__dbe_table", secstrings + s->sh_name) != 0)
 			continue;
 		me->arch.dbe_start = (void *)s->sh_addr;
diff --git a/arch/mips/kernel/r10k-llsc.c b/arch/mips/kernel/r10k-llsc.c
new file mode 100644
index 000000000000..32fd79716bf0
--- /dev/null
+++ b/arch/mips/kernel/r10k-llsc.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * R10000 CPUs before revision 3.0 may execute an ll/sc sequence
+ * non-atomically, and those up to revision 2.6 may hang in one, unless the
+ * branch retrying the sequence is a branch-likely. A kernel that may run on
+ * such a CPU is built with branch-likely retry loops, and each of them is
+ * recorded in the __r10k_llsc table. The R10000 family always predicts a
+ * branch-likely taken, so every successful sc then costs a mispredict; the
+ * recorded branches are turned into plain beqz at boot unless an affected CPU
+ * is present.
+ */
+#define pr_fmt(fmt) "r10k-llsc: " fmt
+
+#include <linux/bug.h>
+#include <linux/cache.h>
+#include <linux/cacheflush.h>
+#include <linux/init.h>
+#include <linux/printk.h>
+#include <linux/processor.h>
+#include <linux/smp.h>
+
+#include <asm/cpu.h>
+#include <asm/cpu-info.h>
+#include <asm/inst.h>
+#include <asm/r10k-llsc.h>
+
+/* Until r10k_llsc_init() has run, every recorded branch is a branch-likely. */
+bool r10k_llsc_war __ro_after_init = true;
+
+static unsigned int r10k_llsc_prid;
+
+static bool r10k_llsc_affected(unsigned int prid)
+{
+	return (prid & (PRID_COMP_MASK | PRID_IMP_MASK)) ==
+	       (PRID_COMP_LEGACY | PRID_IMP_R10000) &&
+	       (prid & PRID_REV_MASK) < PRID_REV_ENCODE_44(3, 0);
+}
+
+/*
+ * A platform whose CPUs may differ reports each CPU it will start here before
+ * r10k_llsc_init(), so that the choice covers the whole machine.
+ */
+void r10k_llsc_note_cpu(unsigned int prid)
+{
+	if (!r10k_llsc_prid && r10k_llsc_affected(prid))
+		r10k_llsc_prid = prid;
+}
+
+unsigned int r10k_llsc_patch(const unsigned long *start,
+			     const unsigned long *end)
+{
+	const unsigned long *p;
+	unsigned int n = 0;
+
+	if (r10k_llsc_war)
+		return 0;
+
+	for (p = start; p < end; p++) {
+		union mips_instruction *insn = (void *)*p;
+
+		/* Only a nop in the delay slot behaves alike under both. */
+		if (WARN_ONCE(insn[0].i_format.opcode != beql_op ||
+			      insn[0].i_format.rt || insn[1].word,
+			      "unexpected sc retry branch at %pS\n", insn))
+			continue;
+
+		insn[0].i_format.opcode = beq_op;
+		flush_icache_range((unsigned long)insn,
+				   (unsigned long)(insn + 1));
+		n++;
+	}
+
+	return n;
+}
+
+void __init r10k_llsc_init(void)
+{
+	unsigned int prid, n;
+
+	r10k_llsc_note_cpu(current_cpu_data.processor_id);
+	prid = r10k_llsc_prid;
+
+	if (prid) {
+		pr_info("enabled for R10000 revision %u.%u\n",
+			(prid >> 4) & 0xf, prid & 0xf);
+		return;
+	}
+
+	r10k_llsc_war = false;
+	n = r10k_llsc_patch(__start___r10k_llsc, __stop___r10k_llsc);
+	pr_info("not needed, %u of %lu sc retry branches patched\n", n,
+		__stop___r10k_llsc - __start___r10k_llsc);
+}
+
+/*
+ * Once the workaround has been dropped, any retry branch a CPU runs may be
+ * a plain beqz, so an affected CPU found only now is kept out of the
+ * system.
+ */
+void r10k_llsc_check_secondary(void)
+{
+	unsigned int prid = current_cpu_data.processor_id;
+
+	if (r10k_llsc_war || !r10k_llsc_affected(prid))
+		return;
+
+	pr_crit("CPU%u: R10000 revision %u.%u needs the ll/sc workaround, not starting it\n",
+		smp_processor_id(), (prid >> 4) & 0xf, prid & 0xf);
+	for (;;)
+		cpu_relax();
+}
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 1ae6d0c0e1d6..8f5f8e473a8a 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -46,6 +46,7 @@
 #include <asm/smp-ops.h>
 #include <asm/mips-cps.h>
 #include <asm/prom.h>
+#include <asm/r10k-llsc.h>
 #include <asm/fw/fw.h>
 
 #ifdef CONFIG_MIPS_ELF_APPENDED_DTB
@@ -783,6 +784,7 @@ void __init setup_arch(char **cmdline_p)
 	prefill_possible_map();
 
 	cpu_cache_init();
+	r10k_llsc_init();
 	pagetable_init();
 
 	memblock_dump_all();
diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 0f28b4a62e72..8d32c252117a 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -33,6 +33,7 @@
 #include <asm/processor.h>
 #include <asm/idle.h>
 #include <asm/r4k-timer.h>
+#include <asm/r10k-llsc.h>
 #include <asm/mips-cps.h>
 #include <asm/mmu_context.h>
 #include <asm/time.h>
@@ -360,6 +361,7 @@ asmlinkage void start_secondary(void)
 	unsigned int cpu = raw_smp_processor_id();
 
 	cpu_probe();
+	r10k_llsc_check_secondary();
 	per_cpu_trap_init(false);
 	rcutree_report_cpu_starting(cpu);
 	mips_clockevent_init();
diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index 579b2cc1995a..e7c4103037bb 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -128,6 +128,14 @@ SECTIONS
 		__mips_machines_end = .;
 	}
 
+#ifdef CONFIG_WAR_R10000_LLSC
+	__r10k_llsc : AT(ADDR(__r10k_llsc) - LOAD_OFFSET) {
+		__start___r10k_llsc = .;
+		KEEP(*(__r10k_llsc))
+		__stop___r10k_llsc = .;
+	}
+#endif
+
 	/* .exit.text is discarded at runtime, not link time, to deal with
 	 * references from .rodata
 	 */
-- 
2.47.3

