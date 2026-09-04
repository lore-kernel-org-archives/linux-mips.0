Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CDE44AB81
	for <linux-mips@vger.kernel.org>; Fri,  4 Sep 2026 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520670; cv=none; b=UuhIf6PgNSK3b2RFR8wIWgyA1chvxSBAWRltFZ5c4zyWu7rxQuo8yvXYJ264uFL5fqa+R/PBHXsj1be9PhtVcJ+oTqLsmKBUiCcxZkSNQZ0A0QQpka/n3RiRJWcK6BnQlMmz1mAz0I6MCYGq2CSRi9oo3dTa7ycp7qavVjEroj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520670; c=relaxed/simple;
	bh=zTBizNpKtLSPwFZHxtHy4hNNKWWCzaj01cIzBDvTbX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UihFBfPIL5+4mX1Deq8UrJFSWG4uETbp3zrMUUavR1EMdmMzqU+li2Ms6+oaLzqdRn8wpUuCON4eEuZojvAXeHl/d7fRScf5Ua7nSStYu9wm5675K64C4j5KuhDg6MbhFK42lrmI5DC0cMqSkBw1wWtBKOCfQYEQ54slRVWxjC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pmlD2FUT; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pmlD2FUT"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90cbff85fa9so11162046d6.2
        for <linux-mips@vger.kernel.org>; Fri, 04 Sep 2026 04:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520667; x=1789125467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zfFWJk7PUW5CrjR05hNpDl61wr3Ggr/JyLicmdvD02M=;
        b=pmlD2FUT6C9OtuQeDRP82EDckNrrO7ndxIhp9tX8/4EyJhTj6UHvYzDZZri2KNMVIw
         gIstLQTB67yCTXsWrIS473nEU0D4zsytuZl6cIGvF1dQPIH19Ti6HnlWdWy50c/PFbAV
         n06OQXfITjQjeF6HQqQsAAIKqz6tC3143HQu4L5RcQWoiieKOsqecH49IvtWoTXPwJgt
         qxzcub3yrd/zX+VHq+R/pj7x1AHBThEPN6gE0+dDR3UsqUlhWPkUOUryUPWTTV7io1HO
         5A1zv+b27aGU766D/GsMzbAjRDcrcBayF60W0ZHIPhJxDP5rNpqWFx+XeqU3uhEi2IYr
         sV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520667; x=1789125467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zfFWJk7PUW5CrjR05hNpDl61wr3Ggr/JyLicmdvD02M=;
        b=RGktozQ1E5G/AGRFL919UU3npaY7yG4M/90a8hrbGxBJyLOTzXLfO3bziF6Qc8lk8F
         Z9BzGnZpABsRQdBtMQWsobHtZkgoLy/P0Uwo3VdedFJUrvrqGqQcFHCcxaDbKAejWZFZ
         xqCY9dyxFW5yzR86Sv6rlnAMuvZguun9URxvAX0DPP/fXVRLQIO5vgwvMWVbF49AHQFV
         k29ehcR2uEv4fO/lepIDti0s4Gzx8hLJ3HzZHRvRMIKX3WKQ/jkkbQy4aqIxllufo4LT
         RapVu0XFcHcotNGKOxUxok+YDDHrXjF7GiHDR1ayIiU+NqrBMEETmXRO6sw8IdGn/s0z
         DrUw==
X-Forwarded-Encrypted: i=1; AKwUvBzGZKlDgS66/VH28ArSJpdNOGOakihKKbLhK+grRobYjk8e6Eb329LTwkeAG9g97Wom8uWsFXAggbbW@vger.kernel.org
X-Gm-Message-State: AFuF++kex02S5KfEn53p/NNrVr0IN5CZD2QPwIFP9FbinkkspOgQWR0I
	m3idGQ9Kk8bdyRnyVJDRfr4c5iTlujGkMrygeSCZy6RwQZanl9pV8xjz
X-Gm-Gg: AYBFou0yTUfaXCfrwybuxPWbgxy1wW5gAAqwq3HajltQM9fPxOo4OcFRP0kAMp0XCCb
	EfmkGvr7JUq/OUZjkwI8u3Vxeull32czHUcot3MIa+TzlSGiMweUWk8K6KbNCjNMJS0UE8OIzQg
	th+hTk+lzDPWyCmsm0pSZxGGFyAoUY3z0Y8rnBiFdeA+S/GJ6QvVeJKUkhd1vBhNRJ+1pYo2Deo
	qtxLTy9X0PyLK9f0me20XDegqttpaoKXTCDO6w/vt8QyaUsBh8YgCBpEkeuMbQd/Sc0MuY0DMUY
	F8Hw3c7uzJg+gftVaeftMBeAB6AUUzximm0pJq08ZE3I/Il4cd/cPXn/48KW/T5B7N3bMsXKoql
	33EN0SWcdC0kRXO59eJx+8ppJ32EOtaCs0NJAy08GfwNPrnxuRyIAHIoL1wymOszb8qaDllRrBJ
	4+/cUIbBpC5GAnG4mF7EF2duehBweDVYSbpXSCAVgwWsHPfnR50qyZ6bvu
