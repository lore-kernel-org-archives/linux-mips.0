Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523512;
	b=pZuazV/6QZ1dgsXIvTOaUMEbI5TuDl1etGqUzkwCtGMx5Mmh+OPGHwJBkEm1TWJA8Zxd
	 LRwn0xS8dUM2tjsVsq79+aY5yduFFcYkxx5GERU95Pg4MKkpKv6s0oCorasKG63vwwsRD
	 K3s3H9VBHZhea0a3O8k9NnXvpID3bUVWMj/EUgvcTEUTuK9chTOXaxqYQ6nFtvKtyQBzi
	 L08dak1JY1RnfQJ0TjYsYqPU8SBCsR9NEB1KQGiI6Rn0SOfDZLVAd193BczUDtBvgKLjS
	 oNyXTWUWsGhBycv+lZhtWEPysMns+SbsmfdTqUtOe7GgroLeCyTwtdi4ebwPvR+zBVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a/wS6Yxk7+tECj0s54STfUWVzey+C0tieK8m7kinAtY=;
	b=5L/1igNRpDsn72MLrvJ0GN7Gct8wDwLWKM1KSYewcJAyn8+cNBaVRIZmLFbrT7FRATDm
	 jOUi17kox9tliGOGg8K6OLF4vuWTD0imLMkhvOEdWozGjSgEr7T6FeQkETkSw0DVfTkh0
	 k7LbDNETghOL0jm2hSyhikdtHazob9yWhqdiWduRYYNrMEvnIaIUzRFQaePrQhCDglRap
	 YW6k5pSA/AVG+nsK2d5EPdNQYrzC11gIoXQuG4zsH1uqu9J3esXpfJ7qyVt1RNaKw97lv
	 WdYwOhoGR5clA06QWdzLT16Ct5esSwRNrTMiIHz5ZKlkQmz+X6zdJR52guYftd3Eryw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=quIDXCH7;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0972606A881
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 22:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0972606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=quIDXCH7
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdd89d84521so574879a12.1
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 14:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794523511; x=1795128311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/wS6Yxk7+tECj0s54STfUWVzey+C0tieK8m7kinAtY=;
        b=quIDXCH71r8kXBO4zdmT6LlbhiXdMtjp+QUt18lWxGcKuvXZl0oapAUh+5CbIZgcEM
         eza9piKdYYEMXGeQX1lAOkfvajpigt6BwFfJnhk5WQqSleQPoJ79KpXVeFnwCrpfqhm5
         87SyjImHW5l9njGveuPp0mszSohcMwz4FGBradmm6xHemQg6a3CYs2U0yDk1dpdbvjEg
         AAZhhd3QfurDN/KeTmh/vEGjoLTFPqwROznszY42kem+2D4touGKyC1KIcB94OzwjGAI
         FK6giG2TtiPTot7bWkFF71XJvy64c0wwPcyA8SrckymUwNa5ysC0P7+8qVXCKkDny5AQ
         wHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523511; x=1795128311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/wS6Yxk7+tECj0s54STfUWVzey+C0tieK8m7kinAtY=;
        b=ghM8e1Q/ZerfXoO1Mpu+HvYqTvdJDWXctd/XfihBkm2SFHPPQp/SAiaEfYFBtYEXJA
         d/JYlvUcDBvAFlSOsA8flIc2u/i2XNASF97ZzLnRdb59WHgiKiTs1TOuq0i5Tb57s4mE
         fWJRctd699KA95Vp9UerLVlVbZEsiKw88i5MiTMvswU/+o3lvEiBb2TXUXZYng84H4L5
         XaKbUOLTlqycVpEYx0Gq5ugSpJqkLek3N3SQ1D/Ptc0TOQ2xxDDf1wYl6N+Hkph7dbrt
         lQYpSGV6UlTnjVxZzdAWHhP/qUwjzmi2maNn3nGwVhWLFECGyPnn4sKRWKdUCClYpVYM
         F07A==
X-Forwarded-Encrypted: i=1; AL+hErHyW4zi1yyOStzjcJsI1L2V4qWDGqntgKyHkMH+jeevYH2ZRy1r6zOsD4csHjNoVHbm8vXv+WBJG/iL@vger.kernel.org
X-Gm-Message-State: APuU4Z+zYL3QJObXAWA2/zjY5lTodQlfuX5bf7jsBAXxtW8YsivYC1er
	qpSFWbFUR6Cw9MnRzgRiEYxXVMScRF9bxIhxxqfHGjbCNGFDg4MTLmlv
