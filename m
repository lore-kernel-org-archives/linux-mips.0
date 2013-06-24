Received: from multi.imgtec.com ([194.200.65.239]:29819 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6824768Ab3FXPma3vW8A (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 24 Jun 2013 17:42:30 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: sni: pcimt: Guard sni_controller with CONFIG_PCI
Date: Mon, 24 Jun 2013 16:42:21 +0100
Message-ID: <1372088541-14539-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20130624154221.qMt-deH92zNYYVROSRiTtjdrnbZATN0v7ubbbf5FTDc@z>

Fixes the following build problem:

arch/mips/sni/pcimt.c:188:30: error: 'sni_controller'
defined but not used [-Werror=unused-variable]

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Acked-by: Steven J. Hill <Steven.Hill@imgtec.com> 
---
This patch is for the upstream-sfr/mips-for-linux-next tree
---
 arch/mips/sni/pcimt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/sni/pcimt.c b/arch/mips/sni/pcimt.c
index cec4b8c..12336c2 100644
--- a/arch/mips/sni/pcimt.c
+++ b/arch/mips/sni/pcimt.c
@@ -185,6 +185,7 @@ static void __init sni_pcimt_resource_init(void)
 
 extern struct pci_ops sni_pcimt_ops;
 
+#ifdef CONFIG_PCI
 static struct pci_controller sni_controller = {
 	.pci_ops	= &sni_pcimt_ops,
 	.mem_resource	= &sni_mem_resource,
@@ -193,6 +194,7 @@ static struct pci_controller sni_controller = {
 	.io_offset	= 0x00000000UL,
 	.io_map_base	= SNI_PORT_BASE
 };
+#endif
 
 static void enable_pcimt_irq(struct irq_data *d)
 {
-- 
1.8.2.1
