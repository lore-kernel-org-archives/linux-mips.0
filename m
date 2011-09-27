Received: from mx1.netlogicmicro.com ([12.203.210.36]:1551 "EHLO
        orion5.netlogicmicro.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S1491809Ab1I0I3P (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 27 Sep 2011 10:29:15 +0200
Date: Tue, 27 Sep 2011 14:07:58 +0530
From: Jayachandran C <jayachandranc@netlogicmicro.com>
Subject: [PATCH 3/9] MIPS: Netlogic: No need to set -Werror in mips/xlr
Message-ID: <7dc67587834c333530e17d110ae504e5a195aaf9.1317111127.git.jayachandranc@netlogicmicro.com>
References: <cover.1317111127.git.jayachandranc@netlogicmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1317111127.git.jayachandranc@netlogicmicro.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Message-ID: <20110927083758.Cm89NF8SL3H6jjVhbCCv16x-nTTatW0N0TbG-WjI2fA@z>

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
