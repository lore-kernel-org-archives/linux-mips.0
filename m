Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699751;
	b=o8srdRPntxB6Jh8fQW9TfOXsNNMwKOGE2L+8DHxYBnMyS6VTK0Z/f6xO2966Ss+wMqFj
	 djgPphaXuNQW3een2VguEuzepkbWRKnCbMJXRk1gwqjmsTgaj3tcfuizpoPk2ZBFoVBEO
	 P6KItbWnCQpNGGSMwHqQzmMJqCSaOAB2GSi/X/dovG4KMh/bpMASRvs3HjehX0lGN2OJd
	 9tfZtzpwj8ASEC3ft45VbY2BObS1eTM3gdo8v6NIqDHs52T7yjoNh5niX7VkuKMFjVezq
	 c9ex6dgLVAd1YeFYLNqoS4YkX3FIYkBjljr371YZVaau7S85t741zeq4PWV+3rYUiGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JIdwViW3MwPcND+fB4xrX/lkNYexl/I2+Vos84GFCrU=;
	b=PM05Ubrm0M2ri2Se2lPtgAVt2U8KReFU0VILg8rhFW4djPfoI1J47BA0aXS7TTyTe1aF
	 WOX1nWs4LNhoe1PWfUeF0zkakhZDpoFRm+dyPuKufhGqk1OCcagYsNu/8C/VLveS7jluI
	 fjFIKh3u297ezDi8h8fbvGNKGabas9XddHkAi9bLBYYUrAYoAJJg/c1m7Xnt5D2laiL9i
	 9L1LotyGGSnCCjvVfZgN0voyplTCJabFRaAo6UL4Z/H2LaBlzzDOWhyqRuLqS9BEP6UWH
	 Fp5pE3mISL7UXk/n0MR8etjxOyvFUNivRjLKULhjQzmsymEzPWZ1c2FgaYgcBNMvBNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n478R7Ht;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042ED606A32E
	for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 23:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 042ED606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n478R7Ht
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so1780616a91.1
        for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 15:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699750; x=1795304550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIdwViW3MwPcND+fB4xrX/lkNYexl/I2+Vos84GFCrU=;
        b=n478R7HtBE31VtoF09RFDgvxLOdNJoP0n6hcHMrmUrktIseH+Qot5DT3T45JARLpxK
         EYwmhr50HgrfShPJAUdrCoDd2KsN7eEeFQDpaLiUDvchx+qtvulWhlizHuXtyj7mMeYl
         n6RvHqXXfrfvyoPYgV/VRU8cswKUutBBdt7rdDXUlZW4Nc2SCtzhBDzkNNCyr8XtvsKr
         zTtrSucpEADd71MimhQc3qA/+Q6kz2rt8IHIKacsVFhb3ssD0B7vAHEoumEZof9coiFQ
         yvPbgVJlMWFwMV85in1/o6mZr3cUBIdUkL4jiqIdmvvXc0siKwLF4D1ci3eSv1SbVp74
         E2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699750; x=1795304550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIdwViW3MwPcND+fB4xrX/lkNYexl/I2+Vos84GFCrU=;
        b=2kIH9z2k1MCJEbuO1LTXVNhxLWHr25KnMW0jnAtrqZkRMs1zyZEz9GSWIrpA9xOqXH
         wWEkUWIZZtje9WjluVoJZqD33VlL8TD3deirmPqItb9GN5VqspzyqIVdgEAXbGxApTAq
         cSqN0AxfOFaAnP9Mu79OKIHpZzyHawYYjVCH6nFiMBjqkhJFb+oo20HIxk63d2wWjql7
         KYYiWnaVZT/6F/HFtho98429EoxyyHHkCzDoG6mwHLJdorC4jVFC4GCr1MXCkRe7BIsS
         aQ/0RQ88wfLGbiNaMQA0YMkcExq7xpRl4S+wm9uqPAJuJlBgX5200mpHbuHMfGq3Lpbz
         0U/A==
