Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683556;
	b=BaVpDtaiGczaGyvmubwhMkyj14mtBIDaGayoFNLO2lN7EEqflMbHBNKttAqrs1d3Cn1/
	 mEGgxTUwXK0o8Jr5D8Ni9gRIAAHJwxWwf9NjXeAUAdJ03EEKIl/zjMpl3voOWSwPUy0yN
	 YwYfDYqRE652Rd6BT9lvGEFgNnbN0cJPKcYGu/pHe4szNXQoM9sdlwlJnWlHpgEZLzPVC
	 ELyGaus825nlRHoXXPBygckMZVn8YRaICb8OX5PXIghmOR2M635ajENvTBku55n4jtpfY
	 WY7ELV6RUPbL0Q7ohEw0yYB0onuPYp2Z9kOjT6D1RWyURTyKsG/NVqc1hBOFmubQwjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gzyMYEceM4UybzdO3Fm0gEDCvlgTGJLtnNanAWRt594=;
	b=f9EuA9az3/vkHGlhxyLg0ro2TzWo3qGwwOOb0P8TPQLEBPada5V/hC4JmOyYTh+DWmgh
	 OyqFpkF7So3gIqww7Z+4uCjseOIAALKrRlFyS1XET1H7STlMHvTFPMdQVY0vIPtfBgOZ5
	 7NVaCEa9dgKqbGd75OSStbsv0zIjYQYPoXeNrwFX4zLv+VjpqYCJl4dWIWzJABRKALDXt
	 3SPNGzB2SyAJ3p6+bXiondU/Y89uNgZFBGp9hrNX6+GqH+43FCGfZZ0yNatY6ZwL0dELW
	 qk4ZGIhkbhgoohSbI3de1nEaWOhDU9CRdgg6rFveN+7xhXt+Yc/ZezYf4KCN6Edw6pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COw5EvXd;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BA0606A33C
	for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 08:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3BA0606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COw5EvXd
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so62981115e9.2
        for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 00:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683553; x=1796288353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzyMYEceM4UybzdO3Fm0gEDCvlgTGJLtnNanAWRt594=;
        b=COw5EvXdXCGtsUqe13IFUYRsjRWKtq904i7s8JTQiJ4Hdkzr6jyWG1YkMsXCB1pwqH
         jJ77B2eERUhok4x6ck04T4D9GOXQBDRfkbZhtETAK5MPcmIoF2phcupZ7SbgzfD3YdF1
         RC8tE+Z8SVsB5/vbks2o1+Ncv8TMJxmpmPMmSj8YVZveAkpaXx+BkGel1QjrO9Qq7Z5W
         DRvDVbI5hxpK09S5c57aOkdWXekpihDvySYpz1hHVeWt893OSvk0LkLCMr1tD/G18Y0Z
         siWpYh5VM8Tnaz9xaoZIGDSVGn2FVag8R/QySxD2LPJI3Qr6xTn9Alij7nfLF1aAt7jk
         2dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683553; x=1796288353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gzyMYEceM4UybzdO3Fm0gEDCvlgTGJLtnNanAWRt594=;
        b=ZrAsdMLyGuBu6U1clKQG8aMQ1lnrUeq4crRIFTjO8TDMuaM2BEXKPCwXH1xfpwfQ0J
         nR9NdpaMGKbzu9J56Sg73G+GzMkHUgwal6JZwQvnal5YtZIJbteIQr8L0Ora/JlVHev1
         uXTvwEbuoK55pX14G471aiXsV3+LuXOvI8mVGVtyKqM2N4iDjghL/xeBABAZWfDKmHqE
         TkavAMAMFAJljZPWuqBei3ZdP0nzT/DGv1gGlPWBuJE2KBQCyYR3BBOcD9j3hVrfNzWA
         lgiZ0BKXrNU9q9C1RdqaRm6oGud3RTsRrJ2pQcYRV4v+jNWvbebcjQ2LAiZ0yfkWjrc7
         X5zQ==
X-Forwarded-Encrypted: i=1; AL+hErHMwa8t4XmA2hYoQOPUrt169oKThA4IQiMqKmnmc0WUOP2Fg+vbb0sgzT+Hw8GC9m+p1SquGwrRZKuo@vger.kernel.org
X-Gm-Message-State: APuU4Z9BHvjGF2rg5/64q6oGvSfZDL/bY2LtqOEWo33H0NEMXGzb+ZA/
	6dsLhICQOqGtAyu1Obgb6EBwWLdendPLdRbWevFymitq6QdX907pE0PN
