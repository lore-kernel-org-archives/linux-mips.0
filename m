Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5443501F2D;
	Thu,  1 Oct 2026 16:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871221; cv=none; b=mcxVAAw1l6A816cr0mrVjlT/dV/AX5be3Ds05KclN0wgq3OyfIs6NSK9TZ8enJYkjigCdtV5JZuwXoNsInVl1Bjlus9RMOmY6N78v7/jIqF0y6GCgehRkdlQkSURGWSlJOA1CrtbbErwYcl+Zio32XQ1UV8iv3CWbEe2sW40M+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871221; c=relaxed/simple;
	bh=nPX5fodMhIC5Z+7wy1MEUVd18oD8aCEjDiBSP4AKKfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxgjG6jRoCDqwjSBKEYYMDIdbMCKNW6NBVzuuCTA1q6vmSPICRsZgUYzZdF0h9pb2rXXx8aLTIzM/7cuBJGWSTPAHgzm9RBKRo3L/Bvh5nrJ6E84N/wDA73IJ/ihBH/WmfmEbYkeN6X5y64os6aFQVwPGUFRsnLsrOnTFXGBvJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+GCtwij; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+GCtwij"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E8E1F000FF;
	Thu,  1 Oct 2026 16:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871219;
	bh=RrUX5cOyIDqfWceQg9sJIMbkBAKQXyN7VQRTNCVo6Qs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W+GCtwijdsMNZ2GCNp7Ny/vBbEaJyVMbkxy6lg3nLi5cYGZ2UiWT1hUmqFZpuQ3qT
	 NVpGGkrJ7rflfi7hMsM0tMryzawYN2BfqiT5K8i7idF2vmQnhtcHFSFCe6e9KSVgBF
	 OoXG/aw2ld0MIZgsvvs5U4GhA8Xh5LHARL+l9aCH050IQekjjYLQ/QeRWreRh2DeDF
	 wruW2nlxHzPHWTt+pRoxPsNzRwNDyThHm0OrsBN4JKwAUTSZR8Y7FP9Btq90vpf2Hv
	 9DvSxQuW9QWuYVXL2tNe5N07mTfQSr/BeTVH3nsPRNkiJ7AIpxvl3cQThIbMgM/xKw
	 EChH77QzI+I2w==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/38] MIPS: SGI-IP27: decode a Bedrock hub's node id and system size
Date: Thu,  1 Oct 2026 18:11:44 +0200
Message-ID: <31dd1111933ec602d40ba76112430ff2fea50cad.1790857966.git.kaloz@kernel.org>
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

Bedrock's LB_REV_ID holds the node id in bits 39:32 and the system
size, which sets N mode and the region size, in bits 47:46. Decode
both by hub generation; the assembly form, built only for
MAPPED_KERNEL, keys on the widget ID.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 .../include/asm/mach-ip27/kernel-entry-init.h |  8 +++-
 arch/mips/include/asm/sn/agent.h              |  2 +-
 arch/mips/include/asm/sn/sn0/hub.h            | 37 +++++++++++++++++--
 arch/mips/include/asm/sn/sn0/hubni.h          |  3 ++
 arch/mips/include/asm/sn/sn1/hub.h            | 14 +++++++
 arch/mips/include/asm/xtalk/xwidget.h         |  2 +-
 arch/mips/sgi-ip27/ip27-init.c                |  6 ++-
 7 files changed, 63 insertions(+), 9 deletions(-)

diff --git a/arch/mips/include/asm/mach-ip27/kernel-entry-init.h b/arch/mips/include/asm/mach-ip27/kernel-entry-init.h
index 3e54f605a70b..cd50e6d3d966 100644
--- a/arch/mips/include/asm/mach-ip27/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-ip27/kernel-entry-init.h
@@ -65,8 +65,10 @@
  * arch/mips/mach-xxx/kernel-entry-init.h when necessary.
  */
 	.macro	kernel_entry_setup
-	GET_NASID_ASM	t1
+#ifdef CONFIG_MAPPED_KERNEL
+	GET_NASID_ASM	t1, t0
 	move		t2, t1			# text and data are here
