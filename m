Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792788131;
	b=N2Q7Rd3qXqOz5pe5Uk8OWuxPeyp6ewourI53kKN+XIxDYWDNk3p30oGp+a9cFZq/cs2B
	 JCLfDdgPfM3NQrMmjfPFj6XqvhuDjpcEqTBm1LZ33QZVEqN8V/5+B5US5jXX8Vv4V8gDh
	 hY373K4YXfz376i5WEn4UNoe8ytzbnijqau5+kW4jMGegBqbZSQZyhU8vYroUqHuRv6YG
	 yQbbUPBbcR5A2x6vuZW/CY5KpU+t1yrEXNzznq5FyuIU/MpQoaILO5k9HJ77u7O9nWBBm
	 Q2MaQbzqEmG+u95n+r2PB/xcb+mpLBkplzcsCI908ZScGjE6TMiISjXb1xBW2F3e6CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zyMApVzALEKfl7qhgL3ky6rk0V3N5+p98NsJ9aVJvD0=;
	b=Q5LSCY13RKjoabQ37SlHRLe+7Y6JlTrweUXn1wM4NAz7cSsoUS1/wgv6PuAK+jn7pQCI
	 /2cObu9+1czKtc/6k9fQ/wIDs5KlQIj2JUg44fFrehnNZO5WMdLH80j3DH/tnzblnQdYJ
	 Z9UGLXzL7PaTLG6qZB+du5uJ3PVJcVXK3ZwO4+7/+dLqgEU4emhTtDW8/dcn7pdbyKRfO
	 2/zBCF1pvJzKOur+LgMF2vOuqDgD4a+3cr9eVQu7/jId+P1J2ACjtU1bH38wdVahvuaix
	 Z9+4vC7OvmBOZ3ODjHMsYJHW+TGhqvFjUC34eLr8qRihW9/p8Flv/tcC5pdqaByIUaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=pGG+kwUr;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D77A606A324
	for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 20:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D77A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=pGG+kwUr
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e0d1da913so1020667f8f.1
        for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 13:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792788128; x=1793392928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zyMApVzALEKfl7qhgL3ky6rk0V3N5+p98NsJ9aVJvD0=;
        b=pGG+kwUrqpe5A/QKNgH2S+nkATS7olAO50nfGbt6mhyG/Zsgrf3rVvM/AKyZTjKXAd
         vv5Fs44g2MljOHzKPYv+EEBOx1bwYDjU35BGn2p6fEsGJ+jS0Le+4axiVU041ZZylKcS
         YpeRU6mN6VRtKYDr8moYFjXNnrhzY+fwA4y/UE2TboBVbmI/jb3Ncs7Tj88qowkFnrtW
         13xjITpCE7k/1oqRyAOSa8KzFJFRa4yNcH9tfZlPQTAXtEpVwhelPe0PY5Tcqplp5EiW
         1RBX8ic7BM7feT/hgCfTffJZtMTXIjrJSdmHwEynW2wGCIbmw2xn3JbbO03Hr62pQhKY
         jHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792788128; x=1793392928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zyMApVzALEKfl7qhgL3ky6rk0V3N5+p98NsJ9aVJvD0=;
        b=ZkuxOaBbjhWQ1R/sG1Q3HV2vKNtgqa1w0GZJ5lbYxL9FVKh+XpWggbmCPtqAcSYh4a
         F2LRNcvWoCCiRg22SytsUvKTiv+Hf7XZtYVjxoq+rTcsIq7NCaJ3DFEBMLsF8/mDNj/R
         5tokLNaCjAzSPJiYHqDZbB4jwZhHVCVLjZt6SaGLBUp0JQZ/pu2vGVs3mMrGla5xeDC7
         Ryw+kSl8Wz7rntVqTQZovfnlSpiZ9lI68cKl5J4UFPPP8lI1cj9x1jNtES+X3QPuAKLH
         4KTBmRTc23d25cYoTn6zef4ifY7TJ4phzmx/D9SIssVvQJEvfow0/809sNyvItQGC+L1
         IENQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSmZSkk6VqGICh9sQ4H79XBgUOGdxDqFY/5eC5Nwcoczvd8RAqXs0+WkNQSqn5B9CrA01bHEbJEtE0@vger.kernel.org
X-Gm-Message-State: AFq9FYK4/M45O0Qn7dtIaij2C2UEwqE+aJz1zv5lDz9Lsp9Z6adkWE5T
	zDPM8jdst//kaYu3VP95+ofXeI45wQrbvsO2zasROpXCWQNHd6sKwY/4qEfBP2ioH1Q=