X-Gm-Gg: AZFdTZdt/4OlP6mteWCPqIaJKoxoLwIpeE+t7MOCw2si+oCzbhyxH1rqHcOWlgOiDCZ
	wXSA0HcIH67y/rjT2HwUo/aAuu5SztabbczzOFp/fCm7hioNCzCpQhIs/vXQIsxlBjlVwBKHG2S
	U2YPmwluvpx4c8rLS6/uopAZD5n3hkb6QU7fntGQlfXBGbY21xrjhovG3Ebp0sq17GoGsG0U3oV
	eP3t+MCB5LQnFr2i58I7gYxfAAjKHA/fQAW76kFbIi/O+ib56/e9BVe7EUZErVqekCApBCUNajJ
	Pwiabn2UdQEtPTgJfBVaAgCYLJB0VVRuHmgSNovycnAorTGOv+AFQffdhMERBx9UTPDVR4aADZA
	noh3hQyWWK+49n7Jnp7+a4eIx5SKcnCG+BsgMKDKfqyY4fuKzqqr5GiGo7t5kiiGLAm37z87Q6J
	WXrK4EWNCfe4JAiPAIuBk4atFxvwBeUxKbR0nF9+mwWJm8nwuW9hXFNQWOfsGfcIqhpcc4Ai2fE
	kjFeK/JT7udhRUX4/MDcqb2YB7KRKnF6iT8mMNJUpRthwfQDRYm5OQi4UlwVef35uDE479/9JOK
	JhKmSiS/WEyyJJFoTniqfh6cLLSgkLwx+P3TFxdo8zxNykcxZGU0NoSt4zviapZThiEzaMHoaCU
	=
X-Received: by 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr417095995e9.18.1795683553331;
        Thu, 26 Nov 2026 00:59:13 -0800 (PST)
Received: from center.. ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm40313744f8f.58.2026.11.26.00.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:59:12 -0800 (PST)
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
	linux-doc@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH v5 4/4] MIPS: Octeon: flash: use the simple map accessors without a shared eMMC
Date: Thu, 26 Nov 2026 08:59:06 +0000
Message-ID: <20261126085906.814373-5-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126085906.814373-1-orgads@gmail.com>
References: <20261126085906.814373-1-orgads@gmail.com>
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
around every access; that commit gives no reason beyond "Without this,
we get bus errors." The semaphore's only other user is the eMMC host
of the older parts ("cavium,octeon-6130-mmc" in
drivers/mmc/host/cavium-octeon.c), which shares the boot bus; the CIU3
parts serialize their eMMC with a lock of their own.

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

A little-endian kernel keeps the semaphore accessors: the boot bus
there needs the address swizzle of the I/O accessors, and a pointed
address would be read with plain loads.

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v5: keep the old accessors on little-endian kernels (sashiko);
    quote the reason 8c1e6b14e27d gives, and drop a duplicated
    bank width comment.
v4: rebased onto v7.4-rc1; the Assisted-by tag is dropped (an LLM
    helped write this series).
    On top of the new 3/4: simple_map_init() gets the per-device
    map, and the bank width check runs before the allocation.
v3: Assisted-by in the documented form.
v2: check the bank width before ioremap() and drop the added
    iounmap() calls: flash_map was one static instance, so they could
    unmap a mapping that an earlier probe registered (sashiko).


 arch/mips/cavium-octeon/flash_setup.c | 39 +++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index d69249acf..896baf52d 100644
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
@@ -85,6 +96,11 @@ static int octeon_flash_probe(struct platform_device *pdev)
 	 */
 	region_cfg.u64 = cvmx_read_csr(CVMX_MIO_BOOT_REG_CFGX(cs));
 	if (region_cfg.s.en) {
+		if (!map_bankwidth_supported(region_cfg.s.width + 1)) {
+			pr_err("Unsupported flash bank width %d\n",
+			       region_cfg.s.width + 1);
+			return -EINVAL;
+		}
 		map = devm_kzalloc(&pdev->dev, sizeof(*map), GFP_KERNEL);
 		if (!map)
 			return -ENOMEM;
@@ -107,11 +123,24 @@ static int octeon_flash_probe(struct platform_device *pdev)
 			return -ENOMEM;
 		pr_notice("Bootbus flash: Setting flash for %luMB flash at 0x%08llx\n",
 			  map->size >> 20, map->phys);
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
+		 * Not on little-endian: the boot bus needs the address
+		 * swizzle of the I/O accessors, which a plain load through
+		 * a pointed address does not get.
+		 */
+		if (octeon_flash_bus_shared() ||
+		    IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN)) {
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

