Received: from mail1.windriver.com ([147.11.146.13]:57563 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6823114Ab3FRTsDQdaAS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 18 Jun 2013 21:48:03 +0200
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] mips: delete floating "__FINIT" section statements
Date: Tue, 18 Jun 2013 15:47:46 -0400
Message-ID: <1371584866-20118-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Gortmaker@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Paul Gortmaker <paul.gortmaker@windriver.com>
Message-ID: <20130618194746.Kf7mw4AMgW6CCHmVauIl-SKeD6l7NK_Ka9I2girwXQg@z>

Commit "mips: delete __cpuinit/__CPUINIT usage from MIPS code"
deleted the __CPUINIT instances, however there were some instances
of "__FINIT" (i.e. ".previous") that were being used in paring with
the __CPUINIT (i.e. section ".cpuinit.text").

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[Again, free to squash this into the larger commit; hopefully this
 is the last hidden trap lurking in this cleanup....]

 arch/mips/kernel/head.S             | 2 --
 arch/mips/mm/cex-sb1.S              | 2 --
 arch/mips/netlogic/common/smpboot.S | 2 --
 3 files changed, 6 deletions(-)

diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index 42659f2..7b6a5b3 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -186,5 +186,3 @@ NESTED(smp_bootstrap, 16, sp)
 	j	start_secondary
 	END(smp_bootstrap)
 #endif /* CONFIG_SMP */
-
-	__FINIT
diff --git a/arch/mips/mm/cex-sb1.S b/arch/mips/mm/cex-sb1.S
index 43d5243..191cf6e 100644
--- a/arch/mips/mm/cex-sb1.S
+++ b/arch/mips/mm/cex-sb1.S
@@ -140,8 +140,6 @@ unrecoverable:
 
 END(except_vec2_sb1)
 
-	__FINIT
-
 	LEAF(handle_vec2_sb1)
 	mfc0	k0,CP0_CONFIG
 	li	k1,~CONF_CM_CMASK
diff --git a/arch/mips/netlogic/common/smpboot.S b/arch/mips/netlogic/common/smpboot.S
index 56769ee..aa6cff0 100644
--- a/arch/mips/netlogic/common/smpboot.S
+++ b/arch/mips/netlogic/common/smpboot.S
@@ -93,7 +93,6 @@ NESTED(nlm_boot_secondary_cpus, 16, sp)
 	jr	t0
 	nop
 END(nlm_boot_secondary_cpus)
-	__FINIT
 
 /*
  * In case of RMIboot bootloader which is used on XLR boards, the CPUs
@@ -138,4 +137,3 @@ NESTED(nlm_rmiboot_preboot, 16, sp)
 	b	1b
 	nop
 END(nlm_rmiboot_preboot)
-	__FINIT
-- 
1.8.1.2
