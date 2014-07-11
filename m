Received: from mailapp01.imgtec.com ([195.59.15.196]:12889 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6860090AbaGKPriutloS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 11 Jul 2014 17:47:38 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 8D0C36D2D74B3
        for <linux-mips@linux-mips.org>; Fri, 11 Jul 2014 16:47:29 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 13/13] MIPS: mark MSA experimental
Date: Fri, 11 Jul 2014 16:47:25 +0100
Message-ID: <1405093645-5380-1-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1405093479-5123-1-git-send-email-paul.burton@imgtec.com>
References: <1405093479-5123-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140711154725.xlygQw7HOnqNUZDHqWXf4oDwxKwVR89_eCoYrHlrDEI@z>

In light of the commit 16f77de82f2d (Revert "MIPS: Save/restore MSA
context around signals") the MSA support in the kernel is incomplete.
Until the replacement for the former sigcontext changes is agreed upon
and in tree, mark MSA experimental & disable it by default.

MSA is only implemented by one CPU supported by the kernel, the P5600.
The P5600 is a 32 bit core, and thus MSA can only be used when the
experimental CONFIG_MIPS_O32_FP64_SUPPORT option is enabled. Therefore
MSA is only being used in experimental settings anyway and this change
doesn't actually make any difference beyond clarifying the state of
MSA support.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 857a49c..d747273 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2110,10 +2110,9 @@ config CPU_MICROMIPS
 	  microMIPS ISA
 
 config CPU_HAS_MSA
-	bool "Support for the MIPS SIMD Architecture"
+	bool "Support for the MIPS SIMD Architecture (EXPERIMENTAL)"
 	depends on CPU_SUPPORTS_MSA
 	depends on 64BIT || MIPS_O32_FP64_SUPPORT
-	default y
 	help
 	  MIPS SIMD Architecture (MSA) introduces 128 bit wide vector registers
 	  and a set of SIMD instructions to operate on them. When this option
-- 
2.0.1
