Received: from mailapp01.imgtec.com ([195.89.28.115]:22644 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-FAIL-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S6839028AbaEGLVkQagbZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 May 2014 13:21:40 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 42951F6C9ABEC
        for <linux-mips@linux-mips.org>; Wed,  7 May 2014 12:21:31 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 4/5] MIPS: Malta: hang on halt
Date: Wed, 7 May 2014 12:20:59 +0100
Message-ID: <1399461660-17623-5-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1399461660-17623-1-git-send-email-paul.burton@imgtec.com>
References: <1399461660-17623-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140507112059.sQCfROmtm0lNtpUolDrFyEiq6e5lqaxxgIsSCIFwheY@z>

When the system is halted it makes little sense to reset it. Instead,
hang by executing an infinite loop.

Suggested-by: Maciej W. Rozycki <macro@linux-mips.org>
Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/mti-malta/malta-reset.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/mips/mti-malta/malta-reset.c b/arch/mips/mti-malta/malta-reset.c
index d627d4b..4471dea 100644
--- a/arch/mips/mti-malta/malta-reset.c
+++ b/arch/mips/mti-malta/malta-reset.c
@@ -24,17 +24,20 @@ static void mips_machine_restart(char *command)
 
 static void mips_machine_halt(void)
 {
-	unsigned int __iomem *softres_reg =
-		ioremap(SOFTRES_REG, sizeof(unsigned int));
+	pr_info("Halting\n");
+	while (true);
+}
 
-	__raw_writel(GORESET, softres_reg);
+static void mips_machine_power_off(void)
+{
+	mips_machine_restart(NULL);
 }
 
 static int __init mips_reboot_setup(void)
 {
 	_machine_restart = mips_machine_restart;
 	_machine_halt = mips_machine_halt;
-	pm_power_off = mips_machine_halt;
+	pm_power_off = mips_machine_power_off;
 
 	return 0;
 }
-- 
1.8.5.3
