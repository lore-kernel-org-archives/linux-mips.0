Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683554;
	b=d9xs20kYvoOD5534Psh90QKTeVm2pTgJgrdE57LBQSrUA0idDZGex28+g6BpYqqdp/Xl
	 JwORwXbp51EPcvIVZ9WmdG9F7vqP1LzCuQr/qtVsM/hJApy06Fod5ETGOOEKmwQoc6wpy
	 asX/cY8XAIQAi6LXxDQyMGN9KCXT/MwT6OFy8/LummSEcRxN4BhxTQtpXKNoqGGTtA2o9
	 d08OjVyQhNe/bIBUiK5/hET8Xk0V7KXUi13IoBbjS3Cn/uT3lmBhiJxZmzq4BJIaDCEF+
	 vUQIpo8V3GWLnANVBwoYaiegjxQrrNbdfCfO7fllhfwNfTnpxBgi2VriKo11gq5hsVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OZeaCKjXj7rhQtKUY6dpSt9k3JcLhM/MuU5+xZ27Sxw=;
	b=QiFMAOVK9LqpP9aUTDHFi54whKYd0MigemQ8CA9n2aKYV7vMbfRkvPMWzlIcFRgOj6NY
	 xZ1xrXw+hbdMAqzm7sdmpfk9duGVHCxn+5toeopzt6TuyiXb3ZN+0BffT8O7zO1dqBWK3
	 yxCyuCG1NQRGCgHIl7R6b5e5WQGzA86OqZs6+ZO3voWozkL2py3om1ycIX1MkJ7AuF1Yr
	 W/LGIJDFgRe0iTqj2zB/U6mc5ltZ1QDynnbqiuDteWKlY+lMGsGoIMN6MSEKvRoqbVM3s
	 hDyf6RmJQSkT1NVrjjKZYx0SYA3kl57Vn6Pdxx19ZgSujG0J+sUqEa2ss0GstuqKc5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ESQ/A94D";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1329606A33E
	for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 08:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1329606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESQ/A94D
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso3835046f8f.1
        for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 00:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683552; x=1796288352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZeaCKjXj7rhQtKUY6dpSt9k3JcLhM/MuU5+xZ27Sxw=;
        b=ESQ/A94DmB3fiztDdkjl1M6gP/HpFUJntkthUI1KwO6oXvYXzWjkKV/Wp6RaClBmxF
         fXlcUh5dhHs+Z9z3XLQIwz4DT37O1EA+9a8nq7c4liAo4GQzlnSTu4cEbpgW0Qx+FVIF
         QQnOca8hez/hdUb04A/MEAeZ/xcF3A5/Y+l2jwx93ZBppfCZWVgMNBINJF43jcG5kuF7
         woLumOqK0V2itMzOWCCcsNQFWnO6qAHdGJHek8NzO9nNVNbMxJGgxyHovLprbBWe8+Gh
         ddBODu5c91vpVpB1Q4gR/EzB9/QPvgWx3YTYHznwy+r1CljfNiteC3HatNRYUV4MybuO
         GZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683552; x=1796288352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZeaCKjXj7rhQtKUY6dpSt9k3JcLhM/MuU5+xZ27Sxw=;
        b=H1wN2L6+0pftWxkDsvVKjhR6ekWE3YxugQpJD8nwBU96ed7OlZAT84qktLg1cLJ2zO
         xptDivi18Xr5NwLzhYkdHPFo7R+N1BK+kYYL5RCik3ncNQ6i3ibdQiKJ1taXNDxo+oHT
         9XFHg2Xibg5x6TV+/aQFHJHX2Ty5nLcwKlEvupRI93D810EKxAvWpz6HAw1KvuvyHf8j
         mGs0sqwTI8W7uRf1TUkvtZmoRSboAk0AzVpTtdBPhZmJ3UgLdvM7UUKtKTQqKFTDymg3
         aQMHzDRwpAVWiqBylbGeF4BLA+KvBhF1HrQHXxuzFKzXuUxMB9CKw/csRjUgSk47vt+K
         y15A==
