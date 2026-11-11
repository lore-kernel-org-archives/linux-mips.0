Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434260;
	b=a3yWCXcS4Sy1EuBo2OhLP+lEt9R+rshcw1nuPxYP5CxCJSNZd/sdJKerFHzpCs4zRZ1k
	 FI0pIumXZarYqQKvIiwCN/tjmYFYwe3CPU/+2sZlrXIR/foQNL/uwf8u8nmnZH/DtUWIb
	 h2IMB8/oE+TZBcufVX9Jnzume4Pteen/CpbUMkaNzGQpcgMxietxCCptNHhElWB7rxpGB
	 jfRiGsyhUXHb4IfBtBc7XzKEqKKAyCsiKcKue0oIRT5G3UFWQotbUfiuc0rYEJL9ekVSo
	 2I9nxx/JAzlCBy7DQAr7gyWmQ97GExYE5w3DAn2JbubmWlGeI3TfkEu9mtSBxRMDjrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4Id6YLrXdo/sbhtyWZLRtT4JHuBONTss7g5b/bmKuAI=;
	b=w2/71BPLAVxBINNgNVhX+D3yZAFO46hyj76Ra6rgKtDiuMx8bhx7KOkelvEXc0nY11H6
	 pA0KY4jXb/aPnkII16ivQPR6inSOtPLBZ0L/y3cTDk6aD1Laehz2lVQwjFHmCDQsbHkV0
	 PdZ4dkmKBVSt+pBuO4TjD+mXJguV1qbp/GQsv/nc0cnwR50SBzCfUJhSiesJIr+HraKlj
	 jVUIlJRx8TIyKCN06wYhDabXAKbkPDlUQgtDyO1BcJKR7L3MTargvzWqNs3f52tEfbh8x
	 IkT5xG8z/zaUeI6euC+eSMDBHHiaoX8ghAuW6vra8jsIuPQuLXewHC7OdcELAh0udzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VXHAYuoH;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB487606A8A8
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 21:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB487606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VXHAYuoH
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso2713972a91.2
        for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 13:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434259; x=1795039059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Id6YLrXdo/sbhtyWZLRtT4JHuBONTss7g5b/bmKuAI=;
        b=VXHAYuoHU92lfwUVxtqfkVZGdQiNbVjxf1xXEV1GYQnL17GdS6R95T+ObDNlDmzinz
         pICwPj37iXBxXLTWt2tjwwJqcSbeFg1StgFcyp3IrKaYoS4aFivkgZybTOBkz6WP1lbb
         Habps8kmQ+GE5KgDT6Ipvpy7G24hHm+/MXrnc2MSxkSeqnVZTeQdzt3ISK2qWifjuBct
         Z4sfhZv3Tkxr6CappcuNZ9a7MIXtFIp6Q3ahlQLCDQQ3H22wG8XKA0JhNnKXanEwjorS
         FNrNT+UtuRJLME5T9ug0pLoQvFnr8E4aBOkTj228wOdNiq8m+3ZOziiE3Wa818rBzLkM
         Ll4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434259; x=1795039059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Id6YLrXdo/sbhtyWZLRtT4JHuBONTss7g5b/bmKuAI=;
        b=2B/J0KlCZGAVNPlv1l7xtGZd2tuO4t213D5EBzro+lzWjU3NmqpjgOXL3PO+BeDUAG
         RSig+TYpWjnse3WOAE4myytrivtgcpGfrwUYAtJ7vXyQfqN+8L0e9F32pWl7MAQMJTWy
         iqZOG4g1L0165FhAPjvrHBh05QlBPJyHr/nNpNifVo9usYAYwO+wKIS3VNB834pCwSAK
         woq6cUS/MpFjUpe5K+LgTkRG1YaE0QWc0iRVJbzbcDiCiNg2w2RkQuD69VlnMx06dMvn
         UMfIS/UE0KlehaLWaEqLlBJNqhWeneLYTwk6Z1wA8SpO+o9uZdxLL8VIKl7JbFlKFUe8
         itwg==
X-Forwarded-Encrypted: i=1; AL+hErF3YO7YsDerjJlf2hMPX8fcJIbalUDRfGAt4J3hQPe7qFPHtmYytqN6/19CIPxEioYBSmkuruRXyJt6@vger.kernel.org
X-Gm-Message-State: APuU4Z9iUrK1NsUmLeot277F9/k85wcEk/g2p+ftNufYLa0akqjTRmVt
	yQMRDBisyYdSFcGS9WTw+Uc9ofyXeOuTzToallFjWDuGeJr+5Sn0P3xQ
X-Gm-Gg: AYBFou3wpUYnfKfMxLhfxLcyNfLwkO6kHTLotBsE8ZZwjEMmV58/C9YAs8yRbXGMCy9
	WgfNWtPMcMHFBcf8nD0iOMPzrisdSPJo6TivLBxgyCO6dfikytyUxdztqX9iSi1WcbRa/IJc4N7
	HR0JPBhNQhoAUe7CalCjOKJD9gnQ9N+lLGNQv5CPxMZUUNXwh1ZqMc/Ek4xAci9bPRBRhOLnZkV
	hjqfR/uLkbfFcWVAAuIAUBnEXwKUS/W7EsEnhN99ogz63ZMjXzNoQjyaFYFF0e2QVe62GxScoVB
	UlOrH0MS0cDi+L7e5mt1BwXrJ3kDexPWI9VLEHjg6irmXv2PkPIeqW1i9nvFOeChUPrZ/mBX9+M
	KSZ2gzTX47EBILF4NjAh7440SLqYrFUO4HTgbkq1c7brhh2tiV5g8vUDP+lAvXDnyHeqBa9R+lK
	E0O+gJNNhTFxD6jBemQlbYJwVSyybEzuCaHp7bpb2Y0qnWNd0klx9TaUTyJG2pPoH/oMLLvLZOj
	sQCSRHyL21z3tqQFoWLeRujPXH2NqYzvTmMxZsU+6PlzbM1HB8gkZeDSz+WPJRvxUrA7LbjPXOv
	AlNFqKUiPYU7lPpJzT1e8v+SQ0uPptln3+0XLOnCEw3+KArjk+qaSid4l3TPKbW1PdD1aU9zObo
	WyCvDEQW2aooUHBph6ojrE/aSHjm2/JYYlthxKtSlU7GVtsQRA3auveywN69xREA+jH2Ne2zmXs
	DwHQ==
X-Received: by 2002:a17:90b:134e:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3b182ed7a6dmr3796484a91.24.1794434259067;
        Wed, 11 Nov 2026 13:57:39 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:38 -0800 (PST)
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
Subject: [PATCH v3 1/7] MIPS: ath79: apply the QCA956x timer workaround in setup
Date: Wed, 11 Nov 2026 13:57:23 -0800
Message-ID: <20261111215729.10683-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111215729.10683-1-rosenp@gmail.com>
References: <20261111215729.10683-1-rosenp@gmail.com>
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

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.56.0

