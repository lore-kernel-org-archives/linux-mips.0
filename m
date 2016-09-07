Received: from mailapp01.imgtec.com ([195.59.15.196]:44731 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992104AbcIGJplpDp9S (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Sep 2016 11:45:41 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH v2 01/12] MIPS: CPC: Convert bare 'unsigned' to 'unsigned int'
Date: Wed, 7 Sep 2016 10:45:09 +0100
Message-ID: <1473241520-14917-2-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1473241520-14917-1-git-send-email-matt.redfearn@imgtec.com>
References: <1473241520-14917-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20160907094509.G_lNKtgj22VsUTwhndMQR_P6xKz0IZr3mXNNxUV1hvU@z>

Checkpatch complains about use of bare unsigned type.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
---

Changes in v2: None

 arch/mips/kernel/mips-cpc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/mips-cpc.c b/arch/mips/kernel/mips-cpc.c
index 566b8d2c092c..0e337f55ac60 100644
--- a/arch/mips/kernel/mips-cpc.c
+++ b/arch/mips/kernel/mips-cpc.c
@@ -52,7 +52,7 @@ static phys_addr_t mips_cpc_phys_base(void)
 int mips_cpc_probe(void)
 {
 	phys_addr_t addr;
-	unsigned cpu;
+	unsigned int cpu;
 
 	for_each_possible_cpu(cpu)
 		spin_lock_init(&per_cpu(cpc_core_lock, cpu));
@@ -70,7 +70,7 @@ int mips_cpc_probe(void)
 
 void mips_cpc_lock_other(unsigned int core)
 {
-	unsigned curr_core;
+	unsigned int curr_core;
 	preempt_disable();
 	curr_core = current_cpu_data.core;
 	spin_lock_irqsave(&per_cpu(cpc_core_lock, curr_core),
@@ -86,7 +86,7 @@ void mips_cpc_lock_other(unsigned int core)
 
 void mips_cpc_unlock_other(void)
 {
-	unsigned curr_core = current_cpu_data.core;
+	unsigned int curr_core = current_cpu_data.core;
 	spin_unlock_irqrestore(&per_cpu(cpc_core_lock, curr_core),
 			       per_cpu(cpc_core_lock_flags, curr_core));
 	preempt_enable();
-- 
2.7.4
