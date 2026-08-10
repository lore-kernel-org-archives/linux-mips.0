Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FF62236F0
	for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2026 19:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390960; cv=none; b=a/AhqDH3R8o5Dx/LPPrwoCcObkF7mwMiaFiOg8ojnMji2qwJVL7EOAtBCPGgoyFRljpXXJ/yb7eH6ArW7z6rdSEWkfraCrWmD0IReX4RSvB9rw0ikyiorY5Bxa9aD/0nLf4EwZLxbMa5HC3MgWoTSiQn5AeD/nxkb1w+YERO8YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390960; c=relaxed/simple;
	bh=ivLu/toBesZnDcu5PR3r/U5A/PlpJyTfP1Kq/7WmGYA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=TX22CcDVLhnC6LlxxB3K3nKEypkaMOQSx2cdBDuRZqvri7/+kY5eYhurboseXWEQQVt3vgfCLX00+mE0jARg5zdDZKWodpPUZycCVKgfY4tttCA0tH45iK04J3oWapeXipnrqV/4DYCHX2+ve//P86zJPxwStMMSg38TueH3nvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3J/LJen; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3J/LJen"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15f020a223so339215766b.1
        for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2026 12:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786390943; x=1786995743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2CFecp1st7SCw1iqmiI6hGKB24VM/1GF4mkGVwlRlzc=;
        b=j3J/LJenz6ixCW+X06KaEZ7QmiT60DJVMEMY02gtEGtFEWFypCpUQ9E0mRk55ZVfik
         AKxUZ+1UfTJ6pto3HvAy4el8o6LAW2Yi5Yq1wa4jghWQAHkSZVez6IjuhY8coM25wNrF
         vEpCtct0BE3RmSdUJxgbsv/OltbKJnMDuLHClgz+VYsr0GgKAxwnCUG3FErfh2tg5U8w
         dCvRLpQeVYKpv6Zuxm+gt4hcAT7hnip8RfjrZrjZeff3UZDl4j1sbVfHJBbVKf8f4pTR
         eQJKY+riXbyJ2tB7mbmnrZcZqesurdbYn6VQrL6HW0QSi477tXgSAwgZ4hOee5YtOYow
         RcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786390943; x=1786995743;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2CFecp1st7SCw1iqmiI6hGKB24VM/1GF4mkGVwlRlzc=;
        b=J6Yyj3eOKiB1FNz/ZqBGKqWUmgIGRpUU9imrlp4gJFIr3MvFpK6KYHTplQ2elVlet4
         +pFfWio22Y1bUs9w7cwB/OqIOAbzhgPQpQ/HWdty5jWIY4d47RjH55ZWx1WdHRx9WR7Y
         xEfb52yxrr6urHLNIhAQpxHtuNeyRrbhPXez9ndW8Y+dlFP6bEYNPteLI1HgVbIzIE7S
         ePrXrqvMqZOWXGmAUwDfrNGHqxz9hxu+JybQZrliJK3baIjqmc1LFk6vIylS0RawPKwn
         L8riHRXkL6o3mmWUFgS2/QEXDyAJltJqm6HBBKg8OAN8bBoDKFVD8DoAe25r4ybt0/35
         2xQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqE12T/CnTrdu+p6lbkjyIK3yaoMQDpe9craH4xsd+9j2gmWmwcsWju+qgJxGBC4WMr8V10vq008oCt@vger.kernel.org
X-Gm-Message-State: AOJu0YyG7fxEsRCMXrIlNbc8rOAXGdNWdgcxh0MwOd2Hc0X7LPrrqOwY
	2I0+xQVJ7gL+55+Q/JuQY6X6ssnPhBe+OUHe9pskoRKMXkUz06aHwlPL
