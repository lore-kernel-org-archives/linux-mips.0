Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C46390239
	for <linux-mips@vger.kernel.org>; Tue, 11 Aug 2026 18:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786473327; cv=none; b=pWQAGRMmII/UIa8ozj/IqZrxuhjy6++U/aSvLuHYWbv1IrZkofZvzuOuYSEEMXd2vZUlEQhlWO6EB1Ip2VtIUU8kr+f15XRtiWoL1O9URQZsDFazGZ7KvC/PJShox2yEo542nEWiQXbO6ow9LHsuJ9AKSdDNu0YLX2wPvpAzO80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786473327; c=relaxed/simple;
	bh=czq7FfVUSRkxS+OESlYfd9yCb+96ZaQvZPYD4R28OCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IWbk2wpOyDrmi+LOLIt+MtJ+M1bpNjeL5ggXkWBlhwoBIn9FrR452a/y4+NfrKTFD/Cw9083LnEbKE2ZbEneAfPXwJNHmX9e7VU7xdr7wdvl6n5A7P4Q4bQ5XWG3t6mAkZ0swJF39nxFKb96pzHdQsheROmaXcFrlxaE05KjvNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TK8WS2Pz; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TK8WS2Pz"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6ae5baaef5dso161912eaf.1
        for <linux-mips@vger.kernel.org>; Tue, 11 Aug 2026 11:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786473324; x=1787078124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QhrxK6mb7Z5yPAVrc9D74/LH8+fdUBZIJUQyCqIeBbs=;
        b=TK8WS2PzpsLgof15PB9NBeEGBEDucx/CpOx/SJehbo+8hiQZ+qrdM45LjVPmBAd351
         mWJCwhmdjZrkTs5ML0ayiSwE1lZgYMqFHPFA9eAkSjR/kOS8iqHm8xVYwBIVdjWC9ebT
         N2ipQUjGxbT+DznwAAcIWk5BF+KACRIxBO9EJQbw0v4ysmuTOaeUAO+gURJH1m4UFxP4
         6M7Li4uEEcAQsTVX7jTe4ow2L9FJ1gInu6DrnF6xzuUwzy6CoXsrJGT4y+yOeCNC5A17
         czef7b4oB8QaiCiDZ/t7HWTOnAkn/KdrCFM/8YYS1g1Xlld19koSRdROQ8zQGDPoOsDr
         2XrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786473324; x=1787078124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QhrxK6mb7Z5yPAVrc9D74/LH8+fdUBZIJUQyCqIeBbs=;
        b=hC8e7GKxdwfJH5WUfQtRKkS9vb42Y7PlimA8pYz6awSUYfP1bltbyTn5B39TpFPCDP
         uDHX0mEhqAORhrI0qUSlUls39Q6pc89Sryhb/hbFJ6blBZoT3m8c09t0SID1akjbzQs6
         dSUqNKd3d0p7s2/JDhpyLOXqdNYm6HhtAsfeeHG5ZSfEW6LSIOaA/FWA+E7rdEwXYRs6
         L7e74vN1jXFet/p5/ZO3k+Qni012J+ScAQ1Cfxm204LsbNC1QSoRGOI5XReb1Me8nt/e
         i6G6q2eIWLMlcoAQutN6JuG/dqpaD/+Lv6V1AsmcbhH/4W1TlJAEw02wjTjfANLGuMzB
         RGMw==
X-Gm-Message-State: AOJu0YxNFF56qjJ5ziA3/rD+9IA3N9hBnuhK6GgJwGJBjKY8BDWWNOhd
	jwc56nEaPsVPVZ7q8UZAO4P0z1eSR+eDCHnTLfjq7wSMl4+bJDfKckYGq8qGzw==
X-Gm-Gg: AR+sD114EkCwsRc1UeO2ajyZHI8OA5uQusoXj0eF4xxtgH15j0TePU6JJ5y5Cr/VVrQ
	gR3xVB7nlCXEMVE4cURC4pvcDjjmmwkUzHKi8GXRo/6cmosOUSvLd4LVM9+XBIaYyC1GqFgoh9q
	GgzX5VV5YBYa4sQjHU2K4wdfNmB7nm4bGNnag6j1BuAUEvJIXukPi1JkLXum1tEDlCRmIjXlJcg
	bfK7SxBsKemsbviPmq3T1qG0stMZY1STp2cEpP+7h81yUwnT3ZkYUoJqjIZKUcFQLIr4FxrFsz+
	tFnVRQScx+ft/e0QiHGzB/osWClKbot3pNprLgoJDdq5ks6etQci1kIZzF0ShS/phBzbIvr1vYH
	uJ1VtGj3U1JtIgkm36xZf+ZKTD/xmL0ZOJUS5nJ180uloOPP8RMGAh+GJI6KgsZbjAAgC9lmE7+
	ncijmTQ5fqksyM7fEHHrNCPTtIf5rqkpAPKJIxa9uzVkamlaq19WmKTZ0kbWNCAruXrKkU4Kl72
	rxIPMRUO1XEp0erEuPfkhUwfRacjHkjscU5I5U3rQvRL5JYxc28jmv8bIwFPFAT6DXu+18/SHYu
	LOaAmFIHZUdKn8uFn2/hzQTNB1cmXWtDAGE5yNKjdRo=
X-Received: by 2002:a4a:ee19:0:b0:6aa:1bc8:ae0d with SMTP id 006d021491bc7-6b0abcd8148mr1566180eaf.4.1786473319875;
        Tue, 11 Aug 2026 11:35:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45e355aae71sm230090fac.10.2026.08.11.11.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:35:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mips: rb532: use devm_platform_ioremap_resource in gpio probe
Date: Tue, 11 Aug 2026 11:35:15 -0700
Message-ID: <20260811183515.24596-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the platform_get_resource()/devm_ioremap_resource() pair with
the devm_platform_ioremap_resource() helper and drop the now-unused
struct resource pointer and NULL check.

Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/rb532/gpio.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/mips/rb532/gpio.c b/arch/mips/rb532/gpio.c
index 49e1a15a3827..458895a9fb25 100644
--- a/arch/mips/rb532/gpio.c
+++ b/arch/mips/rb532/gpio.c
@@ -192,13 +192,8 @@ EXPORT_SYMBOL(rb532_gpio_set_func);
 static int rb532_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
-
-	rb532_gpio_chip->regbase = devm_ioremap_resource(dev, res);
+	rb532_gpio_chip->regbase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rb532_gpio_chip->regbase))
 		return PTR_ERR(rb532_gpio_chip->regbase);
 
-- 
2.55.0

