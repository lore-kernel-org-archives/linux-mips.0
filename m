Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762095;
	b=k7W8/6qa5YnMOm/DpoLTzgxORetmp4+e/kReXb/qvvmiCTKP2b4hZp4+q8yPypAKQegJ
	 cFf2unDstEN4yUz1TFWTa7rFFCTcm/SAHQxEhxQ2YVGki6zmlpx03fXBsoG+Ffpgg7e8q
	 hXyqxLueHaA3jYy+57ZAylKcHcYHIU4dyBDwSzbJ9356rTrtqYpFONJEdeIp9nSZsl5kp
	 nMUTNnvYc7BTByxbhyKdd1Qly+KBb8xAGsHQWdpNcxFuxLm1kTp5JRzSaPp98sA75odmN
	 biGH5mVXIGD8meVF/4vBzliLi2KLwGODGgjFpmPHZeQazIBpoqFpIWxHwa0Qp7OGb7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4/xuQKgFmax+PlK8RsrrP9CtynouzaCSXzHEkLVU8HA=;
	b=PeQMXCv9sDM182qNabShaK4ANXi2xq1my+UjHgj7omNO/T8KwNhmYb0wcCR5CdTZuWlO
	 QiaU/hDOhloRLNg4LTjCmEhbkBDu55eaVxoPPhIS9JLGtAtc8X0GBGDSqJmybswE8g1K6
	 eHnWG/PwNdb2MCevFlWe3NUPG4j6Yvn7mM0APD5hyvT24g1/Zi83e83WdH3v0DZC9R1nS
	 87OC6c+1KcrJJ1S2ny7Z/Bw+LOq2feWOkOL+g8NRcjZUCSQQF4CuXEf0xLkqUN5wp6cKX
	 Z/xuOOAh3y1YrEtnvVQd67PcqDW2nny2mflgXYVij+szU+B3SrLAm7C+sh+H7T2+k/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=GaPAMHpr;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B66606A332
	for <linux-mips@vger.kernel.org>; Sun, 15 Nov 2026 17:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73B66606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=GaPAMHpr
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so16570655e9.2
        for <linux-mips@vger.kernel.org>; Sun, 15 Nov 2026 09:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762094; x=1795366894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/xuQKgFmax+PlK8RsrrP9CtynouzaCSXzHEkLVU8HA=;
        b=GaPAMHpr42ecy3Yixz8307T4q2uhyPQNdYB3zqdnsxzbCfPV03222Tb+bYULUfSiId
         4hvrNFPZMR9Q6OT77poc4sDVLKWR/Tt4ETs8UyIM9nBb5hsQsIOr5CqVjtxf0N+kji5u
         yAHTgf9r40XzS36rayLBQKjL2MVY1SDeYPXz6WjZn5baNyUBDLOsIk+2TqgqZXDT+HXR
         B0Mg9e+xLJrrU4CaQLjZlZ9K/U1BWZ/cMYzSRMSCmdRkxwbU2HVxNpZQ+UdcBjKDKiRw
         BaC57U3e+v7hJkNAHT9mqOoMCEs/idnx7sDnwDTM3aGi9CIfMgbp5JP7F1CUbtbivIi7
         cMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762094; x=1795366894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/xuQKgFmax+PlK8RsrrP9CtynouzaCSXzHEkLVU8HA=;
        b=auW/tS+DzCcYdmPbgpM61IO0PvMgY0U5eEeADQ1jOhA+S9+27QLWC2oO1h+ORj3H9s
         rW1gGrVetnqTJd1+DO6GQ9OpcDikEG0L+s1Ofm8BwrTe5eA0OsWcxavubEZoIMhl4I38
         XDi3zPInKYwpyudnpo6KnmALGaKEIcE4Ug85MVjOv7XfcHdJkamRMENYgl8E6oi2NTlN
         Bb0qO7thVozWooeIQvykTWZa1x+CTPeg60pQX6I93ODn4+BVc2Kl2JMV8S94JPy+jw2r
         6vKm/hQnkMMsQ955ycf3uH478ZH9uoDSTOBcZPi/6MLgeuE7RucauOdQQINj4PtPI2P+
         8SEg==
