Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07A31DB356
	for <linux-mips@vger.kernel.org>; Sun,  5 Jul 2026 05:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783229119; cv=none; b=nl27gIUVpi5sioXcZuVnoL9+isxnC4wJ/Y+YoqLw6364bga+OgRBCKg+D9SZVUZnSxTUo8NAPY0lZT9JkL03AAngfm3RhhJfUdpippYvyv3nDmRp28zug8eLkESoW9XPNdexzVo7AlRbaehmabmYgct97dOypR7ttQZn/Bi9SY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783229119; c=relaxed/simple;
	bh=epcP2Y/j/qqUXJpwk83s+qSfccDLBWVA4GyO1wOgzew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oafdTtDBiPqmiLkuubntCA+tmVvya4joat+9qkObFEAumWRR0klv4rxwwz//x2fbpmVw/JYHjlV/4K5A/d7Dxj84yueknoxC9x18LqfoVuh3FtEpxkc+BstTpF5gE6wvolChzR8JimVmaHo11OrDC8tI6BOdgWVlSrLKTYy5SDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pyrQhfqJ; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pyrQhfqJ"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381065a7a03so1362194a91.0
        for <linux-mips@vger.kernel.org>; Sat, 04 Jul 2026 22:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783229117; x=1783833917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fRh+uNdepByk0NPdqaJV8dOCpgv8k5m3tE5twcjLoc=;
        b=pyrQhfqJMyMOCvmQnHtla3xTXYia6ryYslwziTMSnUcJhZFssa2yVo/pz/bFa5Jbq/
         TqIW9nUsWgZOOSPe9DuD8G1fKT0F4D4jWuGNISatfW22kMVN/eb73v389a0bEmTCNi7r
         5bWjuzG8Q7WxUQz6a8v9gYidb2GSUPi6MX4mALurancQs9V19m10dENbjFZc7kLq4gyr
         2yAeg8F/z20N2xc87EynJh+RyYclPODg4cB6ngh65voFSL6Jg4d1t4CYOJotExCV2XW4
         Pkb7HMevVfGGj+tAAuDWlX9GZf0ZOmzqXKhCa9oSD2aWG3GAadp8MdEpV5sishzQEk94
         hc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783229117; x=1783833917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4fRh+uNdepByk0NPdqaJV8dOCpgv8k5m3tE5twcjLoc=;
        b=lQ4/YNutaU7zVBtNcEligAJj5+C5fLs3dYc/N5xJMBjugQq7++FpKr71j9bO8u/DXD
         GEGpYeKvhdSxvwh3rbp8ZQGUH0rRKSImFgIXKg0dHwNmDFoKVrdCKel669CouFDuCGCd
         QkF0Z8Of0jKBDGDGzteGgYvgziLjvEZHc7fTs0RcZ2pqWJHXzL/fu7gE3CvAjL9M9OvE
         /eaKnw897S6i0BGnCO5LreJLZmh2Ngr3RZC2gvJ133SRMpbUnICRXvIHZpH/A12bFYu/
         gCgO6gFpmnjT0uLrBWVEtJ42U7Irh3abSbZuF6+tlfq1Dhwi9spTFk/0L5X5F0XdDChi
         Uh/A==
X-Forwarded-Encrypted: i=1; AHgh+RolVEEVqp2eScr2EcyMbWYvu97ct5VDpv22RvVfF0BoPXcqQQlRifqBzLlhFWvIfIhBm8KZTXGT1zgw@vger.kernel.org
X-Gm-Message-State: AOJu0YwpScv+BUQ3bFnBvZB+eRBwopenWLxOBr12lCySk8Pvz5Wjry5v
	wBVdi9c3AwCUIhpVnqUgEKG7iIZG+W48iGiwCxGMS9tVwJ55wSvUM9Cf
X-Gm-Gg: AfdE7cmadTrad66ZThsR+1jKgGdmyU6CThmqF2vaFLq3UbvnCRnBeYxCifxTU/FNZwh
	2RodLKK/SI+vyPE6h8hHNuvaPps6EZU79/iM+akXtQxEfVs5zd6PEVC0M/vnBebp6qiSBiFu10b
	nnE3sVDb4E8vVxHgZidnVR+HbjP+dQ+rLHRj6XQ5hc9M3zMax5CTI/z9eVw6Zy2ezFwqW4SGT8O
	MSj1RssKVK4h4mb/f1YL8heDfAqGEYJQKoHs5YhSNQ0MOzBj13bK8CS+VaACYXdH3dY4ZVLmQyP
	VFiGt5jFnbc3ydrO+rjfeydPhtbUPI1K+7Bc1UpmCzRM59v0jz9Mrk5k2iuS3t5eiKFilzc00wj
	fbJ9UH4vCmkFPIM/SZoQhWTcHrG+ps5obhfDkDyseiNHfTpfVRLVBp7ip/rpE3IopZRQC0j1dI1
	rzjiWmOdmbspgwPmqihRmqIpMYo5u6MbqeQtCfI5NqqeJGBKPqf5sg6xihmV4xUx2RUoMr30vdk
	82w
