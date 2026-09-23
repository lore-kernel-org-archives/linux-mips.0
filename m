Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B9D3A1690
	for <linux-mips@vger.kernel.org>; Wed, 23 Sep 2026 11:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161857; cv=none; b=ZhWUqY283xLp6BuN/3S3AXwCK9zE5C1wzUeDh6ebg8eX7Fn8etqyIvNjm97tOJrUUT7YIgzrh5hihuYyUW1XZRf0Nte3FNvfeuXvUJ1MccgPZMDfmgoFg0amZt0anzqHeADNVCLyBP/rzLTWnY3CcLN5vvhVJgJK+AfEIC9ZkYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161857; c=relaxed/simple;
	bh=HQ98az85ol9ykgd6Ibgq6G67fhmP9KbNYrzWQtRpRM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ugUx1/JCoKRBuD3KbHsKDx6l+Luk2aJ6of80T/ffsruu74+dqm/moz90A2tcJuiYmREKXHoXW4Inq0J2ud8pA86ymq07jEIQ16P5JeGaxJ7flbLDKwWTGB9zJF3NNGjtwWwdHdkmm2+nsOUfhIJG8YYjne91Qb3OOzcBbBrmbZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=none smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b=XKCE4nVm; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b="XKCE4nVm"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c5231570so689020e87.2
        for <linux-mips@vger.kernel.org>; Wed, 23 Sep 2026 04:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20251104.gappssmtp.com; s=20251104; t=1790161853; x=1790766653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S7qFG7exmvG6u25BqZtpI99huEdrJeNvIdqZ6NzVIJU=;
        b=XKCE4nVmiKICZmNOveLCVJmZc6nlyHmRjN7J4rqsm1VbCmf5NwRLyCsgeodayTI0TO
         0oRHwLzlmcNPFVmqNZYjivW1Ga12WArEE7kSbhnwndlNtrrthY0Fyvh0eKhr7mxxgpB/
         2baQi0cXgg+7gMAIwWDDO/CoysF8B4nKEXMi0Dt1b3DOhLLvUWI2ht/AuyJLlLW5z7Jt
         XKPFYl2+BfcbdYZ0+u8x2qh3ECz0j9jHPHxklEbpHUIb/7ig9Etri8Su49Cq0oZ55Iah
         ylRFcRDp70o3J+VEzxuMPg1WyuKb8iydxmwu7WCJUZR2RwKtGqXIkevXdThNqV4yqvtZ
         Mm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161853; x=1790766653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7qFG7exmvG6u25BqZtpI99huEdrJeNvIdqZ6NzVIJU=;
        b=lCkUEFVWuvkXLUyuPt26lqxmwp+moonjvw4FlsJzerRoBioMXs8Ppr5ySK2tu2IMaH
         gRcH21VBsyErGWOzrh0iHZ2eNcUU0XsViU2sMfhhhbgRrVl/KtSEUygU+IK2PwrLPMDH
         zuszCjhImnTJxlbQS+fjIS+GErj5Kp4dllUFg1+hdKAcjYksAIQugjQSJKLG2x4i6DIg
         54vHmzQL67Te8O5ISibHkq60mCFJoX0prRUD04UGNoyncRwFh1k3CcdicxvX5FaRFe2O
         A0mJ1gJKAj9JPPtombgBLslCoRhGRjCIg7oDQZidP+Twdq/36R9pKV1e5f5LiPUHwUAn
         9fxQ==
X-Forwarded-Encrypted: i=1; AKwUvBy46eP3pyxz8f3PR88zMczvkrko09pZSU43mBtDw6kXhI9jvvfwxqWgsft9VEB/BSuXfKK2vt6sMW0G@vger.kernel.org
X-Gm-Message-State: AFuF++ln4Ra4O7dzcGIGbLcAasg/TUb98zulzNq3mX3io7ARPzQVoxu0
	aHbsTrquw6qkK1XueSG4R5T0Q3W6qVgcnIqXhl1PJEI7jpT8Ok8XS/eGbu/d8ob2cAw=
X-Gm-Gg: AYBFou3eeOniaTIkdetij9hV90keam1/IrJ6WvXSW5TfWhhgynvG4Ejkbjne4jdVaKQ
	W+PV6NSIJ+EOsoiTOsfT65TPljhkVmEzchO9ncuhViKvLfehJP01Qm4v418NsrGCFDYCcR3+Lj8
	fZZxdj1eLFR1tdV8XcaAAmG2IgTE6sJiQqom2V6tAS+LCYMBFJYXGn00S9wEs2pOFdxb2j/2W8c
	vyBEfW7ejlwnpBOq42EsvMn+1kfdeCbpA+martinPp5na6KQ5XjgZEkNsVfbxJe+fygf5MJuAXW
	i20LUa6JbsY1T+TKXow3bovgzME7qgDAcJKcQUinYF1eNMl5vDj5DdIQKwVVP+NM57KoizFs+VP
	g+czUrLHtXRzquCIeCveT/rNIqbUQF72ARRBR5a8Zp6TH8fGF+MS5VS+h346d5Lx/aUyo0xq6WU
	hmzIffFwh2NBd1IeQFmz4I6HqB620LYoCB9uWyDPpkVjvwDNadz9n+g/dWQAiCOqr8SD9bz5v2V
	YpfxQ409VODEszVPFtz7F8AWPAdsjqlOqhLoGhNZOs=
X-Received: by 2002:a05:6512:1389:b0:5b8:c1e3:ec96 with SMTP id 2adb3069b0e04-5b8d89c293dmr844693e87.51.1790161853213;
        Wed, 23 Sep 2026 04:10:53 -0700 (PDT)
Received: from nuc.. (78-69-188-101-no600.tbcn.telia.com. [78.69.188.101])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8589783sm507873e87.51.2026.09.23.04.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:10:52 -0700 (PDT)
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
Subject: [PATCH bpf 1/2] bpf, mips: Fix immediate JMP JEQ/JNE on MIPS32
Date: Wed, 23 Sep 2026 12:51:57 +0200
Message-ID: <20260923105158.3514342-1-johan.almbladh@anyfinetworks.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An addu instruction was emitted instead of addiu, causing the immediate
value 1 to be interpreted as register $at. This made the comparison
result invalid when the immediate operand was negative. Note that $at
is mapped to BPF_REG_AX, which is used for constant blinding.

Fix the instruction to use the immediate form.

Found with test_bpf on MIPS32r1 emulated by QEMU.

Fixes: eb63cfcd2ee8 ("mips, bpf: Add eBPF JIT for 32-bit MIPS")
Signed-off-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
---
 arch/mips/net/bpf_jit_comp32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/net/bpf_jit_comp32.c b/arch/mips/net/bpf_jit_comp32.c
index 40a878b672f5..15a2a153dc87 100644
--- a/arch/mips/net/bpf_jit_comp32.c
+++ b/arch/mips/net/bpf_jit_comp32.c
@@ -1111,7 +1111,7 @@ static void emit_jmp_i64(struct jit_context *ctx,
 			emit(ctx, xor, tmp, lo(dst), tmp);
 		}
 		if (imm < 0) { /* Compare sign extension */
-			emit(ctx, addu, MIPS_R_T9, hi(dst), 1);
+			emit(ctx, addiu, MIPS_R_T9, hi(dst), 1);
 			emit(ctx, or, tmp, tmp, MIPS_R_T9);
 		} else {       /* Compare zero extension */
 			emit(ctx, or, tmp, tmp, hi(dst));
-- 
2.43.0

