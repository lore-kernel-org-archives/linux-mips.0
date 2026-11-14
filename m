Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699758;
	b=N6xm8EdOaC9tPtCzck4I4gIxoOyO1ZCtzK2yx9x4LyR8xiKMpCV9aTb5H2i9X9eQ8Wo0
	 7b9Ruq0jPOObsNh8wMappVrogKSfN+807gOuHqhsaA9GHJ0vXXyHYYaBm1ZVJGyKdebeB
	 /klRVGvFVZgMQlcqp1H4/lJG/vdTI9viaUEqVJRS7x4drlnu3C/Z1PJQnIiFEG/lGnxCz
	 AxQamZwXJEX3b7zIp8/JbodtZIMXkW4jL0Xwg/hzxZyXYnka5MMu2QtFSMKmrCGFBicUo
	 yKhkm2wm5WQuUZiuxy/jn9DFcFE9L8cRUfzVtUVlzStVuctkbEEAdEiFInDMvS2g7gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W084RD0vMitsWt5r0GlWYVXrFKNwmQsR+8dQtTFBHCQ=;
	b=WzurAuxonqDMAtOdmB4qe0Xbr948QNlMZzNVR+T3RsoJLhOTl2Fp8FSxNmrRvM5ZIaZt
	 dmooOXeaQ66bmFbvc3KjhvLdlcPsSoEhSumQfxO30v/qnh34EjroMIcEBBywUxygLpn43
	 DoWbVA8AEMP1Km4EFWI1q4t0JAEkSwXCi3+Z+JCtlgYTwJzolVOo/6ujhEUtueW9pbCjx
	 sJi2+hxHEYqP8N6k7AWyFezcQKKWznA3PPArYPpVl8BIb0KHeP2eu/fukoaEvjYnMdmsT
	 /zMRMjfXQp2mv6S3YkCabZenMc0XJ6tRjqNcXx7uSHxQ5KSPCCzRtCieSzgqzXtKa4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DG9s3d33;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7BB606A891
	for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 23:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A7BB606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DG9s3d33
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso878404b3a.3
        for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 15:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699758; x=1795304558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W084RD0vMitsWt5r0GlWYVXrFKNwmQsR+8dQtTFBHCQ=;
        b=DG9s3d33XVxFHN9OdMlrQizyH32SS28Z0pjRS/Vx64SZvizFw6a98TZcj6jr/GpZyO
         8uPe/AWMPFNzKqXlD5TITgeGVM+O+sIWE3iqRgVgg0S67t6iwcRsGaqtqEcZ5FguqgA7
         Wt12nhYnQ4MbDAljt0rcO72ySodvZep5pIIbMTHWiXTGImaxQX/tj0//q76hbSqEg9Ei
         UQv+2N78i4sR4DCryexyX1Of+9VvuZak0/t2moqY7KxYLpGPUbj0v9H0PNoG8vDs6I2V
         lyS2V4pPgb3Xfi4ccuaKjDUEpY01+FNK8teUEXpRE9bntEZe1uYg6UNTJcJAr8rfzj+X
         oPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699758; x=1795304558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W084RD0vMitsWt5r0GlWYVXrFKNwmQsR+8dQtTFBHCQ=;
        b=SotoX/7mRweCEdIdWV6PMfhJREqAGdxGEtJ8t77fFSsyTNtd/1iK6eDuIT/2geOgni
         pgF5q6uINs2apIUlnLqXqvXQgtIheLcfMUvVjAbRITgTlod3xw8AjY8TZIFznp8qcfOB
         F3bNDoeu/jWWLJK7n4H7+o6jWXPbZFK9pcsaQs8TXD1INC3gwtHt51wL/USQ5uzHqMKl
         gyRvbN8ZnkPkNcw7Ymq7Opu6GDb82kUBl+MvhAyvi8Fe8ZnC0UA3YbOzHl+Fw2g+u0HT
         19sBXRWEuGQ/ksxYHB0YD4pjNI6ncZQcGhfVGtMvA5whBnRhy14Y/rV/0xaA2OoZ9Tqg
         Lrhw==
X-Forwarded-Encrypted: i=1; AL+hErHmxCn0fyRxjjUk21kbFOTkaAFhJWPtaBOrsETEOVRkVJ6CzXLcFyjsRaHB0y0L+WK7ZGjKtSULy5Bh@vger.kernel.org
X-Gm-Message-State: APuU4Z/M2xVrpXomvWrPKbIosANyq5S22kwNo8LW3fnP/tIS6atfoWPb
	pkKHK2ygeHdVZWmlipKBy8bcWabw0WlzhY0rFZHog3N+uvPByHJEogYO
X-Gm-Gg: AYBFou2fTBk4/8vSvUrsXRnLW8Xr6bukqVzmkmuY78OKQZRy2jMVnkWKoCodaq/vy6j
	HoPFCCw6VlF9BYX1oR5JrVeAgiG5qgNY9SFGfd69Q4qtH+Emd7VKUNLxilGOhqanJGqS3gLpx67
	BhZ9TSfjfMtiQtBMp0jid0Y+jCVEtWNOurOPxr0oVk7TVkqoHPetW3E5lv6qpJDJJc70r8No0vX
	VWXKPDwan5G2ER/BH4unglN5J6ChbMfZrdrIpDp7+LKXrigFC+s6vaiSJfUtl8NQb6CCTkKhCuC
	2KCrvSeg1ufN83ceL+dGm76L647pqeoGbstfkz5lpvbKanXmIudbjMKN5TWS93R1mUJ0ITKlPeZ
	6zH+XHqMlM3P04hccadQKeTsLatZIPD5G7OjYIJPvZFfS4x+8i6qEhsgCPgT9yeVmWZQXGYMPET
	ld2/jpPAW20kq6dBWiHks3wB452VsCHoCZH2rIH1AtX0+cK+eWVRjumqljnxP9sY6BQP5PHBH/W
	1Hq0aOB2m/z9nD2prJwEgMJmcC0Q+CVTEEeIAhzo1aXWq4bzsU1hpSooJt19MwpIBwoI8jOCOSI
	exQDkd9654jpugopU+ivYJR6xBvz6kLcDRLCtVuWQF1y0DokgbxMK6uf1TYx33EQMdL3EJjwU2X
	RxrImcHAsOyxxJsH3LTFqrazzfzmUJabTjdptMWS0awvY1gWqJdDZuvgZXKwWFLRo1ZJo8urrQM
	2d1Q==
X-Received: by 2002:a17:90b:39ab:b0:3ae:8410:ae6a with SMTP id 98e67ed59e1d1-3b1b0a1eec0mr6608862a91.22.1794699757612;
        Sat, 14 Nov 2026 15:42:37 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:37 -0800 (PST)
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
Subject: [PATCH v4 3/7] MIPS: ath79: stop using ATH79_CLK_END
Date: Sat, 14 Nov 2026 15:42:18 -0800
Message-ID: <20261114234222.88337-4-rosenp@gmail.com>
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
2.56.1

