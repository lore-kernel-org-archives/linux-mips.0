Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E711470E96
	for <linux-mips@vger.kernel.org>; Fri,  4 Sep 2026 11:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520675; cv=none; b=piFVX//R1cHMlLXcQQ4AnYGT/IjFt03fj2l791xxSJjCrD/fXeDB+4Vvbri4YeLki07VOcFkRiOtqHWcSQOCSuxOVZ+xXj2Woxm+qFZuf6O9H7eO5rfeiFF5WbeBB9sjeY9Y6MX97HQv+XMDxEMHCAaA8xhHuKXTTAlpfTNzdnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520675; c=relaxed/simple;
	bh=4DIUolQj5K7s0LXB5mQXEoJFCJfRS2EJ6t4V8xTTHv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lm3BNrLoCSe4fPiTiLrHv7qnEk8h+numudR6lk5sgzJBxeMK8IGZYbgPd2qCxTEsLyhy8XzmVOUrutPTzlIjfMnFh2CF/WV5wgy5mbCbzWdqlaxWrL2V18mEPFv+iqXqYAlnnSUNUMWWf5juzn/cYgM5QSl/pf5OJD8xoU/poA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTXY7njk; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTXY7njk"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-530420edf1bso15737851cf.1
        for <linux-mips@vger.kernel.org>; Fri, 04 Sep 2026 04:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520671; x=1789125471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a8aI67v2qHq2F9XuFlZJpkBUyR2T964WRJn0GOGoYgs=;
        b=MTXY7njk0OvkwDvPY2MVXvq/rHzM5p9XFSgqGtmkie0CGgIwXYzH1LgBEHoe1qXniS
         n8THd91ssV5KYCiDlSdMVLaXFcnzhFyu5zU61JL82uB+Lyv3lkEancp2/Nq1xWYcE5q+
         HQG8P2NC5a7FhbFluIVDhLh3oSsK4B+oZwdV2fJHp/8rXZNG9fQj025ypYPATZryiMnP
         iVHf9al8Fptpkp2rGvDNMGA4D5cq8E9yiDGu9XbbffxNXFUHo30KVQwAO4b9EW4oFpzx
         srcB9GXYy2vjgFnGsoIebL7T9UH0MwYClOR478zY/bqft2UJypiNZPFWT94PnxkJhtbh
         WIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520671; x=1789125471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a8aI67v2qHq2F9XuFlZJpkBUyR2T964WRJn0GOGoYgs=;
        b=bwzINzKWckkMy7AZbPlswN3mCJ/zt6wjYf6IhvZ7xYdGry4AFgdxjXuEyx2CE3nYHD
         xQNghC/Ea/aP0CwvobdZrd1FlblYA7KByy1TE7gSoh5G8yWLvBpShi6uZAVBSyWznn0p
         79Udnrd8juoROqT6BBEfr1iWp1xmBZ9k10rYPkeTApUmeeDmxsXPFOt/ecnPHRyrVqcv
         DumqEA4x6AXFi8X1FtwmQYIFu3feUoC1g2TIw17hBP+cOf+so5VGODZqK/tzPi8RIqg+
         78D1uJQB6NNJ6Tzu8Jv241aHKpmwcSQoiQ6+T93TspOazhd5BW7noBrXdGOsPh9ejgLj
         Y1cg==
X-Forwarded-Encrypted: i=1; AKwUvBxTOalfLUamuyH9jZsgZJaebueov5+OQivEbd5MWxwIKGiYex3VbPUC+/PIxlxG/ecuGv3qe38Xdb8V@vger.kernel.org
X-Gm-Message-State: AFuF++krHEHYmLeYTpZkzWlMYsbsex0NEeoxONpHGArRtLSJ6FjkxGmW
	P3yLI0B4R5MbVLEE9FcyHSlIZbp93powd0t8gt2rIip1UaCWq7XYBX7y
X-Gm-Gg: AYBFou358vh2uMh2d0k/9HTHQhGC+K738L6iiYHbMG+lkA0NSv3S6XNdMYVnsAvz2sK
	MF8MavzeNGwKwmTRcY4Sy10nlukcSmsZLk+SUvAPek/e66yQfa531DMGEVLRmNIEvIDKwQ2+hBX
	dgjZKf78dvoAZ7zNdyep7q8EBzfF2hsanckqTGbRhdoB/WhxSyNdhZhOOaGLfYiTgKFw5iGWfh3
	GDBc4kYh1Btrzu+2vwUrtart1B44BFPBMWFA9nDUgP0XUELo/dGvhs3GSDw9bg2Kv9lsrVVgMEH
	oacn8dyC/9A7sZjQhbMa7S+WRlvGR12Y+CMOdZVHDh8hyjyFLXUW9v+spEG3p0l7w+lP/pSK057
	resRWuapQgtPeYalqMQlN24naBJWAquArjAT3DclvDWdX9DisJjWNeSUx1JWINuAcJFWxCfxG64
	YwZWR/f4TGqFWjLf8dknPXhRe4OPc+Zz6XLvNDpMeDb6bW1Yi5ySGRT7kQ1B4ibhCxkR0=
X-Received: by 2002:ac8:6108:0:b0:530:42e4:f003 with SMTP id d75a77b69052e-530549bb544mr68480221cf.48.1788520671204;
        Fri, 04 Sep 2026 04:17:51 -0700 (PDT)
