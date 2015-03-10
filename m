Received: from mailapp01.imgtec.com ([195.59.15.196]:8817 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007716AbbCJMbKCgnhM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 10 Mar 2015 13:31:10 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id E64E74EDC6A55
        for <linux-mips@linux-mips.org>; Tue, 10 Mar 2015 12:31:01 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: Kconfig: Fix typo for the r2-to-r6 emulator kernel parameter
Date: Tue, 10 Mar 2015 12:30:56 +0000
Message-ID: <1425990656-2063-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150310123056.3fY8KpmZQEsgmtVqi3LEtqXpgMg9ntSkzLwhFUng5lE@z>

Commit b0a668fb2038 ("MIPS: kernel: mips-r2-to-r6-emul: Add R2 emulator
for MIPS R6") added the mips r2-to-r6 emulator so an R2 userland can be
executed on R6 kernels. This needed both build time and runtime support.
The runtime support needed the "mipsr2emu" kernel parameter instead of
the "mipsr2emul" listed in the Kconfig help message.

Fixes: b0a668fb2038 ("MIPS: kernel: mips-r2-to-r6-emul: Add R2 emulator for MIPS R6")
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c7a16904cd03..bb332109f2ca 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2072,7 +2072,7 @@ config MIPSR2_TO_R6_EMULATOR
 	help
 	  Choose this option if you want to run non-R6 MIPS userland code.
 	  Even if you say 'Y' here, the emulator will still be disabled by
-	  default. You can enable it using the 'mipsr2emul' kernel option.
+	  default. You can enable it using the 'mipsr2emu' kernel option.
 	  The only reason this is a build-time option is to save ~14K from the
 	  final kernel image.
 comment "MIPS R2-to-R6 emulator is only available for UP kernels"
-- 
2.3.1
