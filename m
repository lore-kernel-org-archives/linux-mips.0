Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274619;
	b=KEiEvOTWBDy4+BfAbKb6zA0B8W9BHssNxLjRUXU8riAeBOr7Uy4syXT0fOSdAP7cZcbz
	 Zg6yxdCcNJApdSG5RieHB0Jshm/lsX69gpOZERTHMlgd+VE1hvdunuMEeCM7zl79qYMwl
	 893GFn/rNMj1zLwqs8Y3AdYGKKodA30op2DWbzcYNxcLPcCfUT1WPy76fAsb/jIooNb4L
	 YjU4mjxs3pTGRq79A8JTDji1Rum/TUp0Vf3oFxICYJdajYhdaAHNwYG9v6SSBgcvm6lhp
	 S1FH5XezBpmy08saOrjxhFFewyplJZDGr79t0GzAjPSNc02l4rBk1nf0ByHUNkCBogA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PgiLeA+AUEhjknnf87xwKUw9Fc6CxmoE+hmCmn2ebwY=;
	b=XY+vGRM1m01zp9Lf64IhFBX2J2eJ7ukSej9h0sXTu2e4L4jMKV5jLcIS14WutbKbfvKc
	 gk40d5uL6Cxe1/nMJIkZDx7KKWzhiLDaC1PAFO2tHYKRU5OT1qkc+idXy1H1Wet5YnY8j
	 UuLyMdLZ/4EROjfHmcU5sy4U/V7WhH9VsO2G3XdWFbsRz5V4NIaNVY3aJ2m1s4lR7kz6b
	 qTXsW7Zl9wVVP4QE0QvGXDbLIGIE8MfwZf4tJCWNI9OnWtl0eLZM9XAetcgDT5kdfDdYc
	 zwDn8pj6cz+O5pXJrn4QY11imyLtVsvGgNPxUGMjJAYVXsUww7mwB5ymEOp0Twgnm5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J/Rw16cP";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0047360A2614
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 01:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0047360A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J/Rw16cP
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so6244955ad.1
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 17:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274618; x=1794879418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgiLeA+AUEhjknnf87xwKUw9Fc6CxmoE+hmCmn2ebwY=;
        b=J/Rw16cPObp3yLW1VgpFIWKU4KeUmtm3z4y2VmDbBVazCBovIs2FM5JXnEVwLXyb2X
         9STnPdgpuFcYIdVM3DG8uWtyf4DXNvgRhjft5K91+pQhT7yhrFIrgtoXTAIJHEMp8BhT
         quYrdUTNAh8JM7KNW1t0MQ5OVtX9gvOFWrqA6oO8k4/zq/um962HANiY1NnnRKg/KrG9
         fOaVnSYKG8QsM2w6ProTIwSKcQr0Q655EEfVLg8h9CFjBGNo4xnQ6i8wD5wdGLBW7ZZg
         dH4UkYQ+JHj3usvF6fExn9sBCZq4T3AwLIH/QZsRXIBt+1CImw8EVTclYFU51Amf5gvS
         xgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274618; x=1794879418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgiLeA+AUEhjknnf87xwKUw9Fc6CxmoE+hmCmn2ebwY=;
        b=TeDU3nBSooRHKHa8wtFd8bMmr2Dtrd1CDAkDaCRqhqJNq04iRyHQNx2pfF0VZ7UUGj
         Iw1Q0OcxqYbNMKdVNGZ2lemlPbVJ5CBP3FqeK8UmxcArQMW4kUbUtS36dNIUaEGSSiM+
         KqhwKeSSwAnh3wUlK0LJFM6sU1DwOLcTEQWXk/766Mt9rGHxvHXc29wwJBqyBLlWB+xE
         74yDAwGLjoVyWlXM37O89r0J4qwZrnybW+vxNPfNA7YXPsUGT8EZIXf9PqWJKRlnkToC
         4ecB0Sips/rkB+zbVZVLuVIysaaDy78X5o6DPCYNXXyF8d59C6dtoazIFwRtGrXqZy04
         M2dA==
X-Forwarded-Encrypted: i=1; AL+hErFCsNEp9DBeJr/w8S9wLY3KZrtUo3JoR07HC8rsKvq1xpsGSm3MORp/X87x5c5FKqnylTpIqx8sb74u@vger.kernel.org
X-Gm-Message-State: APuU4Z89iBdqDaRraEIWB0YTbAnlv6s+sm/JsBO+0MQtJv/LTFtI84Sc
	IV701y4EcMjvdYC6OdJTkvwHDWc9/SJrg+S8yid/5HF2Rhi6vByHZhHR
X-Gm-Gg: AYBFou3tyKcqNQUaOH7D4BGzpXl4w4uaJGoznwODG3OQ8K4HJcJz21pWxO1tNyMV6z3
	lGnIeuGvvrpwtDCJ6uPFDq74B/DYLar8rwU9A/tvDjdiiQ7PO1Z/+Waff5uw8A9j7DjZEp3uJXb
	DVX85uOKyK8QeeyLDYHjwq+qLQvgADWO03cwm+BlDESFExKM0shwopVKoMRuvRqgT4amiDL8Jj+
	t3pwNC6xV0DBc9PdLMEEqnauL86HfhyDNTyjgNhssf2V738pHuUPXfHLuRnOuIbBkMJbn8F2uOn
	2KRSzNkaITIi3oRjn6OqzpTLHv5FkPOL4him/Fq7LGWc+rpP02omaN2BYHlW+vnqjBg17rszx0L
	Iq4jS7Tj3WY/NauNPeHEEaesVdm7b3HuUaMJcwaUovY7rqIkLwECqsWa9wBeWRsKt8AOgly/X93
	O/mZM2nuYIPWU3uUj4hpm4vPC05ocisXdIdAZuZa/cbaOOkS0w2vV0YSaHIW3EP7slkSHSywMNO
	sluJoY/wJyiA2j6bcJ8AhUCEWw90I56M7GxiYaMHWFgIbsgiJdSvVqzxG1hX/oV9LiS3katxgp7
	89qwA83BkjrhkOexHmtAS0VTmoeDND5m3/JodZ5Uxyp2ExxvR2ZM9Fj3RNx3CwgPeTl0wbFAPyE
	6xNH8RihQ429ZXIccof0LzGFCUr7v1zpkiQa1OpxmO9tZ82opYP/hRMZnnk0UYOSzVB0rQmpU4E
	2euQ==
X-Received: by 2002:a17:903:1252:b0:2e9:5c51:19d4 with SMTP id d9443c01a7336-2edb912cd82mr9735785ad.29.1794274618427;
        Mon, 09 Nov 2026 17:36:58 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9efd6sm3399055ad.50.2026.11.09.17.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:36:57 -0800 (PST)
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
Subject: [PATCH v2 4/6] dt-bindings: clock: ath79: add the PCIe PLL clock
Date: Mon,  9 Nov 2026 17:36:44 -0800
Message-ID: <20261110013646.1582970-5-rosenp@gmail.com>
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

Add an ID for the PCIe PLL, which AR724x, AR934x, QCA953x, QCA955x and
QCA956x have, so the PCIe host controller nodes can reference it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/dt-bindings/clock/ath79-clk.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index f8a98e4d206d..e4956afd151d 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -12,7 +12,8 @@
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
 #define ATH79_CLK_UART1		5
+#define ATH79_CLK_PCIE		6
 
-#define ATH79_CLK_END		6
+#define ATH79_CLK_END		7
 
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.0

