Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4AD48D87C
	for <linux-mips@vger.kernel.org>; Wed, 29 Jul 2026 16:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785342591; cv=none; b=iCzSyGKQRiZkwWUB88i0f//cpD2Y1K5/ofUGKZ+atWUOM68ALSUH52kICLhOfFqJkHm1a2IpXPPFVTy6C9NjSdpXnFEENK+eOxRnrxIwM2RU8GfZo/KW2VJ0kgqwGF0f2/ZYD2DlW3RmqupYjl7ENqEOr1mGk4Fn5UnL00pWlEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785342591; c=relaxed/simple;
	bh=R3lUFwXzA6Utc8Qmizb9zVXH9qJGnpDmVVKh5fC1sUc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=OLGmnghiGX2b26pcCts2/wr/yRUvKMn6MvP9JaeZZgoUflGH6hL57uCxEXXRX/SYM3V0jt4mCBIp0/P0bMBPmcqerkv3PIvyvjb2Ph8HEsYi4z7I6DRiK63FtSUCXwgxgFpsuawuo7wb1JiHKwvRPJYPhC6MwjNtoiufa4ZGF8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtgYFZ2e; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtgYFZ2e"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e54f8c051so64721985a.3
        for <linux-mips@vger.kernel.org>; Wed, 29 Jul 2026 09:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785342585; x=1785947385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YaMgBKE4IT7GHc8dKZ/bu4hutKGY9j/cGc76tkbN8yg=;
        b=ZtgYFZ2eWkhuGGMDXhroyuZQI8hwTLcYaa8NSDzBk/kmSztyCwiu717evu5D7+0BH5
         WT5zfhitoDa8VfsNrqEF0E8zuE9oNVkx2wQGOZ3rob8i51GIrbxBxXUiNAWIUFaFSZp1
         ozjNYHCL8wYdr23vxXnzodUkgHWXs4TDYga8YQdxQVXx5kWWW01KJqmP7koxHODzlmw9
         26uWTsCMg4lhoIEz4INiu/HFFNb82WQDtz0HhJD+/b5OsRQaBLbFiyKJ3n/UUps1Knzl
         B5G9nCJtS8kb0j2jLO1Rg83B9pcT69DSeAomPb031V3oOhzEHwS0ejS+4kEpsxnD4LPB
         PhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785342585; x=1785947385;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YaMgBKE4IT7GHc8dKZ/bu4hutKGY9j/cGc76tkbN8yg=;
        b=UuOlZXGU05v3Q2DER8c/23VfgFvXqZ+hgeHuQIvNh4S/wQWA5k5NFl3mXK+ORN6uOA
         /bXr3Xdb6ywzgDl3m0mUNLqckdTwi5aecEnPMojr+iYjsxw4Dd1c/95QzyH8hmpYHxfz
         DrSuU1z+g6QNbxzm9hYJxCO8+FgPrJn9L9j1Ac6lbTcTHGUBFIVQY/pJTa/gIzkHnXBE
         9K+rnymdso1ibj2uWqCp1suwuC3IpU6lPi9FF7fZrRfP/25dS4fBximTNDnW1F7HRGVy
         tBJrIxeCpBT2n4bQTxlRUmwLKAY/BebwqkE3bdLD9UBwut84YB1BsAaivCFTJPXeEBlB
         4Byw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8rpySAP+XxKO24no2I/wvFVg6sLoEIEpKWTWojq5XZbkzrynZvQ8dOlV6lVH13QG+odT0yfTwuJvS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxis1t9sG0OeZm8mkKUHg12zq8wM/6yMtnBOdxQ7ovXLsa6XLmw
	eUdAxau9qXZDgvgno43gs2g23C5M0mYoIt/csj51HfQLKXMSigmrGbrr
X-Gm-Gg: AR+sD13qE4nTdwlgb89rjqLvykZuj6WdvvVF6NlnShPIKPOgEMhC+ruvAnkfnqVCFAj
	x5SCxxOrQS/5KEydsKB28fyHgU+Vfa05TyLcqUYXf5dT2nQDjf87SmhhB1Miqu66PgkUg7eZWJS
	vz+Afv91z4TQna5kV7ZeY1p/aEmmZVLdQTQtBY03DgK4pPdzYAF5QZBYCtiZ4+DHNBY7Bo8TAjf
	9lngUr7MVoqf2G6DgCBeaZcLTSCaFCZzCMpZKvq0y4I0Z+vTejs3IeRXpe2rxbr9YXnxU0mLc7o
	CmX5R39eifPipcnnuZl+xz3vccBWQcU30o+ci3hg5/AjshcRDYWjdEqb8td+zOoBAWqYFk7jPjm
	UXtbG/4qpKrAvK5I9iNev7/qc6eWpgiOI4b5teYbXvf5On1a6FIVFq3GTYWgpA6fO0mrDzWNQqA
	z6npufWKyXdWoam6flBVm7bvUhf2AJAxnj1otwvYe9h9OV5mQDbYMSexjVHUBVa1l8Wo9WORjS3
	+W5fg==
X-Received: by 2002:a05:620a:284a:b0:92e:bd6f:b166 with SMTP id af79cd13be357-9330266c55emr706970885a.63.1785342585335;
        Wed, 29 Jul 2026 09:29:45 -0700 (PDT)
Received: from localhost.localdomain ([187.15.144.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e7318180sm201745885a.28.2026.07.29.09.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:29:44 -0700 (PDT)
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
	visitorckw@gmail.com,
	bpf@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2 0/2] bpf, mips: Add signed div/mod support
Date: Wed, 29 Jul 2026 12:29:29 -0400
Message-Id: <20260729162931.2369353-1-main.kalliope@gmail.com>
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
class and opcode, but do not inspect insn->off. BPF_SDIV and BPF_SMOD
therefore use unsigned instructions, or unsigned C helpers for ALU64
on 32-bit MIPS.

Patch 1 factors division and modulo emission into helpers. Patch 2
uses insn->off to select the signed instructions and helpers.

Tested with test_bpf under QEMU on MIPS32r2, MIPS64r2, MIPS32r6, and
MIPS64r6, with CONFIG_BPF_JIT_ALWAYS_ON=y. Patch 1 produced the base
failure set on each target. With both patches, all 16 SDIV/SMOD cases
passed. Fourteen failed on the base; two already passed. No test
changed from PASS to FAIL.

v2:
- split out the div/mod helpers as Philippe suggested
- use an unsigned quotient intermediate in the signed remainder helper
- rebase onto bpf-next at fdec474c65fd
- test the base, patch 1, and the full series on four MIPS targets

v1: https://lore.kernel.org/bpf/20260716211055.2569433-1-main.kalliope@gmail.com/

Nicholas Dudar (2):
  bpf, mips: Factor out div/mod emission helpers
  bpf, mips: Add support for BPF_SDIV and BPF_SMOD

 arch/mips/include/asm/uasm.h   |  6 +++
 arch/mips/mm/uasm-mips.c       | 10 +++++
 arch/mips/mm/uasm.c            | 20 ++++++---
 arch/mips/net/bpf_jit_comp.c   | 53 +++++++++++++++++-------
 arch/mips/net/bpf_jit_comp.h   |  5 ++-
 arch/mips/net/bpf_jit_comp32.c | 30 +++++++++-----
 arch/mips/net/bpf_jit_comp64.c | 74 +++++++++++++++++++++++-----------
 7 files changed, 143 insertions(+), 55 deletions(-)


base-commit: fdec474c65fd35d5a6e1497ed50a9f98c07192f0
-- 
2.34.1
