Received: from mail-wm0-x241.google.com ([IPv6:2a00:1450:400c:c09::241]:38130
        "EHLO mail-wm0-x241.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990433AbdLZKzvXUuy5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 26 Dec 2017 11:55:51 +0100
From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH] MIPS: Use proper @return keyword
Date: Tue, 26 Dec 2017 11:55:31 +0100
Message-ID: <20171226105532.23452-1-malat@debian.org>
Return-Path: <mathieu.malaterre@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Cc: Mathieu Malaterre <malat@debian.org>, Ralf Baechle <ralf@linux-mips.org>, "Maciej W. Rozycki" <macro@mips.com>, Paul Burton <paul.burton@mips.com>, Ingo Molnar <mingo@kernel.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20171226105531.rWbWG_OYi8lUuLHLHA_afc1MF-nHFMnd8EtfTHw-K9w@z>

Fix non-fatal warning:

arch/mips/kernel/branch.c:418: warning: Excess function parameter 'returns' description in '__compute_return_epc_for_insn'

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/mips/kernel/branch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index b79ed9af9886..e0d3a432e1e3 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -399,7 +399,7 @@ int __MIPS16e_compute_return_epc(struct pt_regs *regs)
  *
  * @regs:	Pointer to pt_regs
  * @insn:	branch instruction to decode
- * @returns:	-EFAULT on error and forces SIGILL, and on success
+ * @return:	-EFAULT on error and forces SIGILL, and on success
  *		returns 0 or BRANCH_LIKELY_TAKEN as appropriate after
  *		evaluating the branch.
  *
-- 
2.11.0
