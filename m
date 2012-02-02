Received: from smtpgw2.netlogicmicro.com ([12.203.210.54]:52723 "EHLO
        smtpgw2.netlogicmicro.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1904109Ab2BBOjP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 2 Feb 2012 15:39:15 +0100
From: Jayachandran C <jayachandranc@netlogicmicro.com>
Subject: [PATCH 03/11] MIPS: Netlogic: Remove unused pcibios_fixups
Date: Thu, 2 Feb 2012 20:12:57 +0530
Message-ID: <0cf4db092acfd521440f8d75dfffbe143060a5f6.1328189941.git.jayachandranc@netlogicmicro.com>
In-Reply-To: <cover.1328189941.git.jayachandranc@netlogicmicro.com>
References: <cover.1328189941.git.jayachandranc@netlogicmicro.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Jayachandran C <jayachandranc@netlogicmicro.com>
Message-ID: <20120202144257.8W7NoNO7jsma9TPxppEX0c5hCSHqakDtKuSrUWiwt4E@z>

This global is unneeded, and seems to be carried over from ancient
code.

Signed-off-by: Jayachandran C <jayachandranc@netlogicmicro.com>
---
 arch/mips/pci/pci-xlr.c |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/arch/mips/pci/pci-xlr.c b/arch/mips/pci/pci-xlr.c
index 0148001..7dc1de2 100644
--- a/arch/mips/pci/pci-xlr.c
+++ b/arch/mips/pci/pci-xlr.c
@@ -334,7 +334,3 @@ static int __init pcibios_init(void)
 }
 
 arch_initcall(pcibios_init);
-
-struct pci_fixup pcibios_fixups[] = {
-	{0}
-};
-- 
1.7.5.4
