Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD197486415
	for <linux-mips@vger.kernel.org>; Fri, 11 Sep 2026 21:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789162434; cv=none; b=oU/McuPZBAI35j9FOoA6uV+JRL20cjOzMoCyIcgUzNaE1Y3WUvccRzZ24oHDRN/xP6fB2kGixx8fqEjoOoXZCRB5xfJCzooLQ41T7GxarVQ6mDAEdJ1vNo+oWBMgvFicK1fUrszFvZse+lXi36cu+qqJhlRNBPVX733tmTyzHyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789162434; c=relaxed/simple;
	bh=6WWUp9R5KMfa/CshmsP7UggokIFh/r96TCUO6MKrmrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QTdnqgkwAi1MkYWIm2s9ibs1n+/W9TEPCiR+xNID6sgVtTmZurwSznv7Dya3kzROuSa/XxuDuAtFKaG97ard6nkvUlFaF0y+GvpkXOPd2RPcDubTd093Pf2vs8UfhubFk+SL8bRCO9rE2nkamnvHNsGYhR9WIm2zKVusKmmddqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPGGKtkF; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPGGKtkF"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109fafd6so23921085a.3
        for <linux-mips@vger.kernel.org>; Fri, 11 Sep 2026 14:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789162432; x=1789767232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDUUpR7EV4DDb+hECXvl+mIFifzn7YL76NkRxKNfsbw=;
        b=FPGGKtkFfDaMvTzDIIPjh3oLZLK5HK3+uToHjyAlSEJvSB7f4C2HJRBAxhJYtGZwQx
         fvtEN+B6P3oh5GXgDqeP0eEXqxiAC1kNbOcSP2uV4Ean/GMtORrN76gehCkQ+KHTUsDT
         rcxORD3vp9+96JquQjyW8fc2HO7QEhO9IXev4pQv9ymTs5gp9uEkYSmI2DjaLfa+mBEN
         lBoG+seoPw4NXZGfjDesvHI0OB5+NIM6JL5aeZPrOawiTbYZc1gNA4injgftALQZbxir
         9kYW+l16qcy0Hy9hSp0yM6rU7xJ7aHhU1EcPvvG1pNvpmW29W4EOV66zkeOmsYSMw31e
         eHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789162432; x=1789767232;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jDUUpR7EV4DDb+hECXvl+mIFifzn7YL76NkRxKNfsbw=;
        b=aQi+fH8Dw6S8/OurBgjdYsfYQU95wUqXJ8BTSYl1DOL3JxSSww1PaK5V6DPqAQlHBt
         xYLhTIsQE+PyGVrnr9U0UmA8FGOJEUl7/s4gJyz+dPZbjlKlWuv5u39vdbwN1ZmUarNU
         Lq2fAkv//IM574/vNTX/7slQR5E8LB6mBHuaFJdUR5L5v1QUNxfyMaVBHlsEN4fodnK9
         WTIlMvsLjKEfW3HLw8vNNe+U/4Zs17voW2u52XKywSSevzSmn0qdWOEkK6r7K3y4BdU/
         lFKLYUWWbL99LVF7DESNuXND/ll990nDP5AIivLupksckV86ofmf+Im6D47j4Bwdyd8W
         nqxQ==
X-Forwarded-Encrypted: i=1; AKwUvByGc4k7zNrd0myVx6kgusoslf3b4tbTmOH4mz8yABnZL93Wy9O3W5xdjQxQWooKN7+TYfb5eFkOlZ9/@vger.kernel.org
X-Gm-Message-State: AFuF++lxOySjEuM5V5bZJm4NcNdzN9fFpVpwTC7BW9yESTfseozJzNol
	X9SMmONBRKteyHZDtwuH4pXA/yrH8DzP+dTJImfwc3+rdEqkdmUSQHFx
