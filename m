Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820762417D9
	for <linux-mips@vger.kernel.org>; Fri, 21 Aug 2026 02:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787280645; cv=none; b=ZJcd0bMEgxO0NEV3EjqJ3aSV7yxg++Y6IgWa9Qr9q95+ZoIiQ9Ayw7s6mKjHXOTcmBFYMv98wFLpycU+M037CCwG4zGTtqAbqQLH7BvSlG0RefuintaLYgrKOS/vZxHe9bRD3Xeyd4Lzi7585A7I7N0ndbnAQV5BeDOP+0O+jlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787280645; c=relaxed/simple;
	bh=BYrml0pMXKQLTy35R2yD094JYC3Ix+mC4M+c8TqmOhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9TrfRV+ejFtXjzVpPsERuFIUJeJXdi48w4UdJrbVO0BLM8TpqzLg7UIQP7LQCK7ELA2g6OdkxypboYy1VynH1vAkf9Xbj5I21AnhcsDN3yNUVZXwf7Z8yBPYBJSGPxh5VuWu9BLhgVJBNgBRNdguahQId4hfq8Bsdq1jEbumJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbxuDefy; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbxuDefy"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66c70f05859so824737d50.1
        for <linux-mips@vger.kernel.org>; Thu, 20 Aug 2026 19:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787280641; x=1787885441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bLHl1jCdXwSsUFajCWQ0rWHHmvya92XtyYS+pQ7tQVA=;
        b=nbxuDefy2rZdc4Im0sTdTOTjO0Kap96dfCNctQWBkgXx4iICCfhPorUOFmSXU/of+V
         +y2yYP6q87WzHWsOw0KMZ6a1FKYGN5U9rhd5FkXzTOu1Q9cyq2vTrtmV3y+TAavROpgK
         2TJW3/XjobtkV6wiO04c8veiHVxltoG26cKXhITPzPoncmMMjD3EH6NM1ajowz/9Me02
         p57mfdnJkXSK8hGb/XFrVzzSeoLjh7Q0vNJe6aez+eYuGwa1GDFV93RP/nIoNutVhqpG
         faOXmTSvPktpHfJqKdVFbMUBOuqkQNx4BENmjnr+caxTCKyRaPcrJsaTa7Mq8dKACoWp
         v2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787280641; x=1787885441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bLHl1jCdXwSsUFajCWQ0rWHHmvya92XtyYS+pQ7tQVA=;
        b=dZQeKMSktH5EzLFarvvuLrCJ2aAGInPVW1uezlp0sfwAjM/u2I1MAJ3xpPYi+ZM2lB
         f1b6pt66r4iDCErn4EnkMjRwQC5nkzvhf047QAQInZHpr91Rcj1sikGDRpyAtnYJPvQn
         Ce0UDxe/RJ+lpxypqolOB3UEpgpsAYkOYYuT5lEt8ZkYK8+6yypxlCTSdevizwUFG9Li
         W2gNrivnWLgVgMnmcAB4kDqG7VLzwAXk64GVVcbrVJcW6TepCRf1P+f12+R6Y/ge00OB
         yLppRgENcLVjjg6l3ystKNAIXz+dHeBtMZCUjBmwUFsQL6JuQ2PLZGEKpVmdvTuf+Ays
         +6iQ==
X-Forwarded-Encrypted: i=1; AHgh+RpM1IoNR0wYfug7VqNoGCzc4y0X+tLKbYhda7yv/UxHwOCkVOOQXuiMV0bj8ILSUDmQXZFoe3Ja4E8t@vger.kernel.org
X-Gm-Message-State: AFuF++n2wvUOglFIX77xYROZgh2uVoX9tOQnXV24E7pcKFNb8jV6hr+5
	HShm6RzAbbV6LtO/5RDqODR/Vda87SVpbnARtVP2RqNwmVd3jrXkJD/E
X-Gm-Gg: AR+sD13W0PpiFGoXvsTXVN3e5U1G6pVgAN+p92vK44Y7j1urt/YnM6cIo9JWfqViSQH
	8PxEpRkpnRt/I/94tSDQRj/66kWeAe09h1bP9AsTrTwxwlUP6flG3RqzWEp4RGWeOoZMPqgLx3g
	oHPwT77GSV3Zdfk2UnmhAQ32cQkUmVOo9wgfWPKWZNRuNcS1JWdWY1ONoadH7VJihggv/jEC0Ho
	k9T8sU2qmgmbwAdzK/eFTdGpS0yoRP5UiWooaKyT3222F8YkauNc2SB3A7FgDR3PTyLUFV2Jnnw
	ITCGcoU4H3JUS5GEp68enk2AqhIDOpY87WOAs1KdorYKet7s3Jw4PIp309gacVHMpWLROqrTK4u
	sLPG4pHRz5E2N54OIEdgUVp8m4pjZh63OPb+rAXRxe3XImw4idUdYnx5kekUFh/mAi4Zx01//so
	u2t+8yEh19zL0SnUgRQnMXtV91xw5I8ijCJr7dDm7AHfxSntxAsx/2LuRGxQ==
