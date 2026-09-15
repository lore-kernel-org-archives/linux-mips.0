Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631A34D5A1
	for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 07:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456397; cv=none; b=adQmCDWh/H8FnQRQHGzvbyfVA3Zy37HOUdMHYyrmWfhXp4qcXlFJ6AHdJeehMMKO8fg8KFgJfg7qE15voJkrhSF8+YhResHKphS4KB24AhrBf0IlLD+sxzkC4lN63LDqUJK+2j/bEBidx4NPwREA98qywtZBi+8G2kCMsWx/qZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456397; c=relaxed/simple;
	bh=yKvdK3j8xOuUGSgKYDb2u+uvfmNE/Kj+TpTf0ZtDgLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lsew7oYW/pEy7ishb5H39Oi6QLzh/LXnaCO6qYOQ0mJb/Ty3/gy9uG6lOueWC8PfQQESAIfna53yNqt56mQt/wcMZI9pEgQ6FFAT+Ir7/4O6Uw3ksn+nQKPKgBUKf9+Cz4k2+Hxj62Be4a4X2KSsyLs1LTuUtF9SyX4OLESQRfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgIbtUv8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgIbtUv8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso20326365e9.2
        for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 00:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789456394; x=1790061194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9zrX61GeCI+3H5TcNjr1lM5UeIxHraXxb4N6RDSCO5k=;
        b=pgIbtUv8UY4Vd2/dw5MHAXYSzAmmvKd3Jdg+PcvEqkvxDWtr75o3XzNhU+easPp7cq
         QsJFm5GluW8Cq/K4334E7AIrtJ4CAEh+TZtpS3J/ihtWfsO53IHWNCqNEmUAPJgrF1ZO
         pJAV4corDZpuoui9ci51rJKPR+IgdTWVXagKXttd2NDNCqjQTC8MAsCe40g85rgnchXt
         0q0CQySq3KEg+uR6+xhfIIMq5yHJ1wOsqyPDOzlm1Xfj1m8OUbRKuKWmUCNCv1rIEQ+v
         W8Nx+waTe2ljdDvxNeGZkr4rpLaHMCazt52KGQjxkQOgX75627fBHRj/2R+y6lA2f+AW
         9WpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456394; x=1790061194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9zrX61GeCI+3H5TcNjr1lM5UeIxHraXxb4N6RDSCO5k=;
        b=B5rU8myoru4KLLs5yzqFl9VDW4tExd/Ys/TxWhYwRBH5hJmpD2MqlQBVCtRwVWDIzx
         gJU2zwI/SjY2b2LvOLGdrWpyaS4j3oukQf7SlSngPB9H2glZKM67TWoPdHrmn8nWezXh
         OSBoIU1bkE0ZOuea4pxWEkaM3YbDczEpiHGDp/tfshVbobIffS05NEUFgt+uVLZWNwTq
         LruWLGOdqJxkx0do0VFanJC9zm5NoiXe7V8+sFyJwcEt+87FjwseMCxchGfQKM6LbBJd
         3g+LUEohHKLb16EfWZXO5G6gF5IWV6H4Uj25LAUcHuD96Yzi0gMILxS5LeBF4+bZuNhy
         /Ikw==
X-Gm-Message-State: AFuF++m0xkgUiF1v3BegHs3jJpsNqklcU7sXGjEbHNTf/uTCGw40R+2b
	YQ0fn1n249ndzQTvMP4Cam//zsqjjsMZRwIdvROpybLN2V9XKPBT7ryb
