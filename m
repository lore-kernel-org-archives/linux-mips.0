Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434262;
	b=Tm+k5jcMzrBNustEChmy40dGBDIbZBoFPd28N+2MK8aVx86xkRG+QeDPDvQ0pTL9PEF+
	 Zui6DGkL9mRKSB1lEmhBXDUo/95oBIh9i+rhHf524azMuxZxoA0HIOOTXQZDkQYAMdSd1
	 lPliszMlItdRU1op6dAa7LYXm6lYSZkzndcSr5cs0Y9jW+oLoFBuyXPOOA2uTh6Tjm9ZZ
	 1+02Bn84BqNqoOCBbhIF6Df4zgZ2fvHeahSriQXtthGOR207JuSh62/Pq/0+AWvIkllhr
	 BH5JJojN79JPc5vhKKvd+AGpFbfchQ0D2yhrCi9VQDcacvCUqShUzq8x44dk8HM4Hsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0SxbXbiAkUu/9xk8uRLM8Bu8VTt+3N8T+dREW501N3Q=;
	b=KxGL2Oxx/ecQ0Osax8/pjLVFKW1f5RdH4apCM5ZdpcSkco1frqPV6V9PvtKARQu4KWml
	 zlHE0RqX41J3RG4v1bvjTFOhPb8/u7Xxy6ta3k0I0Vn2SfmFAAS7H81qECnzl2jIuDx0d
	 AXmp4oxLj2jmTiuj7obPwvwg722d74q7wWIIhawOMYaxs7fjiQd2J8WkZeB85+fBUtgSJ
	 B4ntE/1EskketS2kivZi3gemWQ8nR/PdPAaaDPO7ahguigh1WCXb1mwvEwNvw1lx1TVaT
	 3EgVXsBeVOoXZojyIOtoWSR814e2XyD9Mguw4WZCxojLHGOwlR+QRo08vt7lTwZX3rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zye+u06M;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7709B60A261A
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 21:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7709B60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zye+u06M
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so1432397a12.1
        for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 13:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434262; x=1795039062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SxbXbiAkUu/9xk8uRLM8Bu8VTt+3N8T+dREW501N3Q=;
        b=Zye+u06MWPnI/iZ9Dvf8g7kNiCqjl8bBx5B9PgvrMRhL965Tb+ZA81cHu7ySSpTHRa
         /vN7WyNneVWe4nb2axIJEbaOE6JLWqKdt45FQOi3j/WT05ZlAD6eRIlxPX6IykdQ2zCT
         XZmXrCggIgVSQMRZj0XpsYTP00aFNq7A0fFaoSId9V+rqnk2Z+nrQPr7eI2GaaYS4kXv
         WRnUdG/+96JvWJeH50HjrK/XOZGRBlVPPhGuFmmaMEx+euYJcFBH8WQ+Zk96dGKEo7ic
         3OjUsz57osZ3fPVTvVjlcRDn3I1xf4TIQ+5RVhrcast4d/9TUdXu5B4T7DCeTssuRBYG
         I4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434262; x=1795039062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0SxbXbiAkUu/9xk8uRLM8Bu8VTt+3N8T+dREW501N3Q=;
        b=E3DaOI1NMPrlcwZLkxDt7Q31YLOMrq1Abfvrysn8GFMV/Hp0+vTjQUjQuCsVxSxWvL
         /f9PNz16lkpzLAPAWLve4RJiYC8/An8pohOeVd24jsQnNRdQPEym4qzVD1VnDTfPTNII
         rkJNeNg4YnB7Wnp+tX5+6V5uA5ZOY5GCg3yiLpGr5F5NZ+Mjl7Mc64mS7PaR7XcmR8mi
         /SUnD9LP4V1dI8EZYrHU2zRekk/UTuaLVEAYXX5tkB5ELwd5WKl33sEwh+sFErCrJCE2
         h+QSko/ob5KEEYtS4ZLHx/59gaFEHcOyJFVuZS6Zr5JqJruEMAc7mGH3JyH9NZhmKHX4
         dzKQ==
