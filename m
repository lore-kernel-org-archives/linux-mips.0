Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699451;
	b=jrJKK2Tl+iKVqHN9Lekhy6XuYvUtgZKPruE3lHvptG6J6TA2/1x8BRmzksYqOdsXn8ss
	 nVwYNFsXtr17UKvdnBPYd9i+81XsFN6tfGHIvHWQgawQNw+kCr66jJJD91dyr/pQEGlXe
	 tf2iIvCV2hJW3gA4whWq4DMiRLWkO5ENGUN/+6Im3K3iC6q9xq+HPu08v58jzOVEYXjXP
	 wx5tR4cftmlb2zCi2g2BhpVmMYCtAWvuA2Bj4Uq7ez3A6I6/9AKDqOgGPqoskPIpzBxpG
	 CHDlJO18xy776GRB2wArEuxURxJs+aW6wUd4t5EEDcSjtCd/fNcUcEM1Nw48OKO4afQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a/wS6Yxk7+tECj0s54STfUWVzey+C0tieK8m7kinAtY=;
	b=Tm+XquhpRJGi9WVWakEzCR0FR7ibIXufQjKoTo8QLKQ+B973hiGiXCGHoTrBYU+9CynV
	 kw1XwnDl7xGGlTZ4lagwvOycQK4ONQ5JQiU34590PNcL81Y3q3VkXENBu/Z4HuwAbJsFB
	 wfZWHAby/XMdYr/PNuJM6mLGyGenu2t+P/FoZ0QgEA7WXNNW2FXulCxqSzL8wibj2cfZS
	 YgH2FnQxy+w2bXb6TeQ+dDKwd/ampBQKJPpR4MWgF1P2zjddBRC1cSvL5b+zEAmlWUAMP
	 k8eyzqIwEYxEoKQ8gcfEryx8kZQyb8eoWYSNe8HhtbhqPkc4joojWXyC3zKC4N5ZUpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sGGj8G39;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FF8606A890
	for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 23:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5FF8606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sGGj8G39
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so2476096b3a.2
        for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 15:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699450; x=1795304250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/wS6Yxk7+tECj0s54STfUWVzey+C0tieK8m7kinAtY=;
        b=sGGj8G399ZF31uILhnt5fqpBTS93oUlFlXCu9ne5PNel6hESS6eCg5Cx7fn3ZCBlFe
         oxdxc4STyzHOiUpheFiC2TsLQ/nQFezbJ1bVf98u+8/TdF8CZ4oolWnvdTaOjrpMgC9O
         mX+erfavcN+ALosfLrNvHxOUVX5hDGRCxrf2DYFN5vlwSqM6bz/bibjBYxVL4O9FO7Os
         kQqE/sTCymdhbLvav1w58eVJwr1Ak+cV4ilPGNYlgYUkVbt/72MvEq71q0AQ2uU5qKVQ
         bzJCsunwS+EYxAF4OdP66Q7clln3J7cD6t7FaUmp4sPiEadxRjJ7+PT1YCpvPhgNxRhs
         AWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699450; x=1795304250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/wS6Yxk7+tECj0s54STfUWVzey+C0tieK8m7kinAtY=;
        b=K9B48zDs4HRXcxe7o4KPUueYXTztXkMJSP6mOfgvL17qwB1lRhBHn7tQPVL3bpsbvl
         xoqLWrFeIKPbYGtV0B7b8BIuOKheJgUm3U413C8sNT30y7eQS2ezsCvCwB6sgWbO6Cop
         G43aJqNSdgqGU+emVHCPa3Z2SfrZONsChSOq6eV24VPBRbiF6kDSoWa1ge/I+HBfT4af
         /jeFqO8JqrxJDUpPXg5JVpk5IEnxcwoDr6fC/dTG86vUUsvNwxGxbk3H/67fwrkx+AVM
         /2xHsqznqPP2o7qWDVcJ7KkbskPcXOfwro7oUpvXtiqA8JLh2yIeyceL7jJEJ+FPIiKR
         4dXw==
X-Forwarded-Encrypted: i=1; AL+hErEwLN1ZD1HA4NCfR4X970PQvNAoyIzDGuE48ZbhB4ZwODfCxoSGGHS5SVVJxAlquKsLdsE2HRkaXKX8@vger.kernel.org
X-Gm-Message-State: APuU4Z/DFBoGfONdpP4waRrF1Un5v90ddVcQHBjmbsy4tDsByE3n0+I+
	Hjm7pNAIgMFaHgKfFaTqeD4sC+9N+kaZw1n4dY4DyTj9iAatA6CBgk6mxK5ExA==
X-Gm-Gg: AYBFou1M/hjGOssewDF/6SFEYv2K2NQEhjt4CMqvBvIru+pnZSo5ZTjBNYmi9zzDvSK
	RM3g7C7MyY+5QFg1DKvtOofNokJwh7LJNDN8U3c/PIOny6aAyP5330frxjm0W+w+VkKpKsgx2az
	JuR/nT03wdxYihNS9NaRhXRxKdRLbYTsYu6qVWuUY1cIHbSCocRJsQQIdc+/iO4lli4wAh8Hk7i
	m5dt3KpuN6jZuRJ5cwhYaWhCPnpgWA9Gl/24uW0t240iipnck6d6WvzbXdC5rPGVaZICmR3saJg
	FEjy41F4If1DwPNbKuHOwT/hrO9l5Ttu/S9cT6a3vCWAy0MmQef/gbAmLCkSJTVoVJV27e98dgL
	v0p2OLtOBfb9qGd5Jkwg0JlbXMKk+uKo6uY/lc/XJ/DkReE6HMabXgfXiSbfbQvonaFIJSsbyvt
	Fue4rgg93IoxpxMki5ukFoac1dgTxUozJ2KdykoAJi7rirujxcYZZVfaAVyDWESCjb/2ILqESwc
	mRFuidRm/H28R1wvVvpjV1DjXIKSscc/birFk2U0ttd9FvbDDFiQBVT+ckHPrPozn22Z8kmDRnf
	qH6h+q0C6GnS9NLmvUOO/5WxP8FyslgP1i4XKJz8sbjEjCiPxdIdeUmNCjN8fW5WBX2rgNjmcsU
	8mhL4LCgRcqLT2CWORDBCLnfr7J0yc7b8l7j82v6aVE4LvBzdO8NU2fIrWtwhJxciSPGfiCSi1a
	rnSA==
X-Received: by 2002:a05:6a00:2c95:b0:878:34d7:697b with SMTP id d2e1a72fcca58-8beb7d1cca2mr6147034b3a.41.1794699450161;
        Sat, 14 Nov 2026 15:37:30 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2d0f473sm2306372b3a.53.2026.11.14.15.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:37:28 -0800 (PST)
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
Subject: [PATCH v2 2/4] irqchip/ath79-misc: map the performance counter interrupt on demand
Date: Sat, 14 Nov 2026 15:37:16 -0800
Message-ID: <20261114233718.86520-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114233718.86520-1-rosenp@gmail.com>
References: <20261114233718.86520-1-rosenp@gmail.com>
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