X-Received: by 2002:a17:90b:4b06:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-382807af3c4mr5777064a91.8.1783229116575;
        Sat, 04 Jul 2026 22:25:16 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:4560:aa1b:b33a:15b8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a1bsm39035329eec.3.2026.07.04.22.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 22:25:15 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 04 Jul 2026 22:25:08 -0700
Subject: [PATCH 1/3] bcma: gpio: Add and register software node for GPIO
 controller
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-b4-bcm47xx-swnode-v1-1-730d59340237@gmail.com>
References: <20260704-b4-bcm47xx-swnode-v1-0-730d59340237@gmail.com>
In-Reply-To: <20260704-b4-bcm47xx-swnode-v1-0-730d59340237@gmail.com>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Michael Buesch <m@bues.ch>, Hauke Mehrtens <hauke@hauke-m.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

We want to convert the legacy gpio-keys platform device on BCM47XX
boards to use software nodes. To do this properly and allow
referencing the GPIO controller by address rather than relying on
name-based matching (which is being removed from the gpiolib core),
we need to associate the GPIO controller with a software node.

Introduce bcma_gpio_swnode, register it if the device does not
already have a firmware node, and associate it with the gpio_chip.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/bcma/driver_gpio.c | 17 ++++++++++++++++-
 include/linux/bcma/bcma.h  |  3 +++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/bcma/driver_gpio.c b/drivers/bcma/driver_gpio.c
index 658c7e2ac8bf..0dad8d6dbe5a 100644
--- a/drivers/bcma/driver_gpio.c
+++ b/drivers/bcma/driver_gpio.c
@@ -19,6 +19,11 @@
 
 #define BCMA_GPIO_MAX_PINS	32
 
+const struct software_node bcma_gpio_swnode = {
+	.name = "bcma-gpio",
+};
+EXPORT_SYMBOL_GPL(bcma_gpio_swnode);
+
 static int bcma_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 {
 	struct bcma_drv_cc *cc = gpiochip_get_data(chip);
@@ -190,7 +195,15 @@ int bcma_gpio_init(struct bcma_drv_cc *cc)
 	chip->direction_input	= bcma_gpio_direction_input;
 	chip->direction_output	= bcma_gpio_direction_output;
 	chip->parent		= bus->dev;
-	chip->fwnode		= dev_fwnode(&cc->core->dev);
+
+	if (!dev_fwnode(&cc->core->dev)) {
+		err = software_node_register(&bcma_gpio_swnode);
+		if (err)
+			return err;
+		chip->fwnode = software_node_fwnode(&bcma_gpio_swnode);
+	} else {
+		chip->fwnode = dev_fwnode(&cc->core->dev);
+	}
 
 	switch (bus->chipinfo.id) {
 	case BCMA_CHIP_ID_BCM4707:
@@ -234,5 +247,7 @@ int bcma_gpio_unregister(struct bcma_drv_cc *cc)
 {
 	bcma_gpio_irq_exit(cc);
 	gpiochip_remove(&cc->gpio);
+	if (cc->gpio.fwnode && is_software_node(cc->gpio.fwnode))
+		software_node_unregister(&bcma_gpio_swnode);
 	return 0;
 }
diff --git a/include/linux/bcma/bcma.h b/include/linux/bcma/bcma.h
index f02cb3909375..aa88c2d64bfb 100644
--- a/include/linux/bcma/bcma.h
+++ b/include/linux/bcma/bcma.h
@@ -486,4 +486,7 @@ extern u32 bcma_core_dma_translation(struct bcma_device *core);
 
 extern unsigned int bcma_core_irq(struct bcma_device *core, int num);
 
+struct software_node;
+extern const struct software_node bcma_gpio_swnode;
+
 #endif /* LINUX_BCMA_H_ */

-- 
2.55.0.rc0.799.gd6f94ed593-goog

