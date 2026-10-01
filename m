Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ECB4189BA;
	Thu,  1 Oct 2026 16:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871267; cv=none; b=DFi7NBOqRHGPtMYM/wuoPK2O24r6HjuZj8SW1duvGVc4PaX6eA+kPrjSQBGdEufiquEslt8sTsshmfIzJS2FkPSjE4YuQxYESugtWLWmuy1d2e9jZuUWxEsGaxH0IIdntbhO3AIKyGxYXNjLDUc/chZsLmz7I9fHYpv6e829ikA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871267; c=relaxed/simple;
	bh=xqpx7Vizb9nt6+G7vkXl+UNnveEGX7PGHw2oUYxuNHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vF3BjeUkg+F4gK2wEFe4QTSYoS5PdRrgOgtGWMc0AwlyHaLtGZ7QRr+u7iGMWZQ+NlbuqNyltWC5uZKMcdHc+3PqmaClNK854Ky4XnaP/6BOohvOwWBkllFEbmujeaApfLKUqvvFQ9sviHJ5GytOEUF6CLFjjbpbIF/Ed1TMuBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JdT4VHoY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JdT4VHoY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC86F1F000FF;
	Thu,  1 Oct 2026 16:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871265;
	bh=tVHm06X34u8AGKrX5ze42cJuWlkT4sfU7DA1g2GyizE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JdT4VHoYF5BObVvAQ6g/FQ+j9XFKx5/ms0Bkmu+M0KueAq1hquYzIO51ArYJNXQsX
	 hoUuC8Ph8GKEP5u0DXSxLtcrbgNcDMGbB0shUpGrKxnMhVl5dQJk4ToMD5inOIPrtY
	 Kz3aUnEnQ86EN0ncYsvHSmVYMrPXtPt3T64DUEOetkYML05M5+kWTbvwow0+SB0s59
	 GOH1x0iERS+OPtzqNIk9Vccmozw7qhTyeQaVisYy8VXzjosBhcIYHj6+fg0sw/A9FF
	 hqP8gTfCThvdbgoc7t4cfSZhF6U5YQ6E/DikueQn/hx61d5rX/msu4yQ8HCAow47r/
	 DmT0tgXo0OJHA==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 33/38] MIPS: SGI-IP27: don't register a w1 master on an XBridge or PIC
Date: Thu,  1 Oct 2026 18:12:08 +0200
Message-ID: <462d9f216272243d9b2521826ef487ac9c52f44a.1790857966.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790857966.git.kaloz@kernel.org>
References: <cover.1790857966.git.kaloz@kernel.org>
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

