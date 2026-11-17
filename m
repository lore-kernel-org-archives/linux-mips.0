Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951711;
	b=2j6t7xHRu2uWkavIi4DznSk/f/c47HurhKm3hJCuOCvcpp6tro1EW1beWmhs3Q7Xg5tC
	 RejdyV/2CmpTNSOnhgKGtlf+XXm/lIJle+xWxx52I9P3DHYEuAKQTlXys7zKb7hHvhLJC
	 Nx4Cs8Q/RLrgX8Qj9Bni1chq116Bgqngy1RANDcwF+texPFef1IOY2F/lFIPoSCYkHsXd
	 n52OxXlX2lbRbndfXqk61ufEox7YwFdDuSLcFv2NqZ2g8NmCeQ4pj+TGfXWLdg2jJ+z7i
	 ncSD5XA7mC+ZMmOfQUp7vNWdgiZMidCAooLsMNNzVfBz30hFfbT/Vy6ZGBm4oyTlIzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FSOzTuildzOc1Vsgs2eOA/FCbZ+NSuERw0qAipq6Ry0=;
	b=PgiUFsiHf2HQ7MDaYFlUCqZhQynHrJjmJbqoO++rR3Hpw5NkDwMxJwv0F2D+ZpBn99xQ
	 +bMSXtaAH5F16TVqJ8iUamYqfRM2JZMD0jT8c6u/S4tRuoHrWtr4nOhorKua9RjdnWEfR
	 aiWo722LxgI6DTsCWpdSAveQxaLGV5s+MkCHUoWdLP7pH5fbjdrTdW9EtlmFOdJZalAD6
	 I+DWJTFkeEIwGd8NM70IK7CSIMNilEqQLJolTsGpWmb6/5EzN3+RQXL9zeswzGJmONKkl
	 sJEQgr2p4cfK6wi4AIcoWQMDOlBF1e8Pmd6X+iTW5wKS0kOt4myUXGZkOQ/k9vOZYWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ClPu4vBR;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B5B606A881
	for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 21:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9B5B606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ClPu4vBR
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490d59c3edaso96907f8f.1
        for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 13:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951709; x=1795556509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSOzTuildzOc1Vsgs2eOA/FCbZ+NSuERw0qAipq6Ry0=;
        b=ClPu4vBRUY1hKH+8netbBQN2tGVRTiQB/KriMcBkv+gYXyO2f4LvcWw5+AyiNrZXW+
         /AeXw/c/ygFQV+b3+txeb9WibsEWoAD9Dq92E57B5hY9fZQXS4tcLSJ2WvMMywxTMieo
         yLN3yT6MBo3LLR5J17mFQawN9p47rwRvz5ss/3f3mGAh1LXzpJJw7pKtNYb3zNtJ8mye
         Dm4tw3jud6tRZ7DsUMDe+vbdS70OGk3iRaEBiZfCtiyjKT3XYb8YsHAN2whrN3nJ/wqi
         BuLyznW2pp/iiih4aYC70oXurunrmBsiPyE8pu3rphBQN+m0vbyMGZ3TgWseFV75xYAv
         YKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951709; x=1795556509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSOzTuildzOc1Vsgs2eOA/FCbZ+NSuERw0qAipq6Ry0=;
        b=u98kTfDPrORWagWM45ymgzk/aC1fkfvNp+ND8fSOztfM/ThTm+Qo1laW8QsfJKXTc8
         SKp5gSp+mHjVY99Gmyq3FKUd8CdoVXflA21oGjJGbc5ArsD4q4ITiOiiGhcbgWfcKGE2
         aHKfxmswduGu0KWMDa7qfkMY40EqEIEP+QZH35ve6mmVqMXRWFydX9ZBj1StLhTP59I+
         YuCuevxzWFhqx3NZ0zdWCr6oKx1Vy1rWhkwUaMsjwpm7A8pVyy0Qqo6oGy7GfEq4NECK
         +ZsYNMZbld+4xqdXPAPua/0A8f7i41Apv1BAU85l/+MzO4KbPp+d6Zbq5XyhfzeycgTZ
         L4SA==
X-Forwarded-Encrypted: i=1; AL+hErE5PRCT/S1eXsHS6jNzWVTzo6MNZex3vLyuwpLzoIElqbFpmFKOA1J4TkQN0U4o64jE5qF/s3+nKwdX@vger.kernel.org
X-Gm-Message-State: APuU4Z9cW48oqFDyKMm2PCPKOz7RrdPKQEGqfr4Duf+rIoXq8vWfkUJw
	B+S3hqLTSSVTPwkkF2UfRJc8wF1TDmRrb2Gub51gRPdUkjfVb21COY2Z
X-Gm-Gg: AZFdTZdbjccqwpOpjfleodOD+rADbEzSkbdmlNC75YedmZiI46YssTLQTbPWl6hRKAq
	qAggooZaooPpWELKiRa2dORmypP60ip/1s2KsHQiXa086HeXEpOJG5NLahgTJ80sdnjTOz9Qehw
	dGt3jBQbXC5H77SmEghtPVqdTLLpaBSNz2Z0YRFvtQlII0gwN1+wmQtkqcw4hIWr6OCW+Jqo4up
	26d5CAQm3UnK+J93MyGRMHRVGXDywsSYFmY24LNdibmkqaGhpbWqp8YJcgpkHuHtYekA9f0L7r8
	cBU8Q8iS7p7h+fTHyPmqKKExLSfWvkzpsDd9Cd7tWH12mBpSbfBXCDZTuBnjKSmZZYkOJGB1i6a
	cB4ewyG+PcRWhg5dUtW32RtPZzQqKXm07xIfT33OC8jKhmH4e3eipJALQDvf4a0LyTblcu/4g6L
	yd+8J+Ta8fkV0erIVmlwUBVNMdZbxszTqw3ZhbqFQ6iNIu+0l9iSsOM8h74tBkHNmhVyUBNLoUX
	UsN24pFJhwt/v+uJX5Db9aO72faxiBot0n/RXl1+/lH2fy47WdX880Lzs6VYgb24tInhswlmjDV
	5MEjUY+EeuZqbsPbMafCN6g/p0ZblKyStKevjaJGc5Bvdn/N8oQlxCcFTl6SdkxHjEN3EEqTPCd
	4JoMyxbN9mPO1q1cjoVCvIjXM5YlzC/1qINwadk6THNdxroo=
X-Received: by 2002:a05:6000:4705:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-4a3771eeb83mr9286381f8f.21.1794951709112;
        Tue, 17 Nov 2026 13:41:49 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm978391f8f.21.2026.11.17.13.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:41:48 -0800 (PST)
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
Subject: [PATCH v4 3/4] MIPS: Octeon: flash: allocate the map per device
Date: Tue, 17 Nov 2026 21:41:40 +0000
Message-ID: <20261117214141.3826637-4-orgads@gmail.com>
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

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v4: new. sashiko flagged the shared static flash_map against v2 and
    v3 of the next patch; v3 left it as it is in mainline, this fixes
    it first.

 arch/mips/cavium-octeon/flash_setup.c | 49 ++++++++++++++++-----------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index 66d173b..0e5652f 100644
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
+		map->bankwidth = region_cfg.s.width + 1;
+		map->virt = devm_ioremap(&pdev->dev, map->phys, map->size);
+		if (!map->virt)
+			return -ENOMEM;
 		pr_notice("Bootbus flash: Setting flash for %luMB flash at "
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
+			  "0x%08llx\n", map->size >> 20, map->phys);
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

