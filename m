Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A232937B00E
	for <linux-mips@vger.kernel.org>; Sat, 12 Sep 2026 04:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789186352; cv=none; b=qbApIebjYpebrNMaAGEBZQUlWIQPCZe5l3NEXM/9zMNcuNgdDRNCl5FiYmcBR9lAm+8jXETB9RzRvigPj7qU7fA9TvRjqO24YqVF5TKu3lT7pmWHZZ5t+AkyhtaPC7bcvoEE0dCvcarY+mPLTeqf1FejXV3OHMLT+4oz1RB4ffg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789186352; c=relaxed/simple;
	bh=Y4mmlS5jFgG5ATmNax0YkycTZRrcGtrpcCkO1XmVR1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uFmslkzHdaEBNXVM3iKPk33eSSxEv9S8oxDk3gNUr9WO15SG5pPPNN/URwWk76fBq38/44uZLhnnMnhtkXCRq29tODPPLaTFNuYIa1neCmqLbUmCiCVwwge0e7u9oM49xtJGy1P1+FVu93GpXUD3+WXh0AWxUOfod+36NJRWYJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhFm0oF1; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhFm0oF1"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9399daa3d43so135425685a.2
        for <linux-mips@vger.kernel.org>; Fri, 11 Sep 2026 21:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789186349; x=1789791149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ARX6sPlaaU5jt76zvFI9y/9+1m01ifIYtxUFDnK8I6Y=;
        b=UhFm0oF1fH4S3G0a1yfmS9DAyKyrXpeBMjmMB7CATAM5bXIuxYjGy+591HcyYvJydV
         t1mMMaAJN/6i+0O8JI9xjJgXBX8msr1h7bHPyo3icoSnU33m1CNu3KiomhVp/U34AD6Y
         uORf0mtp34NbvDJKqMMRQb9bU5sa/WpxjOIPv3ILX+IFJK28VSxJ41go9UJsQ3WL42q3
         mhVYDDj3o4TneOrq6dOaXPpn/VGmW8dg5PVPDYMYEzmjzsXWqfVBwp6bvPZ/Yg8gG8Nf
         7jYcYbO1/OZHmAlQ6y8/NQp8HSNZjIlrVAZm/2AKCrpBZH41PFlEsQLai799cDX2O1aU
         W31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789186349; x=1789791149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARX6sPlaaU5jt76zvFI9y/9+1m01ifIYtxUFDnK8I6Y=;
        b=F+mNkzg1ivdiElm37jfX3Or5CAnvZM2mpOWXfKK4PB3CSj/OZQtMDBhxruIBpVx09r
         TKEZvmcC/j3eZduJ3rC2eic2ZXOaGcW82GwrgpmmqD7G+DRHXBy5n0d/S9MCc1o4VH3d
         WjMqmFHXmfKfbE7o6AMVpIlrMvzbW7qLDluvutFwEHU8vR4AnlYfY0I7sb7X2MQMhfxq
         LZk3ZAew3at28w4FHRjxNUUApDvVllalliMD399yzBxGucFzaoCRuaybAIlQaom+p6bu
         XbEhZ+N+Z3BCn530vwNELg/771ITXOMJlaxFc2w80pAyeALtKs3hzFM5jLPqOen4BANM
         02VQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFT6OexydnvY6HEJBOYmO8u5AvpE635jFEs+oGisOT4rvrizYezscXUmRt36DrRzyKz7hKxmNXLoVZ@vger.kernel.org
X-Gm-Message-State: AFuF++mlNXWRfes6+ap1ZxTmBhgCsOlwbdDNa+JwWbiPGXelKoRbQIX+
	W+ys8++yUB6g/qieq14+MhbX28/MKsFsbIirX2bQGkd2ya4DOF1Atj8x
