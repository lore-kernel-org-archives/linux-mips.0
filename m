Received: from [69.28.251.93] ([69.28.251.93]:55953 "EHLO b32.net"
        rhost-flags-FAIL-FAIL-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1492955Ab1DQTIa (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sun, 17 Apr 2011 21:08:30 +0200
From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH] MIPS: Squash pci_fixup_irqs() compiler warning
Date: Sun, 17 Apr 2011 12:01:08 -0700
Message-ID: <cb01d61712b1374a8c62bc765094ea7e@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Return-Path: <cernekee@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Wu Zhangjin <wuzhangjin@gmail.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20110417190108.03XJdiwA4jYRjMb7K4JxQubv4TQRQAJ7hX5bGouwEg8@z>

MIPS Linux is unique in that it uses a "const struct pci_dev *" argument
to discourage bad coding practices in pcibios_map_irq().  Add a cast so
that this warning goes away:

arch/mips/pci/pci.c: In function 'pcibios_init':
arch/mips/pci/pci.c:165:45: warning: passing argument 2 of 'pci_fixup_irqs' from incompatible pointer type
include/linux/pci.h:856:6: note: expected 'int (*)(struct pci_dev *, u8,  u8)' but argument is of type 'struct pci_dev *'

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---

Reference:

http://www.mail-archive.com/gnewsense-dev@nongnu.org/msg00706.html

It's been two years since the original discussion, and the warning is
still there.  It is now the only warning left in my kernel build.

I was hoping we could get this resolved for good (one way or another).

 arch/mips/pci/pci.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/mips/pci/pci.c b/arch/mips/pci/pci.c
index 33bba7b..9a35cd6 100644
--- a/arch/mips/pci/pci.c
+++ b/arch/mips/pci/pci.c
@@ -157,7 +157,8 @@ static int __init pcibios_init(void)
 	for (hose = hose_head; hose; hose = hose->next)
 		pcibios_scanbus(hose);
 
-	pci_fixup_irqs(pci_common_swizzle, pcibios_map_irq);
+	pci_fixup_irqs(pci_common_swizzle,
+		       (int (*)(struct pci_dev *, u8, u8))pcibios_map_irq);
 
 	pci_initialized = 1;
 
-- 
1.7.4.3
