Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F7A369D5E
	for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 18:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655734; cv=none; b=cqf5EJo8LXKdYlt125C0bSAMz6+VqBUTFxVavZpx2GQPVmIZGh4Bnts+KqOco6SSVek8Nk3xaEjzmFV5lWRA9jd8rgjmIBF/CLY8AUxdvcsupjJNm9b0emM41DvEdNiZdIIc8wtCeYovO3UkeFJCdYrVF5QYbit2dwi49xRlFfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655734; c=relaxed/simple;
	bh=efG0LPwWpnCuyTOzbhovMwCos3QoQ+/RLRNQqktiG64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pQTrZi9HSs7Zd/iA9+aZ+ZjKo6fIfjK5xzMGsNTrHV4cXKUcIMxA7vxeYlghtsFNQwc7UiZHO3AJHqoyuEX1TdXUhCLBC6Ieo0LhI7dySowg72emDVYIH5whr1WGI7F6R7ydyqw91udNPDP2xvLA89wE++FhP6qBt+nh0zTr9Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzS0wAgc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzS0wAgc"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16c399641so7152595e9.2
        for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 11:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791655731; x=1792260531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwjLjIdBjLhSbHy5MbJpSboN8vZWvV8OrJbj2jSTRdo=;
        b=VzS0wAgcU4tultWaoc6xAwtqnxJLL9VAqDwwRohVaC2oUTaqY/nGjUKfC3g4TEyThz
         haJxQRS5rtBWJM166HSGy6Zt2cZgINowUnOhUxJusbQAtIqRGQRM/Qk456usLIeYFtLd
         9RBXtRldl2t8FzcWhdUzU7oAAepcGsXhseHZRtHdSKR2SaSeeJxmBIJtb//69F5DROqp
         YOzjZhAsX7HOZBX7dr+B37Zk8Nx6l6DRWTCunq1m1Nz8L7Qdklg4C+ZioKtMLRPaQflK
         7aJuS0ithiInGxFKXnYv5AsXUZvE3PWLJRlyKTHD1U8kbJSRxBMSPHdLSFXOgeJ8Z4BX
         aQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655731; x=1792260531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hwjLjIdBjLhSbHy5MbJpSboN8vZWvV8OrJbj2jSTRdo=;
        b=eEp4O7Y70bPBRsZj4+QchQN5B6IYDYbdmbpJGNw0CF3+VHDl3+m6xAET31Rc4iBS4e
         XFkS1EFBIKajZ3OzLz/VAvqaNjlw3Jm88RAw3WxrNbfJLrBSb04O/t1uJqCsjhBDFQ1P
         veC7DfJ/SOzpuh9WPzVJMI7wQEdbXFpEIpKDxjgWNHUlQo1bXUwRdt5LBMWuWXUH2fnt
         RBu/O5+Gd5HjQu2yXklqJD8lU8TUaSXHx3MpOs6YuTkCK3s7TUvxtFwGO00OS54AthBb
         H2LGc7vNUeT22mhsvEuPrwIwPmy/0+GGnYRWisXP1WmH7rgLa058jYZDxPvtbpvCKDKg
         pe1g==
X-Forwarded-Encrypted: i=1; AKwUvBxjDzeCiZ34ZVA5Hzaz0JD0+Oo/uZzH5pMlr8QP04LLGwQIBK5n8QKMjhgfOr2jrqo2+TlOsfeFfrQ4@vger.kernel.org
X-Gm-Message-State: AFq9FYIekSr8khLIlc5+YvUyN/AliNDwArrRxtuNly9w7itNjeLNc3k8
	fzgA4PeC2HoQowGm0ZQ8KPVaKGtpsKkzC+xkd9H7eRkU3OjBEan8OjH2
X-Gm-Gg: AYBFou2IaiHzaTQaoxSyDjVuaxWgOtBM6zHIPMyg5prHAjLb59oauHjL2KiPNJO/iAX
	23GxCligMYQ3bvFd6yesljGBxz5mMNmIgBXiz6ORSguMFzkzhIsZx/jW42rK5k/4Fg5eCNa0FPV
	ioKeyqhqXO46ZW+tgbw3M3AHFZdo5+sLcWGSwj9lYhW0PGtMV/qJWx5VwxtQYZm9SkkajJTUDnp
	L2SqgQVorvUZJWHPg88iPGwXbLOeQrhNNUMS4hqajFCLbJvCxJw370sTWBmFhEtBZW5zIrWvYlC
	t/1408P8wtY2sS5rAcn6B1AhvbOgY/hXcMfebybqIZocpNA1SjaakK/69WTjSrRvJWKxXttQMeF
	1finJOiSyYtvJy94HyBvUpgbfi4PhHe96OrQ1NyvUrMp2PXzeHjuSon1MnU/7iHThBLFAT5uko8
	BWQwJVjsuZ164F+QOhUwZYemCZJYeZIfJBo3fBb7K47jGSu9XwUgghtn5RDWBAkLfVw6jWStY15
	enNnCem/1CDFFOuzluIjwGo4bZhgTSrC7Lvx5OmWW4LmQ1RyWTCBJeQl6mqkxW5gznX26PUeq91
	DtiUxDetL6Pzr74AYff4aHzwAJQ=
X-Received: by 2002:a05:600c:674a:b0:4a1:7cf8:5433 with SMTP id 5b1f17b1804b1-4a18e443ee9mr99738155e9.3.1791655731151;
        Sat, 10 Oct 2026 11:08:51 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db97ce3aasm10187163f8f.21.2026.10.10.11.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:08:49 -0700 (PDT)
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
Subject: [PATCH v2 3/3] MIPS: Octeon: flash: use the simple map accessors without a shared eMMC
Date: Sat, 10 Oct 2026 18:08:40 +0000
Message-ID: <20261010180840.2152492-4-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010180840.2152492-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261010180840.2152492-1-orgads@gmail.com>
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
probe command. Check the width before mapping anything and fail the
probe instead.

On an Octeon CN6635 board (no eMMC) with a 100 MB jffs2 partition on
an 8-bit NOR the mount drops from 15-30 s to under 1 s together with
point() support in cfi_cmdset_0002.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v2: check the bank width before ioremap() and drop the added
    iounmap() calls: flash_map is one static instance, so they could
    unmap a mapping that an earlier probe registered (sashiko).

 arch/mips/cavium-octeon/flash_setup.c | 36 +++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index 9242521..1c0b7d7 100644
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
 		/*
 		 * The bootloader always takes the flash and sets its
 		 * address so the entire flash fits below
@@ -102,11 +119,20 @@ static int octeon_flash_probe(struct platform_device *pdev)
 		flash_map.virt = ioremap(flash_map.phys, flash_map.size);
 		pr_notice("Bootbus flash: Setting flash for %luMB flash at "
 			  "0x%08llx\n", flash_map.size >> 20, flash_map.phys);
-		WARN_ON(!map_bankwidth_supported(flash_map.bankwidth));
-		flash_map.read = octeon_flash_map_read;
-		flash_map.write = octeon_flash_map_write;
-		flash_map.copy_from = octeon_flash_map_copy_from;
-		flash_map.copy_to = octeon_flash_map_copy_to;
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
-- 
2.53.0

