Received: from mailapp01.imgtec.com ([195.89.28.114]:40499 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6819447AbaDHPJHPkXoI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Apr 2014 17:09:07 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id DE2DA53DD7870
        for <linux-mips@linux-mips.org>; Tue,  8 Apr 2014 16:08:57 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 1/2] MIPS: regenerate sead3 defconfigs
Date: Tue, 8 Apr 2014 16:09:02 +0100
Message-ID: <1396969743-454-2-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1396969743-454-1-git-send-email-markos.chandras@imgtec.com>
References: <1396969743-454-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140408150902.btd-H3mtPFuPiaYXs5BtntILtUCaPSRNdYGTglnMbvE@z>

This is similar to a86dc812881fab40175f4d3c3028acf8627a3804
"MIPS: Regenerate malta defconfigs"

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/configs/sead3_defconfig      | 1 -
 arch/mips/configs/sead3micro_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/mips/configs/sead3_defconfig b/arch/mips/configs/sead3_defconfig
index 0abe681..3646498 100644
--- a/arch/mips/configs/sead3_defconfig
+++ b/arch/mips/configs/sead3_defconfig
@@ -32,7 +32,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_WIRELESS is not set
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
-CONFIG_MTD_CHAR=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_INTELEXT=y
diff --git a/arch/mips/configs/sead3micro_defconfig b/arch/mips/configs/sead3micro_defconfig
index 2a0da5b..60bc094 100644
--- a/arch/mips/configs/sead3micro_defconfig
+++ b/arch/mips/configs/sead3micro_defconfig
@@ -33,7 +33,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_WIRELESS is not set
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
-CONFIG_MTD_CHAR=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_INTELEXT=y
-- 
1.9.1
