Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F092050C28D
	for <linux-mips@vger.kernel.org>; Fri, 25 Sep 2026 23:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790378446; cv=none; b=Ft3QVUevt7xiphCnOPCSANDs3HitOZrQpVtvVHZnXhLKj1BBjRMIMtfAUqmrwF1vaE8jtujGb94yDtCPIBJXCCZpAW8gFrWpOV8Z+5Gc9Q8LAtugMjlFxZ00KAO6RVWZ0+nVAw/5pvvrKqF2YaQ6Tt3QRidYeBjQw8IqBAup8wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790378446; c=relaxed/simple;
	bh=uNyIZawlXUFH+vWnPxM19u8WPHDKOdBH5t/9SUUm9/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXfRJbW3tAENVrpkwWF5wwo098+Jdj8aWQj0mHIHWMHSgsdjeitYQMyFCWRQm/Iw3aYQggK6z6fcVqrTErAKes4rryKtt23h7wULsXdPmmx8/Mi/0nalJfIuMvqmK3ZHRbWaN4c8Ru3dUh1doT/QeJ3QFQhPSHmoHdPZtoixp28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=pass smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks.com header.i=@anyfinetworks.com header.b=dml/q4/w; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks.com header.i=@anyfinetworks.com header.b="dml/q4/w"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8eacb7c8fso820735e87.3
        for <linux-mips@vger.kernel.org>; Fri, 25 Sep 2026 16:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks.com; s=google; t=1790378443; x=1790983243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmp0hAHy0EFtBjENgNqTmQMkKp1jjD2xZz8/kp2KS9Q=;
        b=dml/q4/wDnGpu5YPbsmCO9G6vU3pnNTiWELr0GpfzVIhPG1U7dMLV3rG1lB75qprr7
         rith1pYtDUbJVdV0uC+H0q0mhlIaWvFGxgbMY1qYUVk6CnSj1ISDnwQ5lECZW/0a3ELS
         5Hox4QkLTjHERn9J/sYJXPsuz9sIr0o1holfDWcviRnz6OTtq8HMffUT7BFzBYI4jFWp
         qLyA+4bmgKnTxjHqTgFZrseJDIqLjFJv+T5VADAPI27Fioduhqlp5SR0shiUgjEYdl5Y
         UR40TBq8oHa4D7HsX3pPFe3qevvw0e6UXwRCXueACn95NZYNcl/MNXSfa1QCjb8yOR7e
         d6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790378443; x=1790983243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmp0hAHy0EFtBjENgNqTmQMkKp1jjD2xZz8/kp2KS9Q=;
        b=tuVOpT1M0Ol9kVmPejFaHLOXCMRt7RvSOa+q15PjJVauD7OB++em5T6pA3E7SbJIHc
         YAf2XdmHIbHZgHn3dg7FCAJAPkfvog8iqCPHIMrXAFIuXxLSID+6iZboTpKe6aGoRLaC
         QO+BGIZoagZJ+MXYQBD/hXpK0EE5/lZ5j1/jJphWG2O1qVom9LhFXk550795LMKneMbI
         jVZkt8kwBXZwLWmTkjMgu4XC2H24kFYN5Q+1vpcJ3gP+kZx/W4Qj5HBle8IKOlOoVARH
         oD717UXKFYaxSXvGN5IXXhwc6TqX4h16/voyyieduwJf6kUNudFam5wSf3XQgI8YAw+X
         kYZg==
X-Forwarded-Encrypted: i=1; AKwUvByl6OVJPDDs2Zzl25yN86LqrfiDjoGvSqFaEs2/9LxKzimcgRLAJGJMEAX5zXBTYS+RFQIiPn2Ym9Pb@vger.kernel.org
X-Gm-Message-State: AFuF++k5Wxz0GgxLHLfoyHjuYTnMoT58saZ1cmtzW0b/7CEUemnW2iU7
	dXBAbpYbMukAjmM6Mm+OLRNfWICZGDTCbPfpbbDhz3600VrQimdE0xS4sOiHbUbzPfU=
X-Gm-Gg: AYBFou3R507X7rLx+FGbXMUA+5+f3gYRrtdqN3xuDYQfr7b7ZmW3T2Gsg+6/NDnwU4t
	Qds3Cl7lZU0BgPFrVoNW/4Rpghbx0cdtO2YvUmitMW6WdGQWM1dAys6qd1GnXC26VCzC1bpqu5W
	HxTZpwvB7Tx4E8ZWbVMVIIN1i3JCmIBJqPWjXv572ImFeBZQbHwsLCn93WiVqcrnQPW14Qo611G
	apKgF985KEIkVKXWJfOweDNIGXlJ7uAonYSS2bfETWpc3MEZkSr5SwtGt1OE85HDdugnTnc5ww7
	4HhxBe+eFEo7oRcp2399I0EWSjJOM/zMi63dmX7SnVdpYYs6AnBapx8EeAMIgBhEpv9edfYaZx9
	VtWUR55rtX/twmnIQxnxS8StdJhAXaeZKx9Plud/Ol9ik/T9Jast5EcprR3TKDA2S/aKwcks9sn
	4WJ74MStMYJhGlm9Em/8LjLB5jJA8B8ALdYOLOe8dYb1Emf88M+5nIE0B6U48HofPS7Fa/yzgBb
	/lk6lKHaxWMmal/UfYoROp+7OlJVO5qKSLFheeWKhqwMmK7Yp7xhg==
