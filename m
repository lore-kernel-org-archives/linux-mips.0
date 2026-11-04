Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771937;
	b=oTul7YVVJblQI4xcVasCWd4eQYRmM81wDnUlz3ltqaxQoS1IkapJKiIwrq+xksBW2JVX
	 OuCr5yRcuI+sx+uhh7SnMqEWZ1zIvDB8FcmoMWDEU2cHmj9InxgMO0Ur95BzudcF4wswd
	 x0yXB2hTgYC/OHmUkMPfXwXhxbcZlFEOMFQdrqNgymKKzcaM6ivOhvjWNdlc7wF+yJLkm
	 5wcaE1ug6tPRBMQ9Dt6y7EeuSLkZBT5l/OCCsOYsYVoK5cVq0YuikydnhYURxoAAhsOfY
	 LZFJPBjcbNXoV89Ak35uss8K0msj23piHMSNLqAmDxUgm2uivC0TMkErMW6uqybu6GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KBXunWp616box3X7V9vV93MSQlhAq0/quw4oecuKOn4=;
	b=noWAKt/vQIADkh00iq1b4/wgmkyigxFa6YFlgtxxCDZY7cunOEPeEODRjVcUhGVJvrBx
	 mxyJcCodHe3QXMmTC39VcpiGMbvZ+IfE6m6aP5hTg6EEvq5cnJ8B8PaMJVO3JtHtKtJLs
	 bJYWSd1W0/4FQ2zKX5YppYanchUvcyBXVCdq94tHqnoUshrAKM1gaZiPnaj4Jvo25K5PS
	 rICIdDdEmTECCxIoQnlkXrDaFVLgMNNwVTDnqKbC+UjBJCqbhhownEjcqQZWf5f4t9jg+
	 0QrasURBwBpwi9XwM0f5p48eSxol3WebGUKJm2ycT9Z8sybIO0Xd/hgc+MLqcAbyj/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxLqEAZc;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277FE606A334
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 05:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 277FE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxLqEAZc
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so259154a91.1
        for <linux-mips@vger.kernel.org>; Tue, 03 Nov 2026 21:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771936; x=1794376736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBXunWp616box3X7V9vV93MSQlhAq0/quw4oecuKOn4=;
        b=qxLqEAZcJHUp/cY1NqTaJSKMpFvTnLBytBsofAopex9x+pMxlnZkcmmCCu5OrwRL1K
         CrAeHJhPbzRBfxVCYj7cdpfX2HWhDmadl2rp4oOxAtdBw+cGZyQuCi9Fs01WTSxGVJ7V
         8Nv/X7kIfY3JwNb/zsRuXaFlShZBoW7Jvjb8j9ngaktX9tQkPkNeE2cDHe7sr+grQk7w
         sOdXzKBkctZ8d6mUE3Lv9wjYkbBSndCH1pJ038t3kQx7AJUgCnA9LpQte8RjRzXTTZ/3
         CnHlg4EhxozVd8/RR0b3sZ3b1md4BBLJTqYxxNToKpSTFVu4HZ4C0TmRLSpz2ib7Y1X0
         QtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771936; x=1794376736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBXunWp616box3X7V9vV93MSQlhAq0/quw4oecuKOn4=;
        b=OMtHRCF1liEdk7V3KJW4I2oq7+3LckUfQDwztyxZlvx9lGD5A2Gk5qRCaNpJNNsNiW
         QPnL9Ne4gWNT5IdR1soXFGanrREGsrlzVZsUhnSTkiaedDImWRgDDiGi9E2z0+fm5HH0
         zohx77NhH56Z2DcHHvAapBRlC+PY4u6BPSwC2lBi5gNDphSSjWQcJMYDkqd77up/LvVR
         GhkAR3NuHY6re+PyMQ+/rDGmbonpxCqC0Hiz2RJPyXoZyKpFhaizsVHrDd4RyJ65FoJ3
         NkQynal81MXswhrtBY0cQsbkx8SsZNKnJm8yy/Oxxv9EuGZ8rIwHYpCxKZ6hblCk1/gV
         KC5Q==
X-Gm-Message-State: APuU4Z89sxZKBLqfcAn+Yce1yp0qFomx/1CLQaNaVcw53zEG7GRKZbS9
	Q2RJ98hFrvcSGbr8qjwu71E7av4jKBPRNvLfFl4uFCkvLhOFNnwIcqM+jFzRdw==
X-Gm-Gg: AYBFou1xFhVFvLO6D9vt4aZ2PKFBbeiyGpKKuE4oX6/B45lQxzB0cLrxLh3/AlSiqwS
	Q2MSccvsgNPEU7Eh1Y16yyaLSXpCBu7ESqxSaEssHTwZzzy/HE4I37tpnxL6rYEVgq6Xu23KOYh
	ffadWwGPRqXxhMoQUXDoIsExqfLQvh4bIkUcwsErUP7mgzRAfenRHaFDU6u7PqAOOhYI/KoIA7s
	ZQF8WuJOGd6FzzCchBs0mjDTofIMdp9yXEa6qtx8QN8QyeEv+7AQusMsqMMDFHMGaR4AenqDdXp
	HRrWKSCOmGFbNKL14uS5tS94e8l9cCtCk+EWgq+MnASpSVDXj8kLDO14M0oKBcOTPISxrF0Yuy8
	7YChj9H8YFmNF0cdSyMKd1wMVJwJgnyIBspcNGkKLzfh1pyO7rA68rkArx3DcvVOmdbDloioUY7
	A9gjkvOK3Dkb+kBKwAkWok9S1slMbuZOIwD0immYcHaox2Mm/1rKIXr5+5jfIqBiDosexDqGD9I
	82sBVDirwLUzv0gl9G6BmtBB5o1pNFfWqgvG6tniEfEqrkk4iSmZ3chNaSI1uMxDzmn5B/+Snla
	yjvI6A3n/qdHsrzRKvpCW4HfgLppSFLjk8YWnmGbNGQTqpagup3KBgbyBJiUrEfnE0wIWmeO5bq
	iVpD/TMaGYr+og9HySRRti12nfY6lJtqcb6sU2vZDRKHdRojmwzrkwlVGWZr7NwuP9COejxZUBQ
	5Gpw==
X-Received: by 2002:a17:90b:4cc8:b0:3a0:c276:1ec0 with SMTP id 98e67ed59e1d1-3ae897f673emr11389663a91.28.1793771936338;
        Tue, 03 Nov 2026 21:58:56 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7840110a91.15.2026.11.03.21.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:58:55 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH 1/8] MIPS: ath79: apply the QCA956x timer workaround in setup
Date: Tue,  3 Nov 2026 21:58:45 -0800
Message-ID: <20261104055852.152340-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104055852.152340-1-rosenp@gmail.com>
References: <20261104055852.152340-1-rosenp@gmail.com>
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

