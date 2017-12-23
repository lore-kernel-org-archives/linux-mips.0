Received: from szxga04-in.huawei.com ([45.249.212.190]:2173 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23990483AbdLWLK4gh250 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sat, 23 Dec 2017 12:10:56 +0100
From: Yisheng Xie <xieyisheng1@huawei.com>
Subject: [PATCH v3 23/27] MIPS: pci: replace devm_ioremap_nocache with devm_ioremap
Date: Sat, 23 Dec 2017 19:02:03 +0800
Message-ID: <1514026923-33665-1-git-send-email-xieyisheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <xieyisheng1@huawei.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
Cc: ysxie@foxmail.com, Yisheng Xie <xieyisheng1@huawei.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20171223110203.zVQWrNaUhPiZfSesMJcAtyqWOZl3XzYfehCqp15KYV4@z>

Default ioremap is ioremap_nocache, so devm_ioremap has the same
function with devm_ioremap_nocache, which can just be killed to
save the size of devres.o

This patch is to use use devm_ioremap instead of devm_ioremap_nocache,
which should not have any function change but prepare for killing
devm_ioremap_nocache.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Signed-off-by: Yisheng Xie <xieyisheng1@huawei.com>
---
 arch/mips/pci/pci-ar2315.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/pci/pci-ar2315.c b/arch/mips/pci/pci-ar2315.c
index b4fa641..8f3baf1 100644
--- a/arch/mips/pci/pci-ar2315.c
+++ b/arch/mips/pci/pci-ar2315.c
@@ -428,8 +428,7 @@ static int ar2315_pci_probe(struct platform_device *pdev)
 	apc->mem_res.flags = IORESOURCE_MEM;
 
 	/* Remap PCI config space */
-	apc->cfg_mem = devm_ioremap_nocache(dev, res->start,
-					    AR2315_PCI_CFG_SIZE);
+	apc->cfg_mem = devm_ioremap(dev, res->start, AR2315_PCI_CFG_SIZE);
 	if (!apc->cfg_mem) {
 		dev_err(dev, "failed to remap PCI config space\n");
 		return -ENOMEM;
-- 
1.8.3.1
