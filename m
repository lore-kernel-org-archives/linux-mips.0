Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699754;
	b=LTsQ745m9mfd3IQDZbZOKXJFGP0qfnHIVef20dsf3rnSi9deZQibviOu1LAJrAH34biQ
	 rqPDzJlJvsUHwx0csQbtuW4WQ4V2sqpLi0j0YA/p1cOQ1zJJqk0c3dfuvrAN+tpjq4dti
	 Rrw5R2ROrqcbRx2JJ4X3XMbcRBwLjXSCvUpRJWKtHtawh4ir3AC4Aytog1iyI+UDA98Tr
	 iFX7SisgIN4qVXLOVi57t9UpAMMVCF1aZS2tk7qqj1du0B/ikRxxheWTCUOB3CFY3jIR2
	 8LmDe+6tTIwRyZ5RqynO5bHu1Fu7JPtZGQHSCfZPA8pLwafh9gFOds9Jf54luZeIEfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h02M7ZRT82vo2QN0ZQk0R2AefSd/VQlgbNcmA/89Arw=;
	b=AlqjRXa9Xgv+SJ0iLjWyIJWsRhnzQzwdP4TU3c5e9BndDkTeZaoSwVxLMVnBrgYgUG7l
	 anQKrPbNMutbgudJq7Im7TZxVUEUEBDQ+c2Ca26fB5g8QCPm+W2Vwbo39ea2NKUV37tyt
	 NJwYn801tRdJkGzOv0XyRkMk9Q7lsf7ue+qzV0NOKcZecQXmZCYIA09jxNmJ9DA0rzcrI
	 o2SIOaXz3Ctb873EQJ5jd1IBVYZAwZW9nADCIRtbrorZCxppRdvjarqDvzEcDyD4s0WSW
	 zvk378EGv18ddAK7VPs/7rHwM/AWaVVWXWnUf+gfuB9ivKNB+UdKFq7Bvvn55C75nUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PzmXYQR1;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EEC606A885
	for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 23:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79EEC606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PzmXYQR1
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so1190211b3a.0
        for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 15:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699754; x=1795304554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h02M7ZRT82vo2QN0ZQk0R2AefSd/VQlgbNcmA/89Arw=;
        b=PzmXYQR15cCChYYvbHvZmRtbxA+Vazpm1dPjD1puEWhx0NHS5zVYdgFvLCRrTrbMVu
         AbiPDGFXmUGW4rbpcSXBWDfd8I651GINKhQKGtP3z2j/DEVxNHkttCAoOCRIznTya9Ta
         tLj9nHU+bxyuLbuzU9kk8koKm7BgijjngQLYTr+A0yP2mGjXl8d3Cv9wFOWn9lUvS0PR
         iy5QRJ+VhwVrcvMN8wOo6s4y30qiALwZesI2H2UmSDC8wdet4p2Vo3BNUFtXMzhRLocr
         TkwxisJZcvi/ws25jc/IbIhPqlHaciw358MQKaPrD/0kWpl3RijFo0B0IMpRItR3rcSw
         kazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699754; x=1795304554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h02M7ZRT82vo2QN0ZQk0R2AefSd/VQlgbNcmA/89Arw=;
        b=bToyRh1xGuMdZapjSiFZmnvgjidRBK76A4dn6P5NplKQwSD9pbtnmEXLlPG5agoBlf
         PbRH4MsUukI9aDASgIymhgXQJrhQOjIFt+bx5cfpsdHt8kYU/Pae2wW/AxBbN7HpoIbm
         A0ny/NrXd11s6ubi4qZpk7sIwZeFyqlWwhtmU6hk5qtG8T0KYl1HV71vW2MqFLGjwwxQ
         11zFODzavMcvrfD6C0RohO2AeypDtS9m6AHPVmvUg/15fSLnLRTxihPgvcML8QDFiEug
         w/nUh4xfHfFd+S5Hf0xnEI4E/nDvku+wY6Swkrodhzr8akZcriY0s8tP/3PkhKDJHkIc
         GrcA==
X-Forwarded-Encrypted: i=1; AL+hErE1XhONbGr0CwVnYFXDVHX68X4wbQenBaqZHVaFu81he6GGwbgUxUYJHL9JGPkO4JvGOPMecOCRcFeN@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ue7Tb7g/tTiBtK6q9mBan808Mw9+wavjHWFyvIxtv7uuY9QTa
	SLNtooNJmDqNH+ItaQkSV21fq37lQ5q2a+DW7dIVgrIRrO7oqX0SsnxV
X-Gm-Gg: AYBFou0lwUKmf0wIjciIu+RBBlEI4Z7WYy3+4n9onmAOAeAYo5olEgTe7iHtixu1lin
	hF0rJLv4hWdy81Zt310ifj4J26J8o0CxxkOQvutkTOGCBmZOdr+XJj9EqTV0F7JYuVIaB6l0khk
	sv1blH69fsxQZzdcE4/8Tn/8me1H6gGcSeLnjPzb9fqaY3sgbQyxN7jh2lWfmB6LbJF3+c2gDv6
	6L5O3kfKBzZLqjkgP4oSJt3yIduSVWGylqrAsr03lu0dTNb+YBN1NbT7QA7H1dcKbcI1XIMzQEY
	/9t1MJENdTVu2Wjem5aNdv2DPOntIH3qBaqrSy5wB/d7tsdgmqbtXQZp/2N98vvtuuHdRpiEi+B
	aEezVVcWWxAczIkmyKGRfZUcdg/x0MuMwlMD036az4DJZfTEVr4n5YhijbB/9PIdUBFPH54GWCc
	XJfaND05QkkwCutG8yUf4HsEoL4ZmAmgXRq7Hkg3FOXOUqCmgHmkG9N1gNu6+QPZw/vXTH6UVxZ
	l7HXdDw6mSEQFEozPUlX2wka8lV6LamqO6e8nBKJHtf+J/EqOrGjNZiHoYMWTB5Gf2rGZPTT6Or
	A5NurDvclsgt5UV+e+aHqmKt+ANJ+nv2FQ2r1ptB98yj1v3hrVdtYf0GoebHE1L3rpAnJlUK2a3
	YkR1CY3o8E4KeEQAk6BXTfZKYWttjT4UhXvxPzPzwwR8BQQJtxyoK1F7HG6bugXdh7lrbFGq4W9
	njvg==
X-Received: by 2002:a17:90b:3c4e:b0:3b1:8380:a9a0 with SMTP id 98e67ed59e1d1-3b1b0b67c8amr6550886a91.46.1794699753758;
        Sat, 14 Nov 2026 15:42:33 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:32 -0800 (PST)
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
Subject: [PATCH v4 1/7] MIPS: ath79: apply the QCA956x timer workaround in setup
Date: Sat, 14 Nov 2026 15:42:16 -0800
Message-ID: <20261114234222.88337-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114234222.88337-1-rosenp@gmail.com>
References: <20261114234222.88337-1-rosenp@gmail.com>
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
2.56.1

