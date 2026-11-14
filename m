Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699445;
	b=RwdFk/Hw3rth1vscYVTAfShAdgDCLN1sZs8JFKDH1ADC/30VgTtPuSAh+HMq0KsR41tI
	 WGExei6jCoOaFDQBH5q04hVU9xk8gA8BCKUsonwYULtT2WTdEZ8J6Z603oEkGuaCvHup2
	 sI6R+iAsOHh36XdIdB7iZEObD5ILYAmW5NKNxEhq9O7qyFCvTbbcdslfRUKtctjokAM0s
	 CkpkPVg+GJEiVJeZ6hUuIs3oXs9qFxgNMeQmZoiy4qMJL9Yb7GBfHW7QjmCiwfG/7qBzI
	 hWa33PEdqTfEtpgsS3VXEuBG34i5VSI24ppJ2LSJYdHVO325n20ZBC4k4u8ElFm8caw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NqFBf9Iq5XfpNzEQERkV/UyBTQGdOGc36+bRwxXe9UI=;
	b=TBjv9O75S9GqbNfSrwUKfVhzenQhSWca5PtntLL+g9IAYNcHvci7Rm43fqOfNVYCbZzM
	 /O8+WKwzlkr0hCh6xXAOJaQhfXMGJ/q1Fg9ofLet1TSPF71OHAuTMk6jZZSpOYUcoLLkP
	 e4z528AaDHj24UlLLAnB9XCqZD8BUhLT1QxhmG4Mvfk4B/1oPCYOA6Qu8ATB0R/K8Jub8
	 AxL3L0wCpGzKpwH66AKy+TDoApq7ct8j7OxxXvSftFemm5DLA+Ms6fkn46OQv4xdtC5yj
	 NkNQ9G4wnXebQCNODD1x7NHInZ/MAqeZOZ7s2TIoJjH7ZwIGjdVg+Dk7jf2Ur8KvIlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MmaHf8KU;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE9F606A32D
	for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 23:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDE9F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MmaHf8KU
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so885904a12.1
        for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 15:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699444; x=1795304244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NqFBf9Iq5XfpNzEQERkV/UyBTQGdOGc36+bRwxXe9UI=;
        b=MmaHf8KUq5AIhEzi+DqfX5tHF5/BQAmuFYd5HbFZ35qCF8G1MD2b4r1HkiXs/wmbJk
         TLHjqASWGiYG5vIM481HsaBYGD6KCX0wRmO2PZFmxwbAAFGwBJUZOlsFRgD+BmXKlglD
         2LjOBCaTN/X3uEz5FAghenKgOewqdZpMmsrrVHC9aylgbiKxFYwQHWy9z3+BFrqsq6Hl
         2nfFVzVHG/wfObJARs0K9QOXTkfCWxAs8Lm4SqesVYWgoCpWofPUPASxXoNwxwjK3G4A
         P0g8Ol1fpGOunlJj/KW4yNPvV3TNbBFRkDPNyf5ht4NZQ6mgSqi19vjLAugL0PQKiMOM
         JB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699444; x=1795304244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqFBf9Iq5XfpNzEQERkV/UyBTQGdOGc36+bRwxXe9UI=;
        b=BbtIAufLV8nJ1ggZx99P4tKPBNl1bToMKmJdYBZUWqE3+SrxNJPUnDxGY76v1AJWs1
         +LRBuxjcKBakwDo5ORZ+OArbL+NUCcNOzhkujXi/PR/JdsJA1QeStv2C/kYRAkotgx4a
         JkZHD11GxjrXjHR+5En6g8Byu/Bm5F2jQs6eg3LTN0uW9bzWL0knCM4IHDb9b+VKc7/k
         r7PD5CMpITOMak2vmuriZimTPEPfSYhcGETqm1xQyq8YwE17POOqLcQ3G6bbsLgq9nCh
         tPdPQnSDIR696XMJ7uM+m5ePTUWFx1hJ5Ba7iWcQ8veDJysBkUqK+GF2uttdK3hdOsn6
         OiVg==
