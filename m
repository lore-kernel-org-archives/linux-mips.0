Received: from lpdvsmtp01.broadcom.com ([192.19.211.62]:41172 "EHLO
        relay.smtp.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993908AbdAKToxPNcNY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 11 Jan 2017 20:44:53 +0100
From: justinpopo6@gmail.com
Subject: [PATCH] MIPS: Add cacheinfo support
Date: Wed, 11 Jan 2017 11:44:32 -0800
Message-Id: <20170111194432.24283-1-justinpopo6@gmail.com>
Return-Path: <justinpopo6@gmail.com>
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
Cc: bcm-kernel-feedback-list@broadcom.com, leonid.yegoshin@imgtec.com, f.fainelli@gmail.com, Justin Chen <justin.chen@broadcom.com>

From: Justin Chen <justin.chen@broadcom.com>

Add cacheinfo support for MIPS architectures.

Use information from the cpuinfo_mips struct to populate the
cacheinfo struct. This allows an architecture agnostic approach,
however this also means if cache information is not properly
populated within the cpuinfo_mips struct, there is nothing
we can do. (I.E. c-r3k.c)

Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
 arch/mips/kernel/Makefile    |  2 +-
 arch/mips/kernel/cacheinfo.c | 85 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/kernel/cacheinfo.c

diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index 4a603a3..904a9c4 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -7,7 +7,7 @@ extra-y		:= head.o vmlinux.lds
 obj-y		+= cpu-probe.o branch.o elf.o entry.o genex.o idle.o irq.o \
 		   process.o prom.o ptrace.o reset.o setup.o signal.o \
 		   syscall.o time.o topology.o traps.o unaligned.o watch.o \
-		   vdso.o
+		   vdso.o cacheinfo.o
 
 ifdef CONFIG_FUNCTION_TRACER
 CFLAGS_REMOVE_ftrace.o = -pg
diff --git a/arch/mips/kernel/cacheinfo.c b/arch/mips/kernel/cacheinfo.c
new file mode 100644
index 0000000..a92bbba
--- /dev/null
+++ b/arch/mips/kernel/cacheinfo.c
@@ -0,0 +1,85 @@
+/*
+ * MIPS cacheinfo support
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether express or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#include <linux/cacheinfo.h>
+
+/* Populates leaf and increments to next leaf */
+#define populate_cache(cache, leaf, c_level, c_type)		\
+	leaf->type = c_type;					\
+	leaf->level = c_level;					\
+	leaf->coherency_line_size = c->cache.linesz;		\
+	leaf->number_of_sets = c->cache.sets;			\
+	leaf->ways_of_associativity = c->cache.ways;		\
+	leaf->size = c->cache.linesz * c->cache.sets *		\
+		c->cache.ways;					\
+	leaf++;
+
+static int __init_cache_level(unsigned int cpu)
+{
+	struct cpuinfo_mips *c = &current_cpu_data;
+	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
+	int levels = 0, leaves = 0;
+
+	/*
+	 * If Dcache is not set, we assume the cache structures
+	 * are not properly initialized.
+	 */
+	if (c->dcache.waysize)
+		levels += 1;
+	else
+		return -ENOENT;
+
+
+	leaves += (c->icache.waysize) ? 2 : 1;
+
+	if (c->scache.waysize) {
+		levels++;
+		leaves++;
+	}
+
+	if (c->tcache.waysize) {
+		levels++;
+		leaves++;
+	}
+
+	this_cpu_ci->num_levels = levels;
+	this_cpu_ci->num_leaves = leaves;
+	return 0;
+}
+
+static int __populate_cache_leaves(unsigned int cpu)
+{
+	struct cpuinfo_mips *c = &current_cpu_data;
+	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
+	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
+
+	if (c->icache.waysize) {
+		populate_cache(dcache, this_leaf, 1, CACHE_TYPE_DATA);
+		populate_cache(icache, this_leaf, 1, CACHE_TYPE_INST);
+	} else {
+		populate_cache(dcache, this_leaf, 1, CACHE_TYPE_UNIFIED);
+	}
+
+	if (c->scache.waysize)
+		populate_cache(scache, this_leaf, 2, CACHE_TYPE_UNIFIED);
+
+	if (c->tcache.waysize)
+		populate_cache(tcache, this_leaf, 3, CACHE_TYPE_UNIFIED);
+
+	return 0;
+}
+
+DEFINE_SMP_CALL_CACHE_FUNCTION(init_cache_level)
+DEFINE_SMP_CALL_CACHE_FUNCTION(populate_cache_leaves)
-- 
2.10.2