X-Forwarded-Encrypted: i=1; AL+hErEtRcPCrs4BGClSgiA7Dj35m/lGXnR/ludrLgCMcK6d9GtUjZORkWTDiqCM8H5fZWfo09mn6M3Kiq0N@vger.kernel.org
X-Gm-Message-State: APuU4Z+gD4fT8UpZkFZGVTNFMhO9S8fX5E2VdeA4GdFUDIaAoGBiuV5M
	V//KyTTJ121/Xumhvy9VAUDKN+bx9WYMhOfhwsWkXiznlGu3dFpRhekXgGivbNPIu+w=
X-Gm-Gg: AYBFou2499Izs2kHTYQQEKis/8/NaUfae1LxpgLWWlRH8gmDhOH8vTG1Fx+7ZySnXHy
	5IL2gG8EEe1/0yqOkoqbi635Hwf+tPOeMvkd9+1T/2WbE/Fs9bAOFEhzI+fDr5gKN9BYUM2y7QV
	o6thDgzNKOoUsBxJ4rL7pv4SAVBmfwupcddN/qJTbQQQjEzZGtBzYlk+SkQ+0TKGkydfkmtPePY
	BAO3heYZYgvMCkS1MmClh4gGg1E87i12Jr0RLHhD1jlZRXPU8OBKQ8msha5WzkSol8hkBreHiki
	u9P3P0z02vLersI4YhJGEx/M1p+/dDWE9TKtydGE58jpzNKysZJe8egGjLYVDLKpZlUayyi9YPP
	jEOHdwaGXZDhEzx+kgSFEAo2jVxFPMVqRjq5yrFDxGcwR4aFWLE5sCMF/vMYQtfrd2dN89DAS5g
	c9HbOcQKHIwTdONrlu8WAHuLtHP/pPtZV/qwaPIZbO27Uenityol14Ytxz7LbD/86yj3psT96h+
	D/CTBQkddj3dfApENUaev36+ogw44sCTUJB2LthJvYxZjvy1tclCSwFOQVJYrxvcRYGG6vpyhn2
	F/ekaNoX55W1zISxlWK4zKsskP2z2J94LPQn3OrGCUfV2kf8Emph9SOQxpHAGMeLO7RZ4jEurvZ
	lTLW823KM
X-Received: by 2002:a05:600c:3b98:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4bb55a8c128mr180753495e9.25.1794762093849;
        Sun, 15 Nov 2026 09:01:33 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d673ce75fsm11599174f8f.55.2026.11.15.09.01.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:01:33 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
	Hunter Laux <hunterlaux@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Paul Boddie <paul@boddie.org.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org
Subject: Re: [PATCH] MIPS: ingenic: Work around stale L2 data after DMA on XBurst II
Date: Sun, 15 Nov 2026 18:01:32 +0100
Message-ID: <20261115170132.24780-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <988F3625-C300-4C68-AC70-E371E5D9A496@goldelico.com>
References: <20261111-mips-ingenic-l2-war-v1-1-0d9dec232a7a@gmail.com> <988F3625-C300-4C68-AC70-E371E5D9A496@goldelico.com>
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

Hi Nikolaus, Hunter,

On Thu, Nov 12, 2026 at 11:24:40AM +0100, H. Nikolaus Schaller wrote:
> Maybe the individuals and teams working on the XBurst devices should coordinate somehow
> to avoid double work and potentially incompatible fragments?
>
> E.g. by describing which hardware is available, which topics/code patches are in the queue etc.

Good idea. On my side:

Hardware: a HiBy R1, an X1600E music player (480x800 RGB panel,
CS43131 DAC, AXP2101 PMIC, SPI-NAND, Wi-Fi on SDIO, Bluetooth on
UART0). It runs mainline from its own flash.

Posted and waiting: i2c v2, PWM v3, serial v3 (binding only), display
and panel v4, cs43130 TDM v3, the dma-jz4780 fix. AXP2101 v2 follows.

Not posted:
- CGU and the X1600 USB PHY: yours, as agreed. I will test them on
  the R1 when they are out, including the 1 ms wait after POR
- MACH_X1600 and the R1's board and dts: I will rebase them on your
  MIPS series and dtsi
- the X1600 TCU and watchdog (needs rework: the TCU is the X2000's)
- a driver for the X1600 SFC (SPI-NAND)
- MIPS kexec writing the new kernel back from the caches, and keeping
  the jz4740 MMC clock running on an SDIO host

All of it is in kernel/patches of
https://github.com/mgcrea/hiby-r1-linux, on top of v7.3.

Thanks,
Olivier
