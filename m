Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2ED78F26
	for <linux-mips@vger.kernel.org>; Wed, 19 Aug 2026 01:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787101534; cv=none; b=RAxdJiaV+1TNwyBuDuedP5kVlDq1fkv8IUBHhNamtisbmjnS8/jkbsFgMFUGm5SgBd5GHyVUL4dg1Yx4mLTaIGz0PQ5yJK/pYOYmRuIRPYlPBIXW/OJnYKLz27/b3bzaJhX5uxKu5waRLCcGxTUm9Oqtf0x+UWNzgzKmFGWsAuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787101534; c=relaxed/simple;
	bh=90FGMOqfaMwKFE3m6MrCWpsXGFOlRbBwVWKfP0t4P9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kSGZhwjVCMaaEa8l6gJnIond7pbn/qPVPIgOL86PPp+iH8Hv8Js2SE62j/oZvxyGKD/UN8B5ab8aUcIxCiPXFMoncT8BXQgU2LJyoUU0t1T9pLN8hFjQcNJVbD15hKf7d4BuZg+4lSGe2L6Hnctq1UL3+PQh01IPn2RDHDs+wxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sR7gQRHe; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sR7gQRHe"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90a80860d35so6293596d6.2
        for <linux-mips@vger.kernel.org>; Tue, 18 Aug 2026 18:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787101532; x=1787706332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K00Qxp5YCwypDmxrz55eJ7p4e8/W3wjazUln9Bb9aCA=;
        b=sR7gQRHew4Ja6zfND6k99kVnqqNB6w5oKTiLDqrdcWhh0ntxwHmGhjn8IbJ+qMk1NS
         pXCRj9TEjyPkbhOreuOXae3WOnBx8f6KaX015RiVIP0wbUkWGKCzLV8gSta19MxlgcCL
         Ad8XPbB/IGj7DroJ2G652P+Suj2pVrH09VVoRz3Y40G2/q2Udb8ovEL9ie0wY86uXp8J
         Tn3Tq1Lk/ADeDWzuEZ3wd0kDq7YjUy5hViLUjjrZ1PZ4ua/OJ9odrcgbBBz+iXUdnpRf
         ArV3LftkODFTyoaKNdf4QN1g6fom+xjM8KvY3smzJyJNZXeaAeFhNrWc24Pr6DT21gsj
         nAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787101532; x=1787706332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K00Qxp5YCwypDmxrz55eJ7p4e8/W3wjazUln9Bb9aCA=;
        b=LC/G6MgBReI9Mn3HF0Drz6TzEOHvwFeb2KiM1VU4yHLbD9j+eewbMoc+Uetm6B9lm8
         LOMnAG02XO+2KdVyO5fo0ID+Y/zmrnggfFCkBNSyIFsfphxGKVDnhhctnxhA/pHpjnEw
         TqUj07Ul4jyQHRQvQXm2sGZcw8apyDApwC6B9HwLbJGHqd0oLPHA0WFCd9jKv4xO/VYk
         H8ZX+p1pmU4y3pKUaAgIZNzuC42+Ka1VHXyMchfnB33bX2XFK9dBK+6HTk6YzCexR+d+
         TfirXwQ5gJLfIvSXOFf5WP+zxdRrGyU3FuBPfYh8F9d16+/VYXxcH0GJE/C+faUPtVIG
         G2yg==
X-Forwarded-Encrypted: i=1; AHgh+RqmzrM7HAMzhMJz820DkSHoiXm+vpj8CaUCliuVAkdmvwV5DHuxXxjG6vlvFNM4qyT7yKeQur9CCcHk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Sl9hDpnDxNE0fCT/E0eqanGDQvrBlmYsaCqYns+gdxyuhgBw
	Xxa9vDTQhA8OjgRPF6g8gk3HtS8UkD71m3k549AO/+gA3Jds73WI50/B
