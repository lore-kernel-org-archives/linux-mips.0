Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:38797 "EHLO
        mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010881AbbHAMDmcDwAt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 1 Aug 2015 14:03:42 +0200
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 3/4] MIPS: Netlogic: set ARCH_REQUIRE_GPIOLIB for XLP platform
Date: Sat, 1 Aug 2015 17:44:22 +0530
Message-ID: <1438431263-12427-4-git-send-email-jchandra@broadcom.com>
In-Reply-To: <1438431263-12427-1-git-send-email-jchandra@broadcom.com>
References: <1438431263-12427-1-git-send-email-jchandra@broadcom.com>
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
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>, Jayachandran C <jchandra@broadcom.com>
Message-ID: <20150801121422.7xxWK44h4gbl_k26y_fsehF3tBvbu6xJ4FkywaDWibE@z>

From: Kamlakant Patel <kamlakant.patel@broadcom.com>

This is needed to enable GPIO framework support for Netlogic XLP platform.

Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>
Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index cee5f93..1920141 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -899,6 +899,7 @@ config NLM_XLP_BOARD
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select ARCH_PHYS_ADDR_T_64BIT
+	select ARCH_REQUIRE_GPIOLIB
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select SYS_SUPPORTS_HIGHMEM
-- 
1.9.1
