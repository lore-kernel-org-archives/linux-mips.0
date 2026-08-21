Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669F934EF05
	for <linux-mips@vger.kernel.org>; Fri, 21 Aug 2026 02:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787280648; cv=none; b=D7in2FbdTsYIgyyQHYEV2MBNDTAQDx+CM0u/l6Ik20NmRKxY+KSsyfZbWGv3S0A88vdTXWZrEa52e2iKb7bNKthwzsBK7TD+cwPYi+MedkE9C++gQ0XnSUOQVqL35AlgxA3x9hnbhHZ2XKMOK8oXHHNTLxHlIHxHbzlSAoZS7tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787280648; c=relaxed/simple;
	bh=biSlZdKoW2TIp1N9Eur8irrRElc5mHmfC7w36+KN9dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ts7nyaJc6QQPZ6TMx3QzC69tXVcujr+dvqzdPU4hc09ucINBCwca4J+GMSz/iy6vnXmDf5YnH0la/fpdMx/+xvlJ7YMva1V77PgxcypDG8EikQTG88X8/PVxURurMw8X8FIn5XIF/nDLh5PbaZ9yh6YEqu0RqZUW9Xw73ohwfyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gd3gRaH1; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gd3gRaH1"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-836c436a6b3so8441557b3.0
        for <linux-mips@vger.kernel.org>; Thu, 20 Aug 2026 19:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787280645; x=1787885445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0wOKIjhcTdiEA7KXOwvh33miMuBlXwjUoaWhMM4geyg=;
        b=gd3gRaH17qTAfafW/wpEB91wz+BQSr535LEqza+5A+AvwmnpHZU/bz8ciZek+SekER
         oA0YBB2YKL09rUtwlUxqIItXSUG6RtxKz8r6LJPLzu8KRrBsxp15bGnq/sCxEG6BAnR0
         xMjHTtXZQiv/bZkK3JIDwNllm++mhTck5x5uQ3TQdxdW2duzbacI88vRhp6OmorW5nfb
         cLhtpebeAlIBQoGWUEkOO+wf/6fy63+poth/sTwskkmc4Gm6wJgNrT3dlThW2ZJ8+LaV
         /qWc8qc6zASCtiFDJvqUpOHJQdB6G+qnC5HxNTg0LAroNuwXFmR59mcj6KHLrdyliQ0v
         NZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787280645; x=1787885445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0wOKIjhcTdiEA7KXOwvh33miMuBlXwjUoaWhMM4geyg=;
        b=JkY23C5cUpGf3zdqq0VsODvYiN+uwKx3r/EDUdSStX9Tk85rrKwtrpiD8gwdMXj6lF
         uYoY3yKdFEBWdkTlNC9EHIBVQuk6UyhnIpmflOC4JzgewnKwTrfZbkKloOm8vPh3uDnv
         KzyXLXIFX+TTG3r8hx0U8n2zrGXSkf1x6VwFLgfwDOUgjTYZNy5bYpQxg5CMHtUslwO/
         EuiYsFUz7L6hfS8Xg0QBZomZg5Owv+zgG85NNYE0mNqTt3dAZqJNkfqUQDEdmgPfYbAj
         TPAPBThXeOOxzroqFivKd0lh1VyT692C/EYrOAhOaomteWH2Se2rYL1vLSdS7vke0bfG
         Jwtw==
X-Forwarded-Encrypted: i=1; AHgh+RoHvmoA6yNvJF+aC1/IB4zb/RnG8lXUxBu93G3lbAvBhX1zh80/3sspt4rh+OnBXW7pIXueezRuSdJp@vger.kernel.org
X-Gm-Message-State: AFuF++nnwLRwreBmUc/mgUanQf8EYl2ShR3OHuFuTOH1A4hsbKd6TP9k
	CZVeMmN0w/BcSMdg/Nv3s7kahIx/t8di9E/1nf0Zlg4qX0y6pv2QtbEW
X-Gm-Gg: AR+sD10YFwI0F+Khg9UhtBXxySB6iyM4sX3SzdouVFBU3/hybIug+nSYCcL6jY3FeSP
	zD6KnLxnVdvs37kA5sP7oZSaixzS8BXZOPK6gEbNCcvAquGwKe9pgLydH+f6ZhzVQgBcSC5nU4Z
	rUPAfcEv6m3ktgTPfJ/um+nHAkUXeITQf+TzgghhsmtAVCVvacDLxhGNOvGWTIZG11/+P2RKVjW
	5i0q/SBfUtBTY9rnC42Esjr5/yBezQP/qUbl18rB3GR2dDT4FQXltJA6Mcazorp9PfAZuu6K1ez
	6QUfNeJc70uHNNH1Mw4x+PGPe3LXHz0Pi/87PGOuLd82HaPZVXA4hYvNPlotSlrhjuiDbmL1iXn
	bMSo2CjzxGbLUU/SJl3YeyjNlOd5ambHgJWDDcBmWJ64kGUNj3ZIkfO1O60D568xnwKpF8UEFx2
	TSGNS4jEMh/kQNwikuj9BcWIFR9Ad8yfo6nPd0H1py7LNrppjxA8Sr3pqaLQ==
