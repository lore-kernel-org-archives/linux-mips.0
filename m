Received: from mailapp01.imgtec.com ([195.59.15.196]:11708 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991984AbcIBPwdDp8PA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Sep 2016 17:52:33 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 10/12] MIPS: Malta: Remove custom halt implementation
Date: Fri, 2 Sep 2016 16:48:56 +0100
Message-ID: <20160902154859.24269-11-paul.burton@imgtec.com>
In-Reply-To: <20160902154859.24269-1-paul.burton@imgtec.com>
References: <20160902154859.24269-1-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20160902154856.bEJkAs2ele-syh8TGaQAllhkSKvR3JUY6paSK8FqGFE@z>

The arch code will hang the machine with an infinite loop if the board
doesn't provide an impelementation of halt - let it, rather than
duplicating it.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/mti-malta/malta-reset.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/mips/mti-malta/malta-reset.c b/arch/mips/mti-malta/malta-reset.c
index 04d6b9c..dd6f62a 100644
--- a/arch/mips/mti-malta/malta-reset.c
+++ b/arch/mips/mti-malta/malta-reset.c
@@ -13,11 +13,6 @@
 #include <asm/reboot.h>
 #include <asm/mach-malta/malta-pm.h>
 
-static void mips_machine_halt(void)
-{
-	while (true);
-}
-
 static void mips_machine_power_off(void)
 {
 	mips_pm_suspend(PIIX4_FUNC3IO_PMCNTRL_SUS_TYP_SOFF);
@@ -28,7 +23,6 @@ static void mips_machine_power_off(void)
 
 static int __init mips_reboot_setup(void)
 {
-	_machine_halt = mips_machine_halt;
 	pm_power_off = mips_machine_power_off;
 
 	return 0;
-- 
2.9.3
