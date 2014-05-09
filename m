Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:14807 "EHLO
        mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6854776AbaEIQC01zQwa (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 9 May 2014 18:02:26 +0200
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 1/5] MIPS: Make MAPPED_KERNEL config option common
Date: Fri, 9 May 2014 21:39:20 +0530
Message-ID: <1399651764-14202-1-git-send-email-jchandra@broadcom.com>
In-Reply-To: <1399649304-25856-1-git-send-email-jchandra@broadcom.com>
References: <1399649304-25856-1-git-send-email-jchandra@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <jchandra@broadcom.com>
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
Cc: Jayachandran C <jchandra@broadcom.com>, ralf@linux-mips.org
Message-ID: <20140509160920.lYm3U9PtdReb7yPBl65ZoFodRqvVPBLloAz5_QjFaAk@z>

This will be needed for the mapped kernel patches for Netlogic XLP.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/Kconfig          |    8 ++++++++
 arch/mips/sgi-ip27/Kconfig |    8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d0bcfce..acf85a8 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2093,6 +2093,14 @@ config SB1_PASS_2_1_WORKAROUNDS
 	depends on CPU_SB1 && CPU_SB1_PASS_2
 	default y
 
+config MAPPED_KERNEL
+	bool "Mapped kernel support"
+	depends on SGI_IP27
+	help
+	  Change the way a Linux kernel is loaded into memory on a MIPS64
+	  machine.  This is required in order to support text replication on
+	  NUMA.  If you need to understand it, read the source code.
+
 
 config 64BIT_PHYS_ADDR
 	bool
diff --git a/arch/mips/sgi-ip27/Kconfig b/arch/mips/sgi-ip27/Kconfig
index 4d8705a..2c9dd3d 100644
--- a/arch/mips/sgi-ip27/Kconfig
+++ b/arch/mips/sgi-ip27/Kconfig
@@ -21,14 +21,6 @@ config SGI_SN_N_MODE
 
 endchoice
 
-config MAPPED_KERNEL
-	bool "Mapped kernel support"
-	depends on SGI_IP27
-	help
-	  Change the way a Linux kernel is loaded into memory on a MIPS64
-	  machine.  This is required in order to support text replication on
-	  NUMA.  If you need to understand it, read the source code.
-
 config REPLICATE_KTEXT
 	bool "Kernel text replication support"
 	depends on SGI_IP27
-- 
1.7.9.5
