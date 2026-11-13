Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794612847;
	b=MwMciLtHLo6mEB0LL+Dl+0jloEN4Lz08IHKTq3HsDsHjESeK+vA1FxSB2y7CAHMRXrRR
	 A6VzKgwsIE6NNL0xHxjFEABFhxjvCh9hji2kSAa4uy7Shu8xCnIy95Da9GtPTW1cdk2Yd
	 1AiQ+9wGNyZ/Z4aePdEC9oyy8lwy73SntCckAE8bw3QDvtzsNIVOPBJToUiYnJBPvasv0
	 5U+LmM8GcONIu1usyoeUAOKTYQCp1BYeXWINZde1TLVd+ZUGCay/Hr9CC77DlG2gpWoA8
	 7gOgk0fSXkLdWWPwKyOjdp9G5XSMn/r0ShRmlHU9plHq3LA2fTi7iyZ+SYRB7hyjE5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794612847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YtlPe71UsmVz9h4+BFpDabZxVBkWd1duDw8VtWzU01g=;
	b=y/ure5epaImAcvX6JZX5bO1rmsp85Zv47vGG4+90nAFr2XTw+hu8LWTsrARlFzs4Byxz
	 ZqpL+W/IBueIOKNrWV47+aWlunAayOdW8NjlXEmk2NSUpi3ZdY5VVmzFKdketiYLTSfe1
	 A+FiepNozrZV7c4uwsZbMLCTeBPgvnoyy/dyRyVfSB0TsU7/gOnsLBHzI0NDveLO7Neyn
	 Zrzn2zxBGdyTb+HbOMImiqFLOSJE5Z95PpZG81RP1Wv4fZgpdzs/Vra6SmHKfJBP2nyy4
	 MX/JEQqPmQkyZPUmkJBGW5irRACyxF6C7r83HnG6namZzIPdDwGWz8lpaD4hUywi+4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tACVrlV8;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F310606A880
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 23:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F310606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tACVrlV8
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2903154eec.0
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 15:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794612846; x=1795217646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtlPe71UsmVz9h4+BFpDabZxVBkWd1duDw8VtWzU01g=;
        b=tACVrlV8XJeZsjfryb//f6qThpcS2cr5CPmVJSIUKq6P8bH5fo5gZO44daC4NdXhFT
         d1abIWSJRrZ56MtxEXnJFckn8bM9+vrbUJnw5b9iE1p17AYCSzO3fWLeCo6LBp3RYP5Z
         iO5DNTyHUxDctkK1mGgP4eYDZHXUt4q/BrqTa0AkuxIL7zFuZnETldAFbbslNegko9q8
         dxwB5OsFyrEYwUiiJ+SjXtal/X47hI2OV/t6aXJK3asAIqlAJP0RFQf68xARsZmzQc8k
         xDN+kw7riRQngvEcj7KueF/7yHCBglad8AD8oRMgubnfg6ApQeWxwUKzcptAo5j8kMZB
         MOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794612846; x=1795217646;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YtlPe71UsmVz9h4+BFpDabZxVBkWd1duDw8VtWzU01g=;
        b=AUicwMX6DCBYRrq7V/w2YiMp0adb1e609pfP7MesZEJWh6/J/HKKjDH+LNq7OXWicM
         957NoOLpYRKMZg2+QQuloZZkUDYpw6fYx5m+ztv7AC85ZwWWUw59WIFAzIySBqnAy4qE
         C2tdwTDaD8yX0Nij8P5gEppUa9TS9rfgaiHFy1pEFrnLgrGF2biwJ+IJC71N97Svx3BE
         4J+T7NLnUDmc/DXPdzbvQDZBoXOp7ghY8/pUiYZp4yvtIGJ46ZH/D5hFcSPJF95TPO26
         +blRX5h902SErvBnFbe+RrO+p+DE1CpIr34O6AA/1oYG5dZbhMziwNCGbIuCzYStQRTp
         y6RA==
