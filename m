Received: from mailapp01.imgtec.com ([195.59.15.196]:17338 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992058AbcHaKpCErLGD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 31 Aug 2016 12:45:02 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 02/10] MIPS: CPC: Avoid lock when MIPS CM >= 3 is present
Date: Wed, 31 Aug 2016 11:44:31 +0100
Message-ID: <1472640279-26593-3-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1472640279-26593-1-git-send-email-matt.redfearn@imgtec.com>
References: <1472640279-26593-1-git-send-email-matt.redfearn@imgtec.com>
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
Message-ID: <20160831104431.2Q7jsUsIcaC9OirwlLIp-Tw0qDRTdA6TFppzKm5fgh0@z>

MIPS CM version 3 removed the CPC_CL_OTHER register and instead the
CM_CL_OTHER register is used to redirect the CPC_OTHER region. As such,
we should not write the unimplmented register and can avoid the
spinlock as well.
These lock functions should aleady be called within the context of a
mips_cm_{lock,unlock}_other pair ensuring the correct CPC_OTHER region
will be accessed.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/mips-cpc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/mips-cpc.c b/arch/mips/kernel/mips-cpc.c
index 0e337f55ac60..2a45867d3b4f 100644
--- a/arch/mips/kernel/mips-cpc.c
+++ b/arch/mips/kernel/mips-cpc.c
@@ -71,6 +71,11 @@ int mips_cpc_probe(void)
 void mips_cpc_lock_other(unsigned int core)
 {
 	unsigned int curr_core;
+
+	if (mips_cm_revision() >= CM_REV_CM3)
+		/* Systems with CM >= 3 lock the CPC via mips_cm_lock_other */
+		return;
+
 	preempt_disable();
 	curr_core = current_cpu_data.core;
 	spin_lock_irqsave(&per_cpu(cpc_core_lock, curr_core),
@@ -86,7 +91,13 @@ void mips_cpc_lock_other(unsigned int core)
 
 void mips_cpc_unlock_other(void)
 {
-	unsigned int curr_core = current_cpu_data.core;
+	unsigned int curr_core;
+
+	if (mips_cm_revision() >= CM_REV_CM3)
+		/* Systems with CM >= 3 lock the CPC via mips_cm_lock_other */
+		return;
+
+	curr_core = current_cpu_data.core;
 	spin_unlock_irqrestore(&per_cpu(cpc_core_lock, curr_core),
 			       per_cpu(cpc_core_lock_flags, curr_core));
 	preempt_enable();
-- 
2.7.4
