Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771936;
	b=K78F6VPqB5F2oOvosQc9SKEby1j+unkoKAwMD6RZAiXC2xoNdOiPY/9p+av2lgvYzuNp
	 uQB/NDd2CdSmIl20mczjiMXlI2ZL7hsOtdG3vKTrV8OyWTo9iopohP3qmcRIm3xTsz0A7
	 Qhmo/V8xOfc9SPpPzIohG3VhZ3DjE2L3dtwN0pnFJvTnL6IA+fzrBBEdnbgdlM2O5lLqT
	 V7rDcAD/r/mkjs1JVzM/XH+tJeQJpttF3asOAertn3u5KxPh0kLeHuE11+jV0aAlLMqBw
	 hO6LTOL/n901gEzhKnMcoS0DQMHWuqLDlWfUUC3WeGHjCbiSXWDRX0/QTBNaiwjNO4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9xIvMSl489GZfxwmphM8YUW4yrYariUf7f4sziVKnos=;
	b=DCbALl+ULOrOkYeBPYmphHCenRNi2lkpjIssTYDHxgfGBe3kYdOEuhhLj0oKQuiDyQV3
	 yjVIVczW8McvY5bmHW0GAM4ut678uDCgMq5TjY7HC9JeyBUP9sTqbRJ6YjFkkkOr2tuZ0
	 JVRDqd6svXgQTGnEAFtCROXjsbvVxiT4oc8zQVCjQvddmlCvq7XyoWAL6AvdRngNMG9Bt
	 n7AJj1Meu+1sY8pUT14tgjELlV4aRKmZ8wl7zuGXHJ7JdWD2mJGK8rkPfNxRn8vyBirkP
	 GGgfNIYoOk/xN9FwRS/utacbLDCPRfVGslRdmJhH3pBeY+HNVJ2CxYKghD8xQ50/ckQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8aLuJtt;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3683606A32D
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 05:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3683606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8aLuJtt
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae702d28c4so196324a91.3
        for <linux-mips@vger.kernel.org>; Tue, 03 Nov 2026 21:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771935; x=1794376735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9xIvMSl489GZfxwmphM8YUW4yrYariUf7f4sziVKnos=;
        b=J8aLuJttePqvSGqoTtP1+p1z2IPE1DvFVdTunuPA2iw1VGMGh6t9sc7CQsJ8iMR6vA
         wyTmTQ3jWAhV51uB7jclKCs4WhNNSbpPJX0VLcEfYUSgm8h4WqF2W4rlCGimATh5KLpy
         FacvMpAMOx36KEre6UONSpxtmTSvko6Wpzf/syW18/pqfcN7t448/DtZNxuDmfJtX/go
         hZ4syqNqw66Guk6J8GGOC+wSPXvE4buhzzfqGxn+inHzd+F9oGoSA2QDLsaJejiLnl3W
         /mdfVocrBCmLJdcs8jA/17X0++i5bDiei7jWyDgJaRn1lMX98ETHRf/8obeVxExvaG1M
         rUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771935; x=1794376735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xIvMSl489GZfxwmphM8YUW4yrYariUf7f4sziVKnos=;
        b=Q78AbVfjoC2XXHHQSWi51k/o+4s/C/YHt6degY7L3kw5EqC9lIXyRSGW5IvY8TZIyw
         vvwZHp7v3W/JcUM+vSUhZ2lx8n788CZCwobHep1HXCvJj62sGDrQlvwPA+B8MKnaRSUX
         5l27Frolfiihx9p6qGHh5MkoEXt40qCgkFko48K9GHVCxzhonC9Qx6WCK3UITU3vrl22
         d4hKd1A03TptnrXX+UdaMhsXKJXD3SaJqCdVGO4k/gCyIsWJI/eCP+qI94xNXjjsiim5
         RXj+f7+ST5jTg8R7JoPbpf3GGk47dTAf1RhO3EzVO84qHaV00x48Jp00oVK1RFfiIJcI
         f38g==
X-Gm-Message-State: APuU4Z9hDIlIl3kb3hGCLLkCivUTjIbFvn+0ErQPqfmJ+z8M0N3eG7PV
	E8JI7dUO58ihsJIAadZYUcxOZQLz0zCU8ytrgbTI+epoHUEZfB4QAaTAdGqJtw==
