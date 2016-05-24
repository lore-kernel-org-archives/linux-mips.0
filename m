Received: from mailapp01.imgtec.com ([195.59.15.196]:18895 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27030917AbcEXKmoe46OM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 May 2016 12:42:44 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] genirq: Fix missing return value in irq_destroy_ipi()
Date: Tue, 24 May 2016 11:42:30 +0100
Message-ID: <1464086550-24734-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20160524104230.Uht2RWHkMD6Sq6l4NHKdaximP-LvLxIStg015HVGQbU@z>

Commit 7cec18a3906b ("genirq: Add error code reporting to
irq_{reserve,destroy}_ipi") changed the return type of irq_destroy_ipi
to int, but missed adding a value to one return statement. Fix this to
silence the resultant compiler warning:

kernel/irq/ipi.c In function ‘irq_destroy_ipi’:
kernel/irq/ipi.c:128:3: warning: ‘return’ with no value, in function returning non-void [-Wreturn-type]
  return;
  ^
Fixes: 7cec18a3906b ("genirq: Add error code reporting to
irq_{reserve,destroy}_ipi")
Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>

---

 kernel/irq/ipi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/irq/ipi.c b/kernel/irq/ipi.c
index c42742208e5e..89b49f6773f0 100644
--- a/kernel/irq/ipi.c
+++ b/kernel/irq/ipi.c
@@ -125,7 +125,7 @@ int irq_destroy_ipi(unsigned int irq, const struct cpumask *dest)
 
 	domain = data->domain;
 	if (WARN_ON(domain == NULL))
-		return;
+		return -EINVAL;
 
 	if (!irq_domain_is_ipi(domain)) {
 		pr_warn("Trying to destroy a non IPI domain!\n");
-- 
2.5.0