X-Forwarded-Encrypted: i=1; AL+hErGFlu7vvmv7AABAlI2b8OVEytD3Jj1wiBW4POzYkfsFbtRU+EEJ6xJD/6EQ5bN3IMvkMRZKjOvTISkW@vger.kernel.org
X-Gm-Message-State: APuU4Z8k0eRT5k2THnJPjV9WDEoLrXGuXN2GxC9PeKu7kYs25JC1Fqym
	WuVCK5eXlsDxVlvJTeTFB5H2IgzF0lEAqM/G6vD0s7W2z/UyvhtsJLtd
X-Gm-Gg: AYBFou18GUiNdSnADqhPp6ItEhDAvJLLLwYlVAwp8D6708mq+2lEiwxW5C4xhk3hSLp
	j3ZuE4miySnt7L/gJsjVniptDIUBqzoWPWjYJM+uhyZWM66dUY1qLWjNRSpnc/AmwzhleVlRY8F
	DWxnGdQ740vZMgDQx+WV/8IShsrnhIfCdzRCuowmfqUEoh6HN2afJv4P4ILXZ0u/HODOFnBsecm
	82PoFy/t+Ov93fbcjAflXHDrDFsVqMyQ2/LwyHjHFr5h7ghK/PZaR9dCHZKoceaHuRjsyJ0v226
	HZf9IKWnDIAeRZHdLo9FwpMY6517ny9wMqiTH8JI47c6aXfNy1+0MUv2wqBbP1/7z+lrm/vUJbu
	P74c7FLzF8wbIVJUV6Gs2mPOJv8OucOrEVjLuojA/o0HSSFNod907rME/LmRzmYVVe+ZlwtGzII
	Xv+YAU/zqDmzDoDbjFjuAipon8dtg+DXFSsIjOAbHdKWkxVxpVZgBvWrekuahQbujdRdnqHuMdc
	9XDUxfUnPiNuFgAnT+TUJevVt2YADn4r/Zyb7g8s+07n+aU/TnVBRrNeqCveKtWfn0r6DHdzby/
	Rv0IoNvA2iJejsCUvpvQN/QzO1n43uWrAx5vy4LC3NP9VroOML13z42mGn00lPxoOeSzhtAQxn3
	pZevaB9YEKYyVK8mugYAQvBeclmHXj66+N0K3PJfgkNN2wWdQUdDC03hsR7Qyc6Z7JvjoPBJ7/F
	AzQg==
X-Received: by 2002:a17:90b:2649:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3b182f2381fmr3592513a91.44.1794434261873;
        Wed, 11 Nov 2026 13:57:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:41 -0800 (PST)
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
Subject: [PATCH v3 3/7] MIPS: ath79: stop using ATH79_CLK_END
Date: Wed, 11 Nov 2026 13:57:25 -0800
Message-ID: <20261111215729.10683-4-rosenp@gmail.com>
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

ATH79_CLK_END counts the clocks in the dt-bindings header, which means
it has to change whenever a clock is added, but it is not part of the
ABI. Size the clock table from the IDs that the clock code uses
instead, so the define can be dropped from the header.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/clock.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 6a8bef782186..55d8ef8c1c8c 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -25,13 +25,15 @@
 #include <asm/mach-ath79/ar71xx_regs.h>
 #include "common.h"
 
-static struct clk *clks[ATH79_CLK_END];
+#define ATH79_CLK_NUM	(ATH79_CLK_MDIO + 1)
+
+static struct clk *clks[ATH79_CLK_NUM];
 static struct clk_onecell_data clk_data = {
 	.clks = clks,
 	.clk_num = ARRAY_SIZE(clks),
 };
 
-static const char * const clk_names[ATH79_CLK_END] = {
+static const char * const clk_names[ATH79_CLK_NUM] = {
 	[ATH79_CLK_CPU] = "cpu",
 	[ATH79_CLK_DDR] = "ddr",
 	[ATH79_CLK_AHB] = "ahb",
-- 
2.56.0

