Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:53251 "EHLO
        mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27007231AbaH1QDSIkJBG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 28 Aug 2014 18:03:18 +0200
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH] MIPS: Netlogic: Use MIPS topology.h
Date: Thu, 28 Aug 2014 21:23:52 +0530
Message-ID: <1409241232-4205-1-git-send-email-jchandra@broadcom.com>
In-Reply-To: <Message-ID: <20140825132050.GH27724@linux-mips.org>
References: <Message-ID: <20140825132050.GH27724@linux-mips.org>
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
Cc: Jayachandran C <jchandra@broadcom.com>, Ralf Baechle <ralf@linux-mips.org>, Guenter Roeck <linux@roeck-us.net>, Huacai Chen <chenhc@lemote.com>
Message-ID: <20140828155352.D8cVxwav2CRemlIvSB7-hMpNegOo6cKlTFr4hbo6xIU@z>

commit bbbf6d8768f5 ("MIPS: NL: Fix nlm_xlp_defconfig build error")
removed topology related macros from mach-netlogic/topology.h, but
did not setup the current_cpu_data.package.

Fix this by setting the package field in netlogic/common/smp.c. Also
mach-netlogic/topology.h can be removed now as it no longer needs to
override mips topology definitions.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Huacai Chen <chenhc@lemote.com>
---
[ Ralf: This is for 3.17, fixes an issue which went into -rc1, and was fixed
  partially in -rc2]

 arch/mips/include/asm/mach-netlogic/topology.h | 15 ---------------
 arch/mips/netlogic/common/smp.c                |  1 +
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-netlogic/topology.h

diff --git a/arch/mips/include/asm/mach-netlogic/topology.h b/arch/mips/include/asm/mach-netlogic/topology.h
deleted file mode 100644
index 0eb43c8..0000000
--- a/arch/mips/include/asm/mach-netlogic/topology.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2013 Broadcom Corporation
- */
-#ifndef _ASM_MACH_NETLOGIC_TOPOLOGY_H
-#define _ASM_MACH_NETLOGIC_TOPOLOGY_H
-
-#include <asm/mach-netlogic/multi-node.h>
-
-#include <asm-generic/topology.h>
-
-#endif /* _ASM_MACH_NETLOGIC_TOPOLOGY_H */
diff --git a/arch/mips/netlogic/common/smp.c b/arch/mips/netlogic/common/smp.c
index 4fde7ac..f23fe22 100644
--- a/arch/mips/netlogic/common/smp.c
+++ b/arch/mips/netlogic/common/smp.c
@@ -120,6 +120,7 @@ static void nlm_init_secondary(void)
 
 	hwtid = hard_smp_processor_id();
 	current_cpu_data.core = hwtid / NLM_THREADS_PER_CORE;
+	current_cpu_data.package = nlm_cpuid_to_node(hwtid);
 	nlm_percpu_init(hwtid);
 	nlm_smp_irq_init(hwtid);
 }
-- 
1.9.1