X-Gm-Message-State: APuU4Z+j1I3AW+VMWH92wFJRKBql2XIW9iWxH85I97MjQtrJDy+1QFbf
	EyMB/+7dwatLy0E16UQF7JPnAtEXoc7tOSu/GIGo94BRGzOK3ayG8f9163y7Aw==
X-Gm-Gg: AYBFou3okyjklp3Wi9Cnrlq4FDvDrIUaXjhl7yo8UIwCvxNvHjIS2EXKrjNL8jrEM8V
	gCWx3TZWckc8RLppCOzzPy8mABbT5hMxmhtuBhavCp2684JlT7tcEhJG6iiXOvKjlcGF9yNiMeb
	tP8aByO1zN2T/GaQIdJA9bil6/bCzmXp/sx6Ed9LXOnloHarpxon7QKcw2NeVXWp0PPN5siWmS6
	QJzShCvL4Fh9YfvVh6Fsjd26l6NzG/deOmZ+kDocZ0cx19ceo2OKPwRXQAadOAxaJInx1E3b9ct
	IVikxQT52OL9MyQAQ2JGYZMqETzgi1RhahZVTiQ52kVhpoKrgPaLWO/reQR5fDV7fWmZN+jEo53
	iMTisKPp+UcsQNCWEPpd1Xfv3xDhW1YkS2HIqDoj8EA89GLIZA4I2tF3zGBxnJmV3nEeRbMNx0k
	MOnxXLCe2lfvAGv5oxXitKHGrNCpmgOZ26r6XxMbUCYugLIZ9Wcii/o/pGYHaBSfb2K7Q+frk27
	5fW2xVx0jfpJVJU22sF2JLT9r+Wa8/WY3/X4vMWpouRbgcvVsTn75P9quhWdH+X7wa+j68RfIxU
	Zl7QCyQE
X-Received: by 2002:a05:693c:8208:b0:378:314:402c with SMTP id 5a478bee46e88-37966e3806bmr3520013eec.28.1794612846033;
        Fri, 13 Nov 2026 15:34:06 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316f2sm10726041eec.9.2026.11.13.15.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:34:05 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM),
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: [PATCH v2 0/3] MIPS: SiByte: Add HW PMU support
Date: Fri, 13 Nov 2026 15:33:53 -0800
Message-ID: <20261113233358.538698-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series resurrects the SiByte HW PMU support which used to be
supported with oprofile but was later removed.

Changes in v2:

• Preserve usercopy fault state during callchain unwinding. Save and
  restore current->thread.cp0_baduaddr so faulting unwinder reads cannot
  corrupt an interrupted usercopy’s recovery

• Balance PMU event initialization cleanup. Release resources exactly
  once on initialization failure and install the destroy callback only on
  success. Also check event type before rejecting unsupported attributes,
  allowing unrelated events to fall back to another PMU

• Keep disabled PMU interrupts masked after EOI. Add an SB1 IRQ flow
  wrapper that reapplies the mask when interrupt work disables the last
  event; the generic CPU IRQ EOI would otherwise unmask IP7 again

• Fix a documentation heading underline in sb1-pmu.rst (Randy, sashiko)

Florian Fainelli (3):
  MIPS: SiByte: Wire up the CPU interrupt controller
  MIPS: perf: Add SB1 userspace callchain unwinding
  MIPS: perf: Add SB1 and SB1A performance counter support

 Documentation/arch/mips/index.rst       |   1 +
 Documentation/arch/mips/sb1-pmu.rst     | 162 ++++++++++
 arch/mips/include/asm/mach-sibyte/irq.h |  10 +
 arch/mips/kernel/perf_event.c           | 110 ++++++-
 arch/mips/kernel/perf_event_mipsxx.c    | 397 ++++++++++++++++++++++--
 arch/mips/sibyte/bcm1480/irq.c          |   7 +-
 arch/mips/sibyte/sb1250/irq.c           |   3 +
 include/linux/cpuhotplug.h              |   1 +
 8 files changed, 666 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/arch/mips/sb1-pmu.rst
 create mode 100644 arch/mips/include/asm/mach-sibyte/irq.h

-- 
2.53.0