X-Forwarded-Encrypted: i=1; AL+hErHqHgxJmr5AdZssxq1QDL9O3j0/4zYUQ46AuQiuYXUNcKT7HpT/k+P9fnoFFpfJIoXqHB3tuiQEKEAX@vger.kernel.org
X-Gm-Message-State: APuU4Z/znVRJzO7NQpkBlfgV0CsC4oxYby67PxLguzyun+h1tFN0i5OG
	VSCjLPxacy1mmwr2u9NUU3PLlA+Mc8IQF7cXk9wNBZoNdfwaWyg69STs
X-Gm-Gg: AZFdTZcO0JJ5J4Os4h+rzVoozGSIgRHHA4PEWMQM/XiRC3EaE6fcrfgoXVK/y05NuN0
	6HQNxR2fRN50JHlCWeNPoxv0mT3dibpYhStYQa3ZYSJnLyDq9GH8NrWZLuqbDkdZ1QjJmowbOSb
	PeNB+X0Sq+RofgtgIIZEhBN4ZOQqj+qO8lAMDiEGTNguBmky9wj0HxYu2mmZ5n4f29f/ziMAA1t
	uBAhq8edOc7RuN54aXjP3GG4B7SiXeeuquwtCtDkKp96sKkbRGIpzoPHGMH2PTUJ4TfW4JHlXWZ
	XFdQp21iJUkrl/DHTvOZ/JfPKDh7oUt7oonk1l/D9zNZbdL60XoOVBsRnq40sqlTFshxd+AnVgU
	7h0TUPahFMbpui+fIg669r2CcQ6Wjke0GPhPpS/cwy3GXLGwiFT8u/IylBtCxt+Qr5Fsz0tZCQ4
	r++rbzB2tASHyW78OC8wWNupajfK2UeFdwJqhewyethSXKqGlUMrMf1T8GgfuVJdyRIhNd9qVVz
	hEJgyJaESD2N8ZBeAzkFrKofZhvYssM11HKF9iM5IXXwctG7lm7ZfcjMHzUmCuQOrcZrRy/UBN+
	k8konr34aAS/8NfizjvCd6AhdWVRLBB2UL75tkvxa8ZCxdy/EaOmZg==
X-Received: by 2002:a5d:64c8:0:b0:493:c0a:507d with SMTP id ffacd0b85a97d-4abaab633c7mr44200123f8f.1.1795683552059;
        Thu, 26 Nov 2026 00:59:12 -0800 (PST)
Received: from center.. ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm40313744f8f.58.2026.11.26.00.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:59:11 -0800 (PST)
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
Subject: [PATCH v5 3/4] MIPS: Octeon: flash: allocate the map per device
Date: Thu, 26 Nov 2026 08:59:05 +0000
Message-ID: <20261126085906.814373-4-orgads@gmail.com>
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

octeon_flash_probe() fills in one static map_info for every "cfi-flash"
node it binds to, so a second chip select overwrites the phys, virt,
size and bank width of the first while that MTD device still uses the
map. A probe whose do_map_probe() finds no chip also keeps its
ioremap() mapping and still returns success.

Allocate the map with devm_kzalloc(), map it with devm_ioremap() and
fail the probe when no chip is found or the partitions cannot be
registered, so the mapping goes away with the device. mymtd was never
read; drop it.

The driver has no remove(), and the mapping is now device-managed: a
sysfs unbind would unmap the flash while its MTD device stays
registered. Set suppress_bind_attrs to rule that out.

Fixes: 7f481716bc90 ("MIPS: OCTEON: Use device tree to probe for flash chips.")
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v5: add the Fixes tag (sashiko); join the split pr_notice() string.
v4: new. sashiko flagged the shared static flash_map against v2 and
    v3 of the next patch; v3 left it as it is in mainline, this fixes
    it first.


 arch/mips/cavium-octeon/flash_setup.c | 51 ++++++++++++++++-----------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index 66d173b57..d69249acf 100644
--- a/arch/mips/cavium-octeon/flash_setup.c
+++ b/arch/mips/cavium-octeon/flash_setup.c
@@ -18,8 +18,6 @@
 
 #include <asm/octeon/octeon.h>
 
