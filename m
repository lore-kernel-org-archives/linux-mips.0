Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFE352D2C3;
	Thu,  1 Oct 2026 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871232; cv=none; b=Qava+QtxCARiePTRfzYVrbKxUoEMncIuUA3RUKJJahpZ3CMfrIiMpfTICQaxyhmK3x5dELf19l7AeheA469RzDAW5bXlbhB/LCMmKNvvD0ft4mZqJI4ZPj9uXPZkUV4bJbZ2CV4MUyfQJuo/lv+7MMKS3Lk7CA1O1cBP+RdgUmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871232; c=relaxed/simple;
	bh=QKYlsoYC1SKV7XjijH0vAR2oUl0yzLQt5pPCjAICduk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HAqkZmhHSLMdDbBPvNcQpsC+PXcwY/L6KB06f46uA3FI/ksHftUPgL3d+e3b9JkUbedvwOQ4/nkDuM3/91Ht8t+iOaWRDhfLpalq7WLPpbIkPO3fnn+CJCBfOqsIMJscue1tZuGNfXq4RX/22IqzSWubyjkRLiFpYsAWtg1x4UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/llxquz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/llxquz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814401F00898;
	Thu,  1 Oct 2026 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871231;
	bh=jlKKRxlvZkRUu+C+kl1CWieHNo4K4Czswyg7La2EkZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a/llxquzv4Wg8gcKoSBY7dhmblmPJYE1dUjA/jTTBVSk9gyH32pr/0qWDtlEjCOR8
	 3+OEWxypblkM4ARsOB5s+1f2JlaL57x+BN/qq7yKyUjHp7rRkwlGKW65pc9nwz4L0U
	 ApCZhQWdp8paBXm8FUDX3nxN7mdHKVIfPcpkklUHfmkaoQoVzWNKz8LFREJJND8kMX
	 Z4t9GHGmPmd0zIA10S/IupYxoy38D6JMAbwfCMmy2Bcwt9nUIKxUWmvHCEz+uwduDV
	 upVO90eoYW0Ixxv6DEKUeSYX70CQPFg8ul3zOkesqtUYmICHP0YHTtgTuPBrAPXG1b
	 kOh9QWsezWzgQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/38] MIPS: SGI-IP27: resolve the mapped-kernel node shift at runtime
Date: Thu,  1 Oct 2026 18:11:51 +0200
Message-ID: <81f209cf359e9074fdcdacc0a1127e9d27861617.1790857966.git.kaloz@kernel.org>
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

A Bedrock hub puts the nasid one bit higher in an address than a Hub
does.  MAPPED_KERNEL_SETUP_TLB builds its wired entry and smp_slave_setup()
reaches the kernel variables before any C runs, so take the shift from
the hub's Crosstalk widget ID.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 .../include/asm/mach-ip27/kernel-entry-init.h | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/mach-ip27/kernel-entry-init.h b/arch/mips/include/asm/mach-ip27/kernel-entry-init.h
index cd50e6d3d966..1bedd3c3bc58 100644
--- a/arch/mips/include/asm/mach-ip27/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-ip27/kernel-entry-init.h
@@ -21,6 +21,21 @@
 #define PAGE_DIRTY		(1 << 8)
 #define CACHE_CACHABLE_COW	(5 << 9)
 
+	/*
+	 * A Bedrock hub puts the nasid one bit higher in an address than a
+	 * Hub does.  Returns the shift in \shft, clobbering \tmp.
+	 */
+	.macro	GET_NASID_SHFT shft, tmp
+	.set	push
+	.set	reorder
+	GET_HUB_GEN_ASM \tmp
+	li	\shft, SN1_NASID_SHFT
+	beqz	\tmp, 1f
+	li	\shft, SN0_NASID_SHFT
+1:
+	.set	pop
+	.endm
+
 	/*
 	 * inputs are the text nasid in t1, data nasid in t2.
 	 */
@@ -33,9 +48,10 @@
 	 */
 	dli	t0, 0xffffffffc0000000
 	dmtc0	t0, CP0_ENTRYHI
+	GET_NASID_SHFT	t3, t0
 	li	t0, 0x1c000		# Offset of text into node memory
-	dsll	t1, NASID_SHFT		# Shift text nasid into place
-	dsll	t2, NASID_SHFT		# Same for data nasid
+	dsllv	t1, t1, t3		# Shift text nasid into place
+	dsllv	t2, t2, t3		# Same for data nasid
 	or	t1, t1, t0		# Physical load address of kernel text
 	or	t2, t2, t0		# Physical load address of kernel data
 	dsrl	t1, 12			# 4K pfn
@@ -78,9 +94,10 @@
 	.macro	smp_slave_setup
 #ifdef CONFIG_MAPPED_KERNEL
 	GET_NASID_ASM	t1, t0
+	GET_NASID_SHFT	t3, t0
 	dli	t0, KLDIR_OFFSET + (KLI_KERN_VARS * KLDIR_ENT_SIZE) + \
 		    KLDIR_OFF_POINTER + CAC_BASE
-	dsll	t1, NASID_SHFT
+	dsllv	t1, t1, t3
 	or	t0, t0, t1
 	ld	t0, 0(t0)			# t0 points to kern_vars struct
 	lh	t1, KV_RO_NASID_OFFSET(t0)
-- 
2.47.3

