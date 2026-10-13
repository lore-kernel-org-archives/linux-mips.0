Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E949F52123C;
	Tue, 13 Oct 2026 13:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897544; cv=none; b=FS16cAQBnoss1jqaEQlS/L+AypcpCKIsN7V7qF7lSIZAoIVGUuBp20Yc3j1EowcZ9NX+Zfj7wye1DPWEYIkXxippiFRuXAtczHTynNkLaoFSu5tBpZjQtHJNlxbOSWJjsnTZ2JbO+jqi8GdgCWDJyXOjqVoYr/hLQbRlYT1zBgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897544; c=relaxed/simple;
	bh=1a6p8La4O+gZvyhbPBARC27fHfoLIMt7OPma6tfmIz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OdWZxBeq3ye6FpR2rCNWxu2HKGMvSc2M+xacZVNfBcE2sVZuN5R7Qw94u1ksZ/LZbC7GTyBwKHZoriAyzDGVfBEl1FXWG9hEW5eq044rAPdLKYPTtz51WiU76KsklF/leju0/+ywvv9PHj0of1b8xt8hqmrPxJtRSFHb8oQhQPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCy8aBnY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCy8aBnY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D021F000FF;
	Tue, 13 Oct 2026 13:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897543;
	bh=W9AXGHXT1++O8dEXmJWWVcm6McGUIZriO4dqTiwr3u4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VCy8aBnY/4NxhqF8RtIR1aEigCLFgUlDxXaBpyQZZLkIDXFvAfXYHacTlV5YyG6Yo
	 qhQfgLyn7VC073R8USR2MuF4zS+m1UYUgk8FXZPR0G9qDtax2AqM/1fwQnBWQD2WJQ
	 H6N8ldT1FUJMmhluncZLfwJF57F9kA7yTvrXd9IS1mnSA9Gdfc96mHVbOhp4HeWwSo
	 a0Auv+0WpNQF4CpyHw7DcglDA5PHbzLznlQtlvM89kC7GpNn+bmrZLy48JUhuqbPcy
	 QjUeo1J3z9jokonZIjW2B5N950AERORBti2i/1mHmQSESuaS75jbFWKW74Deh1o+oC
	 LmQZp2+KLs72A==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 17/53] MIPS: SGI-IP27: reserve the bottom 64MB of node 0 on Bedrock hubs
Date: Tue, 13 Oct 2026 15:16:37 +0200
Message-ID: <07f9803ba7742f9f2e2243b857c41ecfbcc3b3d6.1791890466.git.kaloz@kernel.org>
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

