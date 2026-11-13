Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596921;
	b=Hu03BPDAJ/zhNiqFLWODuH/d4XkMy6LyAv20qB8M0TSZHfCOswwKj5pafNf8a0FzJdAS
	 dqRSTdG2clBYXkg27X+rCQxnTU9wdOkJjySuyzOgZNpXKX61mFBVIBYF2nsfyB7vyVpr0
	 JBky+JwGx2k1oO62dlOInYRdX2o8p2kIcdzv1tTsiEC0Ip1P/8s7QgK61equ/7+B8pyQW
	 EjBmLwEI6TvtTlDLyJZo2y0SCFzvTJ0UMee3N79icOIPfifyXEuaZu1/R8irUN/Gg9URP
	 HE9s23CHWfBLcgKU6O8WAwFf3/wjnPOqiec1td8twRF9LC/7kt5F9OA+EBAeZq1UYVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7zVRWdksbk2GmJApPG4YI4MTzgCoDOVGLlN4Rb98bD4=;
	b=mjF5s5dkuoLUsAPLxupzqwQ716AtqPSgXlNQJvlizyMvMoNfcShnzT5c2IGM8lJFkYfy
	 nuHBnMyavQBKSWQvjPGBHT2E+1oxHYgbEvW3zkG3ulY/IBJMxMQNqiteusXdVcX+QA7Mn
	 OS5WdKRTxvW8GFPztoFa1EpVAA1NJ43yKXwYEuFRPD8DKhosVqzK+7ojdxOhyzQ8IrscM
	 059mu5eRGvV/z81PEqC5/+Hd2+oUrQQtwB4csink2BB3+hwpwr26ufSZsYakSJJ0M/Zen
	 mm6DBEH4LIezqVz4pF0XLooLQ1i2zW+4jfA156nOhXtHkdrWjnD1fzWERGryiEwBtTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oi6n14bJ;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E079606A89D
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 19:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E079606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oi6n14bJ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36dbde64409so2038585eec.0
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 11:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596921; x=1795201721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zVRWdksbk2GmJApPG4YI4MTzgCoDOVGLlN4Rb98bD4=;
        b=Oi6n14bJsuA3MZESR2IVpCx1+TTNYhFtsSxeR6Rlc/yu4ih3w3su2fUaAAiDCICSHF
         lxpCMYkvk5kZMYo6LVjuR68e+p2CGzY+iMcOBvs1WBwZSUPFfmNE+Bt4uaLd/Iyr043d
         jL+yLtHUi7Yjzba1ksZmoNThvzrpL/ARk8jz7pRyEHZGfdE6yRPqLAr+TUILJZebSPn9
         2IBS4KyXPkjzPUPmMo2TbXpm3vnGOmYxVohRxSLOfvqMFURsv6MKanVa9YT9B9UuoHPH
         tkyMFjuJH0uBF455JpeLfAJRLK36xUvmXx//gkwEsYSB+18vt1GpaaZ0FN4QKjj++I37
         0+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596921; x=1795201721;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7zVRWdksbk2GmJApPG4YI4MTzgCoDOVGLlN4Rb98bD4=;
        b=mbBWYFxLa9rQ95lYABfhSCwTnSB20I2LSIzGABGSPVsmUNrDCh8T8N8EKOnQHH84k2
         MN/mF3pRgdUlH8wdK0f/LFd5jx6q+ZY2bqtyLuA7F4DChCY2x4bdFEkK3QO7D82Ifzz1
         zjspgb8p9Lv+B+K7WfSQszKosKvJCMOqqiCQld9IzDHq5QIZ94QGmS95x5NiXLPPd1xU
         XXYj9YrI/gxXNs2EYSRZsVSiOIafQIEwHCmCvw7jX+dMBMDAdaJi/7hyiqBvdhChxVUn
         3gWDycEwemIRF8W78JG2NrU7nZEpJqMo95jvn8jOYoNYmXVdG0EUT+bpqzFmblFyi0Io
         YeFg==
X-Gm-Message-State: APuU4Z8SPUzhZ1+aEZr/SJQCgoJI31d7kxvCQTdsn1Ebm6RhxNvFrodl
	j0uBDBjku3qxskyQcv+zrng2YK3QBizLk3IpvWxJUDXtMURRmJJS3YunxPLvhQ==
