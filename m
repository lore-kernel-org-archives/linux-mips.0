Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434266;
	b=NQ6zB8sMGBHNd2JwOA5tGZyIPzvgYGxq7VeTRBIY9x3Lvl59C9yvTHXBs2wqXUIiCjj8
	 Erw6ImKmcUc+Wbgqrf/cIwpPDS4qy5LNyJGhQPx4UhcjlP3HW+3kyMjjfQPms7dE+4NM4
	 rkALKRZL3GT75XmtHpC+IkIPXoqwnd/Ik5oZRSE1RqQYWSuJc0Cp8cyg/0eME8aZPjRN5
	 oesYik8yLRS0dPCFsNCqQAG2gSYRuqPOOP3XvdhQQbphw2FuzvkvOoiITJ19eOkOlut8B
	 MXlzBCHnlx3AU/1BaVUG/1daiWB5eKFph5t1Xy+JQM3SupQcvN8QR0xOSpT2UKnaPfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CsB56uTJEJHrtz+2WjYnHjiy4+fXaZizurtR1/wh/6k=;
	b=dZwy7Fquzou2rML7eJ9t/W4AKcHoDaDXcehMQ8ldbqlBMPAHwoQD2kDcymr0LECfKxU7
	 lr5wgBTJw3okwmNOEQkok9JId/7WuWF36BNtgJEnQBXBcRB4W/LoaVH4KBLR7JZB0wMNM
	 /G3ZuQZJp9CFy8JA9KE5SHZpiWvXGjKhyCx9YsAw63xvjOUxkUjNseL+Ie72ggFPGhpg3
	 sqsz9ardROIM88VSmcaHrHW2wDCSiioH4ZRWuvx+71iy3Qr6uDtD/OMoZF8IpsgTUf0g9
	 pMmW1htpxpg9Zym9oRVsKZkwbvJgb14sywcFA8iSRHre8xQNhFQ+CQdLCDiew/ERCqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rrVIh/Fd";
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B506A60A3810
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 21:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B506A60A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrVIh/Fd
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1887400a91.1
        for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 13:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434265; x=1795039065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CsB56uTJEJHrtz+2WjYnHjiy4+fXaZizurtR1/wh/6k=;
        b=rrVIh/FdrV8ih1hGXt254oV79FoZzhocTRet+LuCZ3i9sYsg6p+u8oviKyhrfht0Rc
         sUWrD5vMUOiVIOWKbVngXvsNsYnNk/f5YUXMJ0JYhZKgUXEQU2mimkGc8UHmU5wp1ftU
         ooQ31v06a6Pb/+YxXeU6izgiJ1wqCOP4JRMtqxJ6dYDSwyEQ9dsLyu38XxJRbDwnimD2
         xb7CC4Jf9cQpp69hjgOCbvPdsYZF9QFGBVjmhUmfyo+e1iL+SlJuyKlFE+q6nF+ZiLfd
         R3WlcvUfeOIun4ydxcXV/PTz4IAnxeaPjqZX3JHef0iPI511canOs6fHg6KrqIX583Ak
         xkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434265; x=1795039065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CsB56uTJEJHrtz+2WjYnHjiy4+fXaZizurtR1/wh/6k=;
        b=N5HaoNs9CrexNGowar5o1uzodvTO4QpDMI6LaAHr3YbQZwgcTwflvemS4C//0vpI5i
         jrvLxgX3AIsYXnsbe3RLbtBakfWpuThXJEJgqKoHWPwYdwhpd9WahOyuh/utLR90dnGl
         SXq/cQlNXZaDwa5QGpNY78JyNGV9dshoJrTV8Bz47pYUAx9Yt4igVDBI/nc2oaVwRBPl
         MtssH1/039HxXHssTXciqAdvDB75IyVMmwxypgG/OL5b/quFzNUyqgwbWAlfOknwQNh+
         b8Jt53xVNIYpKdej0BRWBRGBiz7B0fYsTZG+8pvAcu6o/eqsLJm0tlfwb9WSE3L4ZiXZ
         IcaA==
X-Forwarded-Encrypted: i=1; AL+hErFDIj/f5UEIMlTj/fkSO8xxVpKBVK/qLiObAiVwy0H/abANwiqYhl292BSbr0h9c1fQHO8vHQpZAnZ2@vger.kernel.org
X-Gm-Message-State: APuU4Z8MIhkCMis1WNDEdXQyCKQUyKSunBHwTTYvLBz8TG9p7E8beh2j
	4Act+FRpN+6FT7yzqpX06rkpORsJHQ2/nj3U1UYrtFQVyJaVltr2EKtk
X-Gm-Gg: AYBFou3iw08i7CRTqQYv4S5ROUKYvERrU3MKE9dgWyJNvfvdiBDwSopjolF0CoWQs8H
	eTGHdWcWoooxY6m368wP5JZi4/D0ZwtghhKaEPSg2L9EgQvx6DPvvcPDBpqTaGWu/K749Up9haK
	an5siK5wPWXdITrW/OtZ5paCqdascBj1ZMMruTZlB9rYJ9idgyv84exKu8/EyoV/tUrZ2LBcSHQ
	FIzRZ3QVIofXnvFBg3Q3znfEEzk/PonmOR9Up65sRiYNd0GooVwTsPwixr/BwZu6Udt4sBGlZvR
	J5ni5jPlf3kLKkG1E7h9+tDiwO6boJn7nUowhcAq1vd8AQRsPd6TQUIls8ql6nYe+4fR3Jw8YRp
	cEO9nRiq+2Wcr4XJPrd1cAYZQECbI+z6H8H/foq+63nt78Ce/q2DsrK+9VYg43vOOMFOpW25lOC
	5aXDe1ix2WboDJf8IUZAqNi+2LyeoEHnw6Q/t45q2XoVSXuk8IneEofNvLX//v/4l/s8De39DnN
	4sT0riFuKgFxzzBinbaSPSPPu/yqLUzy5LGR4a6fWaEYUNBYsic9EoqI/ZltQ9cq2FjCYiqjdNo
	HHCvpaimnTuQpOYuNPasLJ4pjfQRfzdiWeZJQOzcLPveA93J8MI6ezP2rhY2SFkC3SmGA1spmd2
	PSNEnCbQCDoeEcybWcF4eJcerMqhGEXBY7jN7pyv4jAypx0pXkpA4T+TNyk6P/nK9pRFWQUlmcW
	GUIk0cDJiCUEJhJaIdDmN3bHM=
X-Received: by 2002:a17:90b:2e83:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3b182fe6fc9mr3518665a91.44.1794434264676;
        Wed, 11 Nov 2026 13:57:44 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:44 -0800 (PST)
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
Subject: [PATCH v3 5/7] dt-bindings: clock: ath79: add the UART1 and PCIe PLL clocks
Date: Wed, 11 Nov 2026 13:57:27 -0800
Message-ID: <20261111215729.10683-6-rosenp@gmail.com>
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

Add IDs for two more clocks:

The second, high speed UART of AR934x, which is compatible with the
qca,ar9330-uart one, can run from a 100 MHz clock instead of the
reference clock.

AR724x, AR934x, QCA953x, QCA955x and QCA956x have a PCIe PLL, which the
PCIe host controller nodes need to reference.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/dt-bindings/clock/ath79-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index 27e31452544d..57d966ae9722 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -11,5 +11,7 @@
 #define ATH79_CLK_AHB		2
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
+#define ATH79_CLK_UART1		5
+#define ATH79_CLK_PCIE		6
 
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.0

