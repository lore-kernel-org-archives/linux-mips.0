Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274618;
	b=O4D1A2A/Bi9Fa3HTOpEIU4hLfg7SHmqbKuSRmE9ygETtlQQb5IsGpxaIJJSI8Wpr81CQ
	 /dSlI0Ctsobsiql99MOdgklQNdYA/LKzVeKvVAbmb0v7yG6JXJJn6MVmu1PP0KQAQZ+B5
	 0wpdikq0TJ/Uh1XJxjlQQ7Mu9YKtyfBik6jyRIatXi6A6e74vuPsHaq5aSgv+pKdqtVe2
	 ea/GVEsXfymtmA05TaVl9yGRLO3Iu2z+wyyRpHPQXZTI21fE5hAPNhR0edGORr8AD4TBo
	 MTHIKQTfedmwhDtFIk5K/R64htSwZUHuFckUEzNclEgINrL/AHXUy00gWLDkkpgxcdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4REj6Cc3PcYKPXeO0BJLjLikBlGobV/sM3/zRfrSm8A=;
	b=piOgvJsY3QLv/D2yMZ3FNtjW/tNTYJGNFwTG/uBqxxSYYAilKC0k1QLih0hCNaHwPXAJ
	 FG7aZVjETU5lTr7e4XJkNk/gR5JXZiZrKCkM6Ye0dnllk/0aHfIsazvRJB9dCURAKwr12
	 IQ6kN4iM0qWm6njHKeRMfxotrlPVK2as/WjfT5GwZmz4r9mPlUIkcPcBdtiYGeVEZpf3L
	 PPG48ezorKhBftFA0vcoqtiMUzEpHXmtckujmsqJPQ1XvBUa2ntXOCN5dYxfUPUrXUQxm
	 M52H91O1w+zBYXKFK0hmqXteyLDnA2UtIg4EWKCZ1ItroLKEfZEi5y7aiPkZuAW5InQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IifquLZD;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF6360A2603
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 01:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CF6360A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IifquLZD
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e946155442so12247725ad.3
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 17:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274617; x=1794879417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4REj6Cc3PcYKPXeO0BJLjLikBlGobV/sM3/zRfrSm8A=;
        b=IifquLZDZ+cGll9llv67+7ME61nc7o7FQKMoq1Pmy+5nIBxla61YJWHsHKruAn+vkt
         1E1pM0yuqw7uDjvRtjt+gY0g0we1m4sBlfJfOTOa4nQvvuD0+J9DogAgK4oUBSLcpFVH
         UKQmY4AJPzhsBAhfF6i5Z5PnBBLV68vn/QBCqHtNaVTaE/1uxslVDkwlgZEphqjCIUTR
         KmfsnLIwFB1oE/ZOPOmcHaUcp7dLiqOm2dzbJVwPUsPRP3XBJjNsRhiM+fCcKCv2eFgO
         amp/0xP1jIWUcIm9ebZV3I1M81tgb8OVHBAMhdDZR0FRk9wQMYooq4l+B4nuFWfj6Qfo
         aHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274617; x=1794879417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4REj6Cc3PcYKPXeO0BJLjLikBlGobV/sM3/zRfrSm8A=;
        b=afflS1AW3qxxy5AIjNiqY6CRV5xtnIHiaamI26CwbKoJk8L4FXPhvi13GYK+AaTYQi
         we6GSK0DIcvlyjUKhO1ToZFtzVRIMw1p5KiUAkXcovN6e3q9OBw21xvZtqXhgYJOgJAv
         hLpWKmK3Lj7nWd1rjBnlraoc08ekOtvOOjnPklbiVT+xX1AIvxW1a+dQSIOWggbomDxc
         8t6y8YEWSzUeNAk/4YrEmdhuJYp6PS3l19AIEKgvKKO43EQWgHl0MszMvdnVIra1kpV4
         +0s2AO9CMEFQDHQ52P4FCgsrgKDdy5QMjGGBWv++xPsxnZc9IFtFXRi8Kwqp+mL3MVnx
         By4g==
X-Forwarded-Encrypted: i=1; AL+hErF0h4m06hs4g9OCfRSdsfyLhVEJfgfGFCvnydCFsPyfY1VxZESuiPKhpf+G1VcL7i9t5Nd/7Q1/p7f0@vger.kernel.org
X-Gm-Message-State: APuU4Z/TvY1Ldc0owb/HcqOgdjsUsKcH+sYDwhaas7a3tWZ1+tbY6uB0
	kJ8zoYW7h2yIYsj4dH8G3z2zMpQW0mOY9ovQ5qcVg0SnqBfrKZhcF69q2efgEQ==
X-Gm-Gg: AYBFou2HVSx/QeEDyeMmzI5SiTJiDK9JK9lWYlYiXtLofSjUf+gmFfpsdrSHum0nUHR
	SbAIppMX+cgkiksdDqry++NFeJcrJIz7+seHaTZAp0AvDR0MfkOqkrpnj+wvOs8fqyJNH7Vcj4w
	eK0vJtdxptfxsxBANzIkgG7Q446KGfdBpTT/ImxdcvunjRvEusrayH8uJaEYa7AodK7GdFwZKlq
	g0YDpT+sn4+s/Gltr48JVagSC5xKERnExCbWO81E4e1eI6eimuc6BfrV9aVIIkoq3xhaWndU+Cm
	Ypzx9tBnrlueejLi69hM0MQZxmmFkzswftk2PHjIjOUCzoeB9rMbWmp1WvijzCgGDLIq3zibmR3
	Mf8iN/mY2USQ4D8TvK7QnP5k7YjLJ1JrGfi7nRH/GxbdMaqqeiwMcH49DBgoDhqwRz5yCYGq8TD
	Ud+O0uWcjG+lsGHx2yiPhva4mjVBx9g/t75AkqiWGNC4fBPSOZxVDz7KLFFUdBYyyR7pLWpAoAa
	cxTD0RGbYc8FCgRPr3NOtERhT4OXNJAX1adxlMRNndE/rvxRqt6qXuGMmaLWeRoG/x+5eTd7Ozf
	4oSVjqdRL1JKBnAdXFg5HX2jXn5+vkwJjYZweOwTrqky2mk7yCZPzvK58muAhjszAa1m2k6lY/V
	N6zrGmBwI527uC+wlMZ+Q4yswV5Fq7P/4MMsC4bBZB9mWjAhbr8H2ZlVdg9mCnPx7nle/BzPa2S
	msLlaLWGRvN0e7OssYnfM/Ol8=
X-Received: by 2002:a17:902:e944:b0:2ed:630:40a4 with SMTP id d9443c01a7336-2edb91f5535mr10276065ad.11.1794274616976;
        Mon, 09 Nov 2026 17:36:56 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9efd6sm3399055ad.50.2026.11.09.17.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:36:56 -0800 (PST)
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
Subject: [PATCH v2 3/6] dt-bindings: clock: ath79: add the UART1 clock
Date: Mon,  9 Nov 2026 17:36:43 -0800
Message-ID: <20261110013646.1582970-4-rosenp@gmail.com>
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

AR934x has a second, high speed UART that is compatible with the
qca,ar9330-uart one and can run from a 100 MHz clock instead of the
reference clock. Add an ID for its clock.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/dt-bindings/clock/ath79-clk.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index eec8f399b9e6..f8a98e4d206d 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -11,7 +11,8 @@
 #define ATH79_CLK_AHB		2
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
+#define ATH79_CLK_UART1		5
 
-#define ATH79_CLK_END		5
+#define ATH79_CLK_END		6
 
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.0

