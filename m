Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBC332AAA0
	for <linux-mips@vger.kernel.org>; Fri, 21 Aug 2026 02:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787280619; cv=none; b=fcLyy1yjwyUJKr+2J6tD6JORVoX/YHg7XN1iPUUOTBGZHYbVkg50L5gEKRq17vHw9FkiPq4b4v7lgNG+Op1ZZC0MG5wdEvaqGgr7soNu0HYW9QgInkrAtvbSy8FknzidK5JzN+yY2DzSxIMotsqfp4lNYoFuqBJ86FMVZuQFNRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787280619; c=relaxed/simple;
	bh=NZiy0I0LfKDGdP8gcLo+2A+fnvZn6aM2d+SsTHj3iko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IemxO6Swq94RjT00NpjpzdFKuoGgQa7ei90Bh0/+YiMYAvjRkNN6EV2xeiFtJfJfUmNOjaefMYWzvdeyRiPvJdHVLqKTNFdM8pKrTxVOLfKbsMDbRravIHsQG00ZdaN/01OQvGpowY8FUMvXaQopzYoAt2FVy2zT39lfllziUJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvjshYz8; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvjshYz8"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6688acd1a51so849637d50.3
        for <linux-mips@vger.kernel.org>; Thu, 20 Aug 2026 19:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787280617; x=1787885417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ow8qo7sHcSx/W3utHs5N9xZe+w2Vs/hGwVJrOJRCERg=;
        b=BvjshYz8weIHb9vHeagK4GZ3yQgGRbWkM23zxLFchzn32CrEnyNFiG1zwcCw9J96Za
         pyOyWOJThaqLPuMpoOYVxmRptx3IYZkCNo/3IblJ0zp5bKwXuxqssjBqV86w0CV9MMKz
         RH+VP8gUrPGiTIVsQJ04i9289kp3SmVoCxnH2CKs2nyLvUixQObREi2ql1mlNdVMuFD8
         Yd8N3paZ9DF/NvgkmOXMvnTpItHDPsUd2AHryGkQp+xmdfMsFGYwYhvzNricg/lwTFmv
         3r0OmgjFNI5qwk3+ElCFKplzR+8ynp6ZydEI/LDpE9PWEWoUw6blfK6/XZo04kCM6DTK
         WrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787280617; x=1787885417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ow8qo7sHcSx/W3utHs5N9xZe+w2Vs/hGwVJrOJRCERg=;
        b=BvssI5mfZh4kmDxWZwjpppq6M2SukgDDR6XsPVnoj9ycGei/yqAIy5Y6iEulEP6t92
         tVgikGDOtrBrYFM/etnEIr+MdwRBbiXKnfoFlR/Yjqzz2PRdxOSXyfL+NAwpENKvy1me
         j7LfTt+meoKIbrZbb+3XEm09cMvfyKtZKthOCDnuPh6jZWxpkp64Nc97VMMxJIqn2POz
         XF6TdpJgD2XWZFgyd7ZWrQf6kbKUEjKRDr8BNHw8vDIoR4OyhLNvV2uR2qFyeHrYxGpw
         4SORKB/QJQjkY1QSLEnreGoAM7ptWM/MhKJiV4bNCTtZcmUCMFr6pCqR0fWC5zTR9cAx
         2LFA==
X-Forwarded-Encrypted: i=1; AHgh+RrciCL2z/yuQw5I4eVI+vOjhNjM+QU4S5TyBjjwz+9KMz85R2J4e9bcPHmUUV5GttjGj4AsIODbHH+P@vger.kernel.org
X-Gm-Message-State: AFuF++l0Hehbidd7NEcra+nOft6WjdkVja6V/1Fmy3F5oXz7+vzHMO3Z
	59xtY/HsVuPMzx+LJeRaaPo95Lb+2KxukDnszN4y2K0iTJ/5h3Ep3iNw
