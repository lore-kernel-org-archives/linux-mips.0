Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016342;
	b=KV1nZpdwT7KTZZywUdrKdJLQIAimZAOjiD4GafFDD+40YNCNfVi9C1MCSL1Djthms3so
	 EEwa//pgC4cTB6lZ8U6/X01D3EQ8cOu0eZzvTkWMuM4YhHuYEc15ZeyIHTfzJhEMouGpE
	 K88e+edAc7J+QD0bvLuCNjfqZ76WqPckjL69FfJvl9TKFdY8BTfdGt9CY+5qKNV+WF+Vb
	 eurE8H3geVT5kDhlO8vearLFFLisUQSlGR6b930AFKUq3sTQp8CmqZFttlNcT4KSJL73O
	 AjCOIZHpR4ZegcOG2nlw6Io0b//5jBxVi61osvm7YAK8LZvD4GfUJTnlo/HN2UVpg6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016342;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/QXlwY2Ak/IyBAHhsGjEfQEX/zi/CPSUg9j4tBSUdOg=;
	b=EqPuP1gUorfnT0hFrxdHOHt89ugpVlvJS3s9uBjE/F5YYzvBG9btdFiDVvCSlCK4H2/2
	 vQpNc+oJHnZPcCUj0lqffBeH9s5za+fM1vFPCX+SJ+4SyNHF5akgYeF4qNyg8iE12PnOX
	 tMSUszEvnb1jSA1nGW1e0NiTtpzJiTSFr0CTAja4IKdkpzgHb+798UZJAzG/w0LZzqC7L
	 xwXZndhaF//OVre8bGZGPul1ODAMR4ReivlK/n8GH7ArYGmAWVZLMe5N60uuaVIprhCVY
	 /54293Uzqq2wMTcdtPbN6NpQcYAEgsFgpMKH/5z7BsgM5MFxdXYLCdSo5VVgYyrv+hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zv+tzx4d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9C2606A32C;
	Mon, 26 Oct 2026 12:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zv+tzx4d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3A71F01828;
	Mon, 26 Oct 2026 12:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016342;
	bh=/QXlwY2Ak/IyBAHhsGjEfQEX/zi/CPSUg9j4tBSUdOg=;
	h=From:To:Cc:Subject:Date;
	b=Zv+tzx4diGrBvfZBoajcWNv7ShorrOI1AvS1RGKFP5sh2eZEqinQDIefQ2qioALKV
	 H1gduyvW7zNNpK+Nsb8r6CAHw/JXnPeIuL1jgq3DQOlENZ1aD9tZoflHSULKLheu0L
	 7Ew0AoKRXmm+zw3LOfr4KDGj1v78aivzF1ELwEaguKgviY95usI9hemtBTgwcUprgH
	 IqAHtA9lhq9YbrhIKow94IwUgPZwZhjQ9QauNoGZvu7lEr7dNAlJwwMJa0aCKrB0yZ
	 M6/0SrrRoQ3PHrDCRUYX9gV7XNytwFwaE1DwOaH4e1fCnwylsg9PNOWTTb47V+2+Ny
	 wPtD747vc7miw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] MIPS: c-r4k: Flush the cache error vector before writing it uncached
Date: Mon, 26 Oct 2026 13:04:30 +0100
Message-ID: <20261026120430.13238-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On R10000-class CPUs, a store prefetch while copying the preceding
vector can leave a dirty line whose write-back overwrites the uncached
cache error handler.

