Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:25502 "EHLO
        mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010444AbbAGLV3OBt1e (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Jan 2015 12:21:29 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 08/17] MIPS: Netlogic: Use MIPS topology.h
Date: Wed, 7 Jan 2015 16:58:29 +0530
Message-ID: <1420630118-17198-9-git-send-email-jchandra@broadcom.com>
In-Reply-To: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
References: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
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
Message-ID: <20150107112829.gkBMy92PSQxsN82wWGuUjV_PYdhfVDip-np7j2518ZY@z>

commit bda4584cd943 ("MIPS: Support CPU topology files in sysfs")
added topology related macros for all MIPS platforms and commit
bbbf6d8768f5 ("MIPS: NL: Fix nlm_xlp_defconfig build error")
removed most of the contents from mach-netlogic/topology.h.

The netlogic specific topology is not needed anymore, we just need
to setup the package field in current_cpu_data.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/include/asm/mach-netlogic/topology.h | 15 ---------------
 arch/mips/netlogic/common/smp.c                |  1 +
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-netlogic/topology.h

diff --git a/arch/mips/include/asm/mach-netlogic/topology.h b/arch/mips/include/asm/mach-netlogic/topology.h
deleted file mode 100644
index 0eb43c8..00000000
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
