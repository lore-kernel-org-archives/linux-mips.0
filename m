Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D567A442138
	for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2026 19:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390957; cv=none; b=CMgdY7d/piFxbVzbM/BPK4svRz1a6wbFDXkAaGsQt3jgFSxsDhk+f/8Tlkf4PEjMQ1r2czYmr5twtK4nQ7IhkAvcEIFcINwzoxaAnCX/54gwuEkHlXuSP0Kc3LoqFpxlunHNPLlFjOasZGSX3s4DUNIRXkzLSG0byP5ee5lKhBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390957; c=relaxed/simple;
	bh=mBGGbUnHaBPZ8pdYtaa0x1Q6F4i0OojXHM/laGEULY4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qg5fZMyhYUizvTZ9T4PtfPyyolKNK9Xd6xnYjkn1zicTgm9Txel1pG2liaQwCSgZVsgpBvLNeUmu7XUdiSPszmRe/QRaBxpNJSEFK4WRdi6NhnjS9H3YwtQwOC0bSzm2HY7kIRQZzHRUDimi3Ymvm8m8TphaFQ7NMv5Roe680lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mv6/rtyw; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mv6/rtyw"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c167aa9500dso3222966b.3
        for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2026 12:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786390947; x=1786995747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lkr1vFJIkyhno/UkUAQp7w4u73WRJzZ2tehGeX/lslo=;
        b=mv6/rtywV8CHhPJWdfIkU61GxZiieDRmhXBdzKm7Vqe7/yHkac8cGsaVwMlrk1DOPE
         Avjxj+T4Nt8dYatYMW+kUFp5w81k0eLU7zchoMHINfCYuKAIng/SdYM/peu5rytG02m4
         CSEaFIq+cwLE3Uq3WfjkLH3KlxgR18RtAZ5TV39MyQVOUhov3+Mgppc8AAI/n8z34CCi
         Yye57AibjBRuRnUN8dAXJmzTLJbZYkFBthtCkL8+yL/EfHGZc3PxtGm3dLWsq1+vMwVc
         EHILb9sHt0Sja8G56f691E/NBlAOPY4wkSCnaaAVe38jll00KDW9FKMLwQZq1ou5BVVk
         gdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786390947; x=1786995747;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lkr1vFJIkyhno/UkUAQp7w4u73WRJzZ2tehGeX/lslo=;
        b=T1Kg1luXR25BXJNLn/30HxDhuUJ16rtwNsL+mYChHmURe6uTN9UGAOM7cU+phdKXoe
         p04ujjUUNlW+woE5+yB+D/jPzZ5L4Kd6tYNN/jXgQ9Q/jNKkc0sMyBs3eIRrSnO/yNe7
         RqvNsZR2Mcsw2Y03Zm1CMKAlUlgaG43DZ2XYfTR37z45IELUlzhdTrWPAIl6RuOcOcih
         akKrNEbnI4onjE2/WkePxjrDWsnm0AjhYN1RWtDZuFrXeLlxlPvYqYwKNN8Q6vynvAUL
         +X2K8R3840V0sZcMnSWbSV+jtR8R1XjdO9brFQU8v+1ZMBZZzQfcLIObEb+lfIV2DCc9
         q+tA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7wRVTCdnBejxoy6kqnn2ei7/4x1xdlXLRo8H+1nGQUnnejOa52tnLhyPfFp/sCE+9CQ2DG6gKJgkr@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ7jy9USU8DUQ9aK0sDOqbdk28mTRUdJsAnGstWiBGu1LHw8Uq
	W23AAVIVa34vq9k2VNCq3A8nXd0BuBFZhuqFiyrECdQC7qG4wIfA6vJL
X-Gm-Gg: AR+sD10jX4Dvug0o6gQt/MQIsfk4XNp0BKYnXh2lifvsvmNXBGF2W1s11v/k5lM0npH
	ubpF5MN+CK5YhXrGlOgdgwNicBIGXfzRxFjz48B4CW3eIeqtpFQhhq0A3El7HeDYJJojUdVhIrN
	MuukcmTbNqs6lYzOVmBw8eHGaLe0LgfL8eJm0gR7U79Bg3bqgshDi7d5AlOqGjChLB4RYIh9Ur1
	PUWhb0Z/BlP+wpD10fRqm94ADAHIHAtFV9CblMNEgQEG8ohFDP3b/mnNFLmOrKzq2be8FVr/Es3
	ICFL+yJAvuxdlR0KkJY1sNQgsgkirvUUXdNkmGVhJjmO+pYuvTWm1q6PNdsp9fHRSyaqz0IbJH9
	aDTWiBur5PaBJw1WJA2D02cUAHtnxmfM+iO9sV2/QG6sCxgQo7bot/3fRpjPDV4yf1Cv3x513mA
	G2HwFs6+u00EX1DDBmPghyRbaXX7FwM/FVh80ee/re/p1lV4ivU/WVhZ5T9usX3JAx
X-Received: by 2002:a17:907:1ca7:b0:c1c:4adc:31a9 with SMTP id a640c23a62f3a-c2039e3fe56mr2139790766b.28.1786390947146;
        Mon, 10 Aug 2026 12:42:27 -0700 (PDT)
