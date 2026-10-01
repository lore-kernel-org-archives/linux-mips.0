Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FF741D12B;
	Thu,  1 Oct 2026 16:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871224; cv=none; b=knpFnVumW/b6ZC5nqR9pgtJXPWmzosnCSM4zIfsEMErga4MR+XNKr8TphkXmqu8wh9LcV7wiD+IJiQNyD70ML0fdO3sbyiCa8RbNHOo/A7ZGsOhTp7R83ipeat7RT2UCiTkunoUQ3ZVVAhjHQN3y1H5mGk9swOfIM4dtdI8Rj1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871224; c=relaxed/simple;
	bh=hRyq95jeA7bYtX595jP4Y2lSWzHdBKa/Xe6AAuH5LHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ah+NagB1lWMKZlX1WP4YpfN3qSEc2y1W5vgJiJrKGf7r92eUTs5u6DGwmx+mc1+rSA89AiE1NRTY39pGd8nOaniaOsM6xSolmrhzWpIdet8YbzBM/AlIbBetmz1kyZz+PEw+rdmaB/KwQTj8ETRxL5lcUCxDFvSLLLAzYlrTKq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSOhwM/1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSOhwM/1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CB31F000FF;
	Thu,  1 Oct 2026 16:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871222;
	bh=mBP6pSGNHgICxEEzwZvqPhFYoxdpGjTywawTPRgXIcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GSOhwM/1iLSmDhzPU6cI84c9VCgNZj+wvh09LElB23Eo26d9jPMoWT+BkSLeOq9zZ
	 +BkONoOdlfunk6fL5SW025BP0ke3wtay6SPR7ss9WqpQv39+3XhbqQuQ74CYjdzPSv
	 UwcOyAYbpS/QH/8jr0zE77osWm7HanxRAmnfKxbfitc3NvS9M7tUEsLO5lcz0tuuHm
	 kfiW+O00Uu6a4v3Ojp9AbJMXM9mcpEE/0096zHBFT0H3DeiumT4NSHLijLlbhGRQ/o
	 jujsCTsqi6Ou6dVrvWXiFGYVANkl9ICpjdjB9hOO1wskF5nW+xGw9s5dRB0Z/xQwvF
	 PmCR/bzo9KBSw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/38] MIPS: SGI-IP27: lay out node memory in 1GB banks on Bedrock hubs
Date: Thu,  1 Oct 2026 18:11:46 +0200
Message-ID: <56b236f24a67421bea81a594e9cf38e020394cd6.1790857966.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790857966.git.kaloz@kernel.org>
References: <cover.1790857966.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hub describes a node's memory as 128MB slots, four slots to a
klconfig bank entry. Bedrock gives each bank entry a 1GB slot of its
own and sizes it in megabytes. Take the slot shift, the slot count and
the bank size from the hub generation.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-memory.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index 4317f5ae1fd1..0204dc8bb1bb 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -31,9 +31,16 @@
 
 #include "ip27-common.h"
 
-#define SLOT_PFNSHIFT		(SLOT_SHIFT - PAGE_SHIFT)
 #define PFN_NASIDSHFT		(NASID_SHFT - PAGE_SHIFT)
 
+/* A Bedrock node's memory comes in 1GB banks. */
+#define BEDROCK_SLOT_SHIFT	30
+
+static unsigned int __init slot_shift(void)
+{
+	return system_is_ip35 ? BEDROCK_SLOT_SHIFT : SLOT_SHIFT;
+}
+
 struct node_data *__node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(__node_data);
 
@@ -230,7 +237,8 @@ static void __init dump_topology(void)
 
 static unsigned long __init slot_getbasepfn(nasid_t nasid, int slot)
 {
-	return ((unsigned long)nasid << PFN_NASIDSHFT) | (slot << SLOT_PFNSHIFT);
+	return ((unsigned long)nasid << PFN_NASIDSHFT) |
+	       ((unsigned long)slot << (slot_shift() - PAGE_SHIFT));
 }
 
 static unsigned long __init slot_psize_compute(nasid_t nasid, int slot)
@@ -249,6 +257,12 @@ static unsigned long __init slot_psize_compute(nasid_t nasid, int slot)
 	if (!banks)
 		return 0;
 
+	/* Bedrock bank entry N sizes the 1GB slot N, in megabytes. */
+	if (system_is_ip35) {
+		size = (unsigned long)banks->membnk_bnksz[slot];
+		return (size << 20) >> PAGE_SHIFT;
+	}
+
 	/* Size in _Megabytes_ */
 	size = (unsigned long)banks->membnk_bnksz[slot/4];
 
@@ -315,12 +329,13 @@ static void __init mlreset(void)
 static void __init szmem(void)
 {
 	unsigned long slot_psize, slot0sz = 0, nodebytes;	/* Hack to detect problem configs */
+	int slots = system_is_ip35 ? MD_MEM_BANKS : MAX_MEM_SLOTS;
 	int slot;
 	nasid_t node;
 
 	for_each_online_node(node) {
 		nodebytes = 0;
-		for (slot = 0; slot < MAX_MEM_SLOTS; slot++) {
+		for (slot = 0; slot < slots; slot++) {
 			slot_psize = slot_psize_compute(node, slot);
 			if (slot == 0)
 				slot0sz = slot_psize;
@@ -328,7 +343,7 @@ static void __init szmem(void)
 			 * We need to refine the hack when we have replicated
 			 * kernel text.
 			 */
-			nodebytes += (1LL << SLOT_SHIFT);
+			nodebytes += (1LL << slot_shift());
 
 			if (!slot_psize)
 				continue;
@@ -337,7 +352,7 @@ static void __init szmem(void)
 						(slot0sz << PAGE_SHIFT)) {
 				pr_info("Ignoring slot %d onwards on node %d\n",
 								slot, node);
-				slot = MAX_MEM_SLOTS;
+				slot = slots;
 				continue;
 			}
 			memblock_add_node(PFN_PHYS(slot_getbasepfn(node, slot)),
-- 
2.47.3