X-Gm-Gg: AYBFou2pXvBS++Lr2sJk+40go1spkpvHeMfhd808L+HTMFq3rVWtNFd4SbO4jUgSh4Z
	1PoApTLqKBhlDsCB23uJBiFrf0GX7hHDDvFbPpoPTA55Riw9Ms/Camlt4WOUTSmBzduFjYYLZIb
	AQ/bSTGaO0RCr3Ol8XP+X+1JS72E3EWQ77BEmm18RrR7hyaImCkUrjng5CO7cOD0vhmXLVZ73N1
	QdpNp5+dnbnNYt2slEYyCiLOw7qYXI+WvFMusv7FGTbR7PbaIEqK88qfk46HERPt+4JUiE/4EEj
	qU1JJWop9b2sWL9SyOLMpWp3B8aqyZspKIsEX7iWfHVLf2WP8GOMtfGjDohNfdHnl1+7JUU5SyR
	BzYBO77nEW0weCrLPe2K3/FV+RL9/UXd/IPAiu7Sl83e9DzJ6Pkn3N++ogsELkbBLJ8hfDqRp6y
	kKaFbc8lK8IcUEwqiWQqckbh7NEmCAG6CKhQwnF2+DzdVRjBzoZS3ccwCCeEOd68BYHBGSRGJCP
	zbOdm3C2qIcWnlZZwXLn+Qy7UdaPf62pp1z0M3Y2D9184uuwnAuLPc8WQF1jSxvtOGnAzZx7xNr
	VA9GSIeDq+oAoTPBoy11+L3Yl3g=
X-Received: by 2002:a05:600c:3e0a:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49e7a669298mr70764985e9.12.1789456392912;
        Tue, 15 Sep 2026 00:13:12 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d284a7bsm117889265e9.3.2026.09.15.00.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:13:12 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] MIPS: OCTEON: cvmx-l2c: use the OCTEON II register model on all CN6XXX
Date: Tue, 15 Sep 2026 07:12:44 +0000
Message-ID: <20260915071306.15006-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The L2 helpers pick between the OCTEON II and the CN3XXX/CN5XXX
register model with OCTEON_IS_MODEL(OCTEON_CN63XX), which matches the
CN63XX only. Every other OCTEON II part - CN66XX, CN68XX, CN61XX -
takes the CN3XXX/CN5XXX branch and touches registers that do not exist
on it: L2C_DBG, L2C_LCKBASE, L2C_LCKOFF and L2C_SPAR4 instead of the
LCKL2 cache operation, the L2C_WPAR_{PPX,IOBX} way-partitioning
registers and L2C_TADX_TAG.

On a CN6635 board cvmx_l2c_lock_line(), called from prom_init() under
CONFIG_CAVIUM_OCTEON_LOCK_L2 to lock the TLB refill and exception
vectors, therefore went through L2C_DBG/L2C_LCKBASE. Whatever those
writes hit inside the L2 controller left it silently dropping stores to
DRAM above 512 MB: a probe that wrote 0x20400000, 0x40000000,
0x80000000 and 0xe0000000 in prom_init read its values back before the
lock block and the old contents right after it, on CCA 0, 2 and 3
alike, while writes below 256 MB and every u-boot "mw" stuck. Since the
cvmx bootmem free list keeps its nodes inside the free blocks
themselves, the kernel's first split above 0x20000000 was lost, the
walk of the free list stopped there, and the board came up with 248 MB
of its 8 GB.

Match the whole CN6XXX family, which is what these register accesses
are keyed to. The CN63XX keeps exactly the same path.

The geometry helpers in this file need the same treatment but not the
same condition; they are handled in the next patch.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
diff --git a/arch/mips/cavium-octeon/executive/cvmx-l2c.c b/arch/mips/cavium-octeon/executive/cvmx-l2c.c
--- a/arch/mips/cavium-octeon/executive/cvmx-l2c.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-l2c.c
@@ -54,7 +54,7 @@ int cvmx_l2c_get_core_way_partition(uint32_t core)
 	if (core >= cvmx_octeon_num_cores())
 		return -1;
 
-	if (OCTEON_IS_MODEL(OCTEON_CN63XX))
+	if (OCTEON_IS_MODEL(OCTEON_CN6XXX))
 		return cvmx_read_csr(CVMX_L2C_WPAR_PPX(core)) & 0xffff;
 
 	/*
@@ -91,14 +91,14 @@ int cvmx_l2c_set_core_way_partition(uint32_t core, uint32_t mask)
 	mask &= valid_mask;
 
 	/* A UMSK setting which blocks all L2C Ways is an error on some chips */
