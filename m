Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC99C44A3FA
	for <linux-mips@vger.kernel.org>; Mon, 14 Sep 2026 12:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388256; cv=none; b=mOJRdsmTpui7ag+5XK4fzCbPscSmqLH74iJ1OgSPnx/EU0ukCTYSLg89I/V5eLF/+tjY6myba9UjMw6IuaOeQxud5PmJUxGgi18MWhLJWx+vd6rTkYkLewyhbZO19D5W26qM9fLfE5p6K9retA6x61tIFSnTwd1ENkMmNNh7KPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388256; c=relaxed/simple;
	bh=MHs1HgPxgPGY668f+F+QPsxuTFVLhQpne2pOOe6jaVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BaVCJhoZRvCCPRd/tmqdGCs/Iajg9Ga7wwgJvfXDEjHsRZWkq2c/tfvgrktWHDkNCwmjjLbEHlN1U7tldJq7uD+TWFciv+5EFA1zTTbmKYXKcj/e0bP+KQ4Mxf+c6FCpochbdZzpO6pjh+sO41OHc2tbW2ImDafkERS+R87mvJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qP3juN8k; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qP3juN8k"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 797A94E4059C;
	Mon, 14 Sep 2026 12:17:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4F52C60323;
	Mon, 14 Sep 2026 12:17:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A6B211C7AFA1;
	Mon, 14 Sep 2026 14:17:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789388248; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PN7rLy5S3k/X4ISt6xJqizuIYpNUjwPdt0DJWzVjQUY=;
	b=qP3juN8kOonVv5SJqbQODDeagTOyVi2mPODznh4uvP52N4BGIftlBNasw72laSH9mOMJlJ
	P8cT2VqHoU6YytaDb1If8eqrcH2fBm5tQ2YTlcXiQYv6AdIcwUnLVPB7MuoubCAZTGcuCH
	v+RcRnpV2ZUZWrKxunz0kd6N/ZpbG8XZkAOxiBMJbKVl6KNeLp4Wy/hLIbIRyzXI2Zecl6
	1kg2+8ckFEZEaXitE0+fYMh/vZhGY2/tpe1s4HiifOGhakT1moDtq2tEfn+R40eUSkwbDI
	TWtNiRD7esXqQmmT/XJ4K6IxofuD24zoqQBuXIBg0hmpQ9SMD/pmXBA4kC4Y3w==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Mon, 14 Sep 2026 14:16:44 +0200
Subject: [PATCH v2 1/2] clk: eyeq: Use devm_platform_ioremap_resource()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260914-clk-eyeq-res-v2-1-687e5de3aba7@bootlin.com>
References: <20260914-clk-eyeq-res-v2-0-687e5de3aba7@bootlin.com>
In-Reply-To: <20260914-clk-eyeq-res-v2-0-687e5de3aba7@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Convert eqc_probe() from the open-coded platform_get_resource() +
ioremap() sequence to devm_platform_ioremap_resource(). Besides less
code, this requests the memory region so the OLB registers are properly
reserved in the iomem_resource tree.

Move devm_platform_ioremap_resource() before checking for device match
data, so OLBs bound without match data also get their memory region
mapped and reserved.

Suggested-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index cf37feccc734..3662e6990bf7 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -513,21 +513,16 @@ static int eqc_probe(struct platform_device *pdev)
 	const struct eqc_match_data *data;
 	struct clk_hw_onecell_data *cells;
 	unsigned int i, clk_count;
-	struct resource *res;
 	void __iomem *base;
 	int ret;
 
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
 	data = device_get_match_data(dev);
 	if (!data)
-		return 0; /* No clocks nor auxdevs, we are done. */
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
-	base = ioremap(res->start, resource_size(res));
-	if (!base)
-		return -ENOMEM;
+		return 0; /* No clocks nor auxdevs, stop here but keep resource reserved */
 
 	/* Init optional auxiliary devices. */
 	eqc_auxdev_create_optional(dev, base, data->reset_auxdev_name);

-- 
2.55.0

