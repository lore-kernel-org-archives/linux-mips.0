Received: from mailapp01.imgtec.com ([195.59.15.196]:16775 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993875AbdBNOhVq0cnI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Feb 2017 15:37:21 +0100
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 2/4] MIPS: R6: Constify r2_decoder_tables
Date: Tue, 14 Feb 2017 14:37:06 +0000
Message-ID: <1487083028-19724-2-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1487083028-19724-1-git-send-email-matt.redfearn@imgtec.com>
References: <1487083028-19724-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <20170214143706.yKCqWGDOgr1I6w16DkI7LiK1b3YgkkSNdq38KPG9b1o@z>

The r2_decoder_tables are never modified. They are arrays of constant
values and as such should be declared const.

This change saves 256 bytes of kernel text, and 128 bytes of kernel data
(384 bytes total) on a 32r6el_defconfig (with SMP disabled)
Before:
   text	   data	    bss	    dec	    hex	filename
5576221	1080804	 267040	6924065	 69a721	vmlinux
After:
   text	   data	    bss	    dec	    hex	filename
5575965	1080676	 267040	6923681	 69a5a1	vmlinux

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 arch/mips/kernel/mips-r2-to-r6-emul.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/mips-r2-to-r6-emul.c b/arch/mips/kernel/mips-r2-to-r6-emul.c
index d8f1cf1ec370..7d1fe0448640 100644
--- a/arch/mips/kernel/mips-r2-to-r6-emul.c
+++ b/arch/mips/kernel/mips-r2-to-r6-emul.c
@@ -600,7 +600,7 @@ static int ddivu_func(struct pt_regs *regs, u32 ir)
 }
 
 /* R6 removed instructions for the SPECIAL opcode */
-static struct r2_decoder_table spec_op_table[] = {
+static const struct r2_decoder_table spec_op_table[] = {
 	{ 0xfc1ff83f, 0x00000008, jr_func },
 	{ 0xfc00ffff, 0x00000018, mult_func },
 	{ 0xfc00ffff, 0x00000019, multu_func },
@@ -867,7 +867,7 @@ static int dclo_func(struct pt_regs *regs, u32 ir)
 }
 
 /* R6 removed instructions for the SPECIAL2 opcode */
-static struct r2_decoder_table spec2_op_table[] = {
+static const struct r2_decoder_table spec2_op_table[] = {
 	{ 0xfc00ffff, 0x70000000, madd_func },
 	{ 0xfc00ffff, 0x70000001, maddu_func },
 	{ 0xfc0007ff, 0x70000002, mul_func },
@@ -881,9 +881,9 @@ static struct r2_decoder_table spec2_op_table[] = {
 };
 
 static inline int mipsr2_find_op_func(struct pt_regs *regs, u32 inst,
-				      struct r2_decoder_table *table)
+				      const struct r2_decoder_table *table)
 {
-	struct r2_decoder_table *p;
+	const struct r2_decoder_table *p;
 	int err;
 
 	for (p = table; p->func; p++) {
-- 
2.7.4
