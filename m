Received: from mailapp01.imgtec.com ([195.59.15.196]:10695 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991978AbcKGPIrEFndw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Nov 2016 16:08:47 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 3/6] MIPS: Fix get_frame_info() handling of microMIPS function size
Date: Mon, 7 Nov 2016 15:07:04 +0000
Message-ID: <20161107150707.5079-4-paul.burton@imgtec.com>
In-Reply-To: <20161107150707.5079-1-paul.burton@imgtec.com>
References: <20161107150707.5079-1-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, Leonid Yegoshin <leonid.yegoshin@imgtec.com>, "# v3 . 10+" <stable@vger.kernel.org>
Message-ID: <20161107150704.uqHpNE-V3Xo7umU1FHnz25MUNRnWlzPC8dvtGJCLCbw@z>

get_frame_info() is meant to iterate over up to the first 128
instructions within a function, but for microMIPS kernels it will not
reach that many instructions unless the function is 512 bytes long since
we calculate the maximum number of instructions to check by dividing the
function length by the 4 byte size of a union mips_instruction. In
microMIPS kernels this won't do since instructions are variable length.

Fix this by instead checking whether the pointer to the current
instruction has reached the end of the function, and use max_insns as a
simple constant to check the number of iterations against.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Fixes: 34c2f668d0f6 ("MIPS: microMIPS: Add unaligned access support.")
Cc: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Leonid Yegoshin <leonid.yegoshin@imgtec.com>
Cc: <stable@vger.kernel.org> # v3.10+
---

 arch/mips/kernel/process.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 941a881..d56ef4b 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -293,9 +293,9 @@ static inline int is_sp_move_ins(union mips_instruction *ip)
 static int get_frame_info(struct mips_frame_info *info)
 {
 	bool is_mmips = IS_ENABLED(CONFIG_CPU_MICROMIPS);
-	union mips_instruction insn, *ip;
-	unsigned max_insns = info->func_size / sizeof(union mips_instruction);
-	unsigned i;
+	union mips_instruction insn, *ip, *ip_end;
+	const unsigned int max_insns = 128;
+	unsigned int i;
 
 	info->pc_offset = -1;
 	info->frame_size = 0;
@@ -304,11 +304,9 @@ static int get_frame_info(struct mips_frame_info *info)
 	if (!ip)
 		goto err;
 
-	if (max_insns == 0)
-		max_insns = 128U;	/* unknown function size */
-	max_insns = min(128U, max_insns);
+	ip_end = (void *)ip + info->func_size;
 
-	for (i = 0; i < max_insns; i++, ip++) {
+	for (i = 0; i < max_insns && ip < ip_end; i++, ip++) {
 		if (is_mmips && mm_insn_16bit(ip->halfword[0])) {
 			insn.halfword[0] = 0;
 			insn.halfword[1] = ip->halfword[0];
-- 
2.10.2
