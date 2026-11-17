Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951712;
	b=24zM9wfshJinbMtWv89+d4nB9R09rGKNU8OdWRPQCWAXHe090EhmWPaif9hOrAmtDMTD
	 cHX+dGl4dt/gzRnpSWpIsbq/DMHvYz2bdMGkKMItn1M0sJUbS3QQiRBN1Ko8N8m/Lvvu8
	 NF7UqBNd428m+wed2Ls/onVBsg/WKp0CgHjLIGQ65aO1yktDbA09ixLCLzeqS0NgAjo9F
	 i4cTpmgrx1OvI6JZdEG+MzR+87OjT6btVIguaE99jwjlcrAFs1Yg0SS7tIIFi1yujk+5n
	 1WtK2mfBZt9uzOrOwkbLc8PTrw32eXpTO4F2K89+JDc2qHWCV+uUOmuNeDUHIdwTbMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MggYMX94BkHu56OsrtWdSBo0pOhg3kRRf9jDuhg7bx8=;
	b=14Ovs0t9xwK571LtYYk5WdUtEuL0IgnSP3UdONsxAPuu0RiId8nwdLG1l2ItfPbLRbZF
	 A2JwQ0mQAyNLpQUyVKW3XM2mdYwwlim6AQhuxmPhxxME3gCzldkxIRFeA9sQtrbSLOt9Z
	 V+Pi7jfjU5cPFM/uNJMJ2xyZkNsv5BfgbEdUwgZB6CTg4oNigjyg29Unih54+LvOsMw6W
	 yiXTgxFhPleESE1l0LHhXWdro4UfidmDtBslQ8iTTgG/1j/WmEMnF7STWY/E+7kxuA1gz
	 Cme1HZ6VRvHDr6/bHBUbOge/ST+jdeOIrKGgj6Wpdk0ur9Xb3pH7/+Q2Q0timPmD2fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UeVVC0xL;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A42606A331
	for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 21:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A42606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UeVVC0xL
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so2394515e9.3
        for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 13:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951710; x=1795556510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MggYMX94BkHu56OsrtWdSBo0pOhg3kRRf9jDuhg7bx8=;
        b=UeVVC0xLBemPb8h1K+tso4o1PfOpvZm8vIKw0yHzhioLQFf8L0wZ/bqlPU9wA5utXi
         YSISd/ZnoulE9Pw7uKDsbXtrCGPNkP8+aYP0wS7PgfBEFP4fExGpMHYreJ1SbDEjxTsV
         V0ufcDNhfzvnhxKk2AIe61kpV2LbsgMTgfAE+4m/6RT67NxSotcqqXPbhvIfzHxIum9B
         H2w3WPvgVijggMxW4PYxHPYbftAAeBpNWVocTmDH6NtGKWZsBvk8Y7YszO8SurzKGFvK
         vvkR+FB4GbNlhxo5jNx/Jc3AmHXcn35IyeGwCI2+0y8cfDPw1T+sT/ItzDR3xlTFU4hL
         THqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951710; x=1795556510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MggYMX94BkHu56OsrtWdSBo0pOhg3kRRf9jDuhg7bx8=;
        b=PMwfcjqLoLD8oNHr2wEOnNWSKmR/k6tI/tggx4G7Kc/OCx6i9pdIY7cX1IkxebZSQq
         BwmjvyVW84CYhlRFKzH9VZEG+eqcSrpWZE11LkfLf3uLq5eFz4CYJh+nsPeczWefyXeo
         fVV3KIDOGpdBbXsOVo3ZeR4TEjYDwCrtJwh2HlxN8b7Yv7vP+yCsp+WGfRpcPYCJjyGK
         BiGW+QGYLRlPTb0TfMnKBouU8wHXD879ZEOzBInzkXAlt4mkZwNBvphyak6geWb4sfyu
         3eweF+CJ8LDO6VqmmcupmP6MiKtgFoEOtZPAnJb7hbh6swylfgGk+chI4vR2tXDNZfGa
         LzEQ==
X-Forwarded-Encrypted: i=1; AL+hErFYus/k6GOcXZ+Jtqaou8jT2JHLqv0leqOE+6qEJh0zDCdWSHKh+JYptbpwGVRmvra+qHHcIDLov6na@vger.kernel.org
X-Gm-Message-State: APuU4Z9EBP9+6HFZ+tugvGUt1Aib+vLzY8ySbgZxkiYk11otTbOXN9A4
	pLnaEL4++SlNdhujPtYlWa1cHagwGk/8EBv5WkdgCCmx+sywjhsunw4r
X-Gm-Gg: AYBFou0FqYgBSfnVQ/X62YVSWv53D21zROJTjZMXIh6pjbZFfev7Bx49FH7jJKGz5rG
	I/yeXflgxG/40R6cEU1BQjAUOInn3sZtzhK9IK0fnGekO+5iPoYp0470jbj0EfTqm0BQuMKx2eS
	Xg2ONW4X19X21kYaje3qpga2Xpo0IeLtovk4ZUHfFqy0vf0GopueY6sEkewNt2i05sOi9MSLSxb
	vWAUAbIj1ka6agrDVNWVsZk3fjlXzE0W/zehRuoJp/cRqtr0MrEEssMWxLgHaON7IRuy8+W4u0b
	IEwqjrs99tx/58GNgn5jihCUBW6mtQ8UF7fAY3v0h7jWHoNuDhKWkmm6UrmCNXgttWfL4F4iibf
	PupK0VC1hXwukHWxez4KXK9jltp8FRRQ4MMs89I9kj9dQvED6ga8v5cuIY/p3t+WVIsRDk+SLP4
	Pmi3YYi7ST9qIOY8JPQKb2fPpz2blUbt0lX5yHO/G1wNYLP4ttO+hf5LRk3HNbNZEBTXiF8FIjN
	alVe32E5KjaQWLYq/HVMjwa5BNCgBIL+fGm6cEJYI+aDz3p6+U45bMyGK5O+Hp7h6wVWrmrjW+W
	uH6FAXzxoECHUN2gs1Z2fTsocXAhS0L2kCTaZeZ3GquROORowlOODw7yMjbChGEc5kQs/LXRhzA
	3hDrg6Ah3k3ODYPcVkhkwEqPevVor5wti0F0E+7y6V29Zk/FdyPAN0luoGtSYil1UiNbJ
