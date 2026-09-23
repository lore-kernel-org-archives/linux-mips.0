Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2C858038A
	for <linux-mips@vger.kernel.org>; Wed, 23 Sep 2026 15:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176956; cv=pass; b=LC4peLq0cfjSx6X+zkRaj5yZtXmj820a64gm/R5snGrR1MBeRLL9nRRBW797ehRYpCM1VDMKW4u4opPGJkUQNhdLgdElxSALBapz1RdDrOk2RusgkpxIqgRqtD8XgJw84UiFlTP4sD7N2rVLwVVcLE4vu5TpXRKBSYFBHN7To9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176956; c=relaxed/simple;
	bh=k52FAz1VeVA/rpXiXnrdLNg/c0mGxAcxoMRWsw09e38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BwZKULBD6eiI+Dpd+NrGxxMRz+Kzf9fyiKhBQ0lEZ3j1Kgun9KenWBDlIYS3+nRQvT170ybmYxhgcMy6OBPexPytJKl/6l37yf/xTYOFEaVm2ynaTQoGCmow6r7C5Z2uSOFzj/0hXfInRF/mYo8Ep5lCJmSYToBfB9aLFzmhk0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=none smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b=yfU6/ylX; arc=pass smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b="yfU6/ylX"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9832c759198so512669241.3
        for <linux-mips@vger.kernel.org>; Wed, 23 Sep 2026 08:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790176954; cv=none;
        d=google.com; s=arc-20260327;
        b=hRihL3mzuoCLWrPpsgmUTPWWvUgs+yHdK/+VVM7f55sLd/jCLFNQ4N6+up70wCMmeI
         7hTt8JJ+DO7oR/rtJTipj30DoET6uLEblnAW3+K8gFmSfS/vnSjXFSOYEI1rUAzoXFZH
         874neLr/xvwQ5ucr12+M6LAgwV3eCOQf87035RUuIjlaIrcP1Qo2EgWFKbpo3VCZn0ZJ
         pyCgXdH8PayoQVQJlmRLdG3B4gMzrY+ogH2dv/Xz/2Fg+8O3nD5CoN4rMtW3J2C6bBXq
         t80l42L86uXFkRsm0ySJyQNwLegTcf2AuWL+8U7kwYiOd+YIxCo8G564+beY0Kr1ynW4
         hVhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iZ8RpPQpWuomiLvwjk3uovF6+uc5LQwN2VY4ctUFEBc=;
        fh=k48XtFo5Aa54Yf+3OcaMPHATtTIPBVAPyvkO/q3aGmU=;
        b=CsGyBqwsAChO1AFpU4zE9h5PjjP6Xqmub1mkhFUNPMbkMwhRjPZmQy5TMJeaSEsvLH
         ZuECUCDb0pmjr6QWZnvcsDdmGRS3PohlLaz1i8sWGayQJuojgFTVtCSl7MZkz/uSHC8r
         QQL7UmrJK2t6A9/le8R/U0TQGUjWW/AHmdXJw3Kf7rWIxNIA2mgLH4Tt5i5QA4BUNeY4
         fifotJ9+8uCIWU0Wj11+Q3ytEJdH78nMuJBK6mGxviN2bUbN57fzzwSvAQ22bIRgij1I
         JAwQ2mUcHs8ZhsuzEGU+ccRUJDBJcsbXBqadhp1MhIqnKRPLZGfWXqbwU4HJiYWKDHsD
         G3rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20251104.gappssmtp.com; s=20251104; t=1790176954; x=1790781754; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZ8RpPQpWuomiLvwjk3uovF6+uc5LQwN2VY4ctUFEBc=;
        b=yfU6/ylXO3OdTM0k+QgkBxEUvb/719Dq7FSFJCATdd9ylvzQK6MF+5QiYAjSf87ez+
         Pu0it2eiPmz9yWhxZ+/XBYeiydwciL+5NkOzKk554o7gTaM8d9m8OLZ5IWtKQD8g0Hl9
         9u+l+S/NcgC/gbvRgg430bI4WZHwTLGtJqi7j3iuhUuECnWRPcgbGxEa6auMhZxvgfsT
         BXOvlmjNQKI3cHfTnU0DOPtTPyWc0mrix5zIjCqNy4NBhepMJmfNvCNasEqGh9uOFmXw
         1x6V4OVHwnMpknOPg3AMg0FMSpEKorVpKinmfl2O+fzWNx3Ai1XbiIgEVFABPJhzXDlT
         PpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176954; x=1790781754;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iZ8RpPQpWuomiLvwjk3uovF6+uc5LQwN2VY4ctUFEBc=;
        b=I48QrEA6gj30npiTvMCMg9C6sjDpNGvBrZfnc/+9hKmaJ7oLQ36J8OKbiVqE6u4Uld
         BZT+2L58T7H0MSAOjtlADsLS20hUJ4EAc7cBuzWk4KxtBd9nH2XoM/LoR59TzWEZzwzk
         u/rqQjX7L9722bwyabVx684uMDv3sPtkuEAeLQ5/+ew7NyvX34o5BUYWBlk1fzWlgvgy
         g4I22NLxYK/qv4nTsJHqADERskId09NL/RjfPHcJnfY9u26ie2L4/IBGqdA8bWeaNJ2I
         OSB8EiUolliNBkoJxmQcj/MhvTMQuSX6B9iUI0wT6hN4ebZIhBmyN9l5O0QOjHhcNC8f
         CieA==