X-Received: by 2002:a05:690e:191e:b0:66c:d803:b45 with SMTP id 956f58d0204a3-66ce4ade1a5mr1490926d50.25.1787280641489;
        Thu, 20 Aug 2026 19:50:41 -0700 (PDT)
Received: from Turin ([187.15.143.241])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66ccb144956sm3682195d50.13.2026.08.20.19.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 19:50:41 -0700 (PDT)
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
Subject: [RFC bpf-next 1/2] bpf, mips: Factor narrow loads out of emit_ldx()
Date: Thu, 20 Aug 2026 22:46:39 -0400
Message-ID: <20260821024640.1601299-2-main.kalliope@gmail.com>
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

Factor the byte, half-word, and word load selection out of emit_ldx()
in both MIPS JIT backends. The existing unsigned LDX paths remain the
only callers and retain the same native instructions, upper-half
handling, and clobber accounting. The double-word paths remain
unchanged.

This gives narrow loads one width dispatcher that can be extended
without duplicating the BPF size switch. No functional change
intended.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
 arch/mips/net/bpf_jit_comp32.c | 28 ++++++++++++++++++++--------
 arch/mips/net/bpf_jit_comp64.c | 18 ++++++++++++++++--
 2 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/arch/mips/net/bpf_jit_comp32.c b/arch/mips/net/bpf_jit_comp32.c
index b3f6b92ac34ed..48a3c834453f2 100644
--- a/arch/mips/net/bpf_jit_comp32.c
+++ b/arch/mips/net/bpf_jit_comp32.c
@@ -707,24 +707,36 @@ static void emit_trunc_r64(struct jit_context *ctx, const u8 dst[], u32 width)
 	}
 }
 
-/* Load operation: dst = *(size*)(src + off) */
-static void emit_ldx(struct jit_context *ctx,
-		     const u8 dst[], u8 src, s16 off, u8 size)
+/* Narrow load operation: dst = *(size *)(src + off) */
+static void emit_ldx_narrow(struct jit_context *ctx,
+			    u8 dst, u8 src, s16 off, u8 size)
 {
 	switch (size) {
 	/* Load a byte */
 	case BPF_B:
-		emit(ctx, lbu, lo(dst), off, src);
-		emit(ctx, move, hi(dst), MIPS_R_ZERO);
+		emit(ctx, lbu, dst, off, src);
 		break;
 	/* Load a half word */
 	case BPF_H:
-		emit(ctx, lhu, lo(dst), off, src);
-		emit(ctx, move, hi(dst), MIPS_R_ZERO);
+		emit(ctx, lhu, dst, off, src);
 		break;
 	/* Load a word */
 	case BPF_W:
-		emit(ctx, lw, lo(dst), off, src);
+		emit(ctx, lw, dst, off, src);
+		break;
+	}
+}
+
+/* Load operation: dst = *(size *)(src + off) */
+static void emit_ldx(struct jit_context *ctx,
+		     const u8 dst[], u8 src, s16 off, u8 size)
+{
+	switch (size) {
+	/* Load a byte, half word or word */
+	case BPF_B:
+	case BPF_H:
+	case BPF_W:
+		emit_ldx_narrow(ctx, lo(dst), src, off, size);
 		emit(ctx, move, hi(dst), MIPS_R_ZERO);
 		break;
 	/* Load a double word */
diff --git a/arch/mips/net/bpf_jit_comp64.c b/arch/mips/net/bpf_jit_comp64.c
index ee99f46828c86..22fb58f970223 100644
--- a/arch/mips/net/bpf_jit_comp64.c
+++ b/arch/mips/net/bpf_jit_comp64.c
@@ -398,8 +398,9 @@ static void emit_trunc_r64(struct jit_context *ctx, u8 dst, u32 width)
 	clobber_reg(ctx, dst);
 }
 
-/* Load operation: dst = *(size*)(src + off) */
-static void emit_ldx(struct jit_context *ctx, u8 dst, u8 src, s16 off, u8 size)
+/* Narrow load operation: dst = *(size *)(src + off) */
+static void emit_ldx_narrow(struct jit_context *ctx,
+			    u8 dst, u8 src, s16 off, u8 size)
 {
 	switch (size) {
 	/* Load a byte */
@@ -414,6 +415,19 @@ static void emit_ldx(struct jit_context *ctx, u8 dst, u8 src, s16 off, u8 size)
 	case BPF_W:
 		emit(ctx, lwu, dst, off, src);
 		break;
+	}
+}
+
+/* Load operation: dst = *(size *)(src + off) */
+static void emit_ldx(struct jit_context *ctx, u8 dst, u8 src, s16 off, u8 size)
+{
+	switch (size) {
+	/* Load a byte, half word or word */
+	case BPF_B:
+	case BPF_H:
+	case BPF_W:
+		emit_ldx_narrow(ctx, dst, src, off, size);
+		break;
 	/* Load a double word */
 	case BPF_DW:
 		emit(ctx, ld, dst, off, src);
