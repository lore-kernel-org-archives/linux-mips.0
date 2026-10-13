Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185C1521221;
	Tue, 13 Oct 2026 13:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897543; cv=none; b=dEg5h/Bn1zpMRtt1fJqktIqXQX93K3y6WEiw5q0wDu0/39/29hme1XMEjI4xDiylFo2Yledn8cK3rPTk1lVhIbIvJksAnjXDvw6sShNRjbXxUX4I7Nvk82B8tBoRlqUxs4nY8Bx2Bzzqz9M98gwMpLQYOJx/a8rDethUY5WeUCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897543; c=relaxed/simple;
	bh=hRyq95jeA7bYtX595jP4Y2lSWzHdBKa/Xe6AAuH5LHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lnTo61pxTQzTPr/p1HksDI8L6rDbyX+ifFr5AgMoga1Te0ZMezydEyx9B2D2tm3lW+UgUuCNmgSOUjByTz+ci+0V/7h1EhiEVDQUCHj5cPYhMjGApPVx0Gqd756onXHMqvA4nl6BUJ5bQrSrqFN3MvOAopr/+EsgW2oyjgsXnUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyoutZoN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyoutZoN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6E51F00893;
	Tue, 13 Oct 2026 13:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897542;
	bh=mBP6pSGNHgICxEEzwZvqPhFYoxdpGjTywawTPRgXIcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nyoutZoNSwaXnbv3P1y/zCORVNDVKr4QuryUv36QdVVWGzDhRcSt2frF+dHQAP6wm
	 rPauQ2y9fU1cvLIUXDdcKEM4sAafb5fhM6scPteRaB2zULEp50e+txalJVT5aSOL8a
	 YpUcUHCJG1/1Je4rSBsP9R5b7oM60CsHu5JzUFfste8TysUUupPMkPEqbI4fhdYmq1
	 7W80JwQ6++2Mro2Mwe2yIpu4W5NoG92uSAFq517MLyynddUEpMYcmy18IL68lffHS7
	 +Dsf7cXQMlRmVyuF1NmAsU4j8yfJqWc+lb62drQa9TAmNBiLRT1qKfCxTmW6x5tITu
	 +2Gcbmt4ehXzA==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 16/53] MIPS: SGI-IP27: lay out node memory in 1GB banks on Bedrock hubs
Date: Tue, 13 Oct 2026 15:16:36 +0200
Message-ID: <c99a1738b90b0e63fc62acf11025b8fc0dbc6ddc.1791890466.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791890466.git.kaloz@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org>
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

