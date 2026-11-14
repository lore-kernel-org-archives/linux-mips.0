Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699448;
	b=ebE0qeR5TVNz1B7ZEYrEud1S8v7412TWIHmAc+PFWi2V5NdfQYpPQU8fuiDJp+g5JyR3
	 C23FJJJq95Z/71aHPQ2vPpc2fAO7WsAmXiSMLe8ZYcGmoikCc3mKzcMzH3IK25d4c+20k
	 j7sMp4uOmjGb5vawUmk7ihhMxnd2vZxjD7yYP3uxkzjoptdrswuuFMB9/PhlZRA+l6asd
	 u5hIZhacuEejD7dAGSPPMBh2fHWO1kaHtCsTC+sSgrTa4OEjlVh9RQJbu3xaGJSyYJsgY
	 oxZH20SeVMMSD/YqKuYn+zyDlsdushkDxqDiaUpxhDYHQUGJGDE99e+VAc1idEZh3iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/05SBYoZ3//tmYEVR+U9kWXjnHi+JJTkJcmENCb0oJo=;
	b=FOLP/9P4b5PPe3IlL6PNZXsqb59t12IRxuU+mY6kd+i6usd3CbCcs/15+hZXGDn+E/7D
	 tWGLFXI22w360V+3JOymsQtplJoLQE6DHJVukPyATmgIHAo2qTX6TQUAK7crjLrbJgvHt
	 XK44C5CldC3s/MgRiVsJiAkZCGxtZVTcCYR8SRVEek6O60BUWkMDMP3D8/L1CR0TVBwcA
	 yQyGzl0xxXEydKw7KjJ1yqn5ku/BQbsG/ANRe2rK9VSNVce07e9OyPV90XxKRAYpoXBjO
	 3Yd4MRoJnqEjoEswwEhMxip/wOeZwljH6u1HwD24MZoU0a41cRrsuUTvTFlJjZWngIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIUBClTd;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CBD606A323
	for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 23:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51CBD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIUBClTd
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso859425a12.3
        for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 15:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699448; x=1795304248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/05SBYoZ3//tmYEVR+U9kWXjnHi+JJTkJcmENCb0oJo=;
        b=WIUBClTdxSmsCjNFgZRykFI8qBlFs90zubMVLvHdAEPI0NnJmjEootK/nv4yun3Tup
         e6QBGb8VPaN3mi6fpFVVDaMLWPlObza3U2yXMqx+mXwu1a1GIIPPu0UnJiF9cnQKiO6r
         vxq3sgkSELHUUrf5NkER5QWnv2T424w7QC0V+/K3t8n7rZqnH9ftcbM8z0Ou7lkY+cCA
         uTmwWJ2UFakdP2BlLyfLHl8cKdk/7nBVcoHEckH33RGcu5OpDT1MVPvUVUZSfh3FcISq
         zRacdjJVZVmHWdVs6G3HUMWBHeiibmDY6iNZlJ463Ubo6Gvywxjlh3rzFgGlyL6DQv2Q
         oRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699448; x=1795304248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/05SBYoZ3//tmYEVR+U9kWXjnHi+JJTkJcmENCb0oJo=;
        b=wfDbKxtEmXhCFBOfzuoQCzqIZvnXD6/8EYd268FglIPb9EcAO+jr35jicCvJSCWccU
         XihIg3gCL8QUStXHwTBtQi/+QTVovQHurumTqyOfe69jYAXo2TUUtqsl4eRNHooovPtZ
         XBZHgdS1Ma+VKPD06gE4olr3XDYcg5DHwhxsjUORYFOCa5bHaPJakptgaD/shPNLWA8A
         iDNTJgev9SAH4ljZ+qllMqji9B22odZTDASBRV8FIDl8mgVmeUhXCwWquCKxLpMXKLiS
         KmziDvl8uTCA84584gf3LkxF/CnHF1l3hEeepraxItelQkuRZOHmF5F3ZBpnfyrAeiI8
         3MUg==
X-Forwarded-Encrypted: i=1; AL+hErF+pD79rvsPiN/eX4ecu/4hXwC3nJg7aybU/xTwfCy2/FBSDhTw8Sq9MRgSLd3v4c9OiU1XXYKpyOt4@vger.kernel.org
X-Gm-Message-State: APuU4Z8mcviisXnmr0yHo2ShXrZDfNT+4awZHy+zCrhzBtzOdWA2OPCb
	OjRdz/iclJJ6jyzoetCV4QiCtzpUJd5uBtmp26DOxcVbTJMdFSeCj/BT