X-Gm-Gg: AYBFou17uCZVoibTYk26AH5MJaXtDb2Gr0/wJKQvjFu1XJr6LnYa8whzGq8EL6NuL8u
	fAg9B0tEumWyxWpQumiuilNpLVqugJPqJnHljD+hZRul/yH5uI5h9rIWN2oQ0uAG0xcXWkNXzHI
	PccU3OFfs+iUamf4hrMH+oXQBJdXXm6002EB2LgtN8dTpI05gSHYEbdcz3bplw6w6OUuMZ/EoXv
	ziifA/dYS577tODo3h8+M1upfhqBSHMnplANS1aAynuogGe8iOuEstk2Xhmr1lEMZTvKCsAk49F
	12mV5byXHjziG72L0HYwscPqfNKe1HRfdZHFs5H5UlQKOKymnQxMe7ImoHDjZKegGv0XTsTGYf6
	BlUtQ3Ba9chSAuoy/NEhU9a6sXEdm6kbcAMsxDXFdcqHugeryyvg6pBSzorTU+BNdB3TOYsm4V/
	Sf63CWbwhsxH+aAZuLD/+la3OfNp8vAhUQlO5m7jjXFDZ1nx2WARLkddZ049o2iqyWRJ+fw6Eep
	OM3ZVPORZ9d/j+VUNhbrFmPY0GL2aQy6PACvFJS3g+9hAdz4Hq3oANIyCzpkNOTUJ6VvAIufVoI
	BTtkcT/S9HKZnPE5geWWCxDt/B0au1ZHp0W7xcGAFRauIDPHNWX9BzmBG/P80CW9axAAcztFF0N
	rqUFfztKT1/d9/MMVU+dnWC4Yb9oji9Gzmtxcmbnyxv000x+r26UvNj7Zv5yWQ9qP2ocDTJIuWW
	F+q8h38NBnqU29p9PJts12E/c=
X-Received: by 2002:a17:90b:4a84:b0:3ac:b6eb:e0de with SMTP id 98e67ed59e1d1-3b1b087c2f3mr285721a91.4.1794523510994;
        Thu, 12 Nov 2026 14:45:10 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm37073a91.4.2026.11.12.14.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:45:10 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Radu Rendec <radu@rendec.net>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH 2/4] irqchip/ath79-misc: map the performance counter interrupt on demand
Date: Thu, 12 Nov 2026 14:44:43 -0800
Message-ID: <20261112224445.213324-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112224445.213324-1-rosenp@gmail.com>
References: <20261112224445.213324-1-rosenp@gmail.com>
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

The MIPS perf code now asks for the counter overflow interrupt when the
first event is created, instead of from an early_initcall. Create the
mapping in get_c0_perfcount_int() then, instead of when the controller
is initialized, so that the controller no longer has to be ready before
the early initcalls.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/irqchip/irq-ath79-misc.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-ath79-misc.c b/drivers/irqchip/irq-ath79-misc.c
index 258b8e9a2d57..5cedea5234e0 100644
--- a/drivers/irqchip/irq-ath79-misc.c
+++ b/drivers/irqchip/irq-ath79-misc.c
@@ -23,11 +23,19 @@
 #define ATH79_MISC_IRQ_COUNT			32
 #define ATH79_MISC_PERF_IRQ			5
 
-static int ath79_perfcount_irq;
+static struct irq_domain *ath79_misc_domain;
 
+/* Called by the MIPS perf code when the first event is created. */
 int get_c0_perfcount_int(void)
 {
-	return ath79_perfcount_irq;
+	unsigned int irq;
+
+	if (!ath79_misc_domain)
+		return -1;
+
+	irq = irq_create_mapping(ath79_misc_domain, ATH79_MISC_PERF_IRQ);
+
+	return irq ? irq : -1;
 }
 EXPORT_SYMBOL_GPL(get_c0_perfcount_int);
 
@@ -121,8 +129,6 @@ static void __init ath79_misc_intc_domain_init(
 {
 	void __iomem *base = domain->host_data;
 
-	ath79_perfcount_irq = irq_create_mapping(domain, ATH79_MISC_PERF_IRQ);
-
 	/* Disable and clear all interrupts */
 	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_ENABLE);
 	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_STATUS);
@@ -157,6 +163,7 @@ static int __init ath79_misc_intc_of_init(
 	}
 
 	ath79_misc_intc_domain_init(domain, irq);
+	ath79_misc_domain = domain;
 	return 0;
 }
 
-- 
2.56.1

