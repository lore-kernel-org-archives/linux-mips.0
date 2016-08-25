Received: from mailapp01.imgtec.com ([195.59.15.196]:52861 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991965AbcHYRh5K1yUs (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 25 Aug 2016 19:37:57 +0200
Subject: [PATCH] MIPS64: MULTU/MADDU/MSUBU emulation bugfix
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Date: Thu, 25 Aug 2016 10:37:38 -0700
Message-ID: <20160825173737.2482.86135.stgit@ubuntu-yegoshin>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, paul.burton@imgtec.com, Nikola.Veljkovic@imgtec.com, ralf@linux-mips.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, andrea.gelmini@gelma.net, macro@imgtec.com
Message-ID: <20160825173738.GuTbCfvCRh3vj7gB1ispfiGbdY1h_fge7Y4EZeuvIso@z>

MIPS instructions MULTU, MADDU and MSUBU emulation requires registers HI/LO
to be converted to signed 32bits before 64bit sign extension on MIPS64.

Bug was found on running MIPS32 R2 test application on MIPS64 R6 kernel.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Reported-by: Nikola.Veljkovic@imgtec.com
---
 arch/mips/kernel/mips-r2-to-r6-emul.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/kernel/mips-r2-to-r6-emul.c b/arch/mips/kernel/mips-r2-to-r6-emul.c
index c3372cac6db2..697f84385665 100644
--- a/arch/mips/kernel/mips-r2-to-r6-emul.c
+++ b/arch/mips/kernel/mips-r2-to-r6-emul.c
@@ -434,8 +434,8 @@ static int multu_func(struct pt_regs *regs, u32 ir)
 	rs = regs->regs[MIPSInst_RS(ir)];
 	res = (u64)rt * (u64)rs;
 	rt = res;
-	regs->lo = (s64)rt;
-	regs->hi = (s64)(res >> 32);
+	regs->lo = (s64)(s32)rt;
+	regs->hi = (s64)(s32)(res >> 32);
 
 	MIPS_R2_STATS(muls);
 
@@ -671,9 +671,9 @@ static int maddu_func(struct pt_regs *regs, u32 ir)
 	res += ((((s64)rt) << 32) | (u32)rs);
 
 	rt = res;
-	regs->lo = (s64)rt;
+	regs->lo = (s64)(s32)rt;
 	rs = res >> 32;
-	regs->hi = (s64)rs;
+	regs->hi = (s64)(s32)rs;
 
 	MIPS_R2_STATS(dsps);
 
@@ -729,9 +729,9 @@ static int msubu_func(struct pt_regs *regs, u32 ir)
 	res = ((((s64)rt) << 32) | (u32)rs) - res;
 
 	rt = res;
-	regs->lo = (s64)rt;
+	regs->lo = (s64)(s32)rt;
 	rs = res >> 32;
-	regs->hi = (s64)rs;
+	regs->hi = (s64)(s32)rs;
 
 	MIPS_R2_STATS(dsps);
 