X-Forwarded-Encrypted: i=1; AL+hErFTICYcgX+LWVjSmbzpobFUh3ibtX4wXJ2VwXWEtgutwO4kh2Dkguzft/ko9N8mM6fMC05SLwSC9l1B@vger.kernel.org
X-Gm-Message-State: APuU4Z9OdFkMzqtfQYPgwzziWbJ0veMOU4zeVv3SpxV/wgroyDTnmvrW
	ULVk2axenExxne2eJSY+vCiCwEi76bnwRLorQSLDIiz2Gb14fMz50ViB
X-Gm-Gg: AYBFou1nqF9hjCWLAVKKVT2qnYsciOTUa0mXz84lIY8lDnD+M0jch2utHTWmDMJ849m
	j//UCD41659SjaWmGz/R92JMexu61KAO1U2ibfwVXZJpZayV+6sYr9XXhy0gzR7AXe/4cRwBvPN
	/GzPqPs0vGdKw5xlP3mzOkWtYNQJB+AMgyHisZ5wPFJlXEriBgMqVmzNI+NxvCETNmT+Igaq/RW
	D4A/v2Ir8TT0W6do9xc7hOW2/5fGvEg76uKQXhvhU4geXkp1xvHtTaSzbLI1uGfeD4kbo3VUugx
	br+fcwhAQ7LErNvcAhZocnO4UIZdgA/tRFXlPXHBiYtSX3zreYNguMzataSIGHZ7X4i3b65zkvO
	lK8noy4/roddDzk8hF///Dut9tMBpk82iniOt9IMw+hqwutOw7mUjj7INrYbNhVk6jxctFdcyIM
	hGzhrLl0pW+TK1gXPA2vhB/ijI4dk37jmuQjvhRjnMU1QH8WXQoIqK+v0i7gEUOptJslMdOV361
	QWl4ld0uFOH7N5mmlmn68l/+GCtshrjwykz3uUngo+GPhfKQUC2ypAzmkM5kqMYSqG/+upJEV8V
	G7fat76Fpf1lJL0OxHE6T6GP3p/8Hydkcg+lTuZ1/9ju2btvzFbhcFTGOnxMzCN/AL4YNRzP1HV
	MzvsXh0MRTpdbUFE0jRBt4w8OaAsLhlRLrIS85oPcKy1CzZTSeShr86jkXufeJGhDlFqyDcoMkx
	WGtg==
X-Received: by 2002:a17:90b:3ec9:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3b1b0b8695cmr6283495a91.64.1794699750313;
        Sat, 14 Nov 2026 15:42:30 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:29 -0800 (PST)
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
Subject: [PATCH v4 0/7] clk: add a driver for the ath79 PLL controller
Date: Sat, 14 Nov 2026 15:42:15 -0800
Message-ID: <20261114234222.88337-1-rosenp@gmail.com>
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

The clocks of the Atheros/Qualcomm ath79 MIPS SoCs are set up by
arch/mips/ath79/clock.c, a CLK_OF_DECLARE driver that registers every
clock before the driver core is up. This series replaces it with a new
driver in drivers/clk.

Only the reference and CPU clocks are registered early, with
CLK_OF_DECLARE_DRIVER(), because the MIPS timer needs the CPU rate from
plat_time_init(). A platform driver bound to the same node registers the
DDR, AHB, MDIO, UART1 and PCIe clocks. Until it does, the early provider
returns -EPROBE_DEFER for them. clk-mt7621 uses the same scheme.

Patches 1 and 2 move the two remaining non-clock duties out of the arch
clock code, so that it only uses its own registers and the clk API: the
QCA956x timer interrupt workaround, and the reference clock that is
read from the bootstrap pins when the device tree has no rate. Patches 3
and 4 drop ATH79_CLK_END, which is not ABI, from the binding header, and
patch 5 adds the UART1 and PCIe PLL clock IDs. Patch 6 adds the new
driver, and patch 7 removes the old code.

