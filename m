Received: from mailapp01.imgtec.com ([195.59.15.196]:35516 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012361AbcBZQEKiCRZx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 26 Feb 2016 17:04:10 +0100
From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [PATCH] MIPS: ci20_defconfig: Enable NAND and UBIFS support
Date: Fri, 26 Feb 2016 16:03:48 +0000
Message-ID: <1456502628-13628-1-git-send-email-harvey.hunt@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Harvey.Hunt@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org, linux-mips@linux-mips.org
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20160226160348.qzhXf8i124k_7nuocn86Evrej5osr1RHTzgUtlZsnrg@z>

Update the Ci20's defconfig to enable the JZ4780's NAND driver and
therefore access to the UBIFS rootfs.

Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: linux-kernel@vger.kernel.org
---
 arch/mips/configs/ci20_defconfig | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 4e36b6e..43e0ba2 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -17,13 +17,12 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_CGROUPS=y
+CONFIG_MEMCG=y
+CONFIG_CGROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
-CONFIG_CGROUP_DEVICE=y
 CONFIG_CPUSETS=y
+CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
-CONFIG_MEMCG=y
-CONFIG_MEMCG_KMEM=y
-CONFIG_CGROUP_SCHED=y
 CONFIG_NAMESPACES=y
 CONFIG_USER_NS=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
@@ -52,6 +51,11 @@ CONFIG_DEVTMPFS=y
 # CONFIG_ALLOW_DEV_COREDUMP is not set
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=32
+CONFIG_MTD=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_JZ4780=y
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_FASTMAP=y
 CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_ARC is not set
 # CONFIG_NET_CADENCE is not set
@@ -103,7 +107,7 @@ CONFIG_PROC_KCORE=y
 # CONFIG_PROC_PAGE_MONITOR is not set
 CONFIG_TMPFS=y
 CONFIG_CONFIGFS_FS=y
-# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_UBIFS_FS=y
 # CONFIG_NETWORK_FILESYSTEMS is not set
 CONFIG_NLS=y
 CONFIG_NLS_CODEPAGE_437=y
-- 
2.7.1
