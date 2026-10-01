Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E695221E6;
	Thu,  1 Oct 2026 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871225; cv=none; b=Liode0IN8Y0heL01AVRsCjIXgXOkgYC+EQ7ZBNQhTKpobBoPdBA6Uc2q5gQ1ilVIJPD03DUPvYf/h9sMm0U2IhHq0d7aoVD7hbzpDK4mQzAh1I5F84n8eE9VtDSgrIp178JNlXixJk9BpYf5rchlw8MC8204iY6Rw4HEvO7nRxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871225; c=relaxed/simple;
	bh=1a6p8La4O+gZvyhbPBARC27fHfoLIMt7OPma6tfmIz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pxuwpjXHAmeeOD4Wr84Ooj0l5yfM98NkXs7w5qqGf+OM4y36NZcp8TkXh7TcTa6h3Fkg+KkpkSg4WeYb/nQXj00NVbSdkb8SNWVxqHLuORSrrzF/2IwYWkDuwmEm6mUzGNNRVNmHtlzWOPRQkJLL8qehJiKQjNzZuwtRAYraAN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HilLjha3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HilLjha3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FCF21F00898;
	Thu,  1 Oct 2026 16:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871224;
	bh=W9AXGHXT1++O8dEXmJWWVcm6McGUIZriO4dqTiwr3u4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HilLjha3ioFc7DwgJhO1xb2slSAVcXKoqdXGmIhJstvfNLsgyUTz4EOCAGRCxXiHL
	 K11/OovXcrdvgpD0C6o/SWDWndnznWkIKwVLigc1zFRxR67Om4o/O2n7iivvF6K+Uo
	 BlzS9QYEazgC3kyTnqB1sDwdoITp/uKUwlmCvrF6I4lb0KYxE1VdkzPWmI8zIxrnWs
	 27724EGbjp2tpNkoxTW/vMcPSShGGZqe9SsdcNwYUKV9r+MKUJqb+tY70lLCcs9gtE
	 28xP+qJqiM1q0HbYejMZ/j7LbkgAm4SEnV5qBHpK9quYp8mYp9U+xgzmldg88Q/8el
	 6Usn96Kn95WpQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/38] MIPS: SGI-IP27: reserve the bottom 64MB of node 0 on Bedrock hubs
Date: Thu,  1 Oct 2026 18:11:47 +0200
Message-ID: <bd35c31bbbe68669bb4a5cba196605c771152859.1790857966.git.kaloz@kernel.org>
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

On Bedrock hubs, reserve the first 64MB of physical memory, the bottom
of node 0, and place node 0's node data above it. node_getfirstfree()
covers only the kernel image, so the area needs a reservation of its
own.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-memory.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index 0204dc8bb1bb..98184dfcd8c5 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -17,6 +17,7 @@
 #include <linux/mmzone.h>
 #include <linux/export.h>
 #include <linux/nodemask.h>
+#include <linux/sizes.h>
 #include <linux/swap.h>
 #include <linux/pfn.h>
 #include <linux/highmem.h>
@@ -36,6 +37,9 @@
 /* A Bedrock node's memory comes in 1GB banks. */
 #define BEDROCK_SLOT_SHIFT	30
 
+/* Reserved at the bottom of node 0, which starts at physical 0. */
+#define BEDROCK_RSVD_SIZE	SZ_64M
+
 static unsigned int __init slot_shift(void)
 {
 	return system_is_ip35 ? BEDROCK_SLOT_SHIFT : SLOT_SHIFT;
@@ -370,6 +374,10 @@ static void __init node_mem_init(nasid_t node)
 
 	get_pfn_range_for_nid(node, &start_pfn, &end_pfn);
 
+	/* Keep the node data above the reserved area. */
+	if (system_is_ip35 && node == 0)
+		slot_freepfn = max(slot_freepfn, PFN_UP(BEDROCK_RSVD_SIZE));
+
 	/*
 	 * Allocate the node data structures on the node first.
 	 */
@@ -410,6 +418,10 @@ void __init prom_meminit(void)
 
 	mlreset();
 	szmem();
+
+	if (system_is_ip35)
+		memblock_reserve(0, BEDROCK_RSVD_SIZE);
+
 	max_low_pfn = PHYS_PFN(memblock_end_of_DRAM());
 
 	for (node = 0; node < MAX_NUMNODES; node++) {
-- 
2.47.3