X-Gm-Gg: AR+sD109LS7RGeVXyZqBpbQ4jmwvaSwpLWZGcxpdLjggd2z6rcwwz6se3m8piLlYGyt
	s7cIYnKkeIY8/vXpsph+VfuOZGhas+X4ViyOA37YaLIgW6HbTYGZTIlywOtKRWRc8bGrP9V5AmX
	hhQDakC6sEAIer3DrH8f+gSBhPddrDb1NOHn8cJ6mR5ebQ2rlIyd/kXNQYvg1GgTbGLV3NfRnu9
	EZ78hwzI2nA4zjZiLrv32LM0x/ZqB3X5a/04zhR0q0cFVRlZozTRrGYpWLvQZ268lyt2bqBwzwr
	PTanfKpCcNtPFwVLKDL8jAsVgQic1Vm7c0T2nUUyVesKOX7dbRhf4RIOgZvHTI9ZiusQNIzJhGv
	Yi0tFu4NkuFOYoUBUJj5sIrhNmtEg9juxyUR4i180PbFKdJhIRErXJS35pXigrn4znO2NxTEErw
	98Rj/R62cRGM2/2GtW+ObMoMGsMRGgk3Y1esct3BZ3LK1pcPCDI1Zdq7tU0g==
X-Received: by 2002:a05:690e:702:b0:666:3df9:8643 with SMTP id 956f58d0204a3-66ce4a10b1amr1040646d50.19.1787280617165;
        Thu, 20 Aug 2026 19:50:17 -0700 (PDT)
Received: from Turin ([187.15.143.241])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66ccb144956sm3682195d50.13.2026.08.20.19.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 19:50:16 -0700 (PDT)
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
Subject: [RFC bpf-next 0/2] bpf, mips: Add BPF_MEMSX support to the JITs
Date: Thu, 20 Aug 2026 22:46:38 -0400
Message-ID: <20260821024640.1601299-1-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bpf-next is closed for the merge window, so I am sending this for
review. I plan to post this series after it reopens.

The MIPS32 and MIPS64 JITs reject BPF_MEMSX byte, half-word, and word
instructions, so a program containing one cannot run when JIT execution
is required.

First factor ordinary narrow-load selection into backend-local helpers.
Then extend those helpers to select signed native loads for BPF_MEMSX.
MIPS32 observes the load-delay rule and propagates the low-word sign into
the high half; MIPS64 obtains the full result from the native load.
Ordinary loads remain unsigned, and BPF_MEMSX with BPF_DW remains
unsupported.

This series must be applied after the in-review MIPS MOVSX and SDIV/SMOD
series:

MOVSX: https://lore.kernel.org/bpf/20260819010523.1057789-1-main.kalliope@gmail.com/
SDIV/SMOD: https://lore.kernel.org/bpf/20260810194215.3754591-1-main.kalliope@gmail.com/

Applying MEMSX removes a whole-program JIT fallback that otherwise keeps
mixed programs containing unsupported MOVSX or signed DIV/MOD out of the
JIT.

The ordering discussion is here:

https://lore.kernel.org/bpf/CAJZwKkis=3NGw9At0WfiZaRYEoMPbQfqJKN0e+vtRDvp4VY5Ng@mail.gmail.com/

On four little-endian profiles, patch 1 leaves the complete test_bpf
results with 1031 passed/31 failed on MIPS32 and 1030/31 on MIPS64.
Patch 2 changes the three MEMSX cases, yielding 1034/28 and 1033/28,
respectively. Ordinary unsigned-load controls passed at each boundary.

Selector-focused QEMU testing covered MIPS32 base, R2, and R6 plus
pre-R6 MIPS64, each in big- and little-endian configurations. The focused
mixed-operation matrix reproduced the unsafe MEMSX-first ordering and the
correct fully composed result on MIPS32 and MIPS64, both big- and
little-endian. No physical MIPS hardware was tested.

Nicholas Dudar (2):
  bpf, mips: Factor narrow loads out of emit_ldx()
  bpf, mips: Add BPF_MEMSX support to the JITs

 arch/mips/net/bpf_jit_comp32.c | 51 ++++++++++++++++++++++++++++------
 arch/mips/net/bpf_jit_comp64.c | 47 +++++++++++++++++++++++++++----
 2 files changed, 85 insertions(+), 13 deletions(-)


base-commit: 91ec2035134982b98fab0609a9fd8480e8217dc1
prerequisite-patch-id: aa8ca3f50fc4b0160c5fdba43a92e4b7ec3f2e07
prerequisite-patch-id: bda4c3f3d59b48d784ed98bd8558d9591399bc86
prerequisite-patch-id: 35236f563c0536859077709d52b345b696e5c26e
prerequisite-patch-id: c0f282b0e57ecd60e9582fb1e89e4b3112ae7893
prerequisite-patch-id: 4e93eed38f6585e21fc13931c314907b4e437ef5
