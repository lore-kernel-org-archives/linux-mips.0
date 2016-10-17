Received: from mailapp02.imgtec.com ([217.156.133.132]:52153 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23990864AbcJQOfnM3iA4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Oct 2016 16:35:43 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 3/4] MIPS: Allow pre-r6 emulation on SMP MIPSr6 kernels
Date: Mon, 17 Oct 2016 15:34:37 +0100
Message-ID: <20161017143438.17298-4-paul.burton@imgtec.com>
In-Reply-To: <20161017143438.17298-1-paul.burton@imgtec.com>
References: <20161017143438.17298-1-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20161017143437.pjBD35NvrOpoEaRs6Kn4Jv79PVK4ayFqhKCXN9m8uFE@z>

There's no reason for the pre-r6 instruction emulation code to be
limited to uniprocessor kernels. We already emulate atomic memory access
instructions in a way that works for SMP systems, and nothing else
should be affected. Remove the artificial limitation, allowing pre-r6
instruction emulation to be used with SMP kernels.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/Kconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index b3c5bde..5582ce1 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2286,7 +2286,7 @@ config MIPS_MT_FPAFF
 
 config MIPSR2_TO_R6_EMULATOR
 	bool "MIPS R2-to-R6 emulator"
-	depends on CPU_MIPSR6 && !SMP
+	depends on CPU_MIPSR6
 	default y
 	help
 	  Choose this option if you want to run non-R6 MIPS userland code.
@@ -2294,8 +2294,6 @@ config MIPSR2_TO_R6_EMULATOR
 	  default. You can enable it using the 'mipsr2emu' kernel option.
 	  The only reason this is a build-time option is to save ~14K from the
 	  final kernel image.
-comment "MIPS R2-to-R6 emulator is only available for UP kernels"
-	depends on SMP && CPU_MIPSR6
 
 config MIPS_VPE_LOADER
 	bool "VPE loader support."
-- 
2.10.0
