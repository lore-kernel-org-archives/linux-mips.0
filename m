Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8681E3E44EB
	for <linux-mips@vger.kernel.org>; Sun, 11 Oct 2026 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700155; cv=none; b=AjRdlLxT0moPuPwst4e4DXH61XJjEeHpfKe52aro7qfEKy0ZDp0qRX5fpWUbiU9Bu3Vuv/ivy3Ad0sJZPlF0HR1U3cNRdFYAU91hIAA4rK2k3a56/WVJUQ+x/bA6HON/VPjewKyb2yjZ8MPwEpsaUdbwifRqcKU2LKHTK5HMq94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700155; c=relaxed/simple;
	bh=YJNMvslRmkn09SPy7BJ4jSRFdTRxBo4XKPoVkcqETJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dB4c3N3kASar7JGB+hG7Np6RAF1c4V71liwn05Lwidqo6bkMYsfXXTjNmW8bUXzXyQ8ylUh/ScRisYuXnORxbqU32nwGnNcDoUStXfGCyKoiWqndK0mWchJE3eNn4JoFWLp/hzJjC56Dt5SeSVa4QYI2girHRrFFyD2IeKgjsUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkALZgqo; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkALZgqo"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c45111bebso478898f8f.0
        for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791700152; x=1792304952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JuzYqr333bVnyPHn9BORMpm/ycVJyKnySjL8xjIdXeU=;
        b=fkALZgqoKtaxPlBei/RvufR/H32tbRKCi2MVY8i/ghob+a8oWo4b79/fJ4q6lg17vZ
         sAjsMEHiWYJEWYs2krRSr9H6/jEsc2dd46+5GIDA+hzDdpQpYqCkWV5SzcjG+ZTuO6Rn
         VLALl7w78YrDq/uKWYrHqPulNVXfh96zDE7knXID+yG6RLIYHd9HbcVxBlQJH+0F4uvX
         PO6iEMqw2nUbCg10G3lSbjHxXQdVqn/aeABClEbqSuacJZEpazPxJp3ZJSul3pykRU8q
         QE+LvPXcj1z5jx4d3kQWA3K5x7YQKRbMZpdbPrYOn0b9lxEKORhZG+cqPOy0CmV8tEWS
         Efjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791700152; x=1792304952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JuzYqr333bVnyPHn9BORMpm/ycVJyKnySjL8xjIdXeU=;
        b=Jk+ijaB7yU4bdqgclbxFdojHUgt0YcISBMM1j8Ds2yIFI81zVe59Ki/tKyqm+FYeol
         K9dR4CQu8cTWQVl9mykB4xojP+8AsFjQ0BPpI9dX8+LKmResCqZi5UY2l3E+NqyQdm+9
         HEVXIUcXrPwq5RYivhoUnKMFMT1DrDdCubtJHNgX/geSBE5kmAFp0hWcmEPsjKcGLaEy
         If1rGZX4bGCgAHElZqeuZFxpk9jb4hWykxS4/5EPjhVx+RmkK+RgpuYjk5aHgro6gBVD
         Iit1tY9vGr2RvEEO+QWSjN6FQvU7fc/Bv9YBCNL5pxvXr8n1TPq1uPrc7AWA7ERMoMLV
         TLoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiergfBCYbbxlJH3uRJ68v2eKnnZiWuLKBQ9HyD4sY65XdAwJ2QhPYSiheIWCxx8x7OsjoSA302knz@vger.kernel.org
X-Gm-Message-State: AFq9FYLv9gp/nLHp7sFLG6HkMp6GFfGGTWL90OtonQP6ClWaHfUWtki6
	86tu0PWdMXi+vzfUcFlnnXemvt8ssBP6zuhSB/TwDDhZdAWaPx8d/sfY
X-Gm-Gg: AYBFou1t4kFqadJYMIAAMRBEfRbQViZuJpNDSfdpU/Brw1ER4x9dQGafzq4nUPsdmXD
	peyzwKYnu4DOAsE+ZFAulSBWaU+pFaWWmDHJcFKGhDJ7RhPVjxlNqRLAIjApa/tf4oIA4XPQdER
	qlQZZme+Q+VOpkbgEVYQztoVLrxNf8xGUbBYk85ZWepGGgwlJEWHm+zUjUw8j69EJo5g/E94jhH
	u7un4yFaTnYatij5cAly5laNQATqn7J02CF7eNGaGr2TdrQRnRNYBUMb8eJNzd9B+dEs0Zm4Szt
	vHpKn5s0JYSbVXo1tp8E0wvd8v6tCMwcTnjw1g9GbyUi2+cM3dDdibt9P40vXPhD8Y17EYN9UPe
	yrE1rJtscvzSPsDG0qLpToxdmTekjkLt33ugZlPb0zoNdsuLORHVS5AYCHy5vcUg0Ag++ze6DE5
	HBYECYWpL6x1z/MK7e91XGeDhjqf9z7Oq8lDUqeKeXQ+cbE6DqSEDX2ioHTykpCUt7EiQSKNcgY
	lujbbkh0MgHenIu4f4pjWm3ky/mx00Bl6st9p/JH+Clv72imz+UwivBTxsYWWx0+NcM2LYLT6rT
	+ZPIc8VXmgIJbILR
X-Received: by 2002:a05:600c:e548:10b0:49f:e427:e88f with SMTP id 5b1f17b1804b1-4a18e4b584amr69996185e9.21.1791700151689;
        Sat, 10 Oct 2026 23:29:11 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm222579135e9.1.2026.10.10.23.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:29:11 -0700 (PDT)
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
Subject: [PATCH v3 3/3] MIPS: Octeon: flash: use the simple map accessors without a shared eMMC
Date: Sun, 11 Oct 2026 06:29:08 +0000
Message-ID: <20261011062908.2365879-4-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011062908.2365879-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261011062908.2365879-1-orgads@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v3: Assisted-by in the documented form.
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