X-Received: by 2002:a05:6512:114c:b0:5ae:b887:bb33 with SMTP id 2adb3069b0e04-5b8e6c8c8d5mr1525937e87.1.1790378443025;
        Fri, 25 Sep 2026 16:20:43 -0700 (PDT)
Received: from nuc.. (78-69-188-101-no600.tbcn.telia.com. [78.69.188.101])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6af81cfsm875260e87.40.2026.09.25.16.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 16:20:41 -0700 (PDT)
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
To: tsbogend@alpha.franken.de,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	paulburton@kernel.org,
	main.kalliope@gmail.com
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	philmd@oss.qualcomm.com,
	Johan Almbladh <johan.almbladh@anyfinetworks.com>
Subject: [PATCH bpf-next 2/2] bpf, mips: Add JIT support for JMP32_JA
Date: Sat, 26 Sep 2026 01:19:32 +0200
Message-ID: <20260925231932.1063678-3-johan.almbladh@anyfinetworks.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925231932.1063678-1-johan.almbladh@anyfinetworks.com>
References: <20260925231932.1063678-1-johan.almbladh@anyfinetworks.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The JMP32_JA instruction from the eBPF v4 ISA was not implemented.
This caused programs using the instruction to fall back to the
interpreter.

Implement the JMP32_JA instruction.

Signed-off-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
---
 arch/mips/net/bpf_jit_comp.c   | 2 +-
 arch/mips/net/bpf_jit_comp.h   | 2 +-
 arch/mips/net/bpf_jit_comp32.c | 7 +++++++
 arch/mips/net/bpf_jit_comp64.c | 7 +++++++
 4 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/mips/net/bpf_jit_comp.c b/arch/mips/net/bpf_jit_comp.c
index f14de6d73122..4682dbb3a059 100644
--- a/arch/mips/net/bpf_jit_comp.c
+++ b/arch/mips/net/bpf_jit_comp.c
@@ -850,7 +850,7 @@ void emit_jmp_r(struct jit_context *ctx, u8 dst, u8 src, s32 off, u8 op)
 }
 
 /* Jump always */
-int emit_ja(struct jit_context *ctx, s16 off)
+int emit_ja(struct jit_context *ctx, s32 off)
 {
 	int target = get_target(ctx, ctx->bpf_index + off + 1);
 
diff --git a/arch/mips/net/bpf_jit_comp.h b/arch/mips/net/bpf_jit_comp.h
index 0ddedb733dd1..d0ab5c9a0c46 100644
--- a/arch/mips/net/bpf_jit_comp.h
+++ b/arch/mips/net/bpf_jit_comp.h
@@ -204,7 +204,7 @@ void emit_jmp_i(struct jit_context *ctx, u8 dst, s32 imm, s32 off, u8 op);
 void emit_jmp_r(struct jit_context *ctx, u8 dst, u8 src, s32 off, u8 op);
 
 /* Jump always */
-int emit_ja(struct jit_context *ctx, s16 off);
+int emit_ja(struct jit_context *ctx, s32 off);
 
 /* Jump to epilogue */
 int emit_exit(struct jit_context *ctx);
diff --git a/arch/mips/net/bpf_jit_comp32.c b/arch/mips/net/bpf_jit_comp32.c
index 158e69718c09..84d9c7036e4f 100644
--- a/arch/mips/net/bpf_jit_comp32.c
+++ b/arch/mips/net/bpf_jit_comp32.c
@@ -1877,6 +1877,13 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 		if (finish_jmp(ctx, jmp, off) < 0)
 			goto toofar;
 		break;
+	/* PC += imm */
+	case BPF_JMP32 | BPF_JA:
+		if (imm == 0)
+			break;
+		if (emit_ja(ctx, imm) < 0)
+			goto toofar;
+		break;
 	/* PC += off if dst == src */
 	/* PC += off if dst != src */
 	/* PC += off if dst & src */
diff --git a/arch/mips/net/bpf_jit_comp64.c b/arch/mips/net/bpf_jit_comp64.c
index 8359ad3f6992..994589c3de46 100644
--- a/arch/mips/net/bpf_jit_comp64.c
+++ b/arch/mips/net/bpf_jit_comp64.c
@@ -1041,6 +1041,13 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 		if (finish_jmp(ctx, jmp, off) < 0)
 			goto toofar;
 		break;
+	/* PC += imm */
+	case BPF_JMP32 | BPF_JA:
+		if (imm == 0)
+			break;
+		if (emit_ja(ctx, imm) < 0)
+			goto toofar;
+		break;
 	/* PC += off if dst == src */
 	/* PC += off if dst != src */
 	/* PC += off if dst & src */
-- 
2.43.0