Tested on a TP-Link Archer C7 v2 (QCA9558) with an LLVM build. The CPU,
DDR, AHB and reference rates (960, 800, 266.67 and 40 MHz) match those
of the old code. The serial console, both GMACs, the PCIe PLL with a
QCA9880 behind it, and the WMAC all work, and no devices are left
deferred. The debugfs clk_summary, consumers included, is the same as
with v2, and stays the same when the clock-frequency of the reference
clock node is removed. These results are from v3; v4 only changes the
QCA956x rate calculation, which the C7 doesn't use. The other SoCs are
not tested on hardware. For each SoC the rate calculation was compiled
in userspace together with the old code and fed 2 million random
register sets. The results are identical, except where the old code
overflowed 32 bits with register values that no real setup uses, and on
QCA956x, where v4 fixes the upper fractional part of the PLLs.

Changes in v4:
- Fix the upper fractional part of the QCA956x PLLs, which the old
  code computed as (hfrac >> 13), always 0, and follow the formula in
  the QCA9563 datasheet. NFRAC[17:5] is not zero at reset, so rates now
  differ from the old code on QCA956x (review feedback). This part tested on
  Archer C7 v4.

v3: https://lore.kernel.org/linux-clk/20261111215729.10683-1-rosenp@gmail.com/

Changes in v3:
- Register the reference clock read from the bootstrap pins as the
  provider of the reference clock node instead of with clkdev, so that
  its other consumers, such as the AR933x UART, find it and fw_devlink
  doesn't hold the platform driver back when the device tree has no
  rate. Drop the clk_get_sys() fallbacks (review feedback).
- Wait for the PCIe PLL update to finish after each write in unprepare
  too (review feedback).
- Add the UART1 and PCIe PLL clock IDs in one patch (review feedback).
- Drop ATH79_CLK_END from the binding header instead of growing it, as
  the number of clocks is not ABI, after moving the old clock code off
  it (review feedback).

v2:https://lore.kernel.org/linux-clk/20261110013646.1582970-1-rosenp@gmail.com/

Changes in v2:
- Post the new driver as one patch, instead of moving
  arch/mips/ath79/clock.c to drivers/clk and cleaning it up over six
  patches (review feedback).
- Register only the reference and CPU clocks with CLK_OF_DECLARE, and
  the others from a platform driver (review feedback).
- Describe the SoCs with match data, and read the CPU, DDR and AHB
  selection of AR934x and later with one function.
- Keep mapping the AR934x SRIF block from its fixed address. It lies
  inside the wireless MAC registers, which ath9k claims, so it can't be
  a reg entry of the PLL node.
- Drop the clkdev registrations, which have no users.

Claude Code (Claude Opus 5.5) was used while preparing this series. It
wrote most of the new driver from the old one, together with the
userspace test of the rate calculation. I reviewed and tested every
change and take responsibility for it.


Rosen Penev (7):
  MIPS: ath79: apply the QCA956x timer workaround in setup
  MIPS: ath79: move the bootstrap reference clock to setup
  MIPS: ath79: stop using ATH79_CLK_END
  dt-bindings: clock: ath79: drop ATH79_CLK_END
  dt-bindings: clock: ath79: add the UART1 and PCIe PLL clocks
  clk: add a driver for the Atheros/Qualcomm ath79 PLL controller
  MIPS: ath79: remove the old clock code

 MAINTAINERS                           |   8 +
 arch/mips/ath79/Makefile              |   2 +-
 arch/mips/ath79/clock.c               | 673 ----------------------
 arch/mips/ath79/setup.c               | 107 ++++
 drivers/clk/Kconfig                   |  12 +
 drivers/clk/Makefile                  |   1 +
 drivers/clk/clk-ath79.c               | 782 ++++++++++++++++++++++++++
 include/dt-bindings/clock/ath79-clk.h |   4 +-
 8 files changed, 913 insertions(+), 676 deletions(-)
 delete mode 100644 arch/mips/ath79/clock.c
 create mode 100644 drivers/clk/clk-ath79.c


base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.56.1