Received: from Turin ([187.15.144.163])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305402a8fcsm18350171cf.1.2026.09.04.04.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:17:49 -0700 (PDT)
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
Subject: [PATCH bpf-next v2 2/2] bpf, mips: Add support for BPF_MOVSX in the JITs
Date: Fri,  4 Sep 2026 07:17:31 -0400
Message-ID: <20260904111731.673341-3-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904111731.673341-1-main.kalliope@gmail.com>
References: <20260904111731.673341-1-main.kalliope@gmail.com>
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

Decode insn->off in the register-move helpers and sign-extend 8- and
16-bit ALU32 operands and 8-, 16-, and 32-bit ALU64 operands. On
MIPS32, propagate the sign into the high word for ALU64 while
preserving the existing ALU32 zero-extension handling.

Use shift pairs rather than seb/seh so the lowering works on every CPU
supported by these JITs. seb/seh would save one instruction on
R2-or-newer CPUs but would require adding those opcodes to uasm.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
 arch/mips/net/bpf_jit_comp32.c | 56 ++++++++++++++++++++++++++++------
 arch/mips/net/bpf_jit_comp64.c | 54 +++++++++++++++++++++++++++-----
 2 files changed, 93 insertions(+), 17 deletions(-)

diff --git a/arch/mips/net/bpf_jit_comp32.c b/arch/mips/net/bpf_jit_comp32.c
index bfe73b023983..885da0d0d74b 100644
--- a/arch/mips/net/bpf_jit_comp32.c
+++ b/arch/mips/net/bpf_jit_comp32.c
@@ -190,20 +190,58 @@ static void emit_zext_ver(struct jit_context *ctx, const u8 dst[])
 	}
 }
 
-/* Register move operation (32-bit) */
+/* Register move operation (32-bit), optionally with sign extension */
 static void emit_mov_r32(struct jit_context *ctx, const u8 dst[],
-			 const u8 src[])
+			 const u8 src[], s16 off)
 {
-	emit_mov_r(ctx, lo(dst), lo(src));
+	int shift;
+
+	switch (off) {
+	case 8:
+	case 16:
+		shift = 32 - off;
+		emit(ctx, sll, lo(dst), lo(src), shift);
+		emit(ctx, sra, lo(dst), lo(dst), shift);
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
+	int shift;
+
+	switch (off) {
+	case 8:
+	case 16:
+		shift = 32 - off;
+		emit(ctx, sll, lo(dst), lo(src), shift);
+		emit(ctx, sra, lo(dst), lo(dst), shift);
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
@@ -1501,7 +1539,7 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 			/* Special mov32 for zext */
 			emit_mov_i(ctx, hi(dst), 0);
 		} else {
-			emit_mov_r32(ctx, dst, src);
+			emit_mov_r32(ctx, dst, src, off);
 		}
 		break;
 	/* dst = -dst */
@@ -1570,7 +1608,7 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 		break;
 	/* dst = src (64-bit) */
 	case BPF_ALU64 | BPF_MOV | BPF_X:
-		emit_mov_r64(ctx, dst, src);
+		emit_mov_r64(ctx, dst, src, off);
 		break;
 	/* dst = -dst (64-bit) */
 	case BPF_ALU64 | BPF_NEG:
diff --git a/arch/mips/net/bpf_jit_comp64.c b/arch/mips/net/bpf_jit_comp64.c
index 45fee6f6b87e..a1dfb7492a9c 100644
--- a/arch/mips/net/bpf_jit_comp64.c
+++ b/arch/mips/net/bpf_jit_comp64.c
@@ -120,17 +120,55 @@ static void emit_zext_ver(struct jit_context *ctx, u8 dst)
 		emit_zext(ctx, dst);
 }
 
-/* Register move operation (32-bit) */
-static void emit_mov_r32(struct jit_context *ctx, u8 dst, u8 src)
+/* Register move operation (32-bit), optionally with sign extension */
+static void emit_mov_r32(struct jit_context *ctx, u8 dst, u8 src, s16 off)
 {
-	emit_mov_r(ctx, dst, src);
+	int shift;
+
+	switch (off) {
+	case 8:
+	case 16:
+		shift = 32 - off;
+		/* dsll32 and dsra32 add 32 to the shift argument. */
+		emit(ctx, dsll32, dst, src, shift);
+		emit(ctx, dsra32, dst, dst, shift);
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
+	int shift;
+
+	switch (off) {
+	case 8:
+	case 16:
+		shift = 32 - off;
+		/* dsll32 and dsra32 add 32 to the shift argument. */
+		emit(ctx, dsll32, dst, src, shift);
+		emit(ctx, dsra32, dst, dst, shift);
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
@@ -669,7 +707,7 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 			/* Special mov32 for zext */
 			emit_zext(ctx, dst);
 		} else {
-			emit_mov_r32(ctx, dst, src);
+			emit_mov_r32(ctx, dst, src, off);
 		}
 		break;
 	/* dst = -dst */
@@ -754,7 +792,7 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 		break;
 	/* dst = src (64-bit) */
 	case BPF_ALU64 | BPF_MOV | BPF_X:
-		emit_mov_r64(ctx, dst, src);
+		emit_mov_r64(ctx, dst, src, off);
 		break;
 	/* dst = -dst (64-bit) */
 	case BPF_ALU64 | BPF_NEG:
