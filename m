Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A155376A18
	for <linux-mips@vger.kernel.org>; Sat, 12 Sep 2026 04:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789186354; cv=none; b=MghTp5xfe+07eG+ukzBX7Ii2aPp2g0XfZApJedqj+jRWPtUXLKyy1Ekt8E/mSZhw7gOzVYh9abvjf3fqt9PeHcppjwgiSh2eIjo7Y1Rh4H1QbThMNqhsVxAi67GnJTqmfp+/MCuqWzPllyS9pVsyQcY9h0yLPfyQdQe6ReCpuiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789186354; c=relaxed/simple;
	bh=7COibI29Ach+wbwW+uNXJ3Z1CLlszRI6kx/mtrLZat0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aN0SM7qySMfKiozxJiGPnodXgmJQ/HFEFBVo4yNm4UcrVJ7Wf5R9l4ifPeSfDwxvqrQdG2sLpBkn5PKhBli8qSYWQRa9W42VOwu/g6jZsOYbsX5rBKBnoi9N0JOQZWO81T5qZM1Wfh4es9mrfHpZj+fHEE/kNDNL20Bhf6p+Y3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=se11JjS0; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="se11JjS0"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939eb3249c1so69750585a.2
        for <linux-mips@vger.kernel.org>; Fri, 11 Sep 2026 21:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789186351; x=1789791151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oGYx9/EEnOrP1Jo1+EaxuAffL25XtyIjkiW/sdlTsx0=;
        b=se11JjS0tpnChcy5Y+uhONzLjRtSHsVzXbmOVjDs68/VsEQvkTCn/YklqkZIJMUnMK
         n/g5UHktQzJymyDhpfsLsLzfuWoLApA+HaSvLGIMEr5NmOLYvVOOtRdXf4B+qLAqeSX9
         ss7OUHJIxIMYgEbktXC+Rbe7obD2DCd0Qq1JJZBV32GZyhT9Ok1wTBAHpSmLaNWiosDz
         Fwm1NFCQlx+pbDzqm3HL0TuKIDUyRKhylGGevmFIcE8KnTH+dd8rsBd6xxIxEOq53qWP
         0w1CPZonkw+08wVYSVGaYa6okj3p+QTPkiANa5QnIzU2j/rYVJLG31pGv8iefrimRsAO
         kzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789186351; x=1789791151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oGYx9/EEnOrP1Jo1+EaxuAffL25XtyIjkiW/sdlTsx0=;
        b=mzPWhlLb1ZLDOckehFmdAmKc2ASif0NyX0r4APHfdzwbUB5Mbzt4a9Pb6kyLWnhpZR
         RE0HFa/n2u39sS0pERulunsQiWO32oq5uv6FV6cM9w4L3Ztc9neVQUhzjHKnGlk0OF5f
         kbEeFlkJRi0DBVKRmYyqAhPizCgK1/LKQizHO4phcuvG/sE1N6I3pkE6Mk+q/6uzfvMQ
         hL/ZSUdS4dceEOzRWGvq0VnezUtMz4wBziiD3QfSf+QPgfqycitgmdFNkZAZsrIEx7zE
         OgdVncyvOmV+npm6yV50jf3jf0gD3ceaRQOgW8fJqqteWDz4GLHGbTha97hKZ1pdA6TW
         kzOA==
X-Forwarded-Encrypted: i=1; AKwUvBwB2fxhhboPYw59Seen63v79MijryP0zbDI3bdzFwSO0iz0iu1Fm9iftoLWEpUm+1sDrlYaDJT+3Ida@vger.kernel.org
X-Gm-Message-State: AFuF++kLAsfNac+AWoyOayPubzPfEC4Lmp5jWN1yFRFPzLhCXM2Gzpj3
	oC6Ona6SY/dsD1HlZMUShTOfX/Ql5kdt/9I2S/aHRUIh6bsCQeVkClj8
X-Gm-Gg: AYBFou32QKIst7RiV7Mw173PD587gXhJKXUeg1ROf1pbvOpP/QZucsFnFswEK9GA5fp
	hxqKVEZp9EnKmmANPWLPeAUNAygfP+AxrMz9+1SmyzdM+pn6Cpzxy835pYdFPO1UapDNuJkvXDO
	Bcdc3DlIfikZBlF+nY7o6GPkIkrsi6HRkzMmLwSM/QkDilP08g+tSAdOG1orfIUez8WARGIaz6E
	LDYSR3s25l6S16uefbZ27JJQqlnz46OS6/lz+37yQYIsu2OmkCa0RqI0/hIOlHvwwgtBq4+yz4/
	n9oyolP2vwTnsUEF659ek7yN/WcQv3TY3X32IYU5+s/1AU+3vQevg1ez9GkKiAlNOawS6myRJYn
	l0KiB+jGFapwmT+N+ZShcq9qKt3LSpkLDZeB2csZSonvmZTxzHY7NT1Pz37HK3je2KQCMCo9C6j
	xwjBMjwnbYaoHLikk/+6tDKjMGwq2tt3mlF75XMGYCC7+p1UxivJpYEK73cSR5sudZ