+#endif
 	MAPPED_KERNEL_SETUP_TLB
 	.endm
 
@@ -74,7 +76,8 @@
  * Do SMP slave processor setup necessary before we can safely execute C code.
  */
 	.macro	smp_slave_setup
-	GET_NASID_ASM	t1
+#ifdef CONFIG_MAPPED_KERNEL
+	GET_NASID_ASM	t1, t0
 	dli	t0, KLDIR_OFFSET + (KLI_KERN_VARS * KLDIR_ENT_SIZE) + \
 		    KLDIR_OFF_POINTER + CAC_BASE
 	dsll	t1, NASID_SHFT
@@ -82,6 +85,7 @@
 	ld	t0, 0(t0)			# t0 points to kern_vars struct
 	lh	t1, KV_RO_NASID_OFFSET(t0)
 	lh	t2, KV_RW_NASID_OFFSET(t0)
+#endif
 	MAPPED_KERNEL_SETUP_TLB
 
 	/*
diff --git a/arch/mips/include/asm/sn/agent.h b/arch/mips/include/asm/sn/agent.h
index 8873eb34e31b..1d6d0cd5e5fd 100644
--- a/arch/mips/include/asm/sn/agent.h
+++ b/arch/mips/include/asm/sn/agent.h
@@ -15,8 +15,8 @@
 #include <asm/sn/arch.h>
 
 #if defined(CONFIG_SGI_IP27)
-#include <asm/sn/sn0/hub.h>
 #include <asm/sn/sn1/hub.h>
+#include <asm/sn/sn0/hub.h>
 #endif /* CONFIG_SGI_IP27 */
 
 /*
diff --git a/arch/mips/include/asm/sn/sn0/hub.h b/arch/mips/include/asm/sn/sn0/hub.h
index 916394319af5..c5429dbddc7a 100644
--- a/arch/mips/include/asm/sn/sn0/hub.h
+++ b/arch/mips/include/asm/sn/sn0/hub.h
@@ -31,6 +31,8 @@
 #include <asm/sn/sn0/hubni.h>
 //#include <asm/sn/sn0/hubcore.h>
 
+#include <asm/xtalk/xwidget.h>
+
 /* Translation of uncached attributes */
 #define UATTR_HSPEC	0
 #define UATTR_IO	1
@@ -39,13 +41,35 @@
 
 #ifdef __ASSEMBLER__
 /*
- * Returns the local nasid into res.
+ * Clears tmp on a Bedrock hub.  Nothing has read the hub's part number
+ * this early, so take it from the widget ID.
  */
-	.macro GET_NASID_ASM res
+	.macro GET_HUB_GEN_ASM tmp
+	dli	\tmp, LOCAL_HUB_ADDR(IIO_WID)
+	ld	\tmp, (\tmp)
+	dsrl	\tmp, WIDGET_PART_NUM_SHFT
+	andi	\tmp, (WIDGET_PART_NUM >> WIDGET_PART_NUM_SHFT)
+	xori	\tmp, WIDGET_BDRCK_PART_NUM
+	.endm
+
+/*
+ * Returns the local nasid into res, clobbering tmp.
+ */
+	.macro GET_NASID_ASM res, tmp
+	.set	push
+	.set	reorder
+	GET_HUB_GEN_ASM \tmp
 	dli	\res, LOCAL_HUB_ADDR(NI_STATUS_REV_ID)
 	ld	\res, (\res)
+	beqz	\tmp, 1f
 	and	\res, NSRI_NODEID_MASK
 	dsrl	\res, NSRI_NODEID_SHFT
+	b	2f
+1:
+	dsrl	\res, LRI_NODEID_SHFT_IP35
+	andi	\res, LRI_NODEID_MASK_IP35
+2:
+	.set	pop
 	.endm
 #else
 
