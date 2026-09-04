Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AA3413789
	for <linux-mips@vger.kernel.org>; Fri,  4 Sep 2026 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520666; cv=none; b=p7cUbpC3sHVP3vMLakGUnEfMCvwEQPPIUOAq5AKQW8F3kTLuAteKAwD+H5lhzDOLEy/laSbqPKJzIr+PUoZbTa7PmI9BbR86V4MOPFCeIyLTg+K2LnDNWzKoWnRR6Fq4uispeUGTVmRYOvQTOJFwWSkoRBBPCovY2zCY4iLoYf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520666; c=relaxed/simple;
	bh=E9dAA287EAa796HT4oYolBExrYvudPnFnaT/QfU9o4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KJg91mYTY3RBdXehQVowI16CrFwyzefty/MLxMDFLJsIV378XrIhCYHwPcCYA69rqsiXMdCMd97X8cxeBLHtoy+ZI8MZANiwjqgycNeDFKzHaoTMVahlGUQJfkpMCdTSMsy2MNz4Q++nCI238BA99HH9lP8X/d21ZdxzZ9czK/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/utvK+h; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/utvK+h"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5218927884fso15745841cf.3
        for <linux-mips@vger.kernel.org>; Fri, 04 Sep 2026 04:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520663; x=1789125463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vafBG36yRum0S5znHILZDEuOCiOJO9YS/m791zdYti8=;
        b=c/utvK+hg5+xJriXr2VDSUAk4ud+Awsz6Xqs/9RzRkFMm5Fbbj4a6voiPTcAfZMc8S
         TPTr6m9n+olQSmWvKHMoTwd/S6dVj5AhzdyKR2iq8pmtg3sVFrf0JbXo6a4SQT3REXdO
         LC7vhPZg2XZczUehwOKbwS9oW/u68zvWKvHmVf/l8FSRNbaGUjRS1bo4wIEXtKl8kkbe
         rzOk0uCgSSXrfe9GCcOrKQi1RyXCV5DIyVdz0/wlzlRk1tZecBKlgurZgkxMgLy8VJAp
         CJsii1xlJvbOJYpvO2Uyc/4ogOyD/1dBBBh0Zu/ZWEcMoS7/aPNn+TORoOBVeZVzYH0X
         031A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520663; x=1789125463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vafBG36yRum0S5znHILZDEuOCiOJO9YS/m791zdYti8=;
        b=axTubOHwUXroMoCItQfpth+rloxsLefs+g8ogpJZhV4o9x2sJyAZi5n91zkc9krZPb
         Gn6kSfZRTuXEA0diBb9QuThAR8nb6dzEpmQb93krcBcfVtPJ/PJFFuxz6sQz1OK7Csbc
         FmGw0ABVsnw6uNqpvIgXgZqEYH67oYF5Y7rhOPRrBsNSAOxRg9CBHrftKbVZcTZspbBV
         jN/rmk0H9bp3BlLwESeTJ3pDQfbaJGdC5T16pEfI4faH7L8dBStBzCD+Iu/I/4mMKbMU
         fucO+J8m7IcHciA35oYJURWHRsz1xLnpPlp9T+KrPH4ENw7bx2zDXtZOkdVFG81V5Bvc
         EiMg==
X-Forwarded-Encrypted: i=1; AKwUvBzP+kRG/g7M0g5/zevmykGA3Lf1yoCynMR91bOxNKX65XECXSlTdl4QhmzVCPkW/SfA7AkvpFxaNUSd@vger.kernel.org
X-Gm-Message-State: AFuF++kPAk6SLdarDkkQhApz9bK8mpTjX3A0hAkBK2F51kxn6eZbzDuq
	5cl9kNcE98JFn9K4ZVKVVfUArBCriW7uU3zDy6PJ5SE6KAEbbpz1YYIw
X-Gm-Gg: AYBFou3b0q3oL+l+Ovocv7EEWhk8RpbM+HPdACmmmE8RC3/oA2tQFy2OlhlZcPbfWgL
	a/8c9ZiZ35H8mXguT3VZcSoqO4+IJstAipIl3PNh0gCLiSpMUxtjBuY1LH57wrc7Ywwq6M3ZIg2
	6WZLX9kNXaCjb71DHJgoJUCxQM7gQxngufebZBOpG6fXHpsX8tQUDMorPycDClmq8PXrZp3Wybr
	Fm+Ji99KAphufa8007a7bFBvbRa2eTsW0wlOIZZIdgMXBZXsL2pulZTEB6cM+UNdj6l9D4AU/Xq
	WBtlHrJoWEboo6pdOBEceh60gAOVW2nedrTuygArhqEhNaHAsh2c228HTKLLa9ndE7C2grQM/Ak
	5OCqyBGHMpN1nF9YIgYr7lMzgGJfJThHTpwJ6NIEXWFSB767VDgqHWWxR09M1TINuvYUXgy2pjj
	JkrRv+O0NeHHFO/cAUlzulyu0V6xMdBWn1qBjkmap5ajFPWrQeNzJTZt0X