X-Received: by 2002:a05:620a:468b:b0:930:9585:e08e with SMTP id af79cd13be357-939ea037950mr1090670185a.10.1789186351356;
        Fri, 11 Sep 2026 21:12:31 -0700 (PDT)
Received: from Turin ([187.15.143.6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a09b85dadsm18463485a.34.2026.09.11.21.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 21:12:30 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 2/2] bpf, mips: Add support for BPF_MOVSX in the JITs
Date: Sat, 12 Sep 2026 00:12:20 -0400
Message-ID: <20260912041220.444715-3-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260912041220.444715-1-main.kalliope@gmail.com>
References: <20260912041220.444715-1-main.kalliope@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both MIPS JITs ignore insn->off when lowering register MOV
instructions, so BPF_MOVSX is emitted as an ordinary move. Since
build_insn() accepts it, affected programs are silently miscompiled
instead of falling back to the interpreter.

Decode the MOVSX width from insn->off in the register-move helpers.
On MIPS32, propagate the sign into the high word for ALU64 while
preserving the existing ALU32 zero-extension handling.

Use seb/seh on MIPS32 R2-or-newer CPUs and shift pairs otherwise.
On MIPS64, seb/seh require a sign-extended 32-bit source. Normalizing
an arbitrary BPF register first would cost another instruction, so
retain the doubleword shift pairs.

Assisted-by: Codex:gpt-6
Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
 arch/mips/net/bpf_jit_comp32.c | 65 +++++++++++++++++++++++++++++-----
 arch/mips/net/bpf_jit_comp64.c | 55 +++++++++++++++++++++++-----
 2 files changed, 103 insertions(+), 17 deletions(-)

diff --git a/arch/mips/net/bpf_jit_comp32.c b/arch/mips/net/bpf_jit_comp32.c
index 6d603d9eeb1..8f1ab851863 100644
--- a/arch/mips/net/bpf_jit_comp32.c
+++ b/arch/mips/net/bpf_jit_comp32.c
@@ -190,20 +190,67 @@ static void emit_zext_ver(struct jit_context *ctx, const u8 dst[])
 	}
 }
 
-/* Register move operation (32-bit) */
+/* Sign-extend an 8- or 16-bit field into a native register. */
+static void emit_movsx_r(struct jit_context *ctx, u8 dst, u8 src, s16 off)
+{
+	int shift;
+
+	if (cpu_has_mips32r2 || cpu_has_mips32r6) {
+		if (off == 8)
+			emit(ctx, seb, dst, src);
+		else
+			emit(ctx, seh, dst, src);
+	} else {
+		shift = 32 - off;
+		emit(ctx, sll, dst, src, shift);
+		emit(ctx, sra, dst, dst, shift);
+	}
+}
+
+/* Register move operation (32-bit), optionally with sign extension */
 static void emit_mov_r32(struct jit_context *ctx, const u8 dst[],
-			 const u8 src[])
+			 const u8 src[], s16 off)
 {
-	emit_mov_r(ctx, lo(dst), lo(src));
+	switch (off) {
+	case 8:
+	case 16:
+		emit_movsx_r(ctx, lo(dst), lo(src), off);
+		break;
+	default:
+		/* off == 0 is MOV; the verifier rejects other offsets. */
+		emit_mov_r(ctx, lo(dst), lo(src));
+		break;
+	}
+	clobber_reg(ctx, lo(dst));
 	emit_zext_ver(ctx, dst);
 }
 
-/* Register move operation (64-bit) */
+/* Register move operation (64-bit), optionally with sign extension */
 static void emit_mov_r64(struct jit_context *ctx, const u8 dst[],
-			 const u8 src[])
+			 const u8 src[], s16 off)
 {
-	emit_mov_r(ctx, lo(dst), lo(src));
-	emit_mov_r(ctx, hi(dst), hi(src));
+	switch (off) {
+	case 8:
+	case 16:
+		emit_movsx_r(ctx, lo(dst), lo(src), off);
+		emit(ctx, sra, hi(dst), lo(dst), 31);
+		break;
+	case 32:
+		emit(ctx, move, lo(dst), lo(src));
+		emit(ctx, sra, hi(dst), lo(dst), 31);
+		break;
+	default:
+		/*
+		 * off == 0 is ordinary MOV. The verifier rejects other
+		 * offsets; defined exceptions require
+		 * bpf_jit_supports_percpu_insn() or bpf_jit_supports_arena(),
+		 * neither implemented by MIPS.
+		 */
+		emit_mov_r(ctx, lo(dst), lo(src));
+		emit_mov_r(ctx, hi(dst), hi(src));
+		break;
+	}
+	clobber_reg64(ctx, dst);
 }
 
 /* Load delay slot, if ISA mandates it */