X-Gm-Gg: AYBFou2iBZoXWevKB4KtcfxgJAMEZfZo0c4bnuE0rSkn4hoEFZWf3+cR0e+rQxiB2Zp
	YwMkubSuA5LUbSUZttvlUmeR766VBE2eNX6IviXSz0ho0rCg6CAqf9WJedXnUhDo/XGaVCrPNvp
	VKwpQWhjplbeb3JlwWCpW4CJgn+/p1VAaB1b091htn633wcPRepDFf/iT21LSY65nozmAq6zQls
	MaAf19YpYXHFWQEGotzpv2C5iDK1O07MxQyi2SXvOrXI1JP0fsBFAqQGNai22CgYHi5U0ZcdUT0
	RK0rxNRGEIwqBvoPDo0PxKyc9jNQhRmHNOzkcZKdt3/7oXy3gqCsj6TiIbJMl8V8Xj6v1Hv4/sC
	sJVFvEu9P1rbX1NofG5p1vBBFgkRwkZcA5XqsqK6fD6bXMy100hPIj7sttstdJBep4XWz/B5ztI
	9g/ipfKcHgfbwbpcQ1zZQkBdu6sO0cv8BigGdtCNVVGx41Ue0pRexsKuB1oMQ5Mvb9jCQlbpvJS
	ADbFWQ4Mt9ODdH2HPjQRP/7OxOz1JLnREMS4UO+2YSmoMWGe+t7nlqCDkRu/w+oPJ/hZ1HWRkiV
	wIOck6q1WgO4puYOHUJtcQaNlOR6c8wiZHslzhPIrI1//Pd1b9Ur4taZ5GXRq9tBo39EZ9+zPfM
	KAWY668JTzJdFGaGwoFFRaE+TPdX6Aw/KBIXN14udy77zykuUEXHLPL69jcWFfWTbMsZG+C9cVp
	Yd4Q==
X-Received: by 2002:a05:6a00:2346:b0:8a0:2914:5d27 with SMTP id d2e1a72fcca58-8beb714f59cmr6118058b3a.44.1794699447603;
        Sat, 14 Nov 2026 15:37:27 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2d0f473sm2306372b3a.53.2026.11.14.15.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:37:26 -0800 (PST)
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
Subject: [PATCH v2 1/4] MIPS: perf: look up the PMU interrupt when it is requested
Date: Sat, 14 Nov 2026 15:37:15 -0800
Message-ID: <20261114233718.86520-2-rosenp@gmail.com>
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

init_hw_perf_events() is an early_initcall and asks the platform for
the counter overflow interrupt through get_c0_perfcount_int(). On
ath79, that interrupt goes through the MISC interrupt controller, so
the controller has to be initialized from IRQCHIP_DECLARE before the
early initcalls, even though nothing else needs it that early.

The interrupt is only requested when the first event is created. Look
it up then, so that it can come from an interrupt controller probed as
a platform driver. The boot message no longer prints the interrupt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/kernel/perf_event_mipsxx.c | 30 +++++++++++++++++-----------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index 196a070349b0..4d660952e643 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -589,10 +589,25 @@ static atomic_t active_events = ATOMIC_INIT(0);
 static DEFINE_MUTEX(pmu_reserve_mutex);
 static int (*save_perf_irq)(void);
 
+/*
+ * The interrupt is looked up when the first event is created, not when the
+ * PMU is registered: on some platforms, the interrupt controller that the
+ * counter overflow is wired to is only probed after the early initcalls.
+ */
+static int mipspmu_find_irq(void)
+{
+	if (get_c0_perfcount_int)
+		return get_c0_perfcount_int();
+	if (cp0_perfcount_irq >= 0)
+		return MIPS_CPU_IRQ_BASE + cp0_perfcount_irq;
+	return -1;
+}
+
 static int mipspmu_get_irq(void)
 {
 	int err;
 
+	mipspmu.irq = mipspmu_find_irq();
 	if (mipspmu.irq >= 0) {
 		/* Request my own irq handler. */
 		err = request_irq(mipspmu.irq, mipsxx_pmu_handle_irq,
@@ -1889,7 +1904,7 @@ static const struct mips_perf_event *octeon_pmu_map_raw_event(u64 config)
 static int __init
 init_hw_perf_events(void)
 {
-	int counters, irq, pmu_type;
+	int counters, pmu_type;
 
 	pr_info("Performance counters: ");
 
@@ -1904,13 +1919,6 @@ init_hw_perf_events(void)
 		counters = counters_total_to_per_cpu(counters);
 #endif
 
-	if (get_c0_perfcount_int)
-		irq = get_c0_perfcount_int();
-	else if (cp0_perfcount_irq >= 0)
-		irq = MIPS_CPU_IRQ_BASE + cp0_perfcount_irq;
-	else
-		irq = -1;
-
 	mipspmu.map_raw_event = mipsxx_pmu_map_raw_event;
 
 	switch (current_cpu_type()) {
@@ -2017,7 +2025,6 @@ init_hw_perf_events(void)
 	}
 
 	mipspmu.num_counters = counters;
-	mipspmu.irq = irq;
 
 	if (read_c0_perfctrl0() & MIPS_PERFCTRL_W) {
 		if (get_loongson3_pmu_type() == LOONGSON_PMU_TYPE2) {
@@ -2044,9 +2051,8 @@ init_hw_perf_events(void)
 
 	on_each_cpu(reset_counters, (void *)(long)counters, 1);
 
-	pr_cont("%s PMU enabled, %d %d-bit counters available to each "
-		"CPU, irq %d%s\n", mipspmu.name, counters, counter_bits, irq,
-		irq < 0 ? " (share with timer interrupt)" : "");
+	pr_cont("%s PMU enabled, %d %d-bit counters available to each CPU\n",
+		mipspmu.name, counters, counter_bits);
 
 	perf_pmu_register(&pmu, "cpu", PERF_TYPE_RAW);
 
-- 
2.56.1