X-Gm-Gg: AYBFou0HUdR146tgRlcsKBf+GNd3Tzd7S1umpOJdGz74VBXKjt5snYd89lIgt9OmhCy
	9pSO+FUQryBONsQPHbfzijxmxs/eDNS4kiDBZHoXOPlRdtt6ftGlcRbz9dmYsRkrH856JWJas9f
	LTOPOY46zkFtii4GsrR1T3D/tOPTlToifVm+y9VgRgkWymJzN2R52bwt362fn+O7rKPT7rMbW+b
	UUe5jyzYXIJY6HEeBoRVhyXjER6LVQtkXn6CouJwEBDLJo234JwEAkDuHFoYTizcJ2NB6dZZRqU
	ASKKsddKIL4YYgzwtr7iyIptxgT2urqLXeowggpIcNgZWN9ziAgRqDv1kaQNVT+snAoSXxCmZb2
	ShDkCOqRNp/EaB41NkDWLKxEXFiKC1WQAwovB95KLtDVq2zPwNxLtjqE1Hn48kDTLwI1cWxKGrq
	cnSIEMVnywjA6QwtcDfeZo9k63+K0mNLyqH7IsJtdWS2HOkD8h8tihauccZ9W4zULo
X-Received: by 2002:a05:620a:3726:b0:939:8373:b552 with SMTP id af79cd13be357-939ea048a73mr854217285a.1.1789162431590;
        Fri, 11 Sep 2026 14:33:51 -0700 (PDT)
Received: from Turin ([187.15.143.6])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f496598sm30170196d6.35.2026.09.11.14.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:33:51 -0700 (PDT)
From: Nicholas Dudar <main.kalliope@gmail.com>
To: tsbogend@alpha.franken.de,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	johan.almbladh@anyfinetworks.com,
	paulburton@kernel.org
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	philmd@oss.qualcomm.com
Subject: [PATCH bpf-next v4 0/3] bpf, mips: Add signed div/mod support
Date: Fri, 11 Sep 2026 17:33:37 -0400
Message-ID: <20260911213340.3767930-1-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MIPS JITs do not interpret the insn->off value that selects signed
DIV/MOD semantics, so negative operands produce unsigned results.

Factor div/mod emission into helpers, add the missing signed uasm
operations, and decode insn->off in the div/mod emitters. On MIPS32,
use signed 64-bit helpers for ALU64 operations.

The DIV/MOD implementation is unchanged from v3.

Before this rebase, all signed DIV/MOD test_bpf cases passed with the
pending MOVSX respin applied under QEMU Malta on little-endian MIPS32
R1/R2/R6 and MIPS64 R2/R6. The full suite had 12 expected failures for
unsupported operations (8 BSWAP, 3 MEMSX and 1 JMP32_JA).
R1 had 18 failures in total: those 12 plus
6 additional failures reproduced on unchanged v3 in the same environment.
Earlier v3 testing covered big-endian MIPS32.

Uasm object builds passed for MIPS32 R1/R6, MIPS64 R2/R6 and
microMIPS32 R2 before the rebase. The new SEB/SEH encodings match GNU as
for every register pair on MIPS32/64 R2/R3/R5/R6 in both endian modes;
all pre-existing native opcode entries are unchanged. No physical
hardware was tested.

Changes in v4:
- Add seb/seh uasm emitters for R2-or-newer CPUs.
- Rebase onto current bpf-next without changing the implementation.

v3: https://lore.kernel.org/bpf/20260810194215.3754591-1-main.kalliope@gmail.com/
MOVSX review: https://lore.kernel.org/bpf/CAM1=_QTN3JJ6jtckf32F8wxBzLDbHSrzUttyMBWNqZKmRe=2rg@mail.gmail.com/

Nicholas Dudar (3):
  bpf, mips: Factor out div/mod emission helpers
  MIPS: uasm: Add signed div/mod and sign-extension emitters
  bpf, mips: Add support for BPF_SDIV and BPF_SMOD

 arch/mips/include/asm/uasm.h   |  8 ++++
 arch/mips/mm/uasm-mips.c       | 12 ++++++
 arch/mips/mm/uasm.c            | 24 ++++++++----
 arch/mips/net/bpf_jit_comp.c   | 55 +++++++++++++++++++-------
 arch/mips/net/bpf_jit_comp.h   |  4 +-
 arch/mips/net/bpf_jit_comp32.c | 29 +++++++++-----
 arch/mips/net/bpf_jit_comp64.c | 71 +++++++++++++++++++++++-----------
 7 files changed, 147 insertions(+), 56 deletions(-)


base-commit: c1ff425d625eb2a4d2967e9889b85f202f24eb5d