Write back and invalidate that line in set_uncached_handler() before
the copy, through a new cache_wback_inv() hook. c-r4k provides it with
r4k_dma_cache_wback_inv(), renamed as it is no longer DMA-only.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
Changes in v2:
- Fixes: 1da177e4c3f4 instead of e01402b115cc.
- Moved the write-back into set_uncached_handler(), for every caller.
- Renamed r4k_dma_cache_wback_inv() to r4k_cache_wback_inv().

 arch/mips/include/asm/cacheflush.h |  1 +
 arch/mips/kernel/traps.c           |  6 ++++++
 arch/mips/mm/c-r4k.c               | 11 ++++++-----
 arch/mips/mm/cache.c               |  1 +
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/cacheflush.h b/arch/mips/include/asm/cacheflush.h
index 5099c1b65a58..753dc3d7b190 100644
--- a/arch/mips/include/asm/cacheflush.h
+++ b/arch/mips/include/asm/cacheflush.h
@@ -120,6 +120,7 @@ extern void copy_from_user_page(struct vm_area_struct *vma,
 
 extern void (*flush_icache_all)(void);
 extern void (*flush_data_cache_page)(unsigned long addr);
+extern void (*cache_wback_inv)(unsigned long start, unsigned long size);
 
 /* Run kernel code uncached, useful for cache probing functions. */
 unsigned long run_uncached(void *func);
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 8ec1e185b35c..7abd5abf28a9 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2305,6 +2305,12 @@ void set_uncached_handler(unsigned long offset, void *addr,
 	if (!addr)
 		panic(panic_null_cerr);
 
+	/*
+	 * A store prefetch or speculative store may have left a dirty line of
+	 * the cached view; write it back and invalidate it first, or its later
+	 * write-back overwrites the handler.
+	 */
+	cache_wback_inv(ebase + offset, size);
 	memcpy((void *)(uncached_ebase + offset), addr, size);
 }
 
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index d8aadd3dc057..11bb82263b63 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -743,9 +743,7 @@ static void r4k_flush_icache_user_range(unsigned long start, unsigned long end)
 	return __r4k_flush_icache_range(start, end, true);
 }
 
-#ifdef CONFIG_DMA_NONCOHERENT
-
-static void r4k_dma_cache_wback_inv(unsigned long addr, unsigned long size)
+static void r4k_cache_wback_inv(unsigned long addr, unsigned long size)
 {
 	/* Catch bad driver code */
 	if (WARN_ON(size == 0))
@@ -786,6 +784,8 @@ static void r4k_dma_cache_wback_inv(unsigned long addr, unsigned long size)
 	__sync();
 }
 
+#ifdef CONFIG_DMA_NONCOHERENT
+
 static void prefetch_cache_inv(unsigned long addr, unsigned long size)
 {
 	unsigned int linesz = cpu_scache_line_size();
@@ -1743,14 +1743,15 @@ void r4k_cache_init(void)
 
 	flush_icache_all	= r4k_flush_icache_all;
 	flush_data_cache_page	= r4k_flush_data_cache_page;
+	cache_wback_inv		= r4k_cache_wback_inv;
 	flush_icache_range	= r4k_flush_icache_range;
 	local_flush_icache_range	= local_r4k_flush_icache_range;
 	__flush_icache_user_range	= r4k_flush_icache_user_range;
 	__local_flush_icache_user_range	= local_r4k_flush_icache_user_range;
 
 #ifdef CONFIG_DMA_NONCOHERENT
-	_dma_cache_wback_inv	= r4k_dma_cache_wback_inv;
-	_dma_cache_wback	= r4k_dma_cache_wback_inv;
+	_dma_cache_wback_inv	= r4k_cache_wback_inv;
+	_dma_cache_wback	= r4k_cache_wback_inv;
 	_dma_cache_inv		= r4k_dma_cache_inv;
 #endif /* CONFIG_DMA_NONCOHERENT */
 
diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index ad9b0430a28e..555efcfffffe 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -51,6 +51,7 @@ EXPORT_SYMBOL_GPL(__flush_kernel_vmap_range);
 /* MIPS specific cache operations */
 void (*flush_data_cache_page)(unsigned long addr);
 void (*flush_icache_all)(void);
+void (*cache_wback_inv)(unsigned long start, unsigned long size);
 
 EXPORT_SYMBOL(flush_data_cache_page);
 EXPORT_SYMBOL(flush_icache_all);

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.47.3