X-Gm-Gg: AR+sD11LxAuIUhn98rAi22y9zJ2Kqghj9rG23Zo7hfTdBHGxMN6b8Rsc4F106bEBQt9
	vlG3gHOt5igxqVFg8OJ3jd7Wr4E7sVzUnkcgFGIysaWDBdgA9QuOWTd9vSmY9kNgaklfIRKXZMx
	Bv50S/nWGYEm34MEvoUQVRCdiDaFF1Dt1ENO8jvc07FkxQf9s7vOb+jBCMsXbXzABxZGpB6AWSW
	W6OCKKsRm2KBAXVzyO7FdJPUjJPbiZODg8ghSEL9XAbrDfec0ObD4x9ELwX4SraZxw6JHbbWrFL
	FtOgMBlpbZ4ht4UuhTMqLSMIBEL484k32Q7OqwBK/S1LwR8dCYX/cSHCG62Uyqykl2y8HUVaFby
	/yKxF51ev4yygsjxo0/VdE3UajB45mJUeHT7/5aaHI2LHifFSA9UAkqQnBERfXSxmyW5345Kcqk
	OmAAZqMx1X0CaSiOgDQs/Td8f/0oroMznQyuRpbg5yaLzMXZWDeydFOMO47jfPO0WnQLAl8/jyg
	Bg=
X-Received: by 2002:a17:907:c719:b0:c20:af9d:4544 with SMTP id a640c23a62f3a-c20af9d5499mr565645966b.6.1786390942924;
        Mon, 10 Aug 2026 12:42:22 -0700 (PDT)
Received: from TurinLinux.. ([187.15.140.84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a6f414sm430309066b.17.2026.08.10.12.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:42:22 -0700 (PDT)
From: Nicholas Dudar <main.kalliope@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	tsbogend@alpha.franken.de,
	johan.almbladh@anyfinetworks.com,
	paulburton@kernel.org
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	philmd@oss.qualcomm.com,
	bpf@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3 0/3] bpf, mips: Add signed div/mod support
Date: Mon, 10 Aug 2026 15:42:12 -0400
Message-Id: <20260810194215.3754591-1-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MIPS JITs select division and modulo implementations from the BPF
class and opcode, but did not interpret the opcode-specific insn->off
value that selects signed DIV/MOD semantics. Negative operands therefore
produced unsigned results.

Factor div/mod emission into helpers, add the missing signed uasm
operations, and interpret the raw offset only in div/mod-specific paths.
On 32-bit MIPS, use signed 64-bit helpers for ALU64 operations.

The base, each intermediate patch boundary, and the full series were built
and run under QEMU with CONFIG_BPF_JIT_ALWAYS_ON=y on MIPS32r2, MIPS32r6,
MIPS64r2, and MIPS64r6. Fourteen of sixteen signed DIV/MOD cases failed on
the base and after the two preparatory patches; all sixteen passed and
remained JITed with the full series. A big-endian MIPS32 base/full
comparison produced the same result. Because patch 2 extends the shared
uasm interface, that intermediate revision was also built with a microMIPS
configuration.

v3:
- split the generic uasm additions into a separate provider patch
- propagate raw insn->off and decode it only in div/mod-specific paths
- keep the signed remainder quotient in s64
- add the requested short comments to the div/mod emitters
- refresh onto bpf-next at d114bb989367
- add intermediate-boundary, big-endian, and microMIPS validation

v2: https://lore.kernel.org/bpf/20260729162931.2369353-1-main.kalliope@gmail.com/
v1: https://lore.kernel.org/bpf/20260716211055.2569433-1-main.kalliope@gmail.com/

Nicholas Dudar (3):
  bpf, mips: Factor out div/mod emission helpers
  MIPS: uasm: Add signed div/mod emitters
  bpf, mips: Add support for BPF_SDIV and BPF_SMOD

 arch/mips/include/asm/uasm.h   |  6 +++
 arch/mips/mm/uasm-mips.c       | 10 +++++
 arch/mips/mm/uasm.c            | 20 +++++++---
 arch/mips/net/bpf_jit_comp.c   | 55 +++++++++++++++++++-------
 arch/mips/net/bpf_jit_comp.h   |  4 +-
 arch/mips/net/bpf_jit_comp32.c | 29 +++++++++-----
 arch/mips/net/bpf_jit_comp64.c | 71 +++++++++++++++++++++++-----------
 7 files changed, 140 insertions(+), 55 deletions(-)


base-commit: d114bb98936770c501c958bf2bc5fb6b7c0bad7b