X-Received: by 2002:a05:600c:4e04:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb7da0f929mr7988855e9.10.1794951710179;
        Tue, 17 Nov 2026 13:41:50 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm978391f8f.21.2026.11.17.13.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:41:49 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@kernel.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 4/4] MIPS: Octeon: flash: use the simple map accessors without a shared eMMC
Date: Tue, 17 Nov 2026 21:41:41 +0000
Message-ID: <20261117214141.3826637-5-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117214141.3826637-1-orgads@gmail.com>
References: <20261117214141.3826637-1-orgads@gmail.com>
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

CAVIUM_OCTEON_SOC selects MTD_COMPLEX_MAPPINGS, and since
commit 8c1e6b14e27d ("MIPS: OCTEON: Protect accesses to bootbus flash
with octeon_bootbus_sem.") the flash map accessors take the semaphore
around every access. Its only other user is the eMMC host of the older
parts ("cavium,octeon-6130-mmc" in drivers/mmc/host/cavium-octeon.c),
which shares the boot bus; the CIU3 parts serialize their eMMC with a
lock of their own.

On boards without that host the semaphore guards nothing, but the
custom accessors make the map non-simple, so MTD will not let jffs2
point at it and its mount copies every used eraseblock. Use
simple_map_init() there. The test is for the node, not the driver, so
a disabled mmc node keeps the semaphore.

simple_map_init() BUG()s on an unsupported bank width; the old code
warned and then hit the BUG() in the inline map accessors on the first
probe command. Check the width before mapping anything and fail the
probe instead.

On an Octeon CN6635 board (no eMMC) with a 100 MB jffs2 partition on
an 8-bit NOR the mount drops from 15-30 s to under 1 s together with
point() support in cfi_cmdset_0002.

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v4: rebased onto v7.4-rc1; the Assisted-by tag is dropped (an LLM
    helped write this series).
    On top of the new 3/4: simple_map_init() gets the per-device
    map, and the bank width check runs before the allocation.
v3: Assisted-by in the documented form.
v2: check the bank width before ioremap() and drop the added
    iounmap() calls: flash_map was one static instance, so they could
    unmap a mapping that an earlier probe registered (sashiko).

 arch/mips/cavium-octeon/flash_setup.c | 36 +++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index 0e5652f..62612cd 100644
--- a/arch/mips/cavium-octeon/flash_setup.c
+++ b/arch/mips/cavium-octeon/flash_setup.c
@@ -61,6 +61,17 @@ static void octeon_flash_map_copy_to(struct map_info *map, unsigned long to,
 	up(&octeon_bootbus_sem);
 }
 
+static bool octeon_flash_bus_shared(void)
+{
+	struct device_node *np;
+	bool shared;
+
+	np = of_find_compatible_node(NULL, NULL, "cavium,octeon-6130-mmc");
+	shared = !!np;
+	of_node_put(np);
+	return shared;
+}
+
 /*
  * Module/ driver initialization.
  *
@@ -85,6 +96,12 @@ static int octeon_flash_probe(struct platform_device *pdev)
 	 */
 	region_cfg.u64 = cvmx_read_csr(CVMX_MIO_BOOT_REG_CFGX(cs));
 	if (region_cfg.s.en) {
+		/* 8-bit bus (0 + 1) or 16-bit bus (1 + 1) */
+		if (!map_bankwidth_supported(region_cfg.s.width + 1)) {
+			pr_err("Unsupported flash bank width %d\n",
+			       region_cfg.s.width + 1);
+			return -EINVAL;
+		}
 		map = devm_kzalloc(&pdev->dev, sizeof(*map), GFP_KERNEL);
 		if (!map)
 			return -ENOMEM;
@@ -107,11 +124,20 @@ static int octeon_flash_probe(struct platform_device *pdev)
 			return -ENOMEM;
 		pr_notice("Bootbus flash: Setting flash for %luMB flash at "
 			  "0x%08llx\n", map->size >> 20, map->phys);
-		WARN_ON(!map_bankwidth_supported(map->bankwidth));
-		map->read = octeon_flash_map_read;
-		map->write = octeon_flash_map_write;
-		map->copy_from = octeon_flash_map_copy_from;
-		map->copy_to = octeon_flash_map_copy_to;
+		/*
+		 * The boot bus semaphore only serializes the flash against
+		 * an eMMC host that shares the bus (the CIU3 parts have
+		 * their own). Without one, use the simple accessors: they
+		 * let MTD point at the flash, so jffs2 scans it in place.
+		 */
+		if (octeon_flash_bus_shared()) {
+			map->read = octeon_flash_map_read;
+			map->write = octeon_flash_map_write;
+			map->copy_from = octeon_flash_map_copy_from;
+			map->copy_to = octeon_flash_map_copy_to;
+		} else {
+			simple_map_init(map);
+		}
 		mtd = do_map_probe("cfi_probe", map);
 		if (!mtd) {
 			pr_err("Failed to register MTD device for flash\n");
-- 
2.53.0