X-Received: by 2002:a05:622a:144b:b0:530:430e:8f10 with SMTP id d75a77b69052e-53054a34eb9mr50348541cf.47.1788520663162;
        Fri, 04 Sep 2026 04:17:43 -0700 (PDT)
Received: from Turin ([187.15.144.163])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305402a8fcsm18350171cf.1.2026.09.04.04.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:17:42 -0700 (PDT)
From: Nicholas Dudar <main.kalliope@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	johan.almbladh@anyfinetworks.com,
	paulburton@kernel.org,
	tsbogend@alpha.franken.de
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bpf@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2 0/2] bpf, mips: Add BPF_MOVSX support to the JITs
Date: Fri,  4 Sep 2026 07:17:29 -0400
Message-ID: <20260904111731.673341-1-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MIPS32 and MIPS64 JITs lower register BPF_MOVSX as an ordinary
MOV because their move paths ignore insn->off. The instruction is
therefore silently miscompiled instead of falling back to the
interpreter.

Patch 1 factors ALU32 and ALU64 register moves into backend-local
helpers. Patch 2 decodes the MOVSX width from insn->off in those
helpers, keeping MIPS32 register-pair handling and the existing ALU32
upper-half paths inside the move operation.

This is missing architecture support rather than a regression. Core
MOVSX support arrived after both backends, and the analogous RV32 change
(c6a08afdfe3a, "riscv, bpf: Add support for BPF_MOVSX in RV32 JIT")
went through bpf-next without a Fixes tag.

This series can be applied before or after the in-flight SDIV/SMOD
series. Both are semantic prerequisites for MEMSX. The ordering
discussion is here:

Link: https://lore.kernel.org/bpf/CAJZwKkis=3NGw9At0WfiZaRYEoMPbQfqJKN0e+vtRDvp4VY5Ng@mail.gmail.com/

Targeted MOVSX and MOV control testing under QEMU Malta covered MIPS32
R1, R2, and R6 and MIPS64 R2 in both endian configurations, plus MIPS64
R6 little endian. All 180 runs required the JIT and covered the baseline,
helper-only, and final series boundaries.

I also ran the complete unfiltered lib/test_bpf.c suite directly on the
final v2 candidate with CONFIG_BPF_JIT_ALWAYS_ON=y on little-endian
MIPS32 R2 and R6 and MIPS64 R2 and R6. The MIPS32 profiles returned
1036 passes and 26 failures; the MIPS64 profiles returned 1035 passes
and 26 failures. All five MOVSX cases passed on every profile. The 26
remaining failures were 14 SDIV/SMOD, 8 BSWAP, 3 MEMSX, and 1
JMP32_JA case.

Existing lib/test_bpf.c cases exercise all five valid MOVSX forms on
MIPS, while verifier_movsx.c covers the generic verifier contract.
No physical MIPS hardware was tested.

Changes requested by Johan Almbladh in review of RFC v1:

- Group the 8- and 16-bit cases and compute the shift from insn->off.
- Move clobber bookkeeping to common emitter tails.
- Avoid early returns and use emit_sext() for MIPS64 MOVSX32.

Other changes in v2:

- Document why width decoding belongs in the move helpers, the supported
  ISA floor, and why other MOV offsets cannot reach these paths.
- Run the complete test_bpf suite directly on v2 on four little-endian
  ISA profiles.

v1: https://lore.kernel.org/bpf/20260819010523.1057789-1-main.kalliope@gmail.com/

Nicholas Dudar (2):
  bpf, mips: Factor register moves into helpers
  bpf, mips: Add support for BPF_MOVSX in the JITs

 arch/mips/net/bpf_jit_comp32.c | 60 +++++++++++++++++++++++++++++++---
 arch/mips/net/bpf_jit_comp64.c | 56 +++++++++++++++++++++++++++++--
 2 files changed, 109 insertions(+), 7 deletions(-)


base-commit: 6655c409707ec8ce9ce0850ffe4fe02331fd4d9c
