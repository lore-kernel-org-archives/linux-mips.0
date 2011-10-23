Received: from mx1.netlogicmicro.com ([12.203.210.36]:2799 "EHLO
        orion5.netlogicmicro.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S1491023Ab1JWNoK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 23 Oct 2011 15:44:10 +0200
Date: Sun, 23 Oct 2011 19:09:04 +0530
From: Jayachandran C <jayachandranc@netlogicmicro.com>
Subject: [PATCH 03/12] MIPS: Netlogic: No need to set -Werror in mips/xlr
Message-ID: <20111023133858.GA22947@jayachandranc.netlogicmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: ralf@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20111023133904.fViyy6uaMrLkkzZRFzH3LHdj6ci8VlvgdBBNycUphw8@z>

The -Werror compilation flag is already set for arch/mips - it can be removed
from arch/mips/xlr/Makefile

Signed-off-by: Jayachandran C <jayachandranc@netlogicmicro.com>
---
 arch/mips/netlogic/xlr/Makefile |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/mips/netlogic/xlr/Makefile b/arch/mips/netlogic/xlr/Makefile
index 2dca585..29f1fd5 100644
--- a/arch/mips/netlogic/xlr/Makefile
+++ b/arch/mips/netlogic/xlr/Makefile
@@ -1,5 +1,3 @@
 obj-y				+= setup.o platform.o irq.o setup.o time.o
 obj-$(CONFIG_SMP)		+= smp.o smpboot.o
 obj-$(CONFIG_EARLY_PRINTK)	+= xlr_console.o
-
-ccflags-y			+= -Werror
-- 
1.7.4.1