Received: from TurinLinux.. ([187.15.140.84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a6f414sm430309066b.17.2026.08.10.12.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:42:26 -0700 (PDT)
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
	bpf@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3 1/3] bpf, mips: Factor out div/mod emission helpers
Date: Mon, 10 Aug 2026 15:42:13 -0400
Message-Id: <20260810194215.3754591-2-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260810194215.3754591-1-main.kalliope@gmail.com>
References: <20260810194215.3754591-1-main.kalliope@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Factor MIPS32 and MIPS64 division and modulo emission out of
emit_alu_r() and emit_alu_r64(). This prepares the JITs to select signed
or unsigned opcodes without duplicating the R6 and pre-R6 handling.

No functional change intended.

Suggested-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
 arch/mips/net/bpf_jit_comp.c   | 36 ++++++++++++++++++++++------------
 arch/mips/net/bpf_jit_comp64.c | 36 ++++++++++++++++++++++------------
 2 files changed, 48 insertions(+), 24 deletions(-)

diff --git a/arch/mips/net/bpf_jit_comp.c b/arch/mips/net/bpf_jit_comp.c
index 6ee4abe6a1f7..320180330fb3 100644
--- a/arch/mips/net/bpf_jit_comp.c
+++ b/arch/mips/net/bpf_jit_comp.c
@@ -338,6 +338,28 @@ void emit_alu_i(struct jit_context *ctx, u8 dst, s32 imm, u8 op)
 	clobber_reg(ctx, dst);
 }
 
+/* ALU division operation (32-bit) */
+static void emit_div(struct jit_context *ctx, u8 dst, u8 src)
+{
+	if (cpu_has_mips32r6) {
+		emit(ctx, divu_r6, dst, dst, src);
+	} else {
+		emit(ctx, divu, dst, src);
+		emit(ctx, mflo, dst);
+	}
+}
+
+/* ALU modulo operation (32-bit) */
+static void emit_mod(struct jit_context *ctx, u8 dst, u8 src)
+{
+	if (cpu_has_mips32r6) {
+		emit(ctx, modu, dst, dst, src);
+	} else {
+		emit(ctx, divu, dst, src);
+		emit(ctx, mfhi, dst);
+	}
+}
+
 /* ALU register operation (32-bit) */
 void emit_alu_r(struct jit_context *ctx, u8 dst, u8 src, u8 op)
 {
@@ -385,21 +407,11 @@ void emit_alu_r(struct jit_context *ctx, u8 dst, u8 src, u8 op)
 		break;
 	/* dst = dst / src */
 	case BPF_DIV:
-		if (cpu_has_mips32r6) {
-			emit(ctx, divu_r6, dst, dst, src);
-		} else {
-			emit(ctx, divu, dst, src);
-			emit(ctx, mflo, dst);
-		}
+		emit_div(ctx, dst, src);
 		break;
 	/* dst = dst % src */
 	case BPF_MOD:
-		if (cpu_has_mips32r6) {
-			emit(ctx, modu, dst, dst, src);
-		} else {
-			emit(ctx, divu, dst, src);
-			emit(ctx, mfhi, dst);
-		}
+		emit_mod(ctx, dst, src);
 		break;
 	}
 	clobber_reg(ctx, dst);
diff --git a/arch/mips/net/bpf_jit_comp64.c b/arch/mips/net/bpf_jit_comp64.c
index fa7e9aa37f49..2520e1db7ab7 100644
--- a/arch/mips/net/bpf_jit_comp64.c
+++ b/arch/mips/net/bpf_jit_comp64.c
@@ -197,6 +197,28 @@ static void emit_alu_i64(struct jit_context *ctx, u8 dst, s32 imm, u8 op)
 	clobber_reg(ctx, dst);
 }
 
+/* ALU division operation (64-bit) */
+static void emit_div64(struct jit_context *ctx, u8 dst, u8 src)
+{
+	if (cpu_has_mips64r6) {
+		emit(ctx, ddivu_r6, dst, dst, src);
+	} else {
+		emit(ctx, ddivu, dst, src);
+		emit(ctx, mflo, dst);
+	}
+}
+
+/* ALU modulo operation (64-bit) */
+static void emit_mod64(struct jit_context *ctx, u8 dst, u8 src)
+{
+	if (cpu_has_mips64r6) {
+		emit(ctx, dmodu, dst, dst, src);
+	} else {
+		emit(ctx, ddivu, dst, src);
+		emit(ctx, mfhi, dst);
+	}
+}
+
 /* ALU register operation (64-bit) */
 static void emit_alu_r64(struct jit_context *ctx, u8 dst, u8 src, u8 op)
 {
@@ -235,21 +257,11 @@ static void emit_alu_r64(struct jit_context *ctx, u8 dst, u8 src, u8 op)
 		break;
 	/* dst = dst / src */
 	case BPF_DIV:
-		if (cpu_has_mips64r6) {
-			emit(ctx, ddivu_r6, dst, dst, src);
-		} else {
-			emit(ctx, ddivu, dst, src);
-			emit(ctx, mflo, dst);
-		}
+		emit_div64(ctx, dst, src);
 		break;
 	/* dst = dst % src */
 	case BPF_MOD:
-		if (cpu_has_mips64r6) {
-			emit(ctx, dmodu, dst, dst, src);
-		} else {
-			emit(ctx, ddivu, dst, src);
-			emit(ctx, mfhi, dst);
-		}
+		emit_mod64(ctx, dst, src);
 		break;
 	default:
 		/* Width-generic operations */
