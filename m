Received: from mailapp01.imgtec.com ([195.89.28.115]:52194 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6822344AbaDHK7XHt3Xv (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Apr 2014 12:59:23 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id C4700723F02CC
        for <linux-mips@linux-mips.org>; Tue,  8 Apr 2014 11:59:14 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 2/2] MIPS: Kconfig: Make MIPS_MT_SMP a regular Kconfig symbol
Date: Tue, 8 Apr 2014 11:59:10 +0100
Message-ID: <1396954750-24762-3-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1396954750-24762-1-git-send-email-markos.chandras@imgtec.com>
References: <1396954750-24762-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140408105910.XZPHTYDzEIKxkskaOXEeH8Z46xYy4kSV--W07aOdBsc@z>

Following the removal of SMTC, MIPS_MT_SMP is the only available
MT/SMP option so make it a regular Kconfig symbol.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/Kconfig | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 918a80f..2d1f5e3 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1895,19 +1895,8 @@ config CPU_R4K_CACHE_TLB
 	bool
 	default y if !(CPU_R3000 || CPU_R8000 || CPU_SB1 || CPU_TX39XX || CPU_CAVIUM_OCTEON)
 
-choice
-	prompt "MIPS MT options"
-
-config MIPS_MT_DISABLED
-	bool "Disable multithreading support"
-	help
-	  Use this option if your platform does not support the MT ASE
-	  which is hardware multithreading support. On systems without
-	  an MT-enabled processor, this will be the only option that is
-	  available in this menu.
-
 config MIPS_MT_SMP
-	bool "Use 1 TC on each available VPE for SMP"
+	bool "MIPS MT SMP support (1 TC on each available VPE)"
 	depends on SYS_SUPPORTS_MULTITHREADING
 	select CPU_MIPSR2_IRQ_VI
 	select CPU_MIPSR2_IRQ_EI
@@ -1926,8 +1915,6 @@ config MIPS_MT_SMP
 	  Intel Hyperthreading feature. For further information go to
 	  <http://www.imgtec.com/mips/mips-multithreading.asp>.
 
-endchoice
-
 config MIPS_MT
 	bool
 
-- 
1.9.1
