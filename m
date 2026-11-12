Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523509;
	b=CamFKV4+L6TR9y1K/k5aDWLMUcXYuRYnJJrHvYJpYWQFPkwJj/ETWTWZkq1QegEGcSez
	 sqikvFY4FeMPEcBs+1kMNzrfDZa8gGJqwInPNdm9saG5vbBNJabhtNTQGjfWTy4fXNWzP
	 U384kMAuCXE7lzcKLdqWjIC87qXVPK9/80+9x/uTb6CIgi1w3xg22/7cF/+B7m/DFc4G7
	 GzY+KqihVwUc95RkUDgnqWaixA4sEWvsuw6EdrKsAUiiiY7QQr1eSft17jTIvl7zIHnJc
	 XoeUKYah3kLgIS0/lXuY4SIj3eUBMMSmFWtHkKPhRrwKPOkbubsoIz2MuwvOSNfV+jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8tqnSgVZpqPW8BsWNmooETTnIE7/WkUkogSOJRF5jZI=;
	b=Tou1fEuwbYfVvKjh8LSS0xvucADYmcvQAb2xQaNECp+MtHdJCvEtPdP5UD3a5zPCgqyr
	 lnxTRqnR4OaVLA5yDlY10iswUnoZsrDgWJXz0UpliZVcnoQf38u76X646l8PowTO90/xx
	 GxPc4ftEAJvPTCun1fEeZ3E89Qvc4TT9O6ySjNRNwUBI4HZcNCqDIjvngNSntQ8WKpILg
	 UGVcCfZ4ejtFwjQWeEdJeVed3w31vNMZxKgpswV0W22gaPxBqNGRJ8jTQD001gHAvkOg3
	 nFcvIHItZs6+U7ODdgBIHAbrqxFwwmA6XPgG03SrEvyPnDiDCAonBgB+qhtL7KbvM1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gaYyOYy3;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CA1606A336
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 22:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66CA1606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gaYyOYy3
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso135250a12.3
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 14:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794523507; x=1795128307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8tqnSgVZpqPW8BsWNmooETTnIE7/WkUkogSOJRF5jZI=;
        b=gaYyOYy3ceE2MsM1X6p0A1KQqpuy4aosm6kLHi2JCVy3IPVy2YUDQERQJomEdX/fZ5
         cNngAAfWiPPBjiJY+EI9u5bESaDUZYR/3ga3veG8oY0/UQ0e6kLX2OHmEg2le9L7lb5B
         BRXfdgA8Gc9acr5gP7GEWG6GTKVTZ79cKiml6J+9ED7q2wCh6xt0e6/zdBvF1vlpr5Ub
         RYjOMGaKCC1Rb6CEj9yYM5fp5PjUAVm+S1IsrOui2OHj57dJAYy+j/L2cCKcfYw6eMva
         tJw8IjGHzbiviLK+FgfbTRYD+64okgN1hsDM6UN4w6r/U6qiD6V/5SMQs41FkWpfz1o2
         udew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523507; x=1795128307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8tqnSgVZpqPW8BsWNmooETTnIE7/WkUkogSOJRF5jZI=;
        b=KJJzHvXj6JrGyeWiuYkK2cr+Vg1TCoKahCU9YVe3KQAWYQObiYoee7//j4BPFUpvge
         5sP+d6fy1em6mQlKGTot0nGb63XkhMo88Zo2wLCaittwSPi588dTMrGgo4HGc9LMG7n0
         Lulnaz3bBiptFF1ZEG1bIDflZqy4P+aHf44LUnt+H9NSa1t1gibFN0Al21bNSohVrFEU
         2CpTZ4JVcWN04FsGy3b4j3nVRae7qebez34qrWh2PYstRmlglCGl96VBvNsLBzSFGWqB
         WXza2G44Ku257MpqoV2vslq3tAZsaie8Au+weYeKVIFONqAyG4CcL5uvltI26ncJJGIg
         hwHw==
X-Forwarded-Encrypted: i=1; AL+hErF3+rdH+cVnX/7gt07SS6CSlEn+y6AOgps5HB1PDZyB7QTPKSJ0dVpf6SWWfBe1yReGbuMx5OEGpEEY@vger.kernel.org
X-Gm-Message-State: APuU4Z8z1EcWbAjI+3omP1QrDdSz/p1SliH96cxj6oqPlSWPMPP7vLGL
	VVC97hdLlUu1i+mSL+g8EArcqBp2ksH37Oh0+vuE6sYy0YGGaFuftI53
