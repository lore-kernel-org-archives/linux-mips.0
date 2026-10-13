Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903175275A2;
	Tue, 13 Oct 2026 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897592; cv=none; b=ZCSJBgfx2mLGsuUme1P9dnL++mQElyKF5t6VWrA6LHS5U0TVCf7glGl+jzDVp0IFCOoYtxaTb69Mv//RjoRCifcj4kIhcmyTq1saMPZBa35kK0d3nyKh7GZmVnjrXkr5DrJ0InCupWuityduwS9wG/e7EnH3WYDrDU9ljwBfSgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897592; c=relaxed/simple;
	bh=xqpx7Vizb9nt6+G7vkXl+UNnveEGX7PGHw2oUYxuNHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WX1FUZF440sCJ60tU9fqBj61fCLleuQJ5pnFuPSl1U/EMPDD1N9+OVM8cziqQJ1GqthK4reeQmyE7V/7X08QrSqarLIaHHzNHSNGscgcGmA9kQu88A1g2Cz4M1MErh5drsr0H4pOCYEiL468UFDm57Mh/42Fn9kc4sZ+GnCR9YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ksBQwIg2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ksBQwIg2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF791F00898;
	Tue, 13 Oct 2026 13:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897591;
	bh=tVHm06X34u8AGKrX5ze42cJuWlkT4sfU7DA1g2GyizE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ksBQwIg2y4Lydq0pGQESR1kd3NUnxrbrqStOG47fh7rbDX1pGxcWQGVsoAsRFf+x2
	 bebT/Iuou0Yw6UOETlhMLQtXazFY19AW8zZ4oAGBJAVZdDR+4FTKYqYKRxH4d7LewT
	 bMeOoXfx0Bt+R6ScDk+i2Cp+LNHICpIMGGRGB7dj9sCrcDESqjzQqg0LJHQQzcU/Lg
	 WM7nKmxd3gKu552aVzSgjys2g+HttiqePmNbfVSltg6pcmTaEvp86q0pFrdqGl+RrH
	 ow8NuL1kGs2sN5cJxqxHP70fPGtCjcE6Nw22YEheZxHS/1NdTcZ5p8qtZZdzhRroPb
	 zE3EM+Trk5oqQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 39/53] MIPS: SGI-IP27: don't register a w1 master on an XBridge or PIC
Date: Tue, 13 Oct 2026 15:16:59 +0200
Message-ID: <7f80c8e4933570f1e4cb2d8b425bd3994e26f438.1791890466.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791890466.git.kaloz@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On an XBridge the b_nic register's 1-wire bit-bang path reads back a
constant mcr, so a sgi_w1 master registered there enumerates nothing but
phantom slave IDs. Move the w1 registration into bridge_w1_create() and
call it for classic Bridges only. On IP35 the L1 supplies the board part
number and MAC address instead.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-xtalk.c | 41 +++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/arch/mips/sgi-ip27/ip27-xtalk.c b/arch/mips/sgi-ip27/ip27-xtalk.c
index 73b2eef96bdb..091186cb7a04 100644
--- a/arch/mips/sgi-ip27/ip27-xtalk.c
+++ b/arch/mips/sgi-ip27/ip27-xtalk.c
@@ -31,13 +31,10 @@ enum xtalk_bridge_type {
 	XTALK_PIC_BUS1,
 };
 
-static void bridge_platform_create(nasid_t nasid, int widget, int masterwid,
-				   enum xtalk_bridge_type type)
+static struct platform_device *bridge_w1_create(nasid_t nasid, int widget)
 {
-	struct xtalk_bridge_platform_data *bd;
 	struct sgi_w1_platform_data *wd;
 	struct platform_device *pdev_wd;
-	struct platform_device *pdev_bd;
 	struct resource w1_res;
 	unsigned long offset;
 
@@ -46,7 +43,7 @@ static void bridge_platform_create(nasid_t nasid, int widget, int masterwid,
 	wd = kzalloc_obj(*wd);
 	if (!wd) {
 		pr_warn("xtalk:n%d/%x bridge create out of memory\n", nasid, widget);
-		return;
+		return NULL;
 	}
 
 	snprintf(wd->dev_id, sizeof(wd->dev_id), "bridge-%012lx",
@@ -77,6 +74,35 @@ static void bridge_platform_create(nasid_t nasid, int widget, int masterwid,
 	}
 	/* platform_device_add_data() duplicates the data */
 	kfree(wd);
+	return pdev_wd;
+
+err_put_pdev_wd:
+	platform_device_put(pdev_wd);
+err_kfree_wd:
+	kfree(wd);
+	return NULL;
+}
+
+static void bridge_platform_create(nasid_t nasid, int widget, int masterwid,
+				   enum xtalk_bridge_type type)
+{
+	struct xtalk_bridge_platform_data *bd;
+	struct platform_device *pdev_wd = NULL;
+	struct platform_device *pdev_bd;
+	unsigned long offset;
+
+	offset = NODE_OFFSET(nasid);
+
+	/*
+	 * An XBridge's b_nic register reads back a constant mcr on the
+	 * 1-wire bit-bang path, so a sgi_w1 master there enumerates only
+	 * phantom slave IDs. Only a classic Bridge gets one.
+	 */
+	if (type == XTALK_BRIDGE) {
+		pdev_wd = bridge_w1_create(nasid, widget);
+		if (!pdev_wd)
+			return;
+	}
 
 	bd = kzalloc_obj(*bd);
 	if (!bd) {
@@ -139,11 +165,6 @@ static void bridge_platform_create(nasid_t nasid, int widget, int masterwid,
 err_unregister_pdev_wd:
 	platform_device_unregister(pdev_wd);
 	return;
-err_put_pdev_wd:
-	platform_device_put(pdev_wd);
-err_kfree_wd:
-	kfree(wd);
-	return;
 }
 
 static int probe_one_port(nasid_t nasid, int widget, int masterwid)
-- 
2.47.3