X-Received: by 2002:a05:690e:12cf:b0:668:24a9:a7a2 with SMTP id 956f58d0204a3-66ce4a69ff5mr1394095d50.21.1787280645276;
        Thu, 20 Aug 2026 19:50:45 -0700 (PDT)
Received: from Turin ([187.15.143.241])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66ccb144956sm3682195d50.13.2026.08.20.19.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 19:50:44 -0700 (PDT)
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
Subject: [RFC bpf-next 2/2] bpf, mips: Add BPF_MEMSX support to the JITs
Date: Thu, 20 Aug 2026 22:46:40 -0400
Message-ID: <20260821024640.1601299-3-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821024640.1601299-1-main.kalliope@gmail.com>
References: <20260821024640.1601299-1-main.kalliope@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BPF_LDX with BPF_MEMSX loads a signed byte, half-word, or word and
sign-extends it through the full 64-bit destination. Both MIPS JITs
predate this mode and reject all three verifier-valid encodings when
JIT execution is required.

Teach the narrow-load helpers to select signed native loads. MIPS64
gets the full result from lb, lh, or lw. MIPS32 loads the low half,
observes the MIPS I load-delay rule, and propagates bit 31 into the
high half. Keep BPF_MEMSX with BPF_DW unsupported, and leave ordinary
loads on their existing unsigned helper path.

The existing BPF_LDX_MEMSX byte, half-word, and word test_bpf cases
cover the verifier-valid widths.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
 arch/mips/net/bpf_jit_comp32.c | 31 +++++++++++++++++++++++++++----
 arch/mips/net/bpf_jit_comp64.c | 33 ++++++++++++++++++++++++++++-----
 2 files changed, 55 insertions(+), 9 deletions(-)