-	if (mask == valid_mask && !OCTEON_IS_MODEL(OCTEON_CN63XX))
+	if (mask == valid_mask && !OCTEON_IS_MODEL(OCTEON_CN6XXX))
 		return -1;
 
 	/* Validate the core number */
 	if (core >= cvmx_octeon_num_cores())
 		return -1;
 
-	if (OCTEON_IS_MODEL(OCTEON_CN63XX)) {
+	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
 		cvmx_write_csr(CVMX_L2C_WPAR_PPX(core), mask);
 		return 0;
 	}
@@ -147,10 +147,10 @@ int cvmx_l2c_set_hw_way_partition(uint32_t mask)
 	mask &= valid_mask;
 
 	/* A UMSK setting which blocks all L2C Ways is an error on some chips */
-	if (mask == valid_mask	&& !OCTEON_IS_MODEL(OCTEON_CN63XX))
+	if (mask == valid_mask	&& !OCTEON_IS_MODEL(OCTEON_CN6XXX))
 		return -1;
 
-	if (OCTEON_IS_MODEL(OCTEON_CN63XX))
+	if (OCTEON_IS_MODEL(OCTEON_CN6XXX))
 		cvmx_write_csr(CVMX_L2C_WPAR_IOBX(0), mask);
 	else
 		cvmx_write_csr(CVMX_L2C_SPAR4,
@@ -160,7 +160,7 @@ int cvmx_l2c_set_hw_way_partition(uint32_t mask)
 
 int cvmx_l2c_get_hw_way_partition(void)
 {
-	if (OCTEON_IS_MODEL(OCTEON_CN63XX))
+	if (OCTEON_IS_MODEL(OCTEON_CN6XXX))
 		return cvmx_read_csr(CVMX_L2C_WPAR_IOBX(0)) & 0xffff;
 	else
 		return cvmx_read_csr(CVMX_L2C_SPAR4) & (0xFF);
@@ -313,7 +313,7 @@ static void fault_in(uint64_t addr, int len)
 
 int cvmx_l2c_lock_line(uint64_t addr)
 {
-	if (OCTEON_IS_MODEL(OCTEON_CN63XX)) {
+	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
 		int shift = CVMX_L2C_TAG_ADDR_ALIAS_SHIFT;
 		uint64_t assoc = cvmx_l2c_get_num_assoc();
 		uint64_t tag = addr >> shift;
@@ -460,7 +460,7 @@ void cvmx_l2c_flush(void)
 int cvmx_l2c_unlock_line(uint64_t address)
 {
 
-	if (OCTEON_IS_MODEL(OCTEON_CN63XX)) {
+	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
 		int assoc;
 		union cvmx_l2c_tag tag;
 		uint32_t tag_addr;
@@ -661,7 +661,7 @@ union cvmx_l2c_tag cvmx_l2c_get_tag(uint32_t association, uint32_t index)
 			     (int)index, cvmx_l2c_get_num_sets());
 		return tag;
 	}
-	if (OCTEON_IS_MODEL(OCTEON_CN63XX)) {
+	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
 		union cvmx_l2c_tadx_tag l2c_tadx_tag;
 		uint64_t address = CVMX_ADD_SEG(CVMX_MIPS_SPACE_XKPHYS,
 						(association << CVMX_L2C_TAG_ADDR_ALIAS_SHIFT) |
@@ -745,7 +745,7 @@ uint32_t cvmx_l2c_address_to_index(uint64_t addr)
 	}
 
 	if (indxalias) {
-		if (OCTEON_IS_MODEL(OCTEON_CN63XX)) {
+		if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
 			uint32_t a_14_12 = (idx / (CVMX_L2C_MEMBANK_SELECT_SIZE/(1<<CVMX_L2C_IDX_ADDR_SHIFT))) & 0x7;
 
 			idx ^= idx / cvmx_l2c_get_num_sets();
@@ -878,7 +878,7 @@ void cvmx_l2c_flush_line(uint32_t assoc, uint32_t index)
 		return;
 	}
 
-	if (OCTEON_IS_MODEL(OCTEON_CN63XX)) {
+	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
 		uint64_t address;
 		/* Create the address based on index and association.
 		 * Bits<20:17> select the way of the cache block involved in
-- 
2.47.0