X-Forwarded-Encrypted: i=1; AL+hErHXoysJbBo5iXeWPdx7PpUfcH7ptf+D57qFkULR+w042H4dtFyZJVtEx/ev0zikB3cpS8ro9ZcfGuYl@vger.kernel.org
X-Gm-Message-State: APuU4Z8gpyra+cn3Ibd92+DgfoHqfeuhnic82iSvgegPiZuPjx/uGEGu
	/Jh9r7q8RRiORMeqiUTrar1buzGdFGW6Iq9NUNjgFDyFDpr6hATm53Q2
X-Gm-Gg: AYBFou2I6cZL7EHJ5DTx/bVZRnuwu+EoWjgDZWmV0kTPkQsK3o3eqbFCwbbWXxMG104
	qqVZUNOhEO75pG52r2/UrkF1b3646uLowVjsBrRdAI/jUrjjy6qrtj8Z6l4vlvbcK/VTDiBPnCa
	/mc/gQx2sYWsg14pFzRKVMRfXEQ9ewUENP6Zmkp8eUWCk7e8HlBtlBCr3yE+6PTXQgDov2VEuV+
	g3fRBIRPn4I2GQM3cCNeQ+AfiL7cxVCNFNKjYLHr/MBxSmm6Gh+tHOhlwZ8Qp/1ljNkBn2X0teg
	ODX4GAGGXUarh3F1m+38mzbiNv6zuFn9ft2jidrI1/PKZ5giWI7Bfw9R/Z6EamhUWc9lSrQ79TJ
	FkaxjmoHoKnFQlljUW1TDkKfb+zPFRbTEPBeRkr7ABH/qHLsdD+24koBPTwltBYpqb7rTGjW2RB
	efIRlPEybIy6OlNCYZEBeFy92cEc1wFfY71r7I9TvvX/mwcJGO6fdqxBcN92bIxBhNLQ80zCHWn
	2aYZsdrFFXG4gbVWp8kF71EUGifpFZPVA0G/8Ede3W5y7STPCJ4XZOLIb0Lok+ZKX+W4kp7pMRN
	0xoPkG2vC3EcPe+EZEB1njjgIhqphce+4QYntZ+xJ7YirN0Bz/1pI49wN4HbBRx3XAYiiLOgbsl
	NW9Qp1vSouHcE5gz4opmA0qqHAYeun7uPvXgiLwiKtdEvpr8wJJsAaYx+yX3BjZuIFyYgAbxUWZ
	o9yg==
X-Received: by 2002:a05:6a00:94dc:b0:886:a52a:316f with SMTP id d2e1a72fcca58-8beb2e7e862mr5911125b3a.4.1794699444046;
        Sat, 14 Nov 2026 15:37:24 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2d0f473sm2306372b3a.53.2026.11.14.15.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:37:22 -0800 (PST)
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
Subject: [PATCH v2 0/4] irqchip/ath79-misc: probe as a platform driver
Date: Sat, 14 Nov 2026 15:37:14 -0800
Message-ID: <20261114233718.86520-1-rosenp@gmail.com>
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
non-ath79 MIPS kernel (Lantiq). The v2 change has only been build
tested: no QCA956x or TP9343 board was available.

Changes in v2:
- Patch 3: keep the MIPS timer interrupt enabled in the MISC controller
  when probing. plat_time_init() enables it on QCA956x and TP9343, and
  the driver now probes after it, so clearing every enable bit left
  those SoCs without jiffies. Reported by the review of v1.
- Rebased on next-20261112.

v1: https://lore.kernel.org/all/20261112224445.213324-1-rosenp@gmail.com/

An AI coding assistant (Claude Code, Claude Opus 5.5) was used to write
the patches, test them on the router over its serial console, and draft
the commit messages and this cover letter.

Rosen Penev (4):
  MIPS: perf: look up the PMU interrupt when it is requested
  irqchip/ath79-misc: map the performance counter interrupt on demand
  irqchip/ath79-misc: convert to a platform driver
  irqchip/ath79-misc: allow COMPILE_TEST builds

 arch/mips/kernel/perf_event_mipsxx.c |  30 ++++---
 drivers/irqchip/Kconfig              |  14 ++++
 drivers/irqchip/Makefile             |   2 +-
 drivers/irqchip/irq-ath79-misc.c     | 120 +++++++++++++++------------
 4 files changed, 98 insertions(+), 68 deletions(-)


base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
-- 
2.56.1

