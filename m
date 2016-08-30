Received: from mailapp01.imgtec.com ([195.59.15.196]:3655 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992307AbcH3RdSawZP0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 30 Aug 2016 19:33:18 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 12/26] MIPS: CPC: Provide a default mips_cpc_default_phys_base
Date: Tue, 30 Aug 2016 18:29:15 +0100
Message-ID: <20160830172929.16948-13-paul.burton@imgtec.com>
In-Reply-To: <20160830172929.16948-1-paul.burton@imgtec.com>
References: <20160830172929.16948-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20160830172915.aBNw3-liLpwuJOeDCafmkqexM98yS2BOJlmt3VeFipM@z>

Provide a weak default implementation of mips_cpc_default_phys_base
which reads the base address of the CPC from the device tree if
possible, and failing that returns the existing physical address of the
CPC as read from CPC base address GCR. This allows for platforms to make
use of the CPC without requiring platform code.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

Changes in v2: None

 arch/mips/kernel/mips-cpc.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/mips/kernel/mips-cpc.c b/arch/mips/kernel/mips-cpc.c
index 566b8d2..b188787 100644
--- a/arch/mips/kernel/mips-cpc.c
+++ b/arch/mips/kernel/mips-cpc.c
@@ -9,6 +9,8 @@
  */
 
 #include <linux/errno.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/percpu.h>
 #include <linux/spinlock.h>
 
@@ -21,6 +23,22 @@ static DEFINE_PER_CPU_ALIGNED(spinlock_t, cpc_core_lock);
 
 static DEFINE_PER_CPU_ALIGNED(unsigned long, cpc_core_lock_flags);
 
+__weak phys_addr_t mips_cpc_default_phys_base(void)
+{
+	struct device_node *cpc_node;
+	struct resource res;
+	int err;
+
+	cpc_node = of_find_compatible_node(of_root, NULL, "mti,mips-cpc");
+	if (cpc_node) {
+		err = of_address_to_resource(cpc_node, 0, &res);
+		if (!err)
+			return res.start;
+	}
+
+	return read_gcr_cpc_base() & CM_GCR_CPC_BASE_CPCBASE_MSK;
+}
+
 /**
  * mips_cpc_phys_base - retrieve the physical base address of the CPC
  *
-- 
2.9.3
