Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187586;
	b=4FVmltnFah7rEmBqSDlIGma4Yef5wx/k4iFFuHfM7+NTyn7+Xxo51VhthfI/+EluTg/a
	 IqOKMqPVdkg6SJ0OFHwcUQhSUiBo1EDGA4GNdJB5lfVvP76jBsImDV38vsPT1ihTUDJcL
	 G/Lw9vvfsoKl9aQRd8HV6ZUNGYuFji4PGwcQyoZlvdmN+Tu4qDW7xD7r9PdSiQh238BEe
	 lG2Dn1z63tcTahylMhozsdaS5y12pWpK49sVn1ZXeGRrP/ZY4RG3r9XW+yoIaZyCkTBG5
	 6jGmqhE7CAfseIvppuAWp4HstZjAr10DoHGoW7VrUKV2LupChg1xeXyAbkLy5BL2fcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187586;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=torHDOBLS/8AM9fn9O4rpTmiGST/LRrc4ESupadLB8k=;
	b=Z4hTunEdFmqnoaKVA/LgnybpD2TshZCTgrLy12PTuA9KOrv+c0RpKJ7VwbZDRL9UgKFr
	 aIXDuqjZ51EwTSjACTO8n3eNcN17BoEsmjSAFlXeP+vNQiMKfmQZ0wotIm/6+mECwNkbe
	 6pZ8JKSpmgYDruTumBW2y8BCngF//xKu48A1NezH2pCZMvKMz7WdsWP7E0nvcbn/3IvEn
	 BSF7qxIhFlJMLcrg1SFmr9+UYE3d2nxUFHX/Afov9oeHr0F/GEa02dxzwS/Q3NyFpxNNa
	 5VqAh2+ByNDVxISpoGZUiGhBHq/0HaeAbkFsQD4tJrobDU/s5ChVO38nsRyUWqCJmEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=FzHCYLdI;
	arc=none smtp.remote-ip=62.149.155.101
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375ED606A32A
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 01:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 375ED606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=FzHCYLdI
Received: from localhost ([87.16.49.252])
	by Aruba SMTP with ESMTPSA
	id QE9Qx8UGc6KjvQE9QxqDWB; Mon, 09 Nov 2026 02:26:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1794187584; bh=k7ESnYvV5jT/b19ZiMmV+GLezCbMfSD87jfTKfgvwS0=;
	h=Date:From:To:Subject:MIME-Version:Content-Type;
	b=FzHCYLdI0UHRMhNR1GqDSSs6GTFA6kP/SkCNDD3Tied5ci6m0OswZmNZ34qybdLhp
	 kGDAJdDG3q1VCjU0aVC3cndQQyq0Xv49sQ3MJ8Fshs0KQ8g7ul9hyGsl2y2us4Oevx
	 GR1Unfa+MtRkLs7zPbQxnJG0VOY52O8gSS+VlrkWqecuO0k5koT6H6o6AStYjrMdvJ
	 Fek3eEFgXkhha5u8uMFvYxXau3Vp+dkzC+yHmrrd/NdiEmVWYp0QNwIjkkXkvMTilq
	 //BNbvwrp1tQUUrqySg7GdI4Fa9/LMZrbeMKQzBzQf2ADI7WDun3tjOF/BEpDSKCgI
	 p1NEScrfw4dNw==
Date: Mon, 9 Nov 2026 02:26:22 +0100
From: Alessio Ferri <alessio.ferri@mythread.it>
To: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Michael Buesch
 <m@bues.ch>
Cc: vit9696 <vit9696@protonmail.com>, ville+git@takio.fi, egc112@msn.com,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, b43-dev@lists.infradead.org
Subject: [PATCH wireless-next v4 10/10] wifi: b43: add the 2.4 GHz
 BCM4352/BCM4360 to the supported bands
Message-ID: <20261109022622.000056e3@mythread.it>
In-Reply-To: <20261109-bcma-ac-rev1-v4-0-de1262c18b54@mythread.it>
References: <20261109-bcma-ac-rev1-v4-0-de1262c18b54@mythread.it>
X-Mailer: Claws Mail 3.21.0 (GTK+ 2.24.33; x86_64-w64-mingw32)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNaJ3TblAzN29JopYLP1XVvl2jdRXeGIaOQzUSdsNeAYy7osSVP4gFYhnoQR1WGWSgWEdTj7UZfatfO0oofzzkHysfODp+66TYppvsFMqyFO/AxSo5tm
 2KMU1YxhYmi2OfvojrAoOnkxoAfiXzuP77mg/kscjg7JrN+2C/ilF5AXND3OgiV0Gkylp/hk771ZXX0BUJlxE2XyscQSVn9f9inbNQ7Xh1ZX812ASnLhtsPK
 A5i+GODttOAaei8rYYmZkiGgfOIpE6CMYO4dmx8TvkZEljpuiXzVlqey8TYHqpYNFezqBoOUbrHAxfBbCUYFTskSY7md7Csgs9pxFCq8LAp2ffiFIDJlzMMG
 vs5wDlMSE1LKAv2kQj72DCfdFoWrShGaoN5UAwmzz4Lgy/9Sqa13UTeO8jwQ60/gOpQZJwolV6odvTCO3IVEec+EUxgxHx8C5p3TzYXDaZuyipkYHuA=


Report the 2.4 GHz BCM4360 (0x43a1) and BCM4352 (0x43b2) as 2.4 GHz
only devices, as their 5 GHz variants are reported as 5 GHz only.

Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>
---
 drivers/net/wireless/broadcom/b43/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/broadcom/b43/main.c b/drivers/net/wireless/broadcom/b43/main.c
index 3825b6ad9..350b47b4b 100644
--- a/drivers/net/wireless/broadcom/b43/main.c
+++ b/drivers/net/wireless/broadcom/b43/main.c
@@ -5366,6 +5366,12 @@ static void b43_supported_bands(struct b43_wldev *dev, bool *have_2ghz_phy,
 		*have_2ghz_phy = false;
 		*have_5ghz_phy = true;
 		return;
+	case 0x43a1: /* BCM4360 */
+	case 0x43b2: /* BCM4352 */
+		/* 2.4 GHz only devices */
+		*have_2ghz_phy = true;
+		*have_5ghz_phy = false;
+		return;
 	}
 
 	/* As a fallback, try to guess using PHY type */
-- 
2.34.1