X-Gm-Gg: AYBFou02WIVjt/Jda5qmC8co7FA5Dqy6XpYG3iKYg+JFZZrFPShWyAqugsPr62ujg7n
	lX9Ssyy/l710T7ptpZEVRnZq6mAm4MD7xuGVSe0ACP9Gtv3POLFE1HukFGv9QlfZvSjXMF2mTuT
	RCYnQNLAmawKYYJccGyahZ7axZ2AVE+3S9qf8WB/P175yXCG/mTzz/UCUlmdnjZZ3rqS8YciLe+
	p6yved1ytEefXtb+eHPEWnO/Tm4a43yUVW3q5dCapJ89yjMNEsgSVhhk4emRb6wpO5dPYgIbGpR
	OTuuihH+vTREs6OWkOa4WoMPj2AzLgPrntmJ9Cvj8Zy8aUe6nx3HdUExKYQJmCMCLswEq4I/nQZ
	jdoHvte3z0AiwC+vCd/ZTM+UGSrtFmj1DnhcS8w+OTPcz/jzghPct19G4yKDuuyuWArMLo2Q1Y/
	AcVv1hdF4se2Mcpb+pWaMStrThPtftCJw2n7D3yojjorGWaD/jhGLZpJJiWLzSr6PZdd1Qrk3c1
	X7jm6YN5kK1V8hvd2zh7WfpZ5pBJDAMPKoPhbRR9yhU2un1MpX007/oo0e/vEr0XWpPdjSokNef
	sS8TFLSo+7Fy5+myhu/ZF0xz878Ss02w
X-Received: by 2002:a5d:6e4d:0:b0:48d:bae5:41c with SMTP id ffacd0b85a97d-48e3eb7e458mr188254f8f.17.1792788128507;
        Fri, 23 Oct 2026 13:42:08 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm253565f8f.38.2026.10.23.13.42.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 13:42:07 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Linus Walleij <linusw@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	linux-gpio@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/2] pinctrl: ingenic: Add X1600 groups for each I2S system clock
Date: Fri, 23 Oct 2026 22:42:06 +0200
Message-ID: <20261023204207.48277-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600 has a system clock (MCLK) pin for each direction: PB22 for
receive, PB26 for transmit. "i2s-sysclk" takes both, which a board that
only plays cannot use when PB22 has another job. Add "i2s-sysclk-rx" and
"i2s-sysclk-tx" for one each.

Used on a HiBy R1, which only plays and has an interrupt input on PB22:
its DAC takes MCLK from "i2s-sysclk-tx".

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 drivers/pinctrl/pinctrl-ingenic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 1aa6a6dc1209..28e7f1852054 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2411,6 +2411,8 @@ static int x1600_i2s_data_rx_pins[] = { 0x35, };
 static int x1600_i2s_clk_rx_pins[] = { 0x37, 0x38, };
 static int x1600_i2s_clk_tx_pins[] = { 0x3b, 0x3c, };
 static int x1600_i2s_sysclk_pins[] = { 0x36, 0x3a, };
+static int x1600_i2s_sysclk_rx_pins[] = { 0x36, };
+static int x1600_i2s_sysclk_tx_pins[] = { 0x3a, };
 
 static int x1600_cim_pins[] = {
 	0x14, 0x16, 0x15, 0x18, 0x13,
@@ -2493,6 +2495,8 @@ static const struct group_desc x1600_groups[] = {
 	INGENIC_PIN_GROUP("i2s-clk-rx", x1600_i2s_clk_rx, 0),
 	INGENIC_PIN_GROUP("i2s-clk-tx", x1600_i2s_clk_tx, 0),
 	INGENIC_PIN_GROUP("i2s-sysclk", x1600_i2s_sysclk, 0),
+	INGENIC_PIN_GROUP("i2s-sysclk-rx", x1600_i2s_sysclk_rx, 0),
+	INGENIC_PIN_GROUP("i2s-sysclk-tx", x1600_i2s_sysclk_tx, 0),
 	INGENIC_PIN_GROUP("cim-data", x1600_cim, 2),
 	INGENIC_PIN_GROUP("slcd-8bit", x1600_slcd_8bit, 1),
 	INGENIC_PIN_GROUP("slcd-16bit", x1600_slcd_16bit, 1),
@@ -2539,6 +2543,7 @@ static const char * const x1600_i2c1_groups[] = { "i2c1-data-b-15", "i2c1-data-b
 
 static const char * const x1600_i2s_groups[] = {
 	"i2s-data-tx", "i2s-data-rx", "i2s-clk-rx", "i2s-clk-tx", "i2s-sysclk",
+	"i2s-sysclk-rx", "i2s-sysclk-tx",
 };
 
 static const char * const x1600_cim_groups[] = { "cim-data", };

base-commit: f33a24cc012d34f25bb9942681bd478a1757b806
-- 
2.39.5

