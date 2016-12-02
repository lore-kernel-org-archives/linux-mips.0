Received: from mailapp01.imgtec.com ([195.59.15.196]:41678 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993038AbcLBI6mPGPe0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Dec 2016 09:58:42 +0100
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH 2/4] MIPS: Kconfig: fix indentation for kexec-related entries
Date: Fri, 2 Dec 2016 09:58:29 +0100
Message-ID: <1480669111-15562-3-git-send-email-marcin.nowakowski@imgtec.com>
In-Reply-To: <1480669111-15562-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1480669111-15562-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20161202085829.uLPmChjjguZHi4briCAdUSbmN8mg2kA1CmR9-f5Eo1Y@z>

Kconfig entries are not aligned properly, so remove incorrect
whitespace.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 arch/mips/Kconfig | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 2da660e..9d07bee 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2795,8 +2795,8 @@ config KEXEC
 	  made.
 
 config CRASH_DUMP
-	  bool "Kernel crash dumps"
-	  help
+	bool "Kernel crash dumps"
+	help
 	  Generate crash dump after being started by kexec.
 	  This should be normally only set in special crash dump kernels
 	  which are loaded in the main kernel with kexec-tools into
@@ -2806,11 +2806,11 @@ config CRASH_DUMP
 	  PHYSICAL_START.
 
 config PHYSICAL_START
-	  hex "Physical address where the kernel is loaded"
-	  default "0xffffffff84000000" if 64BIT
-	  default "0x84000000" if 32BIT
-	  depends on CRASH_DUMP
-	  help
+	hex "Physical address where the kernel is loaded"
+	default "0xffffffff84000000" if 64BIT
+	default "0x84000000" if 32BIT
+	depends on CRASH_DUMP
+	help
 	  This gives the CKSEG0 or KSEG0 address where the kernel is loaded.
 	  If you plan to use kernel for capturing the crash dump change
 	  this value to start of the reserved region (the "X" value as
-- 
2.7.4