X-Forwarded-Encrypted: i=1; AKwUvByHMM21cwSfX/WUuh1zEP5K7a07jeKNbe82+1xNmfYNP6PYkbI3TldkYGVT4SfY2vZDUOnacFSN/YLE@vger.kernel.org
X-Gm-Message-State: AFuF++k+MEzpL42MgDuLxsVOqV11s8220SSNuAoK/eET1Df8Xo8M3sEK
	1uUYSmqrr7xy63SPpQfgP8sc2E6Oty7GC5lKxDp2+cjQ19cX8Ne3x2LaicOXddIXolf/r4e2R8+
	cdqlA6YQC6sxP2LyKta6t/JH2eYu8ihP2uyaiEsYLmlRo1rXtuiohiKlf10QL
X-Gm-Gg: AYBFou3w0npFV/vTo2PvfNdVTfw8822IvAXw+5Z1iNTq+jO3GZA+AJeJEoKVEzdKU+7
	32QfLhe6jfXDZaVaVNs84alK41sf6P+OnH5cBA2tbzvpQwq903euTuPlpA9L5GKq06sObz+b0PP
	LvTfvOLHgbq1U02XxTtJn6BQwkgG11F8Guvg+k3zZJftIWLYS4Q6vFdty4YkOyrOYA3zWfU/CUP
	u8o0nkVlmcL1hqbx1ud4PMWC54hCrgyXqhqOkV+lulAHwpQN80oD+uMpViVS5JhpgTJxHrhWFAQ
	T/UDx7t88evNXfFWfSztGUdiDBBJyufpHwv9JWUbt5nuILfRk47LA2w=
X-Received: by 2002:a05:6102:14a1:b0:7a7:7d3c:248c with SMTP id
 ada2fe7eead31-7ac1b9284c2mr2783278137.11.1790176953250; Wed, 23 Sep 2026
 08:22:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912041220.444715-1-main.kalliope@gmail.com> <20260912041220.444715-3-main.kalliope@gmail.com>
In-Reply-To: <20260912041220.444715-3-main.kalliope@gmail.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Wed, 23 Sep 2026 17:22:22 +0200
X-Gm-Features: AclHuK9RzOpNJXNF7_8ky-O5PRlAZRO1N6Z9BojyMo80dP_J3h_DY_FPoZ03fvM
Message-ID: <CAM1=_QTjcyMtMLawSFnCt2c5wJJ-if40GSfo+o-CoZqcgx5wYQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/2] bpf, mips: Add support for BPF_MOVSX in
 the JITs
To: Nicholas Dudar <main.kalliope@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, paulburton@kernel.org, tsbogend@alpha.franken.de, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	bpf@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nicholas,

Thanks for the v3 series. Looks good, with one minor comment below.

I have applied all three of your patch series together, along with the
two fixes I just submitted, on top of the base commit 15972a29ac91.

Nicholas Dudar (6):
  bpf, mips: Factor out div/mod emission helpers
  MIPS: uasm: Add signed div/mod and sign-extension emitters
  bpf, mips: Add support for BPF_SDIV and BPF_SMOD
  bpf, mips: Factor register moves into helpers
  bpf, mips: Add support for BPF_MOVSX in the JITs
  bpf, mips: Add BPF_MEMSX support to the JITs

Johan Almbladh (2):
  bpf, mips: Fix immediate JMP JEQ/JNE on MIPS32
  bpf, mips: Fix BSWAP 32 and 16 on MIPS64

I ran test_bpf on QEMU targets, with the following results. All tests
pass on all 12 targets tested.

MIPS32r1/r2/r6, big and little endian:
test_bpf: Summary: 1062 PASSED, 0 FAILED, [1041/1050 JIT'ed]

MIPS64r1/r2/r6, big and little endian:
test_bpf: Summary: 1061 PASSED, 0 FAILED, [1040/1049 JIT'ed]

> +/* Register move operation (32-bit), optionally with sign extension */
>  static void emit_mov_r32(struct jit_context *ctx, const u8 dst[],
> -                        const u8 src[])
> +                        const u8 src[], s16 off)
>  {
> -       emit_mov_r(ctx, lo(dst), lo(src));
> +       switch (off) {
> +       case 8:
> +       case 16:
> +               emit_movsx_r(ctx, lo(dst), lo(src), off);
> +               break;
> +       default:
> +               /* off == 0 is MOV; the verifier rejects other offsets. */
> +               emit_mov_r(ctx, lo(dst), lo(src));
> +               break;
> +       }
> +       clobber_reg(ctx, lo(dst));
>         emit_zext_ver(ctx, dst);
>  }

The naming is a bit confusing. The name "mov" means two different
things here: 1) an instruction with opcode BPF_MOV, 2) a MOV
instruction (as opposed to MOVSX). I would suggest the following name
changes, applied to both 32-bit and 64-bit JIT variants. This would
make it consistent with the rest of the JIT and solve the MOV naming
ambiguity.

emit_mov_r32 -> emit_mov_movsx_r
emit_mov_r64 -> emit_mov_movsx_r64

I would also put the clobber_reg call last, after all emitter calls.

For the series:
Tested-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Acked-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>

Thanks,
Johan
