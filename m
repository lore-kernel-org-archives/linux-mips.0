Received: from mailapp01.imgtec.com ([195.59.15.196]:58761 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010762AbbDWM2sT9WsA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 Apr 2015 14:28:48 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: bcm47xx: Move the BCM47XX board types under a choice symbol
Date: Thu, 23 Apr 2015 13:28:13 +0100
Message-ID: <1429792093-8160-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Message-ID: <20150423122813.u3fwWHASRR9PvJf_IW8vg5SPj5OtSwTPZqiQJmKTvb0@z>

Since the build system expects one of the two types to be selected,
it's better if we move these symbols under a new choice symbol.
Moreover, this fixes the following build problem when no board is
selected:

In file included from arch/mips/bcm47xx/irq.c:32:0:
./arch/mips/include/asm/mach-bcm47xx/bcm47xx.h:34:1: error: expected identifier
before '}' token };
                 ^
Cc: "Rafał Miłecki" <zajec5@gmail.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/bcm47xx/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/bcm47xx/Kconfig b/arch/mips/bcm47xx/Kconfig
index fc21d3659fa0..39e24407709e 100644
--- a/arch/mips/bcm47xx/Kconfig
+++ b/arch/mips/bcm47xx/Kconfig
@@ -1,5 +1,9 @@
 if BCM47XX
 
+choice
+	prompt "Board type"
+	default BCM47XX_SSB
+
 config BCM47XX_SSB
 	bool "SSB Support for Broadcom BCM47XX"
 	select SYS_HAS_CPU_BMIPS32_3300
@@ -34,4 +38,6 @@ config BCM47XX_BCMA
 
 	 This will generate an image with support for BCMA and MIPS32 R2 instruction set.
 
+endchoice
+
 endif
-- 
2.3.5
