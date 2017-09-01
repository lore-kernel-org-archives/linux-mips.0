Received: from mail.cn.fujitsu.com ([183.91.158.132]:18543 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992111AbdIAC45eV9kU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 1 Sep 2017 04:56:57 +0200
From: Dou Liyang <douly.fnst@cn.fujitsu.com>
Subject: [PATCH v2 2/7] MIPS: numa: Remove the unused parent_node() macro
Date: Fri, 1 Sep 2017 10:56:34 +0800
Message-ID: <1504234599-29533-3-git-send-email-douly.fnst@cn.fujitsu.com>
In-Reply-To: <1504234599-29533-1-git-send-email-douly.fnst@cn.fujitsu.com>
References: <1504234599-29533-1-git-send-email-douly.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <douly.fnst@cn.fujitsu.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Cc: Dou Liyang <douly.fnst@cn.fujitsu.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20170901025634.Z7JEAYWdGJlJTsiXWf3o1HQqiAEvgA4S9EXOdIp3SSk@z>

Commit a7be6e5a7f8d ("mm: drop useless local parameters of
__register_one_node()") removes the last user of parent_node().

The parent_node() macros in both IP27 and Loongson64 are unnecessary.

Remove it for cleanup.

Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Dou Liyang <douly.fnst@cn.fujitsu.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/include/asm/mach-ip27/topology.h       | 1 -
 arch/mips/include/asm/mach-loongson64/topology.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/include/asm/mach-ip27/topology.h
index defd135..3fb7a0e 100644
--- a/arch/mips/include/asm/mach-ip27/topology.h
+++ b/arch/mips/include/asm/mach-ip27/topology.h
@@ -23,7 +23,6 @@ struct cpuinfo_ip27 {
 extern struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];
 
 #define cpu_to_node(cpu)	(sn_cpu_info[(cpu)].p_nodeid)
-#define parent_node(node)	(node)
 #define cpumask_of_node(node)	((node) == -1 ?				\
 				 cpu_all_mask :				\
 				 &hub_data(node)->h_cpus)
diff --git a/arch/mips/include/asm/mach-loongson64/topology.h b/arch/mips/include/asm/mach-loongson64/topology.h
index 0d8f3b5..bcb8856 100644
--- a/arch/mips/include/asm/mach-loongson64/topology.h
+++ b/arch/mips/include/asm/mach-loongson64/topology.h
@@ -4,7 +4,6 @@
 #ifdef CONFIG_NUMA
 
 #define cpu_to_node(cpu)	(cpu_logical_map(cpu) >> 2)
-#define parent_node(node)	(node)
 #define cpumask_of_node(node)	(&__node_data[(node)]->cpumask)
 
 struct pci_bus;
-- 
2.5.5
