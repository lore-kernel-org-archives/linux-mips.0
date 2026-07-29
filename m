Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3978547FAE6
	for <linux-mips@vger.kernel.org>; Wed, 29 Jul 2026 16:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785342602; cv=none; b=jOUKzkstFCT1Pey6v62JcmLOZc+73e6OeG5DR3cxQLT8v9P0lIlqj/ccFUs/GVSAjY3qWMxxDgyXl3kVYyzs5iou8fsbo3u/0NgMKLhA6S/dmIV5oH1wTuteIOGqojy0E+UzaF4vQ4o3D7PtZGvUTxtvugMfiTodDq6JpnmIERQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785342602; c=relaxed/simple;
	bh=UcJm+zVdmhaQ7hxxCJfHfVnp6k95FNk/71r1+BEfajg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mf9O9j9zCHCsc4Cvm6Cn5PcnMY8KrjFZ7QzSOwjW09TKlQxgTQMCCzPAm4EC1MiRx8hqAJlY3d+6s3kYQVmlYqep4x1lh6cRBVEtW9THkcUmDz5Nt9vMDZOzyV/v2HiGInp4lDglZ1UZ4JSagxfKmWzxsyM9Kv69Ml2uIQqQxgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoaJfOm0; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoaJfOm0"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e65e18969so4018385a.1
        for <linux-mips@vger.kernel.org>; Wed, 29 Jul 2026 09:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785342596; x=1785947396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N7qydndb8NAC1l2K1cmIvkvmaJhg7Cl0GZ7WZzozaU0=;
        b=SoaJfOm0xTbcURsPZeeW5j3K5G6cH3DGSWKmOFOxW6Nx138Q+TJtMTxkQcOXruSqaF
         ukh7gtOeTw/GesU8ejroK6J9IKEhK7vSI3BW2ZYwAf9/aLTkzmrKFSBSyBwIfP0G7vAB
         Skax5W7KXsxkbOSgzI+8sZH0evlWwhQHjiu7BJ8KHIpeg5yUk+egXXNUrAYDkpQ4m5Ax
         lnZS8GxF0L/m3VanqahYSYn/x7dewjl6ioS/a8IJmgI6r1ciT5GnShKK/+DxhGiTOzZq
         LkV++K1aADrbGbNDZkQJWdPkMX590S3sx1/2HVBSh7BpevvTyY0/cOh+TzyPbKNrmL9O
         uecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785342596; x=1785947396;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7qydndb8NAC1l2K1cmIvkvmaJhg7Cl0GZ7WZzozaU0=;
        b=kNWJ0p/N6d/3kYvKijwLpFbnc3t5a+D7gWQDAuCZddoJxrC3jPNIpf0FXQr8mlcqpf
         K9JySKzB0AXQ9pBV/G9HXZH1A/8QWVaAKh4klioVt6I8VoWIVM+1Ob0wgz5L/QQ6Iv7A
         +mAu36fj79Ij56KBTxQaex7kkADaTfjpTrE+MSgSBpydgnhgcHcIvgolAJKXYwlvrMFx
         FVXkU8KV67SHij+Uf7DWNDorbuUjClf1Jw7h7rsglx7x69F3M9mL256ci75jXD7RcQNm
         Q3CujCqeRpnAeXMyGC6AfYlYHjgK38rhdwqUgPe0B3BVyVl7CbvfOr1/7o1brEmppG7Q
         zI7g==
X-Forwarded-Encrypted: i=1; AHgh+RpAyuVXF/Nb7xeHG0Tjalcmv6UC0Jkrw0stlhwWP63rehsgFd/oSTAlgt73rqzZtfsyqci7LXArcPKy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Vztl0RMl8TgvmnIVws7znXpo31/hWen8vKTJ/MgpZiHIdpfC
	d59RzsX24NSWMSB7GjF3A3yGxZIKTqpSL0kkdzsr2+lAvsZN7quu17bP
X-Gm-Gg: AR+sD12dTFdI1ZB9A8A6rIs48ysfqKFIyFUXKU1bzK2EAjzdHtvyk10v8nj7OEXEwQi
	iJj9d0oNJO18hl2qt67fH4z2XeuT2H0YtblZnLvMaeYCEgpv11Xcz3a3uVlY+4l172XYff9XqIw
	5tbj/wXGGhjGfVPOpdhx4zn67bfHkzxH6pOipVSpAPif5OLyp3Lpb+ZVvgP6FD8kNl3DWpqpibk
	2v/VjRi3sLk3aOxaP3srPdJJsXf+cYcaytujGZfLWNurNBbULdkj41salXnFtAYO3XmlrjqOeZ/
	1yv2c28atKumzBBNetJrFpUS7w15E/ViczBLZRA0uIhodzVoZokaKTcc/Zw6wp184CKUHR+Gdek
	zoXJ0Mnwo1dU6Was+576tnb667x5Yl25JeK+FazxHq3WkT9uh0YlLsOnXWn6Mg1BSW+2QH7E/mC
	tHI/bunDIyNiD/zjloA6jcYGe+74LeK5rVH995HKiaulsb1oQlQWmkGqQRpE1Hgq/9lREzm9ErB
	Dmu4A==
X-Received: by 2002:a05:620a:1792:b0:918:7e9e:de74 with SMTP id af79cd13be357-93479604838mr256648785a.17.1785342595964;
        Wed, 29 Jul 2026 09:29:55 -0700 (PDT)
Received: from localhost.localdomain ([187.15.144.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e7318180sm201745885a.28.2026.07.29.09.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:29:55 -0700 (PDT)
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
Subject: [PATCH bpf-next v2 1/2] bpf, mips: Factor out div/mod emission helpers
Date: Wed, 29 Jul 2026 12:29:30 -0400
Message-Id: <20260729162931.2369353-2-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729162931.2369353-1-main.kalliope@gmail.com>
References: <20260729162931.2369353-1-main.kalliope@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Factor MIPS32 and MIPS64 division and modulo emission out of
emit_alu_r() and emit_alu_r64(). This prepares the JITs to select
signed or unsigned opcodes without duplicating the R6 and pre-R6
handling.

No functional change intended.

Suggested-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
 arch/mips/net/bpf_jit_comp.c   | 34 ++++++++++++++++++++++------------
 arch/mips/net/bpf_jit_comp64.c | 34 ++++++++++++++++++++++------------
 2 files changed, 44 insertions(+), 24 deletions(-)

diff --git a/arch/mips/net/bpf_jit_comp.c b/arch/mips/net/bpf_jit_comp.c
index 6ee4abe6a..f99bb5705 100644
--- a/arch/mips/net/bpf_jit_comp.c
+++ b/arch/mips/net/bpf_jit_comp.c
@@ -338,6 +338,26 @@ void emit_alu_i(struct jit_context *ctx, u8 dst, s32 imm, u8 op)
 	clobber_reg(ctx, dst);
 }
 
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
@@ -385,21 +405,11 @@ void emit_alu_r(struct jit_context *ctx, u8 dst, u8 src, u8 op)
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
index fa7e9aa37..befeb63ae 100644
--- a/arch/mips/net/bpf_jit_comp64.c
+++ b/arch/mips/net/bpf_jit_comp64.c
@@ -197,6 +197,26 @@ static void emit_alu_i64(struct jit_context *ctx, u8 dst, s32 imm, u8 op)
 	clobber_reg(ctx, dst);
 }
 
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
@@ -235,21 +255,11 @@ static void emit_alu_r64(struct jit_context *ctx, u8 dst, u8 src, u8 op)
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
-- 
2.34.1
