Received: from mailapp01.imgtec.com ([195.59.15.196]:44380 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007955AbaLLMp5W156m (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 12 Dec 2014 13:45:57 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH] mips: pci: Add ifdef around pci_proc_domain
Date: Fri, 12 Dec 2014 12:45:39 +0000
Message-ID: <1418388339-19750-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Zubair.Kakakhel@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org
Cc: Markos.Chandras@imgtec.com, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20141212124539.hXVsKEh3uJEt-XG1o_EjK9-1j7R9SnzDjyDm0ZsmYpc@z>

Without these, there are multiple definitions of pci_proc_domain()
and pci_domain_nr() if linux/pci.h and asm/pci.h are included.

Add #ifdefs around them

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
---
 arch/mips/include/asm/pci.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/pci.h b/arch/mips/include/asm/pci.h
index 6952962..193b4c6 100644
--- a/arch/mips/include/asm/pci.h
+++ b/arch/mips/include/asm/pci.h
@@ -121,6 +121,7 @@ static inline void pci_dma_burst_advice(struct pci_dev *pdev,
 }
 #endif
 
+#ifdef CONFIG_PCI_DOMAINS
 #define pci_domain_nr(bus) ((struct pci_controller *)(bus)->sysdata)->index
 
 static inline int pci_proc_domain(struct pci_bus *bus)
@@ -128,6 +129,7 @@ static inline int pci_proc_domain(struct pci_bus *bus)
 	struct pci_controller *hose = bus->sysdata;
 	return hose->need_domain_info;
 }
+#endif /* CONFIG_PCI_DOMAINS */
 
 #endif /* __KERNEL__ */
 
-- 
1.9.1