-static struct map_info flash_map;
-static struct mtd_info *mymtd;
 static const char *part_probe_types[] = {
 	"cmdlinepart",
 #if IS_ENABLED(CONFIG_MTD_REDBOOT_PARTS)
@@ -71,6 +69,8 @@ static void octeon_flash_map_copy_to(struct map_info *map, unsigned long to,
 static int octeon_flash_probe(struct platform_device *pdev)
 {
 	union cvmx_mio_boot_reg_cfgx region_cfg;
+	struct map_info *map;
+	struct mtd_info *mtd;
 	u32 cs;
 	int r;
 	struct device_node *np = pdev->dev.of_node;
@@ -85,6 +85,9 @@ static int octeon_flash_probe(struct platform_device *pdev)
 	 */
 	region_cfg.u64 = cvmx_read_csr(CVMX_MIO_BOOT_REG_CFGX(cs));
 	if (region_cfg.s.en) {
+		map = devm_kzalloc(&pdev->dev, sizeof(*map), GFP_KERNEL);
+		if (!map)
+			return -ENOMEM;
 		/*
 		 * The bootloader always takes the flash and sets its
 		 * address so the entire flash fits below
@@ -94,26 +97,32 @@ static int octeon_flash_probe(struct platform_device *pdev)
 		 * access 4MB.
 		 */
 		/* Use this name so old part lines work */
-		flash_map.name = "phys_mapped_flash";
-		flash_map.phys = region_cfg.s.base << 16;
-		flash_map.size = 0x1fc00000 - flash_map.phys;
+		map->name = "phys_mapped_flash";
+		map->phys = region_cfg.s.base << 16;
+		map->size = 0x1fc00000 - map->phys;
 		/* 8-bit bus (0 + 1) or 16-bit bus (1 + 1) */
-		flash_map.bankwidth = region_cfg.s.width + 1;
-		flash_map.virt = ioremap(flash_map.phys, flash_map.size);
-		pr_notice("Bootbus flash: Setting flash for %luMB flash at "
-			  "0x%08llx\n", flash_map.size >> 20, flash_map.phys);
-		WARN_ON(!map_bankwidth_supported(flash_map.bankwidth));
-		flash_map.read = octeon_flash_map_read;
-		flash_map.write = octeon_flash_map_write;
-		flash_map.copy_from = octeon_flash_map_copy_from;
-		flash_map.copy_to = octeon_flash_map_copy_to;
-		mymtd = do_map_probe("cfi_probe", &flash_map);
-		if (mymtd) {
-			mymtd->owner = THIS_MODULE;
-			mtd_device_parse_register(mymtd, part_probe_types,
-						  NULL, NULL, 0);
-		} else {
+		map->bankwidth = region_cfg.s.width + 1;
+		map->virt = devm_ioremap(&pdev->dev, map->phys, map->size);
+		if (!map->virt)
+			return -ENOMEM;
+		pr_notice("Bootbus flash: Setting flash for %luMB flash at 0x%08llx\n",
+			  map->size >> 20, map->phys);
+		WARN_ON(!map_bankwidth_supported(map->bankwidth));
+		map->read = octeon_flash_map_read;
+		map->write = octeon_flash_map_write;
+		map->copy_from = octeon_flash_map_copy_from;
+		map->copy_to = octeon_flash_map_copy_to;
+		mtd = do_map_probe("cfi_probe", map);
+		if (!mtd) {
 			pr_err("Failed to register MTD device for flash\n");
+			return -ENXIO;
+		}
+		mtd->owner = THIS_MODULE;
+		r = mtd_device_parse_register(mtd, part_probe_types,
+					      NULL, NULL, 0);
+		if (r) {
+			map_destroy(mtd);
+			return r;
 		}
 	}
 	return 0;
@@ -131,6 +140,8 @@ static struct platform_driver of_flash_driver = {
 	.driver = {
 		.name = "octeon-of-flash",
 		.of_match_table = of_flash_match,
+		/* No remove(): the map and the MTD device stay registered */
+		.suppress_bind_attrs = true,
 	},
 	.probe		= octeon_flash_probe,
 };
-- 
2.53.0

