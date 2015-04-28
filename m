Received: from mailapp01.imgtec.com ([195.59.15.196]:62818 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011885AbbD1WLvzqHpp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 29 Apr 2015 00:11:51 +0200
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: [PATCH] MIPS: pistachio: Support 8250-based early printk
Date: Tue, 28 Apr 2015 19:08:35 -0300
Message-ID: <1430258915-28943-1-git-send-email-ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Ezequiel.Garcia@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, James Hartley <james.hartley@imgtec.com>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Message-ID: <20150428220835.SWsB2FrvlxOPLFzImefmAgi8IkZyq9B913wqa87A4t8@z>

Pistachio SoCs are capable of early printk with generic 8250 support,
so let's select the options to enable it.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
---
 arch/mips/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f501665..29d558d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -386,6 +386,8 @@ config MACH_PISTACHIO
 	select SYS_SUPPORTS_MIPS_CPS
 	select SYS_SUPPORTS_MULTITHREADING
 	select SYS_SUPPORTS_ZBOOT
+	select SYS_HAS_EARLY_PRINTK
+	select USE_GENERIC_EARLY_PRINTK_8250
 	select USE_OF
 	help
 	  This enables support for the IMG Pistachio SoC platform.
-- 
2.3.3
