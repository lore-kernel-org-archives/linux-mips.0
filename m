Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650776;
	b=roP4tE3s7ixbOCjzmTXGn8ujgSXzOfe8tQwKwEEJeLTl3aphGEOEm11rBI9ifyVY1sAO
	 rEyCSRrbObeseweS8+D+rgZqBTMlHilU5l0Zk9fQHxnOOv781BQWZB0vU8+dU16zLjlh+
	 T3BoRtEY/a2kSRNMXV8nXIbWh7ozWvyiAdRa0rHzNvwzjJy9lmr8jKxFji2LWvAdQ/0HO
	 MXaKeEE3LGDAYhiTtu2HWXfOHQOY3/X70ScxTvLfciyxNAEpIdDDEE5A2uhuqXixxWkVO
	 leIy2Ia3ZteugRmBPYoz65GBDVzkbB0mmdInt/DheQ4GGOz610CAuZ6HKVx+eLzuVQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650776;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HB65L63jLZH3QuI+gpMXKfarOmkNShyBiyJScYwhoZ8=;
	b=Os6bwGEwACCWyLjGoMxjd+uW4xYcinmlgaSQGQJUTx5EfTBMvnhsP55T/NrPRuS78Ag0
	 Y58uMx6j9ic0EuzckPWGyJnhX2TWSrqPt3nAJsna5kzzCzYLofFncpcgwsgYyjHwJcbK4
	 V+P48Up0G4eBQNxDOdueUzeb00mvacjumB1YSCzLJfDxsc9R11qyKyz0vankfzI6uPAdw
	 0/CCZil1LvhorlN16xYsUlfcnX5R+yELUAWMDRI6i9UBegM5TNy400Guh7sb1ZP/pXtXU
	 NYuSehKGHR2htKHMcjGSxZMidT9fWCks2ZLqTarDWRk/bzVo0ZwqKpzzqh9JAJZSLnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b="xRtSw/oz";
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 8ABAD606A8A5;
	Sat, 14 Nov 2026 10:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ABAD606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=xRtSw/oz
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 80B38FA1B2;
	Sat, 14 Nov 2026 11:06:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794650773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HB65L63jLZH3QuI+gpMXKfarOmkNShyBiyJScYwhoZ8=;
	b=xRtSw/ozCGXktIBENlYkLQc5BU1GXzczQ5x3obvG1QEOsaE+M97nZ9cocwlrC8ZLJ1DOUo
	Qo35I80lo1fwJRWdEm23zZhe1R7KSrnwjWYAh+dT6MPZLA+BsRzxvoZgX/6BpLPOQVJVxh
	wu684ClqOiES46t3bMjOO0HyMARKz7oeGB4Ciua1Ab/QYPdppHmBgOCNsoY3oJZOe5147K
	VtKgH02yl74DIlo+EA994NvwX7KO1SHi3kznIIqi3Hsg3TOJQ98XPDgDYxO+XPoOTwX4XX
	7vl7S4bk+li2XgFc0Fnt/USInldG0mMg1oP6BTLRFR1jOkkfAkjOkUvPkkFlFA==
From: Simon Wunderlich <sw@simonwunderlich.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	John Crispin <john@phrozen.org>,
	Sebastien Decourriere <sebtx452@gmail.com>,
	Yangtao Li <frank.li@vivo.com>,
	linux-kernel@vger.kernel.org,
	Simon Wunderlich <sw@simonwunderlich.de>
Subject: [PATCH 3/5] mips: lantiq: xway: sysctrl: export ltq_ebu_membase
Date: Sat, 14 Nov 2026 11:06:05 +0100
Message-ID: <20261114100608.3432120-4-sw@simonwunderlich.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261114100608.3432120-1-sw@simonwunderlich.de>
References: <20261114100608.3432120-1-sw@simonwunderlich.de>
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

The lantiq-flash driver, which can be built as a module, is about to
read an EBU register with ltq_ebu_r32(), which uses ltq_ebu_membase.
Export it like ebu_lock, so that the module still links.

Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 arch/mips/lantiq/xway/sysctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/lantiq/xway/sysctrl.c b/arch/mips/lantiq/xway/sysctrl.c
index dd187726e3b2..90902ca3f83a 100644
--- a/arch/mips/lantiq/xway/sysctrl.c
+++ b/arch/mips/lantiq/xway/sysctrl.c
@@ -149,6 +149,7 @@ static u32 pmu_clk_cr_b[] = {
 static void __iomem *pmu_membase;
 void __iomem *ltq_cgu_membase;
 void __iomem *ltq_ebu_membase;
+EXPORT_SYMBOL_GPL(ltq_ebu_membase);
 
 static u32 ifccr = CGU_IFCCR;
 static u32 pcicr = CGU_PCICR;
-- 
2.47.3