X-Gm-Gg: AYBFou1QoSe0JQqLboZ6EI6SF16pTmZplTluIAGy/YPHZYpltOuONu2Mmo3SHTlEov8
	4SQV8fMgXFYwln+dunHlqcJo7PP9GORzQF8fN1rauiONaKeH8MV+QalPB4xrwNhmQoJQnTnc2Q1
	VAv9SgtYe4jSO0cqZFdLfJGUidFeuISVqu/hbr6HNOHp4nx/A0/bm21tZZSNCIBQylb/m5EDj90
	7uetjOqFxAZkwsCOl/eii7M5jYcEy79JWGR3OO8m934k4jI+gA/SIs4uLRU7Lq5bMLQzMmHkJ6d
	CGwUsoRRXdVq4WyqTV3cFQjxQ2cpOboLJgj67RXuyy/WS0jZgMt9h7knugF0w9fqXa7aAiCegIa
	V194/hiBaGqoDTW9h0whafcNajCZMXVjvrQmrd227UGSahe+N6Njnk0S+Ez+xqkmthJ2/oLDVnA
	BLLd0ySaSjCtWnbmr4rhRQqBj3VpPhV5WZbOJTkWo8HTrw+rNzEtGLm9kQup7xkBlZ6g==
X-Received: by 2002:a05:620a:17a8:b0:939:9a09:6009 with SMTP id af79cd13be357-939ea22929amr988056985a.33.1789186344876;
        Fri, 11 Sep 2026 21:12:24 -0700 (PDT)
Received: from Turin ([187.15.143.6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a09b85dadsm18463485a.34.2026.09.11.21.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 21:12:24 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 0/2] bpf, mips: Add BPF_MOVSX support to the JITs
Date: Sat, 12 Sep 2026 00:12:18 -0400
Message-ID: <20260912041220.444715-1-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the five MOVSX forms to the MIPS32 and MIPS64 JITs, which currently
emit them as ordinary moves. Patch 1 factors register moves into helpers;
patch 2 adds sign extension.

Use seb/seh on MIPS32 R2+ and doubleword shift pairs on MIPS64, where
normalizing the source for seb/seh would eliminate the instruction saving.
The MIPS64 sequence also matches GCC's generic lowering [1].

This series depends on SDIV/SMOD v4, whose uasm patch adds seb/seh.
This is missing JIT support rather than a regression, hence bpf-next
and no Fixes tag.

Tested the SDIV/SMOD v4 prerequisite and this series with test_bpf under
QEMU Malta on little-endian MIPS32 R1/R2/R6 and MIPS64 R2/R6. All five
MOVSX cases went from failure to JIT pass; all 16 signed DIV/MOD cases
passed on both revisions. Patched pass/fail totals were:

  MIPS32 R2/R6: 1050/12
  MIPS64 R2/R6: 1049/12
  MIPS32 R1:    1045/17

The 12 failures are 8 BSWAP, 3 MEMSX and 1 JMP32_JA. R1's 5 additional
failures also occurred on the prerequisite-only baseline. No other test
outcome changed between the two revisions.

Earlier v2 tests covered both endians and verifier zero-extension
handling. No physical hardware was tested.

Changes in v3:
- Use seb/seh on MIPS32 R2+; retain shift pairs on MIPS64.
- Share the 8/16-bit sign-extension sequence within each backend.
- Apply on top of SDIV/SMOD v4 for the new uasm emitters.

SDIV/SMOD v4: https://lore.kernel.org/bpf/20260911213340.3767930-1-main.kalliope@gmail.com/
v2: https://lore.kernel.org/bpf/20260904111731.673341-1-main.kalliope@gmail.com/
Review: https://lore.kernel.org/bpf/CAM1=_QTN3JJ6jtckf32F8wxBzLDbHSrzUttyMBWNqZKmRe=2rg@mail.gmail.com/
[1] https://github.com/gcc-mirror/gcc/blob/releases/gcc-15.2.0/gcc/config/mips/mips.md#L3921

Nicholas Dudar (2):
  bpf, mips: Factor register moves into helpers
  bpf, mips: Add support for BPF_MOVSX in the JITs

 arch/mips/net/bpf_jit_comp32.c | 69 ++++++++++++++++++++++++++++++++--
 arch/mips/net/bpf_jit_comp64.c | 57 ++++++++++++++++++++++++++--
 2 files changed, 119 insertions(+), 7 deletions(-)


base-commit: c1ff425d625eb2a4d2967e9889b85f202f24eb5d
prerequisite-patch-id: aa8ca3f50fc4b0160c5fdba43a92e4b7ec3f2e07
prerequisite-patch-id: 9f324d79755bae54c56ce6c90769acc8595c9ad6
prerequisite-patch-id: 35236f563c0536859077709d52b345b696e5c26e
