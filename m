Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:34527 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990439AbdKNRQpCy5Lh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Nov 2017 18:16:45 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH] MIPS: BCM47XX Avoid compile error with MIPS allnoconfig
Date: Tue, 14 Nov 2017 17:16:27 +0000
Message-ID: <1510679787-7944-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@mips.com>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, linux-kernel@vger.kernel.org
Message-ID: <20171114171627.CWpS-DqsVFEOygXEdwj2vEiXleA1mj7HjfbPLk7hzkE@z>

Currently MIPS allnoconfig with CONFIG_BCM47XX=y fails to compile due to
neither BCM47XX_BCMA nor BCM47XX_SSB being selected. This leads the
enumeration in arch/mips/include/asm/mach-bcm47xx/bcm47xx.h to be empty,
and compilation fails:

In file included from arch/mips/bcm47xx/irq.c:32:0:
./arch/mips/include/asm/mach-bcm47xx/bcm47xx.h:34:1: error: expected
identifier before '}' token
 };
 ^
make[2]: *** [scripts/Makefile.build:314: arch/mips/bcm47xx/irq.o] Error 1

Fix this by ensuring that BCM47XX_SSB is selected if BCM47XX_BCMA is
not. This allows us to select either system or both, but not neither.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 350a990fc719..659e0079487f 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -259,6 +259,7 @@ config BCM47XX
 	select LEDS_GPIO_REGISTER
 	select BCM47XX_NVRAM
 	select BCM47XX_SPROM
+	select BCM47XX_SSB if !BCM47XX_BCMA
 	help
 	 Support for BCM47XX based boards
 
-- 
2.7.4
