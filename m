Received: from mailapp01.imgtec.com ([195.59.15.196]:27821 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011440AbbG0UD3lPr0X (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 27 Jul 2015 22:03:29 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 16/16] MIPS: drop EXPERIMENTAL tag from O32+FP64 & MSA
Date: Mon, 27 Jul 2015 12:58:27 -0700
Message-ID: <1438027107-24420-17-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1438027107-24420-1-git-send-email-paul.burton@imgtec.com>
References: <1438027107-24420-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Guenter Roeck <linux@roeck-us.net>, Matthew Fortune <matthew.fortune@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org
Message-ID: <20150727195827.86IE9ncW-QJW1_VqbEFo1VcIZkQtIXIFLorfWS-y-oM@z>

CONFIG_MIPS_O32_FP64_SUPPORT and CONFIG_CPU_HAS_MSA are in pretty good
shape these days, and in much wider use than they once were. Stop
referring to them as EXPERIMENTAL.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>

---

Changes in v2: None

 arch/mips/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a3b1ffe..1c657e0 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2301,7 +2301,7 @@ config CPU_MICROMIPS
 endchoice
 
 config CPU_HAS_MSA
-	bool "Support for the MIPS SIMD Architecture (EXPERIMENTAL)"
+	bool "Support for the MIPS SIMD Architecture"
 	depends on CPU_SUPPORTS_MSA
 	depends on 64BIT || MIPS_O32_FP64_SUPPORT
 	help
@@ -2641,7 +2641,7 @@ config SECCOMP
 	  If unsure, say Y. Only embedded should say N here.
 
 config MIPS_O32_FP64_SUPPORT
-	bool "Support for O32 binaries using 64-bit FP (EXPERIMENTAL)"
+	bool "Support for O32 binaries using 64-bit FP"
 	depends on 32BIT || MIPS32_O32
 	help
 	  When this is enabled, the kernel will support use of 64-bit floating
-- 
2.4.6
