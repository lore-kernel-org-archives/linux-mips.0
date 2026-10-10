Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C14E370D79
	for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 17:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652911; cv=none; b=cmK3/dqCFGk4r43fXh05M8Gp8TBwhlbqJ/LzQ+VpkqR7U94sfGWIamGib5YD3uqgEc9A0nQ1/8U3jkd4jGmhBAzdem7XUSCPT+7fV0SXtfjXbSHYnF5yD54NR7V01OUqj/U3ViAuuKCQfZTeGDg08WNaXRT+WwmjeRhu90XaEas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652911; c=relaxed/simple;
	bh=oJsYl1DS5M76Zz/kovmTDYXs0UpltIPB0aKVEPmLvhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KP0fJvw55fDzcKkYGLJsLdRJ9HLYA9v7LjXcLEAYjWIngwL8J4xjXdB6jkNlPioU7EpPvNVpaA1mYsFv/iLQ5GN9NgmUnJs1wWPQU90qlKjjpmBcPepw+avc7KRvCPBuixeOdshKmQMsmJ/23TykXJ3NE4RTZHqd+Gq9pTPGUNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aop+tANs; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aop+tANs"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so5066355e9.1
        for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 10:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791652908; x=1792257708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TFjLqjpz1OV1iGjbq0FG1a5x3VLRDXIY9kkC816eew=;
        b=aop+tANs+X08VecrR7am2jcVAFozFCafFGzpVsY+aaMAqEwpzXsb0GFijeNPtRza6f
         V3E/6hfGu/Cn6AMXnKhxyGjXeZrXIgWxFfVgtHh1mcESDkR6WzRC0CuxO/fFgwwwDb/D
         ZZFBucNj1GYSkjqyfE9POsup9oZFQ8mDymdzFQh12HhtoXgn3u/66DvtbsoSPS7Kde8A
         m6ue7aRv4yLT3ONM0/wLyvv0BBjh5fy+eSGKOWavR+wHE6PWa6JH5OXNa+QGMUl+ZZqD
         0TDbB0UHfZ4cLXUDoXJ65BA9W5GSnqLNDCgHLR/OQefONaG6MbI2Jtbczt8hG931uUWB
         15+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791652908; x=1792257708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TFjLqjpz1OV1iGjbq0FG1a5x3VLRDXIY9kkC816eew=;
        b=kTAu4Vq/3fG7h+QpVGnxnGgFk+ajjXEc5kT0MFrJoZIj4K+gimjcqRucEbB0nwURgV
         wo0PYnflmofbTL+BNBKMr62dHTHRjrvAvba+kQ6sJtl+6x16TGdXqDxrMji+i2vdf3sf
         iN60Aq1DzqXjwaljBPxDIqsLxRKMrV1dM484naODEdnFKuOV5cUHLnP4budVxKkDHfyE
         /117F6FRZMfjA611JzyqeTCPTGqyu8EUnvT8rbgjDDV1dgy7BdxOTaAiAliSQ1p5VpZ9
         nVNr77viYiy29xCvE9BtcD7hSEhNKmr7z0t1Eabh1t3Ju2tt9Sy+0wRCcpIqlalkYVsA
         mg8A==
X-Forwarded-Encrypted: i=1; AKwUvBynyohTVZCDU4rnOI/pPJ2aLIVWFPbjSKJbI8eg4pFkyrcpUdooqbzYvG7XuU2JKXCBC0158AQ8eHT3@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9GYOQeIkuWqrFoFVLdrHbsgzE6WX/R+d/IKO6Qu5zw4M4UzRE
	93k5p9UkTyox9Sch7zG51ACAigy6HHRt7q0KnI3La3C9W+pYWL7yyfqf