X-Received: by 2002:a05:622a:c88:b0:530:42f6:82a7 with SMTP id d75a77b69052e-53054a16543mr56198681cf.47.1788520667203;
        Fri, 04 Sep 2026 04:17:47 -0700 (PDT)
Received: from Turin ([187.15.144.163])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305402a8fcsm18350171cf.1.2026.09.04.04.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:17:45 -0700 (PDT)
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
Subject: [PATCH bpf-next v2 1/2] bpf, mips: Factor register moves into helpers
Date: Fri,  4 Sep 2026 07:17:30 -0400
Message-ID: <20260904111731.673341-2-main.kalliope@gmail.com>
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

BPF_MOVSX carries its source width in insn->off. Both MIPS JITs
currently lower register MOV instructions directly in build_insn().
Keeping the forthcoming MOVSX width switch there would split the move
operation between dispatcher cases and backend emitters.

Factor ALU32 and ALU64 register moves into helpers for each backend and
route the existing MOV paths through them. The helpers own the complete
move operation, including MIPS32 register-pair handling and the ALU32
upper-half state. This keeps the following MOVSX width decoding inside
one per-backend, per-width-class move emitter rather than in dispatcher
case arms or generic primitives.

Keep the verifier-inserted zero-extension marker on its dedicated path.
No functional change is intended.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
 arch/mips/net/bpf_jit_comp32.c | 22 ++++++++++++++++++----
 arch/mips/net/bpf_jit_comp64.c | 18 +++++++++++++++---
 2 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/arch/mips/net/bpf_jit_comp32.c b/arch/mips/net/bpf_jit_comp32.c
index 40a878b672f5..bfe73b023983 100644
--- a/arch/mips/net/bpf_jit_comp32.c
+++ b/arch/mips/net/bpf_jit_comp32.c
@@ -190,6 +190,22 @@ static void emit_zext_ver(struct jit_context *ctx, const u8 dst[])
 	}
 }
 
+/* Register move operation (32-bit) */
+static void emit_mov_r32(struct jit_context *ctx, const u8 dst[],
+			 const u8 src[])
+{
+	emit_mov_r(ctx, lo(dst), lo(src));
+	emit_zext_ver(ctx, dst);
+}
+
+/* Register move operation (64-bit) */
+static void emit_mov_r64(struct jit_context *ctx, const u8 dst[],
+			 const u8 src[])
+{
+	emit_mov_r(ctx, lo(dst), lo(src));
+	emit_mov_r(ctx, hi(dst), hi(src));
+}
+
 /* Load delay slot, if ISA mandates it */
 static void emit_load_delay(struct jit_context *ctx)
 {
@@ -1485,8 +1501,7 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 			/* Special mov32 for zext */
 			emit_mov_i(ctx, hi(dst), 0);
 		} else {
-			emit_mov_r(ctx, lo(dst), lo(src));
-			emit_zext_ver(ctx, dst);
+			emit_mov_r32(ctx, dst, src);
 		}
 		break;
 	/* dst = -dst */
@@ -1555,8 +1570,7 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 		break;
 	/* dst = src (64-bit) */
 	case BPF_ALU64 | BPF_MOV | BPF_X:
-		emit_mov_r(ctx, lo(dst), lo(src));
-		emit_mov_r(ctx, hi(dst), hi(src));
+		emit_mov_r64(ctx, dst, src);
 		break;
 	/* dst = -dst (64-bit) */
 	case BPF_ALU64 | BPF_NEG:
diff --git a/arch/mips/net/bpf_jit_comp64.c b/arch/mips/net/bpf_jit_comp64.c
index fa7e9aa37f49..45fee6f6b87e 100644
--- a/arch/mips/net/bpf_jit_comp64.c
+++ b/arch/mips/net/bpf_jit_comp64.c
@@ -120,6 +120,19 @@ static void emit_zext_ver(struct jit_context *ctx, u8 dst)
 		emit_zext(ctx, dst);
 }
 
+/* Register move operation (32-bit) */
+static void emit_mov_r32(struct jit_context *ctx, u8 dst, u8 src)
+{
+	emit_mov_r(ctx, dst, src);
+	emit_zext_ver(ctx, dst);
+}
+
+/* Register move operation (64-bit) */
+static void emit_mov_r64(struct jit_context *ctx, u8 dst, u8 src)
+{
+	emit_mov_r(ctx, dst, src);
+}
+
 /* dst = imm (64-bit) */
 static void emit_mov_i64(struct jit_context *ctx, u8 dst, u64 imm64)
 {
@@ -656,8 +669,7 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 			/* Special mov32 for zext */
 			emit_zext(ctx, dst);
 		} else {
-			emit_mov_r(ctx, dst, src);
-			emit_zext_ver(ctx, dst);
+			emit_mov_r32(ctx, dst, src);
 		}
 		break;
 	/* dst = -dst */
@@ -742,7 +754,7 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 		break;
 	/* dst = src (64-bit) */
 	case BPF_ALU64 | BPF_MOV | BPF_X:
-		emit_mov_r(ctx, dst, src);
+		emit_mov_r64(ctx, dst, src);
 		break;
 	/* dst = -dst (64-bit) */
 	case BPF_ALU64 | BPF_NEG:
