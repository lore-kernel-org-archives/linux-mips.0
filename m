Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1615F48BD26
	for <linux-mips@vger.kernel.org>; Fri, 25 Sep 2026 23:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790378437; cv=none; b=B5Sk1G5zWiiuQW7n+7LQ39juK/wMDS18W/P1FAOneyx2nJQ9dO0baoW6gjklQKxm7lz0z6aE++/gzk6oVM6sTAJ+//UOJRB9tSFWHk3tsOmsgvdbCCjuq6Ss3WI20ZBsRYz2Ber0IKkxgi52L6HsbVVRz8cHCltnEhGYVipNuJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790378437; c=relaxed/simple;
	bh=WtL6rxCkfdZ7pTmQgPmxPdrmUbCTBflSvx5Si7/9zqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PVwh37TV7ozbtJTNygXkGin0X60iBSoNMKQaTbvhW7YLnGUVqj/OLI5pXgRx+BWG9PbCXLW3nKcqB3hso98kjK8iZhs37/ATwf9jLx2ChqilB29Fwz+d5rwaQYwEVEh+DSdi9JOaqD2Ep5bMyqDo89uotNIxuG23KiYH5RFrVhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=pass smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks.com header.i=@anyfinetworks.com header.b=hGWTSofy; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks.com header.i=@anyfinetworks.com header.b="hGWTSofy"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e419so479751e87.0
        for <linux-mips@vger.kernel.org>; Fri, 25 Sep 2026 16:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks.com; s=google; t=1790378434; x=1790983234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VR5L8+oQ4rLRFzubuBQiKFNbiQQRFe9UBoKloIMhE4A=;
        b=hGWTSofyMjrw+LaOQDnltigZODwrNbFkhOy46DfWgLaRe2d8QG9YRnplGTlj5HehGC
         wfe3yyE3x3tlCrGp2J/ZaEQnyQA1ZVI2xvJDSQUsZgl/i9vJnabxUknxUpHAL0FNgnJe
         /RFj5MU61cVuGDcG/AYfq0JLD6h4Y+4b4xMUz7HZXFTxQnD03k7x2q+VWV1TVRS0lhrZ
         YjZIzrpyZAwZ5VOR7FAiqKdaikY2Jg1xsM/G9ry2GB3MUH5gVZFLYXwxoFlzx6t+voZj
         fMwBISjtBZFFTjPxrgJK9IlxjW/UPzivZq/SiwHkspaf+LHTe2JDRVQnR7sSj0cM67LK
         XBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790378434; x=1790983234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VR5L8+oQ4rLRFzubuBQiKFNbiQQRFe9UBoKloIMhE4A=;
        b=1jLvciodFfYm12w1sSCf0qH3IVf/dFczIIb3G0TKaI6Q40KIqpp654iFWMob0vQIo6
         vUhS7GIKtOdu8ZfsMLAS+glqjXQehecMI8Bv+SzD9t7JMb24seNuCS65Dju1HeMtDM96
         IqBLMYVNmowFICXRZ9Abn531zDySr3Kxe0T5ppaSYfmW7avYBfZ6QP20/+o7C8+2SLtv
         rBuDOwrRhIp0QDU//8YdobLF83OsUhzV4aVnPWi3/9WfDQ2mDCka7GFNNWLw52Q+jy4d
         sKy6BtkMDch7DxZFdyPCpN811DCUBRRuFh0c/tMPiYp24DWbxWkq8gdz5cWsEBgTI4Wu
         IfLw==
X-Forwarded-Encrypted: i=1; AKwUvByjbSvom5dLpgvGtAwrmJBoXEN8ZDNUk+dIGF6kPslOKEpmH1/UDVy4FJ6Eqf8vwPiacZtjbYF57D1A@vger.kernel.org
X-Gm-Message-State: AFuF++lfERetx2VUtdP27FEOcqOIfWeV59Pl7G6oPNHO/uUjADmVPEj5
	55HDirSCFewyp0dGQ32B8iFghYk4jBIwOxl3fWzorH7xCAHbzRYHJXK+KiIuI8n2f1o=