X-Gm-Gg: AYBFou3/6Y0TKX06ad2AUY/21iG3tBIb1Ss7p0AMqbUk1Mo9bk8Mf1kYHoxdAPEN0i4
	Pl56nHqm5//dJaGf/6mZSUhaLjFfJREMilwOlDNXUda2zum66PpNXZ5pF08QOrDHwgV6mRsKDt1
	kgYssOBEToUa28Pex8FMlmXZWZrBgiKIpdJmPEWzubMzIYrrYlk0+C6N57O9CBa7DOaX6G+x49O
	lr2ViEY0gps9oNuqNxhCUchUt50gVbVoB5s2oFPUJi1SpJwNWKOzbbS8UkkvQwF/tnCp0knhlCp
	rRET+1Yo6yUrCMToS5vTi1fKd+x9u12UZHpsPXiQNaTcF2TRaFeOvz+S+8HYaK8g6c8F0SdL0FH
	pa4orzI8yU7p/MWktsUMEFycdzHwyidU5X+U1a3HSQNVUC7LrsyVTWzIKt5AeXqJMfXhpECQN/+
	qAzfyYupHyGWmQ86yIYaJl4g1RGDBY31oAQClLwiIkuSCrIWunN4pdtH1q0rZ8S0bA2MTpmX06g
	Y6lC2gB2TDNMttbfpZd4QbQZGtxNtuINJBEDYRVtk346Qd/funWd37Frd0B3hYX+eeA8dj9Nt7h
	EW/L4q2Vfg==
X-Received: by 2002:a05:7300:8a19:b0:377:1bfe:14d6 with SMTP id 5a478bee46e88-37965f9d236mr2579200eec.6.1794596920459;
        Fri, 13 Nov 2026 11:08:40 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm15714037eec.25.2026.11.13.11.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:08:39 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v6 0/4] MIPS: CI20: Enable SMP with two CPUs
Date: Fri, 13 Nov 2026 11:08:32 -0800
Message-ID: <20261113190836.470937-1-f.fainelli@gmail.com>
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

This patch series resurrects SMP support for the CI20 board. This was
submitted back in 2020 by Zhou Yanjie.

Changes in v6:

• Added missing Signed-off-by tag to patch #2

Changes in v5:

• Added changelog per-patch
• Split the generic IPI setup check
• Added comments explaining both need_resched()
• Removed void Reviewed/Tested-by tags

Changes in v4:

• Enable the secondary CPU clock outside the raw spinlock
• Mark enumerated CPUs present and assign hardware core IDs
• Skip generic IPI allocation when the platform supplies both IPI callbacks
• Fix generic 64-bit builds using CKSEG aliases and pointer-sized assembly macros
• Reject unsupported CPU offlining with -EOPNOTSUPP
• Restrict the XBurst SMP idle handler to multicore systems and recheck
  pending interrupts after flushing the cache

Changes in v3:

• Align the second line of the readl_poll_timeout_atomic() per Brian's
  feedback
• Collected Paul's R-b and T-b tags

Changes in v2:

• Moved SMP sources to arch/mips/ingenic/ and the header to arch/mips/include/asm/
• Removed CONFIG_MIPS_INGENIC_SMP, using CONFIG_MACH_JZ4780 and CONFIG_SMP directly
• Renamed JZ4780-specific SMP symbols to XBurst names
• Changed CPU enumeration to assign consecutive logical IDs and removed the explicit two-core limit
• Changed mailbox IRQ allocation failure from panic to logging and returning
• Shortened commit descriptions, removed Codex attribution, and adjusted source credits and sign-offs
• Kept the clock polling patch and CI20 defconfig changes unchanged,
  added Paul's R-b for patch #1
• Updated the kernel baseline to include additional upstream fixes

Florian Fainelli (2):
  clk: ingenic: Poll JZ4780 CPU1 power status atomically
  MIPS: Skip generic IPI setup for platform-specific callbacks

周琰杰 (Zhou Yanjie) (2):
  MIPS: Ingenic: Add XBurst SMP support
  MIPS: CI20: Enable SMP with two CPUs

 MAINTAINERS                           |   3 +-
 arch/mips/Kbuild                      |   1 +
 arch/mips/configs/ci20_defconfig      |   2 +
 arch/mips/generic/init.c              |   3 +
 arch/mips/include/asm/ingenic-smp.h   |  20 ++
 arch/mips/ingenic/Kconfig             |   2 +
 arch/mips/ingenic/Makefile            |   5 +
 arch/mips/ingenic/ingenic-smp-entry.S |  54 ++++++
 arch/mips/ingenic/ingenic-smp.c       | 260 ++++++++++++++++++++++++++
 arch/mips/kernel/idle.c               |  31 ++-
 arch/mips/kernel/smp.c                |   6 +-
 drivers/clk/ingenic/jz4780-cgu.c      |   4 +-
 12 files changed, 386 insertions(+), 5 deletions(-)
 create mode 100644 arch/mips/include/asm/ingenic-smp.h
 create mode 100644 arch/mips/ingenic/Makefile
 create mode 100644 arch/mips/ingenic/ingenic-smp-entry.S
 create mode 100644 arch/mips/ingenic/ingenic-smp.c

