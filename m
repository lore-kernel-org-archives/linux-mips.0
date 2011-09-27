Received: from mx1.netlogicmicro.com ([12.203.210.36]:1390 "EHLO
        orion5.netlogicmicro.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S1491802Ab1I0I3O (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 27 Sep 2011 10:29:14 +0200
Date: Tue, 27 Sep 2011 14:07:01 +0530
From: Jayachandran C <jayachandranc@netlogicmicro.com>
Subject: [PATCH 1/9] MIPS: Netlogic: Style fixes for Platform
Message-ID: <24108a12da253e6311399fd70ddc3a38467fd0a9.1317111127.git.jayachandranc@netlogicmicro.com>
References: <cover.1317111127.git.jayachandranc@netlogicmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1317111127.git.jayachandranc@netlogicmicro.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Message-ID: <20110927083701.bnSOn5y4nFmdX65Deh4EY7_-RNJ_Y92ITL2WI_x7v0c@z>

- Use platform- variable for xlr
- Load address common for all netlogic chips

Signed-off-by: Jayachandran C <jayachandranc@netlogicmicro.com>
---
 arch/mips/netlogic/Platform |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/netlogic/Platform b/arch/mips/netlogic/Platform
index 502d912..4fb6b83 100644
--- a/arch/mips/netlogic/Platform
+++ b/arch/mips/netlogic/Platform
@@ -1,8 +1,8 @@
 #
 # NETLOGIC includes
 #
-cflags-$(CONFIG_NLM_COMMON)  += -I$(srctree)/arch/mips/include/asm/mach-netlogic
-cflags-$(CONFIG_NLM_COMMON)  += -I$(srctree)/arch/mips/include/asm/netlogic
+cflags-$(CONFIG_NLM_COMMON)	+= -I$(srctree)/arch/mips/include/asm/mach-netlogic
+cflags-$(CONFIG_NLM_COMMON)	+= -I$(srctree)/arch/mips/include/asm/netlogic
 
 #
 # use mips64 if xlr is not available
@@ -10,7 +10,7 @@ cflags-$(CONFIG_NLM_COMMON)  += -I$(srctree)/arch/mips/include/asm/netlogic
 cflags-$(CONFIG_NLM_XLR)	+= $(call cc-option,-march=xlr,-march=mips64)
 
 #
-# NETLOGIC XLR/XLS SoC, Simulator and boards
+# NETLOGIC processor support
 #
-core-$(CONFIG_NLM_XLR)	      += arch/mips/netlogic/xlr/
-load-$(CONFIG_NLM_XLR_BOARD)  += 0xffffffff80100000
+platform-$(CONFIG_NLM_XLR)  	+= netlogic/xlr
+load-$(CONFIG_NLM_COMMON)  	+= 0xffffffff80100000
-- 
1.7.4.1