X-Gm-Gg: AYBFou0LXnwiJ3/W0wKbl4CMZhNUnv80Mzz5z0SUTl7vVda+tI4kf4V1duujERWizBL
	zaxZmGUlW5mCkh/KtFhWAZkty4PRUUVsb3TC6y8ACoywRefzNn+3qNzG6/659JGUVtyJVt3cXxQ
	izW1VK3YoPZ7/pC05QULqUe5fBR44NUZND5zWZan5dHARo0j6p8U7NrZZaH+6fiNP0s3Z+oHAyI
	HTZ9+pNw2tauo1Wre2ACpvVk5ISBumpMvRBsE5AgeICmm+PhE1n59xYpQD37qNc7nVVU7JHmrn2
	cG5EVK5VyaXmIpbk1atvxhCXoYtkiUDfp9V/rWno1a4964QrqvFqbHXIg7wax7DHsp/6x+P8VAR
	s0VRw87tqv9Mqr0BQ1lVQ3vt5UoFdnhw0c1ZM0+q6sThmWGBO8QmOqWirh/x1vYkXunLVWW1Grq
	qald8+D8qCRnxbbXsoGNv+Atm575KhSHvcDCuULBu1BMwcpUxWs6b4n/+8bPrX9vNN6jxBCP3vQ
	bKXFLG3fwd8XksUL/nE7wRkmvRC/6MqD7C0Tq2tU8JXVPgqi804VpeOQXncID7lZYnM6zru2N+V
	jXDwVrSpeI4CfMnL
X-Received: by 2002:a05:600c:6207:b0:49f:ff73:9971 with SMTP id 5b1f17b1804b1-4a18e4aff66mr96959555e9.18.1791652908208;
        Sat, 10 Oct 2026 10:21:48 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c85009csm114159655e9.2.2026.10.10.10.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:21:47 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@openwrt.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 3/3] MIPS: Octeon: flash: use the simple map accessors without a shared eMMC
Date: Sat, 10 Oct 2026 17:21:42 +0000
Message-ID: <20261010172142.2138956-4-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010172142.2138956-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
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
probe command. Check the width first and fail the probe instead, and
unmap the window when the probe fails.

On an Octeon CN6635 board (no eMMC) with a 100 MB jffs2 partition on
an 8-bit NOR the mount drops from 15-30 s to under 1 s together with
point() support in cfi_cmdset_0002.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
 arch/mips/cavium-octeon/flash_setup.c | 37 +++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index 9242521..a616e7a 100644
--- a/arch/mips/cavium-octeon/flash_setup.c
+++ b/arch/mips/cavium-octeon/flash_setup.c
@@ -63,6 +63,17 @@ static void octeon_flash_map_copy_to(struct map_info *map, unsigned long to,
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
@@ -102,11 +113,26 @@ static int octeon_flash_probe(struct platform_device *pdev)
 		flash_map.virt = ioremap(flash_map.phys, flash_map.size);
 		pr_notice("Bootbus flash: Setting flash for %luMB flash at "
 			  "0x%08llx\n", flash_map.size >> 20, flash_map.phys);
-		WARN_ON(!map_bankwidth_supported(flash_map.bankwidth));
-		flash_map.read = octeon_flash_map_read;
-		flash_map.write = octeon_flash_map_write;
-		flash_map.copy_from = octeon_flash_map_copy_from;
-		flash_map.copy_to = octeon_flash_map_copy_to;
+		if (!map_bankwidth_supported(flash_map.bankwidth)) {
+			pr_err("Unsupported flash bank width %d\n",
+			       flash_map.bankwidth);
+			iounmap(flash_map.virt);
+			return -EINVAL;
+		}
+		/*
+		 * The boot bus semaphore only serializes the flash against
+		 * an eMMC host that shares the bus (the CIU3 parts have
+		 * their own). Without one, use the simple accessors: they
+		 * let MTD point at the flash, so jffs2 scans it in place.
+		 */
+		if (octeon_flash_bus_shared()) {
+			flash_map.read = octeon_flash_map_read;
+			flash_map.write = octeon_flash_map_write;
+			flash_map.copy_from = octeon_flash_map_copy_from;
+			flash_map.copy_to = octeon_flash_map_copy_to;
+		} else {
+			simple_map_init(&flash_map);
+		}
 		mymtd = do_map_probe("cfi_probe", &flash_map);
 		if (mymtd) {
 			mymtd->owner = THIS_MODULE;
@@ -114,6 +140,7 @@ static int octeon_flash_probe(struct platform_device *pdev)
 						  NULL, NULL, 0);
 		} else {
 			pr_err("Failed to register MTD device for flash\n");
+			iounmap(flash_map.virt);
 		}
 	}
 	return 0;
-- 
2.53.0