X-Gm-Gg: AYBFou1GiHt1b8n/p+sByJaVzT67ah8RDGtRC3RocuQkjBtiSQALpdhCw/04F55hDfl
	yeTj9vr4NqOG8VZOU97f0qA+3XzErWjPulLQGIB5zxdb58Z7OnZ5E4eeHoVSy1QWRmLuV9LOSZe
	Bim3VosXJadvSmvh2GE9H78ZSSs9JIa0L54RTEU4bfndqJb/v+NRF/6WBmxZlVovBd11xxkfOUg
	M+DqNaZ6xu+2TH9tUC8dEuCIWkH6IJxgYpHJ/WvwERTuQn5ojYqZMvweHEFE98QFTZUcZ0tzTM2
	y/v8V90mNh3F25vsPSsp1d4Rp3PXWGbwvA+kytlYraLzwPfnCTo1sP4RNfH15wzEq6m1fsxMf7p
	7ehcznxHUdsWZvUiztQlk2OfZkV6IHtgjSP1PFXrfh9JmmdVxnL7utKzfSo2JypBB/KuhwVwXT3
	yvZ/Io5elqmh14y+V3FISyJGVm4aXxNTB1HtY0qOUHCt+sR+lwkYbECQvvQ0zyTggqhjCbuxYel
	KerNRu8WVP62Op6AyvEgmOcR6ZmLljq1EZU0FauCAg=
X-Received: by 2002:a05:6512:208:b0:5b8:b392:b40f with SMTP id 2adb3069b0e04-5b8df09bdfcmr1779080e87.5.1790378433940;
        Fri, 25 Sep 2026 16:20:33 -0700 (PDT)
Received: from nuc.. (78-69-188-101-no600.tbcn.telia.com. [78.69.188.101])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6af81cfsm875260e87.40.2026.09.25.16.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 16:20:33 -0700 (PDT)
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
To: tsbogend@alpha.franken.de,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	paulburton@kernel.org,
	main.kalliope@gmail.com
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	philmd@oss.qualcomm.com,
	Johan Almbladh <johan.almbladh@anyfinetworks.com>
Subject: [PATCH bpf-next 0/2] bpf, mips: Add JIT support for v4 instructions
Date: Sat, 26 Sep 2026 01:19:30 +0200
Message-ID: <20260925231932.1063678-1-johan.almbladh@anyfinetworks.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MIPS eBPF JIT currently lacks support for several BPF instructions
introduced by later revisions of the BPF ISA. This series adds JIT
support for unconditional BSWAP and JMP32_JA. Together with the recent
work of Nicholas Dudar, this completes support for the BPF v4 ISA in
the JIT.

The series was applied with Nicholas Dudar's patch for MEMSX added on
top ("bpf, mips: Add BPF_MEMSX support to the JITs"). The JIT was then
tested on QEMU MIPS targets, with the following results.

MIPS32r1/r2/r6 big and little endian:
test_bpf: Summary: 1062 PASSED, 0 FAILED, [1050/1050 JIT'ed]

MIPS64r1/r2/r6 big and little endian:
test_bpf: Summary: 1061 PASSED, 0 FAILED, [1049/1049 JIT'ed]

All JIT-eligible tests were JITed and all tests pass on all 12 QEMU
MIPS targets. No physical MIPS hardware was used in the tests.

Johan Almbladh (2):
  bpf, mips: Add JIT support for unconditional BSWAP
  bpf, mips: Add JIT support for JMP32_JA

 arch/mips/net/bpf_jit_comp.c   |  2 +-
 arch/mips/net/bpf_jit_comp.h   |  2 +-
 arch/mips/net/bpf_jit_comp32.c | 11 +++++++++++
 arch/mips/net/bpf_jit_comp64.c | 11 +++++++++++
 4 files changed, 24 insertions(+), 2 deletions(-)


base-commit: 6ac134ec930642d5b574b63a72a0e999c2470c64
-- 
2.43.0