@@ -54,8 +78,13 @@
  */
 static inline nasid_t get_nasid(void)
 {
-	return (nasid_t)((LOCAL_HUB_L(NI_STATUS_REV_ID) & NSRI_NODEID_MASK)
-			 >> NSRI_NODEID_SHFT);
+	u64 id = LOCAL_HUB_L(NI_STATUS_REV_ID);
+
+	if (system_is_ip35)
+		return (nasid_t)((id >> LRI_NODEID_SHFT_IP35) &
+				 LRI_NODEID_MASK_IP35);
+
+	return (nasid_t)((id & NSRI_NODEID_MASK) >> NSRI_NODEID_SHFT);
 }
 #endif
 
diff --git a/arch/mips/include/asm/sn/sn0/hubni.h b/arch/mips/include/asm/sn/sn0/hubni.h
index 4830bae723e4..ff7df5e27f66 100644
--- a/arch/mips/include/asm/sn/sn0/hubni.h
+++ b/arch/mips/include/asm/sn/sn0/hubni.h
@@ -252,6 +252,9 @@ typedef union	hubni_port_error_u {
 
 static inline int get_region_shift(void)
 {
+	if (system_is_ip35)
+		return LRI_SYSTEM_SIZE_IP35(LOCAL_HUB_L(NI_STATUS_REV_ID));
+
 	if (LOCAL_HUB_L(NI_STATUS_REV_ID) & NSRI_REGIONSIZE_MASK)
 		return NASID_TO_FINEREG_SHFT;
 
diff --git a/arch/mips/include/asm/sn/sn1/hub.h b/arch/mips/include/asm/sn/sn1/hub.h
index db41bcb3d34a..71ccd2ba3698 100644
--- a/arch/mips/include/asm/sn/sn1/hub.h
+++ b/arch/mips/include/asm/sn/sn1/hub.h
@@ -12,4 +12,18 @@
 #define HUBXBBASE_IP35		0x00700000
 #define HUBMDBASE_IP35		0x00780000
 
+/*
+ * LB_REV_ID, at the base of the LB block and so at Hub's NI_STATUS_REV_ID
+ * offset, holds the node id in bits 39:32.
+ */
+#define LRI_NODEID_SHFT_IP35	32
+#define LRI_NODEID_MASK_IP35	0xff
+
+/*
+ * Bits 47:46 give the system size: 0, 1 or 2 is log2 of the nodes per
+ * region, and 2 is N mode.
+ */
+#define LRI_SYSTEM_SIZE_IP35(id)	(((id) >> 46) & 0x3)
+#define LRI_SYSTEM_SIZE_NMODE_IP35	2
+
 #endif /* _ASM_SN_SN1_HUB_H */
diff --git a/arch/mips/include/asm/xtalk/xwidget.h b/arch/mips/include/asm/xtalk/xwidget.h
index 6dae5d9628f7..978877e8a090 100644
--- a/arch/mips/include/asm/xtalk/xwidget.h
+++ b/arch/mips/include/asm/xtalk/xwidget.h
@@ -122,7 +122,7 @@ struct widget_ident {
 };
 
 /* Known Xtalk Widgets */
-static const struct widget_ident __initconst widget_idents[] = {
+static const struct widget_ident widget_idents[] __initconst __maybe_unused = {
 	{
 		WIDGET_XBOW_MFGR_NUM,
 		WIDGET_XBOW_PART_NUM,
diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index 6394c2076041..108d90908763 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -121,7 +121,11 @@ void __init plat_mem_setup(void)
 	 * Try to catch kernel missconfigurations and give user an
 	 * indication what option to select.
 	 */
-	n_mode = LOCAL_HUB_L(NI_STATUS_REV_ID) & NSRI_MORENODES_MASK;
+	if (system_is_ip35)
+		n_mode = LRI_SYSTEM_SIZE_IP35(LOCAL_HUB_L(NI_STATUS_REV_ID)) ==
+			 LRI_SYSTEM_SIZE_NMODE_IP35;
+	else
+		n_mode = LOCAL_HUB_L(NI_STATUS_REV_ID) & NSRI_MORENODES_MASK;
 	printk("Machine is in %c mode.\n", n_mode ? 'N' : 'M');
 #ifdef CONFIG_SGI_SN_N_MODE
 	if (!n_mode)
-- 
2.47.3

