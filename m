Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:19170 "EHLO
        mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27028420AbaHVTTHBhLRp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Aug 2014 21:19:07 +0200
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 1/2] MIPS: Netlogic: Use MIPS topology.h
Date: Fri, 22 Aug 2014 09:48:31 +0530
Message-ID: <1408681112-26744-1-git-send-email-jchandra@broadcom.com>
In-Reply-To: <CAAhV-H7x3FDAXYcH6J8mDeBnrgV1CZZtizerjHRa4cj_oZ1PuQ@mail.gmail.com>
References: <CAAhV-H7x3FDAXYcH6J8mDeBnrgV1CZZtizerjHRa4cj_oZ1PuQ@mail.gmail.com>
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
Cc: Jayachandran C <jchandra@broadcom.com>, ralf@linux-mips.org, chenhc@lemote.com
Message-ID: <20140822041831.cDIR8oFjwxLlJlzWFGl8MUNgHZGoYJI18NxWsprkj3U@z>

commit bda4584cd943 ("MIPS: Support CPU topology files in sysfs")
added topology related macros for all MIPS platforms. This causes
compile failure for Netlogic platforms with errors like:

arch/mips/include/asm/mach-netlogic/topology.h:14:0: error: "topology_physical_package_id" redefined [-Werror]

Fix this by dropping Netlogic specific topology.h and setting up package
field in cpu data.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
[Resending this, looks like linux-mips.org is down]

 arch/mips/include/asm/mach-netlogic/topology.h |   22 ----------------------
 arch/mips/netlogic/common/smp.c                |    1 +
 2 files changed, 1 insertion(+), 22 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-netlogic/topology.h

diff --git a/arch/mips/include/asm/mach-netlogic/topology.h b/arch/mips/include/asm/mach-netlogic/topology.h
deleted file mode 100644
index ceeb1f5..0000000
--- a/arch/mips/include/asm/mach-netlogic/topology.h
+++ /dev/null
@@ -1,22 +0,0 @@
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
-#ifdef CONFIG_SMP
-#define topology_physical_package_id(cpu)	cpu_to_node(cpu)
-#define topology_core_id(cpu)	(cpu_logical_map(cpu) / NLM_THREADS_PER_CORE)
-#define topology_thread_cpumask(cpu)		(&cpu_sibling_map[cpu])
-#define topology_core_cpumask(cpu)	cpumask_of_node(cpu_to_node(cpu))
-#endif
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
1.7.9.5
