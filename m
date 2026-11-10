Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274614;
	b=mvl0U2OjNpH2pIhMKaoy2bcRuS0YuALE6bSVHnxdoG71c+9p48mKgJH2mvEFRLC9EcQX
	 HD/it+mLOC4sJ8PeGPi8HzPXg8BfqnIw20LQ12ew0yj0ANAFdRcjGiYaPyA5nWdh6LqRW
	 k9qKgIhXudAnKSMrraQp1sjam/S/da7/X9efC6rxB/zpxOgZsu8s5c2kZj9Xa+yfZ/OGi
	 Yqx86J3gctGE6lQ83wNYo4f4Vgwhs6tK++a+m/cO3VFSOtIcpAnEOTt01BMHyP5DC8uxz
	 Vgx6lA+qhizsipNMTQ9nLvQ1rMs+bkpmV7V+tzlVhY2FXPtagRE2E/WbsZMCmZeuxcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KBXunWp616box3X7V9vV93MSQlhAq0/quw4oecuKOn4=;
	b=2SusdRG6ehs7thukHroa0MfRXAbhJKR4z4kKnjFD0lyQEFY2BQY3hvSzCDQSjTfTjsK4
	 1NelKqnpW7l/4ZHBfEfKF1YOeQ7dNLdLPsIV2HdqEsTDlr9ytMLAauQQ2vvbeCcyUgkVi
	 wW6Gqq/Q4FenY3uhMjjaWfD4V2bkZRfA3a+9sZVHSACO1I601ZbhO8gCmlEej7h/hG/D8
	 3zKGux4fXK1e9LruYfqaBurAwSATRPDbxfNw3jAeE7UoWAvcEcYhnkt14FQbF5V0yjeUM
	 OHZDVR5wmB9hoWaUZ7aPjxAZnIDApxxaEs1GYv8hPvytSbWHSyK3002XfA8n4pFj7hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXmwP+KM;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73460606A325
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 01:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73460606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXmwP+KM
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e987a2ba0cso8696515ad.3
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 17:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274613; x=1794879413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBXunWp616box3X7V9vV93MSQlhAq0/quw4oecuKOn4=;
        b=YXmwP+KMjfg8Y+ppgBOIkepUy5vUlFl0hR8P/EkAHp47RMYvYcnIPP1cYSzJUvfFaG
         fa6vOok7/0ZKJ7oxI9jLyyGCaTbdn3xjgBjwuSpA0K2Vwj4MkX4/zee9AQquncJeaNjM
         PgDhHsxojGiStVqXSXYk+hhAFTLwXQeJ1ZOOIrcX2k1O7Xw6mS0tAUXDyUByid89Ciie
         34PGtCLgF4xuojkI1iBeWFhx4pHn9M6gyI5QkwFv+u69AaYpH/cZqgW9gL8Wj9DL/5BZ
         ZCbidCDfgtiBcS2sPxHdmbQfJbgvCpk2sQlRvfPJq1V6q+FOzU0+/MhB2y+FUsslk20R
         5yhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274613; x=1794879413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBXunWp616box3X7V9vV93MSQlhAq0/quw4oecuKOn4=;
        b=iaRttWBXet0s9RVJ2mkFCzZlG3fXIeQzb0zTWntdrr8No/vkqnMKG/1hC+L8zGsOQg
         FLppEBMd3Ab+6KEC1wttSFHSTKBhplGnoK90SEU9gzv+Iphn7HJNzbED7bvUVfS3Tifv
         UM8rKT4TKa5eAGwA1PoFSo5yGkNcdnnZoj6oY+2/xdvHAYnF8u7GpM1sPoRKwii0mySa
         lHDF6LVMfx2RaR1bkrHljoFpZv//PbLZxXcQz9Fh4I1ePcVn6mrb+8RqP6Z2Haom0jEk
         PsiFZ3X80qqZAWngyGi/2qknMNv2iGLYJ5kBGKyFfykfn1zdmF2v/6hLACn6pLoQyBFK
         wNDQ==
X-Forwarded-Encrypted: i=1; AL+hErHUSoQ8DNDxE++rkij4N1kZme9DG7DsLz8/hgYS7yVAQ6uPVh0ywhiDLCsGX3AnCJ88LuUE0rsfhzGl@vger.kernel.org
X-Gm-Message-State: APuU4Z+BvjMFGy7Ec4wrxG5jtH5E8mE526/2uxE5tN1EjPjfePy615ho
	lkOelHoxqbB51gFsZj1jTDzLlmz9e6sY1l9PlBVKS5nFACraA77A78Ua
