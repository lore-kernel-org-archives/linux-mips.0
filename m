Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850728;
	b=xyeUPxQdZW9tt4rwe4M2VQJ8IhjSOD/VqTxp3LjRtFZho8W6RS1W57ZCqydAA5dgUez2
	 SB9KQXvKj4H0KGmnbAcjZV5ij6NA41HoGt8KEF5xn6UIqYZNoRGvEYfsgSpTyfhhr5MhQ
	 c4pCaRHe5UJ4KFweaNDtDv6zTy3b857ped2oYLG1Kt8hzJYWndtuxMLrUHLLJnZkaGYwf
	 w1nYmcHOEecl9845hp0nfifltHnoAJsg+nMxc34Jp0tuzhbqTUmvvUq/QU2yl8FvGcRgJ
	 TeZURnneQbKydRxvpp7oQbuGpDs0zA1CCmUM2vE3NNjuz9Iy40ACgt45lrJesf645Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=aLSjTS2pwt9wjNyiWIDUlRh4L7BmtQghZ/YF0bk5FsA=;
	b=GVnOIZFfuQV6n7PVD6Bhur1SNlh/xzc6JLgQ2STOMfhvQ2V7WDYY9hyZuSTgdaz+YF8G
	 ttMr64gOBmm1skFkLQVlSOrdTDlaO28bmIj3nVX8MHCYVQeF2rbK5yjzUq7RJhgC43No4
	 yEYtXOfiMeaVn/Zh9IQZ07ecAYid5P/8GrX7Frf2RidapJTMKNF8IN/7hkaJOBuiBku+0
	 wFUyuWUFJfOntVvdTk/nWbaklxbzvCBZLI0qZBBjwokvW80WgeekaBvEt19kz1ekNOwJu
	 eBpRTB646O9eRUjqAqDeETxDo9uxqmynyPryPTXWd/UVK1y/aIxtZM/4IkXIT5oVNpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKpxFtJI;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7031E606A331
	for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 17:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7031E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKpxFtJI
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so10429649eec.0
        for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 09:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850727; x=1795455527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aLSjTS2pwt9wjNyiWIDUlRh4L7BmtQghZ/YF0bk5FsA=;
        b=dKpxFtJIyWFjlQRSKbKIOU1/Oas6D/kgChSi2PmhJsbm5FtEqvv9xhesQJVCf12raU
         sUMDR7DzniiYa7v+4fuLtHlyyZBTs+IIwyBU3sFLYGJYb10jER85jVVeaRQ8ftQB+IK3
         kA69IAlKM60thCxjGq1wIkuG6Wj0GvAtsQmT4LvXz3bHPfUf/g03sCmYarJID/W/PejY
         OHp5N06ca7kZ/adfmhspTE73A2p+/a6KZhg3dKjyt8/+ywmTa99RrY/d+Q2wQLXba4kT
         Ad76ynbx5wpiNG709WvXE1nfLHM4EcsY/tD0vm+jPrufY/zb2Zvay2NqACNzMC6dwzib
         yaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850727; x=1795455527;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aLSjTS2pwt9wjNyiWIDUlRh4L7BmtQghZ/YF0bk5FsA=;
        b=DMT8pWCukhJL+9clQGjAxXSCMk1Ip8MePvSCdL1zMRr/TyrPLYwdcn0Vhyxxy29JRH
         ZBeK5Czylz9e3Rj8CSaXsxb2cHB5XJh53+0+RV2xib8QcMPflrG/nTsxdTfPHI/aWI2L
         v6WYj4Hf6p7zD+ajFvlwGPYRKANypxMBredTyauqx46JLnRDRlVQIWdM+3hNj2rw83qK
         rGH08Jn/LB3Wh6iY9xcqnQJAgV7Fb4ePOaYCE6dakGKWtPiBHW3aoeetnfMwwE9uLL6M
         5RngP5BBJe4TkfdO8OwRyS7QzG7MDZvCcg9vLB+V4JcJD7TjZKbtdDcr5qPwir5sqYH4
         Gjww==
X-Gm-Message-State: APuU4Z89uPnmutKXkyVZ1M1PMI8vhcN89GOjsn0JTFQp12mggyZStv9P
	W2zAcoxk28mpkch0AGUprX2vtJCGzfbWR+GybyM3VCh9AcHXBZE2q5ed64O5CA==
X-Gm-Gg: AZFdTZeJ1ZiE+Q0cqkcfRBgLe1yPtMaj3P95dsRBOyNwky1kXyw6KD7x/+bvo7d8DaR
	OI/U+Q3IadaV3INTzDDnCvtR3OOgcS+xysylMXKtMID42JTn8+uShNGw3QnyoWqBv3q29JBhg+G
	tIuUbY2bTpqbYPNUYysVgAnWGCLl4u8wkQX/9DrIZvydcNWq8ILh+fFzVB8oZN1PSgZKZk1JXKb
	xNw96na1LbPlxXzck1jqUBDVahTfyeI1iGS2v7yhdfPLdCqtPJafWPocz+tvV57W97OusErixHr
	Qcq+8pd5zobTuGiMhqLFGhnYi+fp+umIlbpslUEj+Vk202Z4JvgTDhBtTpyiM67z6f81ms9ovJd
	P85FQLX269wfQDm4bkGUBDjQHBcHZ0QMWk4NWlWg+I7f1SS5dJU7Dccn/u+NXzcS5wd9MnwbRKt
	dGnt3JMQCTJVihRSK7SMZJrHs2aR9eB8I/8b8A9WIOaWuEkJHrG2J9OcT1EtKC9KtuUAVrFP6jy
	u+fVa+L8NGS7TvKqgOpCzTx0f6VJ8SK8MphAROx+01wHy6FD3a9PO1YXNO6PJCEPZXvISGzhvZT
	gTZDsfc/fU1x6QDvwSnmG80HxOttBR8=
X-Received: by 2002:a05:7300:6aa0:b0:36c:b8b1:a44f with SMTP id 5a478bee46e88-37967ad928bmr10061049eec.31.1794850727398;
        Mon, 16 Nov 2026 09:38:47 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm36635215eec.15.2026.11.16.09.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:38:46 -0800 (PST)
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
Subject: [PATCH v3 0/3] MIPS: SiByte: Add HW PMU support
Date: Mon, 16 Nov 2026 09:38:35 -0800
Message-ID: <20261116173843.911523-1-f.fainelli@gmail.com>
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

Changes in v3:

- Use boot_cpu_type() when identifying the SB1/SB1A PMU instead of
  current_cpu_type(), avoiding a preemptible-context processor ID lookup.

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