diff --git a/arch/mips/net/bpf_jit_comp32.c b/arch/mips/net/bpf_jit_comp32.c
index 48a3c834453f2..3de7aac72fb83 100644
--- a/arch/mips/net/bpf_jit_comp32.c
+++ b/arch/mips/net/bpf_jit_comp32.c
@@ -709,16 +709,23 @@ static void emit_trunc_r64(struct jit_context *ctx, const u8 dst[], u32 width)
 
 /* Narrow load operation: dst = *(size *)(src + off) */
 static void emit_ldx_narrow(struct jit_context *ctx,
-			    u8 dst, u8 src, s16 off, u8 size)
+			    u8 dst, u8 src, s16 off, u8 size,
+			    bool sign_extend)
 {
 	switch (size) {
 	/* Load a byte */
 	case BPF_B:
-		emit(ctx, lbu, dst, off, src);
+		if (sign_extend)
+			emit(ctx, lb, dst, off, src);
+		else
+			emit(ctx, lbu, dst, off, src);
 		break;
 	/* Load a half word */
 	case BPF_H:
-		emit(ctx, lhu, dst, off, src);
+		if (sign_extend)
+			emit(ctx, lh, dst, off, src);
+		else
+			emit(ctx, lhu, dst, off, src);
 		break;
 	/* Load a word */
 	case BPF_W:
@@ -736,7 +743,7 @@ static void emit_ldx(struct jit_context *ctx,
 	case BPF_B:
 	case BPF_H:
 	case BPF_W:
-		emit_ldx_narrow(ctx, lo(dst), src, off, size);
+		emit_ldx_narrow(ctx, lo(dst), src, off, size, false);
 		emit(ctx, move, hi(dst), MIPS_R_ZERO);
 		break;
 	/* Load a double word */
@@ -754,6 +761,16 @@ static void emit_ldx(struct jit_context *ctx,
 	clobber_reg64(ctx, dst);
 }
 
+/* Load operation with sign extension: dst = *(signed size *)(src + off) */
+static void emit_ldsx(struct jit_context *ctx,
+		      const u8 dst[], u8 src, s16 off, u8 size)
+{
+	emit_ldx_narrow(ctx, lo(dst), src, off, size, true);
+	emit_load_delay(ctx);
+	emit(ctx, sra, hi(dst), lo(dst), 31);
+	clobber_reg64(ctx, dst);
+}
+
 /* Store operation: *(size *)(dst + off) = src */
 static void emit_stx(struct jit_context *ctx,
 		     const u8 dst, const u8 src[], s16 off, u8 size)
@@ -1725,6 +1742,12 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 	case BPF_LDX | BPF_MEM | BPF_DW:
 		emit_ldx(ctx, dst, lo(src), off, BPF_SIZE(code));
 		break;
+	/* LDSX: dst = *(signed size *)(src + off) */
+	case BPF_LDX | BPF_MEMSX | BPF_W:
+	case BPF_LDX | BPF_MEMSX | BPF_H:
+	case BPF_LDX | BPF_MEMSX | BPF_B:
+		emit_ldsx(ctx, dst, lo(src), off, BPF_SIZE(code));
+		break;
 	/* ST: *(size *)(dst + off) = imm */
 	case BPF_ST | BPF_MEM | BPF_W:
 	case BPF_ST | BPF_MEM | BPF_H:
diff --git a/arch/mips/net/bpf_jit_comp64.c b/arch/mips/net/bpf_jit_comp64.c
index 22fb58f970223..14ef3f475c1c1 100644
--- a/arch/mips/net/bpf_jit_comp64.c
+++ b/arch/mips/net/bpf_jit_comp64.c
@@ -400,20 +400,30 @@ static void emit_trunc_r64(struct jit_context *ctx, u8 dst, u32 width)
 
 /* Narrow load operation: dst = *(size *)(src + off) */
 static void emit_ldx_narrow(struct jit_context *ctx,
-			    u8 dst, u8 src, s16 off, u8 size)
+			    u8 dst, u8 src, s16 off, u8 size,
+			    bool sign_extend)
 {
 	switch (size) {
 	/* Load a byte */
 	case BPF_B:
-		emit(ctx, lbu, dst, off, src);
+		if (sign_extend)
+			emit(ctx, lb, dst, off, src);
+		else
+			emit(ctx, lbu, dst, off, src);
 		break;
 	/* Load a half word */
 	case BPF_H:
-		emit(ctx, lhu, dst, off, src);
+		if (sign_extend)
+			emit(ctx, lh, dst, off, src);
+		else
+			emit(ctx, lhu, dst, off, src);
 		break;
 	/* Load a word */
 	case BPF_W:
-		emit(ctx, lwu, dst, off, src);
+		if (sign_extend)
+			emit(ctx, lw, dst, off, src);
+		else
+			emit(ctx, lwu, dst, off, src);
 		break;
 	}
 }
@@ -426,7 +436,7 @@ static void emit_ldx(struct jit_context *ctx, u8 dst, u8 src, s16 off, u8 size)
 	case BPF_B:
 	case BPF_H:
 	case BPF_W:
-		emit_ldx_narrow(ctx, dst, src, off, size);
+		emit_ldx_narrow(ctx, dst, src, off, size, false);
 		break;
 	/* Load a double word */
 	case BPF_DW:
@@ -436,6 +446,13 @@ static void emit_ldx(struct jit_context *ctx, u8 dst, u8 src, s16 off, u8 size)
 	clobber_reg(ctx, dst);
 }
 
+/* Load operation with sign extension: dst = *(signed size *)(src + off) */
+static void emit_ldsx(struct jit_context *ctx, u8 dst, u8 src, s16 off, u8 size)
+{
+	emit_ldx_narrow(ctx, dst, src, off, size, true);
+	clobber_reg(ctx, dst);
+}
+
 /* Store operation: *(size *)(dst + off) = src */
 static void emit_stx(struct jit_context *ctx, u8 dst, u8 src, s16 off, u8 size)
 {
@@ -908,6 +925,12 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 	case BPF_LDX | BPF_MEM | BPF_DW:
 		emit_ldx(ctx, dst, src, off, BPF_SIZE(code));
 		break;
+	/* LDSX: dst = *(signed size *)(src + off) */
+	case BPF_LDX | BPF_MEMSX | BPF_W:
+	case BPF_LDX | BPF_MEMSX | BPF_H:
+	case BPF_LDX | BPF_MEMSX | BPF_B:
+		emit_ldsx(ctx, dst, src, off, BPF_SIZE(code));
+		break;
 	/* ST: *(size *)(dst + off) = imm */
 	case BPF_ST | BPF_MEM | BPF_W:
 	case BPF_ST | BPF_MEM | BPF_H:
