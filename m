Received: from mx1.netlogicmicro.com ([12.203.210.36]:1265 "EHLO
        orion5.netlogicmicro.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S1903961Ab1KKLgB (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 11 Nov 2011 12:36:01 +0100
Date: Fri, 11 Nov 2011 17:07:57 +0530
From: Jayachandran C <jayachandranc@netlogicmicro.com>
Subject: [PATCH 03/12] MIPS: Netlogic: No need to set -Werror in mips/xlr
Message-ID: <1f01f57f5880b3b7b56c20bcd7b23ed6aa14d216.1321011000.git.jayachandranc@netlogicmicro.com>
References: <cover.1321010998.git.jayachandranc@netlogicmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1321010998.git.jayachandranc@netlogicmicro.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Message-ID: <20111111113757.W6IsTP8pVatlUXFyjrQeAEPDlxEIhDj0dW4fqYM3nHU@z>

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
1.7.5.4
