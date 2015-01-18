Received: from mailapp01.imgtec.com ([195.59.15.196]:10275 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011790AbbARWoGj5EgN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 18 Jan 2015 23:44:06 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 36/36] MIPS: allow jz4780 to be selected in Kconfig
Date: Sun, 18 Jan 2015 14:43:52 -0800
Message-ID: <1421621032-25943-1-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com>
References: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <20150118224352._krZGsgBWV0LQeevZ8HUNf4XKSh4WP8i_JFOFc7Z2DI@z>

Now that a jz4780 based board (the MIPS Creator CI20) is present, allow
the jz4780 SoC to be selected as the machine type via Kconfig.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 296bafb..6bd77f1 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -292,7 +292,7 @@ config MACH_JZ4740
 	select LIBFDT
 
 config MACH_JZ4780
-	bool
+	bool "Ingenic JZ4780 based machines"
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_LITTLE_ENDIAN
-- 
2.2.1
