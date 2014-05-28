Received: from mail-bn1lp0141.outbound.protection.outlook.com ([207.46.163.141]:9334
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6854794AbaE1WKNk8ys2 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 29 May 2014 00:10:13 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH v2 05/13] MIPS: Don't build fast TLB refill handler with 32-bit kernels
Date: Wed, 28 May 2014 23:52:08 +0200
Message-ID: <1401313936-11867-6-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1401313936-11867-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1401313936-11867-1-git-send-email-andreas.herrmann@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140528215208.5Y4xIuUsZaFoAlsUbzc9I1oQOO8eetfEuwQ4lQ2HAAA@z>

From: David Daney <david.daney@cavium.com>

The fast handler only supports 64-bit kernels.

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 arch/mips/mm/tlbex.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index f99ec587..af91f3e 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -1250,13 +1250,17 @@ static void build_r4000_tlb_refill_handler(void)
 	unsigned int final_len;
 	struct mips_huge_tlb_info htlb_info __maybe_unused;
 	enum vmalloc64_mode vmalloc_mode __maybe_unused;
-
+#ifdef CONFIG_64BIT
+	bool is64bit = true;
+#else
+	bool is64bit = false;
+#endif
 	memset(tlb_handler, 0, sizeof(tlb_handler));
 	memset(labels, 0, sizeof(labels));
 	memset(relocs, 0, sizeof(relocs));
 	memset(final_handler, 0, sizeof(final_handler));
 
-	if ((scratch_reg >= 0 || scratchpad_available()) && use_bbit_insns()) {
+	if (is64bit && (scratch_reg >= 0 || scratchpad_available()) && use_bbit_insns()) {
 		htlb_info = build_fast_tlb_refill_handler(&p, &l, &r, K0, K1,
 							  scratch_reg);
 		vmalloc_mode = refill_scratch;
-- 
1.7.9.5