X-Gm-Gg: AYBFou2xx635wWwQOQWZ+ZmI5uyNo3PGeXKGry6Kk5K4wMn7/J1OAc8gpMcN+mYQjvL
	m+2WB++fEMUOBEVzMbWgOnVFcYhqysplCWZSgC3cHC/NNYvI1mU+P3US5FI3sfwQS4egxv/6Xs7
	d+AtgNSmztdVqBI8cx3aP1pKmuLb6FR/tDP00Y2S3xfvaArfZUCe8/6TtNgiu+IfVe+Ti3Cn3xm
	g6at+x47K5P6iT/e3zNgVb6sKE05uV8fiWA+z2woZ8/oWjnREZG7fEw85HIabTdcRlMoHuyfqfH
	iK5DZ9efFGwStxg9qXxk4tEiJA14nX6imqEwscPpkryaEmsqc2Mp52+I/8DFgTnFY7BoUtvodzQ
	R+HSbzuuEF8UAbYKTxiF2f45RdODO2nxINYL/Nb4AIS80qTn8bTYq0HPcESQMmK1heQmT5zbmmF
	Ka48VMugPpQ41arShS+R6rQCnBMf0qTLG46FhLFtU71KVD3xYhN0vpYIwOAD3XhZ11CGzKZL9C3
	7Xv+Cdoy+0xNcVqt2NGrT9R+URd8BaD//Dzc2xMhF8o0kD/+UDO/qr/XJlLannDdLUW0D5847mE
	2HZYliDKOgTKeRvcxTZPd6scieDfAPk/gx9st4jomTPvGLqv/703yB+iCvfXGiqYs8u478+5jbi
	kF5IS2fLXtDbDJBFMdzmNLQ7oKjbiwWJFDlNuPHxmLLBJ+ca/Qu12vRRVi71z1wIMBvIPb3QFnD
	mT5Q==
X-Received: by 2002:a17:90b:4c49:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3b1b0a3a7fbmr402428a91.31.1794523507457;
        Thu, 12 Nov 2026 14:45:07 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm37073a91.4.2026.11.12.14.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:45:06 -0800 (PST)
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
Subject: [PATCH 0/4] irqchip/ath79-misc: probe as a platform driver
Date: Thu, 12 Nov 2026 14:44:41 -0800
Message-ID: <20261112224445.213324-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The MISC interrupt controller of the Atheros/Qualcomm ath79 SoCs is
cascaded from a CPU interrupt, and all of its users are platform
devices. It is still initialized from IRQCHIP_DECLARE, before the early
initcalls, only because the MIPS perf code asks for the performance
counter overflow interrupt, which goes through it, from an
early_initcall.

Patch 1 makes the MIPS perf code look up that interrupt when the first
event is created, which is when it is requested. Patch 2 makes the ath79
MISC driver create the mapping at that point. Patch 3 then converts the
driver to IRQCHIP_PLATFORM_DRIVER with device-managed resources, which
also fixes the leak of the register mapping on its error path. Patch 4
adds COMPILE_TEST coverage, which a platform driver makes possible.

Patch 3 depends on patch 1: without it, perf would ask for the interrupt
before the controller has probed and would lose its overflow interrupt.
Patch 1 touches only arch/mips, so the series could go through the MIPS
tree with an ack for the irqchip patches, or through irqchip with an ack
for patch 1.

The other users of get_c0_perfcount_int() (generic/GIC, Malta, Lantiq,
Ralink) return an interrupt that is set up at boot, so calling it later
does not change anything for them. The perf boot message no longer
prints the interrupt, which is not known at that point.

Tested on a TP-Link Archer C7 v2 (QCA9558), with the device tree from
the pending series that adds it: the MISC controller probes as a
platform device, its users (UART, GPIO, watchdog) probe with nothing
left deferred, and perf record gets its samples from the overflow
interrupt on MISC 5. Each patch builds with W=1 (mips, clang), and
with patch 4 the driver also builds with W=1 for arm64, x86_64 and a
non-ath79 MIPS kernel (Lantiq).

An AI coding assistant (Claude Code, Claude Opus 5.5) was used to write
the patches, test them on the router over its serial console, and draft
the commit messages and this cover letter.

Rosen Penev (4):
  MIPS: perf: look up the PMU interrupt when it is requested
  irqchip/ath79-misc: map the performance counter interrupt on demand
  irqchip/ath79-misc: convert to a platform driver
  irqchip/ath79-misc: allow COMPILE_TEST builds

 arch/mips/kernel/perf_event_mipsxx.c |  30 +++++---
 drivers/irqchip/Kconfig              |  14 ++++
 drivers/irqchip/Makefile             |   2 +-
 drivers/irqchip/irq-ath79-misc.c     | 108 ++++++++++++++-------------
 4 files changed, 88 insertions(+), 66 deletions(-)


base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
-- 
2.56.1