X-Gm-Gg: AYBFou25ZMbz4iMU1Y6wEKzKRwx/kJ5PvVp7dCBCh4kA7O/hKOCJySop0zvLeyhedfw
	iTcNdgg656eXbZm2h7xuMwwsoWKyC26t1cakAdyPNZdULFyLBwIIeeWDKE1Wrh5cFWXvQfq+MkZ
	XHugR6WoelqZvjfuPhCfumoNN3p5gk+jQ9oLl4YC4+2gRcbDEPRXjUgefOA2h+4GPsM3YlfO4qt
	VKlRKV//TPVj3BAUnwRSL1g31wVgJFDmZntohCfSKVRF5D2yJaztU1qE60bSOcmSwxnFTQ1zGSe
	ujg3oAt7b0NX/FPoLmT/b1bbD+epmcSjErWhBvfU3Q/+Vrlmt54+orDOhAIyCfA3b4063OWXgt1
	t7fG5vIXKros5tFOttW9MRfq6e0aRkVSBiN+jaj5KRpjzVKy1ZR8dYqWFPPC8zJwmJMBjFiTCzH
	PinWm63I736Yoc2vj6K4zLvjNsCHVkUdCgoG63DueaFo/aAgAbnd2wqptLU9JPAPgiV951j1yUU
	Wi64nN02KZlXJyRJurq052MpukCpxG0h+BqS+VRKN9C1PcfVU4oEo5kRPbY9mqun1p6fKHINvRO
	M+pe8BLWfRd/Z4aqwLViRMqZ8cksZlGTU0UzBMVvy12C2FA01ucANhXwCda0I+/f0Em9K2oJZv2
	3RlKSczwEmlWjZXRdE5uusJ1re7yBYYX7S6V2JuEA1Hdepk67lDK3uzTpbLuhuZQE6l0MuQio8X
	uLhA==
X-Received: by 2002:a17:903:4683:b0:2e6:2868:e576 with SMTP id d9443c01a7336-2edb91c7094mr9718735ad.31.1794274612794;
        Mon, 09 Nov 2026 17:36:52 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9efd6sm3399055ad.50.2026.11.09.17.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:36:51 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/6] MIPS: ath79: apply the QCA956x timer workaround in setup
Date: Mon,  9 Nov 2026 17:36:41 -0800
Message-ID: <20261110013646.1582970-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110013646.1582970-1-rosenp@gmail.com>
References: <20261110013646.1582970-1-rosenp@gmail.com>
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

qca956x_clocks_init() enables the MIPS timer interrupt in the misc
interrupt controller, which QCA956x needs before the clocks are set
up, or there are no jiffies. That has nothing to do with the clocks,
and it ties the clock code to ath79_reset_base.

Do it in plat_time_init() right before of_clk_init() instead, which
runs the clock setup. The order is the same. TP9343 boards use the
QCA956x PLL and took this path too, so check for both.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/clock.c | 10 ----------
 arch/mips/ath79/setup.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 050f6553f398..8c5eaa4ab6e0 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -523,16 +523,6 @@ static void __init qca956x_clocks_init(void __iomem *pll_base)
 	u32 cpu_pll, ddr_pll;
 	u32 bootstrap;
 
-	/*
-	 * QCA956x timer init workaround has to be applied right before setting
-	 * up the clock. Else, there will be no jiffies
-	 */
-	u32 misc;
-
-	misc = ath79_reset_rr(AR71XX_RESET_REG_MISC_INT_ENABLE);
-	misc |= MISC_INT_MIPS_SI_TIMERINT_MASK;
-	ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
-
 	bootstrap = ath79_reset_rr(QCA956X_RESET_REG_BOOTSTRAP);
 	if (bootstrap &	QCA956X_BOOTSTRAP_REF_CLK_40)
 		ref_rate = 40 * 1000 * 1000;
diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index 4e18cdcf65a0..d9e1cc77ad04 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -241,6 +241,19 @@ void __init plat_time_init(void)
 	struct clk *clk;
 	unsigned long cpu_clk_rate;
 
+	/*
+	 * QCA956x needs the MIPS timer interrupt enabled in the misc
+	 * interrupt controller before the clocks are set up, or there are
+	 * no jiffies.
+	 */
+	if (soc_is_qca956x() || soc_is_tp9343()) {
+		u32 misc;
+
+		misc = ath79_reset_rr(AR71XX_RESET_REG_MISC_INT_ENABLE);
+		misc |= MISC_INT_MIPS_SI_TIMERINT_MASK;
+		ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
+	}
+
 	of_clk_init(NULL);
 
 	np = of_get_cpu_node(0, NULL);
-- 
2.56.0