@@ -1510,7 +1557,7 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 			/* Special mov32 for zext */
 			emit_mov_i(ctx, hi(dst), 0);
 		} else {
-			emit_mov_r32(ctx, dst, src);
+			emit_mov_r32(ctx, dst, src, off);
 		}
 		break;
 	/* dst = -dst */
@@ -1579,7 +1626,7 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 		break;
 	/* dst = src (64-bit) */
 	case BPF_ALU64 | BPF_MOV | BPF_X:
-		emit_mov_r64(ctx, dst, src);
+		emit_mov_r64(ctx, dst, src, off);
 		break;
 	/* dst = -dst (64-bit) */
 	case BPF_ALU64 | BPF_NEG:
diff --git a/arch/mips/net/bpf_jit_comp64.c b/arch/mips/net/bpf_jit_comp64.c
index 92df2eba139..4507841a922 100644
--- a/arch/mips/net/bpf_jit_comp64.c
+++ b/arch/mips/net/bpf_jit_comp64.c
@@ -120,17 +120,56 @@ static void emit_zext_ver(struct jit_context *ctx, u8 dst)
 		emit_zext(ctx, dst);
 }
 
-/* Register move operation (32-bit) */
-static void emit_mov_r32(struct jit_context *ctx, u8 dst, u8 src)
+/* Sign-extend an 8- or 16-bit field into a native register. */
+static void emit_movsx_r(struct jit_context *ctx, u8 dst, u8 src, s16 off)
 {
-	emit_mov_r(ctx, dst, src);
+	/* seb/seh would need a sign-extended 32-bit source first. */
+	int shift = 32 - off;
+
+	/* dsll32 and dsra32 add 32 to the shift argument. */
+	emit(ctx, dsll32, dst, src, shift);
+	emit(ctx, dsra32, dst, dst, shift);
+}
+
+/* Register move operation (32-bit), optionally with sign extension */
+static void emit_mov_r32(struct jit_context *ctx, u8 dst, u8 src, s16 off)
+{
+	switch (off) {
+	case 8:
+	case 16:
+		emit_movsx_r(ctx, dst, src, off);
+		break;
+	default:
+		/* off == 0 is MOV; the verifier rejects other offsets. */
+		emit_mov_r(ctx, dst, src);
+		break;
+	}
+	clobber_reg(ctx, dst);
 	emit_zext_ver(ctx, dst);
 }
 
-/* Register move operation (64-bit) */
-static void emit_mov_r64(struct jit_context *ctx, u8 dst, u8 src)
+/* Register move operation (64-bit), optionally with sign extension */
+static void emit_mov_r64(struct jit_context *ctx, u8 dst, u8 src, s16 off)
 {
-	emit_mov_r(ctx, dst, src);
+	switch (off) {
+	case 8:
+	case 16:
+		emit_movsx_r(ctx, dst, src, off);
+		break;
+	case 32:
+		emit_sext(ctx, dst, src);
+		break;
+	default:
+		/*
+		 * off == 0 is ordinary MOV. The verifier rejects other
+		 * offsets; defined exceptions require
+		 * bpf_jit_supports_percpu_insn() or bpf_jit_supports_arena(),
+		 * neither implemented by MIPS.
+		 */
+		emit_mov_r(ctx, dst, src);
+		break;
+	}
+	clobber_reg(ctx, dst);
 }
 
 /* dst = imm (64-bit) */
@@ -694,7 +733,7 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 			/* Special mov32 for zext */
 			emit_zext(ctx, dst);
 		} else {
-			emit_mov_r32(ctx, dst, src);
+			emit_mov_r32(ctx, dst, src, off);
 		}
 		break;
 	/* dst = -dst */
@@ -779,7 +818,7 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 		break;
 	/* dst = src (64-bit) */
 	case BPF_ALU64 | BPF_MOV | BPF_X:
-		emit_mov_r64(ctx, dst, src);
+		emit_mov_r64(ctx, dst, src, off);
 		break;
 	/* dst = -dst (64-bit) */
 	case BPF_ALU64 | BPF_NEG:
