Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523511;
	b=vJT6tMGBGWeVEkpdzml7t3H19zKoHmiAqX2QFPK9JQo/eW/BLLtgHLMmuMBdXmTAWxZp
	 5cRZfYgcfMJLMX02+QCmyiQZbuPmrW4r6/r6Guh2kgn1HB/+HYdqy/9QPyyyVaP7qnodE
	 b18nOQE3SK0xNzM8RDdBqUHOU/ir+bmrevSaB3XJbfBiQMCsxo/FjWNVpTjSjY4XBHhAw
	 7zwTI2bQ5kMLrSq2YuKZAtHnA9wD9cIicEmWSJ5i33Cr1Ka5FbHg1CSsF3hbK6w14TCBz
	 mHcbBiVI2Xpx2z7gSuyruiMeBXMpFkfrlYPfVvxsn6s8nYzM0nRHF4QleSZ4WdAGyGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/05SBYoZ3//tmYEVR+U9kWXjnHi+JJTkJcmENCb0oJo=;
	b=vYnopvDkoNuVUAmSGAdTCJeQ1bOLazNQ7wfOvmmZyoyMUxpigepfNyWZOT99CVTGgqPc
	 mKd7jWsXbh7pvKLJKpfz+x1H+uGSU6ku1qLCSGOps/d0tO803EHSQ4gG8CEwhYpABNMnj
	 rKvcaljDxZc4pXhPtnLJhnoXdZKrpfCrzHCTK56o7K1YxHYjDBlqdYrk/1r3l/fMVvdsF
	 1El4vt3OrmVFrcGLMBIhsRl0+JnR0eELHnU2PEi/YNuY05j+ZwNEjHt8WHDKULFUNL2dm
	 kv4+AsRrEjctgoaQy3C1r/uqDg809NfSH6NU98R8t/S/M5LDFwhNfNtFeKDgxfJF9uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NwXqQ/rX";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4563F606A884
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 22:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4563F606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NwXqQ/rX
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so371818a91.0
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 14:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794523509; x=1795128309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/05SBYoZ3//tmYEVR+U9kWXjnHi+JJTkJcmENCb0oJo=;
        b=NwXqQ/rXiLJqLEAXQgQVUH9RWV8PsTXIFsGtPcd9sOiN9fPGAhvdoAUe8KiWy7wOZw
         PV9zzkGuX+aNjarAexQz31FkLIAPvytSFd/4T3Y30dFKluBuVdWDWLSEPbfaUXHr9r0C
         xaXD8rAUoCoCQiREV4OYzPG0sL8C9EwgF79ttpEUTxGMw292c2vzipsSScsPF/Aahc5V
         TM+5Tk1kIO9Z99whwa/O8OJdtP3IfMdGBjss23H23PHk/Ns2mKa23dzhvHCT+ZZy9mu1
         YfpqicM4CLW4ZgcL5hW9D4ZAERn8e9ycLifBL8GmUTA/lyK5tjb/tVMgCpQxQIdouTKd
         kT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523509; x=1795128309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/05SBYoZ3//tmYEVR+U9kWXjnHi+JJTkJcmENCb0oJo=;
        b=s1zyFcjqbhbZ2bebCTURgdARRzu2g9NWA3MDbLR90lOhmLC68f5jj+UGBBUBAPASGl
         OaZKq3JVS5t9KgbiKlmIZnUDE+Iy1Fgl1zzljkeRq7+h3WBXGI0dICRuCZmETW+k7B73
         zu0YzsL72LmXRBKmJtLasVnGjAwLOFXvmCnIHkp8yiDXfdQXBar/1jZW0t9lXEaVJHZf
         ZjrSni+kZRUjKKZKHgeWDldCnPvp4A5LzvYPTneE2e6zprmoYNcbZ4u7PK9KA6UTybIE
         w5XtNAlkwI9NmbNV5uksgBT7pqzLdrK/jS4OvzxuWBpTp0sODfjiWuqmB4eL2fs3AIcC
         H+/g==
X-Forwarded-Encrypted: i=1; AL+hErGhfRmAnILDnfeEP8/YVE9Z38rnmC/fagt5zdEvNucRWjZFHo5V1Pao38iyGSYoUd13qrx1sts+fRnn@vger.kernel.org
X-Gm-Message-State: APuU4Z8P3qY2kDGHDALJ7UBFf8Ugj4IV84myam+GQ9QdMU9aWgKHFwQ1
	yJ+7aC6zltVTBoJo5SBSO2nixIfnig3DFfxIlpPHtdfv5JGHz0GN64Ol
X-Gm-Gg: AYBFou0YEhuN/p3ITs89l1Vrnly740MOY4LZhF/U07L5OKWcXAlqvyr0gPlLFQgByDD
	MK8PCS8oNq1wUmvPflCMTrfGxi2+hKGAzKpbb1ETNVlUq93RVOtZFSXt659iQ65xIu+IW7DV+Z5
	oFgZi1NQJjnEs8NGgz9GShtk6akPfk5bK6J5MTAb/St1/nu/LUmbVgrYu/imdr/GcRTgkqyDBvH
	uxVATsSZEiSbbr6xDDnoP+rDSA3+efIBmAGXuyYUb49ZE4coWyBOmPc0vfuUviW1LD8OimvYxox
	5ElkfsIgvbsfvht9s2P9Z1hTpEju+wtioNBAtMdCKKLz5B7mKVeG3f+cFvmTyTMCVk1oW3igiux
	OKgydTSerBUOQirUGix5g4tj9CS6AcfSJpy77ukVVZjLMRy7lJ0679cZ6usBRh/Ohttl9n/v2h6
	YPB7H09qQ/dNwQMRYqf/n4b5vea2XPaDxCH/MP646aU8m7cWBNdzDg/fO+kd5RcmyXyIBPAAqas
	Vu5Qw5I+6P7X6XjwCrSc3TnkEC5RB/3qGS6Dnkhq3QhDFWq2tchIqAyqvhNU+K9HZv39wYuZwoJ
	l/5dgKzxn1pE+1RvOO5sIpkfNy9pxh85wRUloxXszbL2yKDnbLxXBvtOd52b64fGVD2UzJ1LXIF
	M23sUHI+FmnaMgbjUyMCvw8vIX1m4VkOYI0qJt96zKa8VQDkigXAAnINy+HLNy37MDeW7xI2FSJ
	Yjmw==
X-Received: by 2002:a17:90b:4f82:b0:3a4:f8da:2478 with SMTP id 98e67ed59e1d1-3b1b09fd889mr441375a91.29.1794523509368;
        Thu, 12 Nov 2026 14:45:09 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm37073a91.4.2026.11.12.14.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:45:08 -0800 (PST)
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
Subject: [PATCH 1/4] MIPS: perf: look up the PMU interrupt when it is requested
Date: Thu, 12 Nov 2026 14:44:42 -0800
Message-ID: <20261112224445.213324-2-rosenp@gmail.com>
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