X-Gm-Gg: AR+sD12yq1yRzH4iycBdx5XmnkBmlqVP26ISSf1M6E1IH/bFdDhvgr8+CvXycLIqFiY
	unvwjssD4xPhCyZliMgKorsR0E/6QgRoWzBBZ8JlXEPleo50VgGeaga4gQLhEaWBPKGEGkZazBK
	7v+brxeuxY9ZTSmsqTjZH4L8TXdH7T6nPdKvj9OPsoxfadqZYlSxy5TkR7Zs9ZiQxAJjOw2qZ2m
	VjBzE2ALSaY3ClXyx1QnEiozsQgO/YSzSSecVTsRPmlPKU3Nsdvzm1JNqQcmZ3WACUP7Ujq/hMK
	Taotac0qG4e1YB31Tii3e9Eo93vVORdOO1bvzijeUIqSle9UYi+9Afo1RgQCLdORGYi0+X6OaI6
	y+55gSmsa9Pq8+shPR5oyZMrWupYdK5BLofygrd67sjX49QfOZ9FGHEK7SVamNiWH0yBlhbYBLw
	58NXQM51wHN5IopkxXc6lUNkwSPK2/eRbTpSRZdjdoTsCuWDEvCxzrAOErsA==
X-Received: by 2002:a05:6214:2c0e:b0:90c:4d5e:d8dc with SMTP id 6a1803df08f44-90c5eb40218mr9560686d6.28.1787101532058;
        Tue, 18 Aug 2026 18:05:32 -0700 (PDT)
Received: from Turin ([187.15.143.241])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f29065bsm2398716d6.24.2026.08.18.18.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 18:05:31 -0700 (PDT)
From: Nicholas Dudar <main.kalliope@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	johan.almbladh@anyfinetworks.com,
	paulburton@kernel.org,
	tsbogend@alpha.franken.de,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC bpf-next 0/2] bpf, mips: Add BPF_MOVSX support to the JITs
Date: Tue, 18 Aug 2026 21:05:21 -0400
Message-ID: <20260819010523.1057789-1-main.kalliope@gmail.com>
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

The MIPS32 and MIPS64 JITs lower register BPF_MOVSX as an ordinary
move because their register-move paths do not interpret insn->off.
Negative low-width values therefore retain incorrect upper bits.

First factor ordinary register moves into backend-local 32- and 64-bit
helpers. Then handle the BPF-defined MOVSX widths from insn->off in
those helpers. This keeps the verifier-inserted ALU32 zero extension on
its existing path and preserves the MIPS32 register-pair handling. The
implementation uses shift sequences rather than the R2+ seb/seh
instructions so it also works on base MIPS32.

MOVSX can be applied before or after the in-flight SDIV/SMOD series.
Both must precede MEMSX (yet to be sent). The ordering discussion is
here:

Link: https://lore.kernel.org/bpf/CAJZwKkis=3NGw9At0WfiZaRYEoMPbQfqJKN0e+vtRDvp4VY5Ng@mail.gmail.com/

Patch 1 did not change any test_bpf result. On the four little-endian
profiles where the complete suite was run at each boundary, patch 2
fixed the ALU32 byte and halfword MOVSX cases and the ALU64 byte,
halfword, and word cases. The 32-bit totals moved from 1031 passes and
31 failures to 1036 passes and 26 failures; the 64-bit totals moved
from 1030 passes and 31 failures to 1035 passes and 26 failures. Patch
2 did not change any other test result. Ordinary MOV and zero-extension
controls passed at each boundary.

Selector-focused QEMU testing covered MIPS32 base, R2, and R6 plus
pre-R6 MIPS64, each in big- and little-endian configurations. No
physical MIPS hardware was tested.

Nicholas Dudar (2):
  bpf, mips: Factor register moves into helpers
  bpf, mips: Add support for BPF_MOVSX in the JITs

 arch/mips/net/bpf_jit_comp32.c | 54 +++++++++++++++++++++++++++++++---
 arch/mips/net/bpf_jit_comp64.c | 48 ++++++++++++++++++++++++++++--
 2 files changed, 95 insertions(+), 7 deletions(-)


base-commit: 6655c409707ec8ce9ce0850ffe4fe02331fd4d9c
