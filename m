Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:1142 "EHLO
        mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6815753Ab3LULLKOsGjp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 21 Dec 2013 12:11:10 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 17/18] MIPS: Netlogic: XLP9XX PIC OF support
Date: Sat, 21 Dec 2013 16:52:29 +0530
Message-ID: <1387624950-31297-18-git-send-email-jchandra@broadcom.com>
In-Reply-To: <1387624950-31297-1-git-send-email-jchandra@broadcom.com>
References: <1387624950-31297-1-git-send-email-jchandra@broadcom.com>
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
Message-ID: <20131221112229.3Sme2H0gVXju55eICyhHWIIjdoE2I_JScruvvNehfDs@z>

Support for adding legacy IRQ domain for XLP9XX. The node id of the
PIC has to be calulated differently for XLP9XX.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/netlogic/common/irq.c |   37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/arch/mips/netlogic/common/irq.c b/arch/mips/netlogic/common/irq.c
index 8092bb3..42d9ea0 100644
--- a/arch/mips/netlogic/common/irq.c
+++ b/arch/mips/netlogic/common/irq.c
@@ -274,8 +274,6 @@ asmlinkage void plat_irq_dispatch(void)
 }
 
 #ifdef CONFIG_OF
-static struct irq_domain *xlp_pic_domain;
-
 static const struct irq_domain_ops xlp_pic_irq_domain_ops = {
 	.xlate = irq_domain_xlate_onetwocell,
 };
@@ -284,8 +282,9 @@ static int __init xlp_of_pic_init(struct device_node *node,
 					struct device_node *parent)
 {
 	const int n_picirqs = PIC_IRT_LAST_IRQ - PIC_IRQ_BASE + 1;
+	struct irq_domain *xlp_pic_domain;
 	struct resource res;
-	int socid, ret;
+	int socid, ret, bus;
 
 	/* we need a hack to get the PIC's SoC chip id */
 	ret = of_address_to_resource(node, 0, &res);
@@ -293,7 +292,34 @@ static int __init xlp_of_pic_init(struct device_node *node,
 		pr_err("PIC %s: reg property not found!\n", node->name);
 		return -EINVAL;
 	}
-	socid = (res.start >> 18) & 0x3;
+
+	if (cpu_is_xlp9xx()) {
+		bus = (res.start >> 20) & 0xf;
+		for (socid = 0; socid < NLM_NR_NODES; socid++) {
+			if (!nlm_node_present(socid))
+				continue;
+			if (nlm_get_node(socid)->socbus == bus)
+				break;
+		}
+		if (socid == NLM_NR_NODES) {
+			pr_err("PIC %s: Node mapping for bus %d not found!\n",
+					node->name, bus);
+			return -EINVAL;
+		}
+	} else {
+		socid = (res.start >> 18) & 0x3;
+		if (!nlm_node_present(socid)) {
+			pr_err("PIC %s: node %d does not exist!\n",
+							node->name, socid);
+			return -EINVAL;
+		}
+	}
+
+	if (!nlm_node_present(socid)) {
+		pr_err("PIC %s: node %d does not exist!\n", node->name, socid);
+		return -EINVAL;
+	}
+
 	xlp_pic_domain = irq_domain_add_legacy(node, n_picirqs,
 		nlm_irq_to_xirq(socid, PIC_IRQ_BASE), PIC_IRQ_BASE,
 		&xlp_pic_irq_domain_ops, NULL);
@@ -301,8 +327,7 @@ static int __init xlp_of_pic_init(struct device_node *node,
 		pr_err("PIC %s: Creating legacy domain failed!\n", node->name);
 		return -EINVAL;
 	}
-	pr_info("Node %d: IRQ domain created for PIC@%pa\n", socid,
-							&res.start);
+	pr_info("Node %d: IRQ domain created for PIC@%pR\n", socid, &res);
 	return 0;
 }
 
-- 
1.7.9.5
