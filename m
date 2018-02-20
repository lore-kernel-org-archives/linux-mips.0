Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:47849 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994675AbeBTKdZk29hl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 Feb 2018 11:33:25 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 1/2] MIPS: SMP: Group CONFIG_GENERIC_IRQ_IPI together
Date: Tue, 20 Feb 2018 10:32:22 +0000
Message-ID: <1519122743-4847-2-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1519122743-4847-1-git-send-email-matt.redfearn@mips.com>
References: <1519122743-4847-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, Ying Huang <ying.huang@intel.com>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>, Ingo Molnar <mingo@kernel.org>, Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>
Message-ID: <20180220103222.piR0ho0xZPenA_L3Zz6o9G3Rh38wmbmoLbSwIeO31gw@z>

In preparation for allowing selection of a single IPI / CPU, group
affected code together to minimise ifdeffery.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/kernel/smp.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index d84b9066b465..5b25e181cefe 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -84,11 +84,6 @@ static cpumask_t cpu_core_setup_map;
 
 cpumask_t cpu_coherent_mask;
 
-#ifdef CONFIG_GENERIC_IRQ_IPI
-static struct irq_desc *call_desc;
-static struct irq_desc *sched_desc;
-#endif
-
 static inline void set_cpu_sibling_map(int cpu)
 {
 	int i;
@@ -157,6 +152,10 @@ void register_smp_ops(const struct plat_smp_ops *ops)
 }
 
 #ifdef CONFIG_GENERIC_IRQ_IPI
+static unsigned int call_virq, sched_virq;
+static struct irq_desc *call_desc;
+static struct irq_desc *sched_desc;
+
 void mips_smp_send_ipi_single(int cpu, unsigned int action)
 {
 	mips_smp_send_ipi_mask(cpumask_of(cpu), action);
@@ -240,8 +239,6 @@ static void smp_ipi_init_one(unsigned int virq,
 	BUG_ON(ret);
 }
 
-static unsigned int call_virq, sched_virq;
-
 int mips_smp_ipi_allocate(const struct cpumask *mask)
 {
 	int virq;
-- 
2.7.4
