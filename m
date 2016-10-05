Received: from mailapp02.imgtec.com ([217.156.133.132]:59664 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992105AbcJERTWjNzXu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 5 Oct 2016 19:19:22 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v3 01/18] MIPS: PCI: Use struct list_head lists
Date: Wed, 5 Oct 2016 18:18:07 +0100
Message-ID: <20161005171824.18014-2-paul.burton@imgtec.com>
In-Reply-To: <20161005171824.18014-1-paul.burton@imgtec.com>
References: <20161005171824.18014-1-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20161005171807.eZ1X6qNHTLZ3uR2uwQK08H2h1JXJHaJtZ2nfLDM9kGo@z>

Rather than open-coding a linked list implementation, make use of the
one in linux/list.h.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>

---

Changes in v3:
- Include this patch missed from previous submissions.

Changes in v2: None

 arch/mips/include/asm/pci.h | 3 ++-
 arch/mips/pci/pci.c         | 9 ++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/pci.h b/arch/mips/include/asm/pci.h
index 9b63cd4..547e113 100644
--- a/arch/mips/include/asm/pci.h
+++ b/arch/mips/include/asm/pci.h
@@ -17,6 +17,7 @@
  */
 
 #include <linux/ioport.h>
+#include <linux/list.h>
 #include <linux/of.h>
 
 /*
@@ -25,7 +26,7 @@
  * single controller supporting multiple channels.
  */
 struct pci_controller {
-	struct pci_controller *next;
+	struct list_head list;
 	struct pci_bus *bus;
 	struct device_node *of_node;
 
diff --git a/arch/mips/pci/pci.c b/arch/mips/pci/pci.c
index b4c02f2..644ae96 100644
--- a/arch/mips/pci/pci.c
+++ b/arch/mips/pci/pci.c
@@ -28,8 +28,7 @@
 /*
  * The PCI controller list.
  */
-
-static struct pci_controller *hose_head, **hose_tail = &hose_head;
+static LIST_HEAD(controllers);
 
 unsigned long PCIBIOS_MIN_IO;
 unsigned long PCIBIOS_MIN_MEM;
@@ -193,8 +192,8 @@ void register_pci_controller(struct pci_controller *hose)
 		goto out;
 	}
 
-	*hose_tail = hose;
-	hose_tail = &hose->next;
+	INIT_LIST_HEAD(&hose->list);
+	list_add(&hose->list, &controllers);
 
 	/*
 	 * Do not panic here but later - this might happen before console init.
@@ -248,7 +247,7 @@ static int __init pcibios_init(void)
 	pcibios_set_cache_line_size();
 
 	/* Scan all of the recorded PCI controllers.  */
-	for (hose = hose_head; hose; hose = hose->next)
+	list_for_each_entry(hose, &controllers, list)
 		pcibios_scanbus(hose);
 
 	pci_fixup_irqs(pci_common_swizzle, pcibios_map_irq);
-- 
2.10.0