X-Gm-Gg: AYBFou3LoBeORMesSoW1xJlWiDEPlr40bRaluEx6cK9m8MAiN1y5/DmQjGRwyuc0kcT
	NxfzeUUGi7Vsug5+dNlqt8BRDnSW5uW6zs30DdFhzWlo+KNdPfAdlHuc2T2wrmZgaFkVM6a9NaZ
	raHlP1EtRq3PsvDbws82+6cxz/m4LjitzCFH0wOrdTCx7QLYuf+VSEAvkzV92MXwGmCIrdnntzX
	P97WfBFoANnIsQ7MDdstMYwhAGiKhNkb7W43WaZjPBFvkaafmhjorwbwISbFezea+YoRPZ2+NyA
	J3XB/3ll7hxIunrQif0kUWQpqaK4HEtuECvG1ghP6Pi0d+b0eNwfbyUJgjfmxNJ06KYnp5jv4c6
	VJJBwXmQokBHGHdMsjnGeRxRDFW7Pqi4izXDuJ8HskX0nwGgApVTVv95IM8VkOhlQ072ZC0WPn3
	hNTBu5Vfr1RkkyTs5PiBDwIKTAI8Qe35ffiSiXQbJn++sCcNOHT63WU2+ro/5nmL9FHhE5CGpya
	HjezhcMcZLAdjvoIH/ZUiyuNGl+9y5eg1sbABQKIh6BPHheq38oeE16P498D9qK59KHW5lYfasM
	tIyP51XCxbouAONoxDEa9dLUTkE+XwGCk5DGOrrU+Em3Vx+575auJ0eklRfKGlW9gSntrl8bbi/
	XKcWJG1aSXGkGwLmyekVdi0ggWEGpQjjA9tPghJUXQ4DqwMz60vnfJonhhA3FrQP/bGJyXDLNUw
	K/OA==
X-Received: by 2002:a17:90b:58e3:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3ae897cca98mr12127224a91.14.1793771934974;
        Tue, 03 Nov 2026 21:58:54 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7840110a91.15.2026.11.03.21.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:58:54 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH 0/8] clk: ath79: move the PLL clock driver to drivers/clk
Date: Tue,  3 Nov 2026 21:58:44 -0800
Message-ID: <20261104055852.152340-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The ath79 PLL clock code lives in arch/mips/ath79/clock.c and uses the
arch headers and ath79_reset_base. This series makes it a normal clk
driver in drivers/clk and then cleans it up.

Patches 1-2 remove what ties it to the arch code. The QCA956x timer
interrupt workaround moves to plat_time_init(), and so does reading the
reference clock rate from the bootstrap pins, for boards whose device
tree leaves the rate out. The arch code also warns when a rate in the
device tree disagrees with the pins.

Patch 3 moves the driver, with copies of the PLL register definitions it
uses, and adds a MAINTAINERS entry from the qca,ath79-pll binding. It
stays a CLK_OF_DECLARE driver, as the MIPS timer needs the CPU clock.

Patches 4-8 clean it up:
- 4: use GENMASK() and FIELD_GET() for the register fields (the
  generated code is unchanged)
- 5: convert to clk_hw. This also fixes the AR724x and AR933x clocks,
  whose parent was looked up by the name "ref", so they were orphans
  when the device tree's reference clock node has a different name.
- 6: fix the error handling: an unchecked ioremap(), clk_put() of an
  error pointer, and panics or BUG_ON() where an error return will do
- 7: one init function per compatible instead of re-matching it
- 8: share the fractional PLL calculation, using 64-bit maths. This
  fixes a 32-bit overflow of the QCA955x DDR PLL rate whenever its
  NFRAC is above 107 with a 40 MHz reference clock, or above 171 with
  25 MHz.

The series touches both arch/mips and drivers/clk. Patches 3-8 depend on
1-2, so it would be easiest to take it all through one tree with an ack
from the other maintainer.

Not addressed: the QCA956x PLL formula. It ignores the NFRAC_H field
("hfrac >> 13" of a 13-bit field is always 0) and divides NFRAC_L by
25 << 13 instead of 2^18. Mainline U-Boot has the same code, so it is
no independent check. I left it unchanged until it can be checked
against register values from a QCA956x board.

Tool use, per Documentation/process/generated-content.rst: this series
was developed with Claude Code (Claude Opus 5.5). It wrote most of the
code changes and changelogs in patches 3-8, following my review of the
driver and my requests, and reviewed patches 1-2. It also wrote the
user space harness used to test patch 8, and it fetched and compared
the U-Boot sources for the QCA956x formula. I reviewed and tested all
of it and take responsibility for it.

Rosen Penev (8):
  MIPS: ath79: apply the QCA956x timer workaround in setup
  MIPS: ath79: move the bootstrap reference clock to setup
  clk: ath79: move the ath79 clock driver to drivers/clk
  clk: ath79: use FIELD_GET() for the PLL register fields
  clk: ath79: convert to clk_hw based registration
  clk: ath79: fix the error handling
  clk: ath79: give each compatible its own init function
  clk: ath79: share the fractional PLL calculation

 MAINTAINERS              |   8 +
 arch/mips/ath79/Makefile |   2 +-
 arch/mips/ath79/clock.c  | 673 ---------------------------------------
 arch/mips/ath79/setup.c  | 100 ++++++
 drivers/clk/Kconfig      |  12 +
 drivers/clk/Makefile     |   1 +
 drivers/clk/clk-ath79.c  | 593 ++++++++++++++++++++++++++++++++++
 drivers/clk/clk-ath79.h  | 140 ++++++++
 8 files changed, 855 insertions(+), 674 deletions(-)
 delete mode 100644 arch/mips/ath79/clock.c
 create mode 100644 drivers/clk/clk-ath79.c
 create mode 100644 drivers/clk/clk-ath79.h


base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
-- 
2.56.0

