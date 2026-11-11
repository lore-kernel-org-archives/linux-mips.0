Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434264;
	b=a6GUfZixYS0jK6FrnSGDSIMNXV+G92C7Da+ejPeND+xlx5PgNT7Rd1V9WCuecHFVkMGM
	 d8AUQfidBLn7FCiWdnJ5jdFF2yxtSPtqRL+OWJf0+U9sHyGQ5fk6HuuwIjgJ9xbbz7/4L
	 gfKuEJpvG9w0kLAhru1PdwtNuqxOqdBiJ9E8DaAeOYYpA6DPWPrZyCLoqxsN6G6fmY982
	 V+UkBwAGmlRY1RgjST2tOPPM1dz7YfGzc9xOqlBmp8iAiTEUW+lMIJ1wZ0336zb5+4hxS
	 mo+MXGWqkqVdG0pBTgNW5F2A8dtq4dg1C5os/yKO03HkypoUE1iwQ46dtA+Sd/ACv0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E5HcxdpQOV9RFM6o/ZfBmmKRtQ1dbEjJPmX/Bpim1FU=;
	b=su7M4/znkouJ/sPWkvogFK68UrC1dP7bX017v7ZunM75yiIwqqhWfPGBXnQXhT6rSOoD
	 tlJJkJvmQ8MEEt9wr0gYRSjiw8OMxh9HKAAebivUwumi68jL2qg75nkPwt4G3P4/5pdGi
	 0ezznhzqL19w6iQoqCurl7pKSp/R9Y5OnThFQiLN2iJ5YPdmvEv1uSwfSnvfWVAPShhDO
	 lkUTZYwatHX8AQLRX0CFk9eJ2Cs2F0C6TRxA+raTc6pNlmrQ234G60ff4Mn3sz3IXzVh/
	 OmC4jkULwh3z88FUNCxyR8q9nQaIp3mOeVIK59VJbwzIRXcmmMVlNZUAoOW1ZKiegew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VKJ1JhnH;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A9A60A262E
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 21:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1A9A60A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VKJ1JhnH
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso2034858a91.0
        for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 13:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434263; x=1795039063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E5HcxdpQOV9RFM6o/ZfBmmKRtQ1dbEjJPmX/Bpim1FU=;
        b=VKJ1JhnHMnZGCpinQvAzVFJUC+MbAAWmd2u5CI3zAOXpLFiDx7qCSS5UpLi1NaBYYP
         8jq2SRgENOiXlwWGjY49oH4aMdu+O0hzKXwExUAzMNnLbozVx3eyyU4T638F1VUbmpnM
         6PL5odfyF2/P2ZtBS32m4knDnod0K0NDyVKjS7kMrNWi35aTu5TwNxgQcsMEdh1H9+O6
         nL8I6S6xfDpE0Gnnzy+IKFUPeNVSubrO1pBsr3skACJx1iDKO/7OHCCODCaABc+8d1E6
         /oibtIOK4J3BvX0UKCjoPTtSLLF/oSokhlSC6CY4EgPFqEZbGVD4bcPp5WYsijHc6ewt
         Tu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434263; x=1795039063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E5HcxdpQOV9RFM6o/ZfBmmKRtQ1dbEjJPmX/Bpim1FU=;
        b=btuXmDF5hD3oDEVZXY9uCcFxC5XoDNOcE8u3RZf3F6iywJR3iUPBTRtdLHxIfEP800
         LQK0uhSldPWn2ODzs3FeOXuVr/r8SEjUb3GqxCgzUAk8gBODt29Z8GBHqOSh3DrwPftB
         uRT7Ao8dR29Xgq31wYWmkDuHPhA1wEgtgDMWbiQN8auWqj9L7NkgwXbBKfDfTkGsxXpk
         sHHfbqF0J8jYmglF9wHhHPAuiOZcDBauMREIwjpv2B1jun596yzxHWzu/hAD6+LPzm1N
         xXZ6Z2f491xRyl8QFJXVLcgYcQ1psE+COxakvQfXB2hFefaPx3HAKNYCPYhT61l3KcNq
         /Xfw==
X-Forwarded-Encrypted: i=1; AL+hErFreJFLBwq4moz6KtkEmmcoHmfhJcPdQ4Fr3SZxHzInbpkB5sbIkHydX6moEplapzlKHdXEfdG2jui/@vger.kernel.org
X-Gm-Message-State: APuU4Z8HFgTGLo7lweDd10GC6aMfoRAjkCGV+Uqqx6Dwbltjw6pAFXf5
	blvutqIqEPlIJN+DiI8GaioKJdA39odiNCdsmYN+faF7pUaXf259y/I+
X-Gm-Gg: AYBFou1TDbE3rnNHVGYO1kR4aMOfEEZtVB9TCn+IsW8UtlPZff7CHy1S/eDRxcRj1O2
	litUlkhQMXlLgIbZ99ZP+jDpn9Zt21eq2MeVXN1rlgtAJYiPKT367UMxCyAoh7Z6l19n5/PvWry
	1tWidWQSFj4PiNlbsVPTuw+tihuor5eq69AElWPNFLM3RDF6adNZZh7tyiNF7hHsL3Jot9CWvxU
	Vc7JfFkFsD+Krg13gjs71KbOdfWKDv7adEEYK5mVLhzO8uqwFRBDHmCSXhh4Aq2usf54DaOkvsk
	kOo0VFBfy4wmwHSNz+vG3Ikbu8QKSlal6mBl/IXJGLmj+U12K1GZwpP4D4ex43M+vJnxbV20yn6
	wMjdsy5LywtHGJf+Q82fNPUTGfzJGnpaW+FtoyyLdWuJY7rkTx+1otAHr6urhQIoM5lMMFRy/ZM
	wv44vq19OOMLFNH9UBrnCvqQlyltenuMhEmmWlY6bpLcyAd7V7xWqszlUHvC0aGTFnXi8c9C9gx
	zEa9gT1cd5p9IF3CrB/aDAmXygtXraQHNDnSsR//fzWmR3DH+9pELxGIQo6UnEU5ZGziaSBmlm3
	jHLszfF3aNsWra9Hd3AjJeR5Gib+CUKvv4DjT/x6c20hGDJb4uaM7p0klCxeYO+kDIZxOqV2wUY
	nk35OBLNKq2oE96YBoGKsx7y4Mq+XJhPLHyTd9ZqskOIpbdNbu1D+6q66WqBSsCj0Loe7zNSMJT
	JyOg==
X-Received: by 2002:a17:90a:c2ce:b0:3ae:5572:c4d1 with SMTP id 98e67ed59e1d1-3b182fdb069mr3632430a91.62.1794434263235;
        Wed, 11 Nov 2026 13:57:43 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:42 -0800 (PST)
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
Subject: [PATCH v3 4/7] dt-bindings: clock: ath79: drop ATH79_CLK_END
Date: Wed, 11 Nov 2026 13:57:26 -0800
Message-ID: <20261111215729.10683-5-rosenp@gmail.com>
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

ATH79_CLK_END only counts the clocks for the driver. No device tree uses
it and it is not part of the ABI, and it would have to change whenever
a clock is added. Drop it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/dt-bindings/clock/ath79-clk.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index eec8f399b9e6..27e31452544d 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -12,6 +12,4 @@
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
 
-#define ATH79_CLK_END		5
-
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.0

