Received: from multi.imgtec.com ([194.200.65.239]:49756 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6823098Ab3FQImMZCKnU (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 17 Jun 2013 10:42:12 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: ath79: Fix argument for the ap136_pc_init function
Date: Mon, 17 Jun 2013 09:42:11 +0100
Message-ID: <1371458531-4988-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20130617084211.cAiUZTU5Marr7xr4TgREQjHPeolYI1o6jfcMYbDZ4iU@z>

ap136_pci_init expects a u8 pointer as an argument.

Fixes the following build problem on a randconfig:
arch/mips/ath79/mach-ap136.c:151:2: error:
too many arguments to function 'ap136_pci_init'

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
This patch is for the upstream-sfr/mips-for-linux-next tree
---
 arch/mips/ath79/mach-ap136.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/ath79/mach-ap136.c b/arch/mips/ath79/mach-ap136.c
index 479dd4b..07eac58 100644
--- a/arch/mips/ath79/mach-ap136.c
+++ b/arch/mips/ath79/mach-ap136.c
@@ -132,7 +132,7 @@ static void __init ap136_pci_init(u8 *eeprom)
 	ath79_register_pci();
 }
 #else
-static inline void ap136_pci_init(void) {}
+static inline void ap136_pci_init(u8 *eeprom) {}
 #endif /* CONFIG_PCI */
 
 static void __init ap136_setup(void)
-- 
1.8.2.1
