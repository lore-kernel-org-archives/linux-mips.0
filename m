Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F8340B36D
	for <linux-mips@vger.kernel.org>; Fri, 28 Aug 2026 10:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912192; cv=pass; b=ofvMHstpH3WyZjLPGu5F4klSDOAjiAavUF8PTKmCqXARGJImkNonLR667WBxlZMSw8D2f1MwxJhwjhzyxdubVqF13y9hJ5oZnivbOfINA3g2RwSAbwUeBGoqOifQRBpuxm7MZyKgq02rpHf/356gdo33sZJx8kg42MnRaub77Cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912192; c=relaxed/simple;
	bh=9nPb6ofpYX8RiPQ7x2iuJEPkGK91/1J8FKtfNZIcC5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HV09VSq8hXott3hWYZUiqatRtcBGuIv8U6i7EoQDIi8hhlU/4FH8TYZO91KVvglqbtMzQNP7XFc52tA4FuQq3QBwIwlk3dhJkQPMKtGbITE0qnsn9EiogOKYPp0L2NBoi3vVgvBQv7a4ctBl7fG+ZZSgLPaePOH303rQEO9lAgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=none smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b=eDi1EAHE; arc=pass smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b="eDi1EAHE"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bf959b820cso773780e0c.3
        for <linux-mips@vger.kernel.org>; Fri, 28 Aug 2026 03:16:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787912189; cv=none;
        d=google.com; s=arc-20260327;
        b=j+c4pTs92N4AdrAvU54035Dkl3rLJXSefBRWhaCuMZ/C9d/A7qnGaxYz5rqCnp7IFw
         jk6zrJyRx+qR9GMqK+DHD8iFUM6oB5nA6EXT6NYKhwcSovaPKkxodg+bweh5IsPSnqnp
         0UWJRPZUG5go5X96qjvCL5jM/QP2FlD61E4ZfE70QbPCjDX3blUIS5p+bZFd3BwPDTbI
         iwk5vVT9B2LT1o/1o4tfcZuWGuYzxra6LGtaYUJ986GhP1rMFw4ZfPUgFVr50jtVORGp
         O92iD27lhC+q6fp5yo5Y+Mjp9jmipn9O8yjQnMx/+DsaYshzITD2M8K0i2IpkWt8/LeR
         mOgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6GcVt68ylb4fqLmficxbeoWwxWTUsNtsQKfhwJMCoe4=;
        fh=ANDTVUM1vreaWSJU0f6f4wfCUG27CxUP7NfHBcUPdII=;
        b=S4csyvpJAiRoiSWef2bf+dJIh2AeWJcKEZUsbsBU7L2qWMWowgNbNw2wzFP4wH94cd
         mlf58t+g7iSFxsBhxVNcVhHn/4PCv9jwHYQP5bZmfogz8AO6tGOIB38n2aNeXeTfplRt
         IBeOvcprqM5beeNaZEWa+sRGYLV5xgI3us00CkP411GCLTtT3qcncbnRJHvzRcahZxPo
         fn24vuGojKxpby/QBR2WBqegmTk2IsowJk6YybP3Rawhzl3mssGVRqgjPbqVmZQF5l2e
         ImYtifCBQfPVR1Au9wHmrvW8c10ofkfopFsPzG/Vf9Ru7bIP3rzBNv6c8h+8n4fPukM8
         5q6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20251104.gappssmtp.com; s=20251104; t=1787912189; x=1788516989; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GcVt68ylb4fqLmficxbeoWwxWTUsNtsQKfhwJMCoe4=;
        b=eDi1EAHEZnV8UO/NrhF4uzDO53/ZiBqe/Kv6LlPMTl1AifjnJFoy3N7vl8W54G2rrA
         2xGtcLViQ6E6TajV3LATlqLSrIK4+DtympTvOkkbRVZHCDB6RacvwJ7CPPDE/wW6YeTX
         uxrK98gVIaDpR9GKb/hPnm7ODAtM3r4KvfBlgB+Aug+U+k7whdR2Uk3otkCkkG2RdjhJ
         nmF7fSrrOry1e4Pw+qwkM/VDMvXTfwBkp1Vbp8rgAT1II2Ot4WBQQuwaeJJJdvgtIyHA
         O+WwqciUVopEQTvIDGa450fP5ZMTIxqTR/P7LYQuYSlteI3ge31ORyszsMnD/HsiSfya
         g/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912189; x=1788516989;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6GcVt68ylb4fqLmficxbeoWwxWTUsNtsQKfhwJMCoe4=;
        b=mdsBcB8WdW7nrXRpTWTr5IlSK2YCiiZV4ghkJHuTe37M5IdYOWLYUDcgzPRfydMO/B
         q6H7ilwDtHvpvRWGJN8DyDybShx9NNSmHFYw+Q4wB9wnRWO3lzjJNaqk0E+3xB22oe60
         PzgnFOD4c7hSnB2r/WuwHUGb/GEbMAYhGW1UYC1DoBb/P1aHX6TkP1+A1hvwOthEziVn
         7y/iylPXu8D/De+OyMA30jnrx8g6mUw6K3jj1xNOgUKTszIbNb/ZrN/860CD5/Q/eSC+
         BzfrwXZJbJ538HEWSv8xbniaiX42oJtTitL8DYe1l8F9mdWgWZ/em7t2njgoxy1gFSq8
         7t6g==
X-Forwarded-Encrypted: i=1; AHgh+Rpob+WVvtcQ2W2vSr6VtlWFDUmoIw5kr3WnhTFrcu04ZWo2pBrusWe2bWjTuJNyXC+xfbLFtjB9CwlC@vger.kernel.org
X-Gm-Message-State: AFuF++l3xdqF5AensTUJaR83ZH70BwlsyZDFn/XYem50yKuza2P++3ZO
	LbHNX09YtL/QTYq940Y2KT99iYTFsUDMa5tBQdYRrzw0NTCK2+Jm/UjYfkSOIuykmZ0dfGAUPt+
	uuTWzcGwccupNWza9B6a70O8R/EsBUdaggDAfqA+s1A==
X-Gm-Gg: AR+sD13ZhfGA7BVgAD3XXe5LX8x6P6zmd8nmVKZoQCf/MKZ5Co/jxrflB7LnHXezVoG
	B4ct/DMDKWJ5MP69MhgNMpfbsA4zHNC6cNmsqDs0XsP7iNOvHZo6OLdkm3H/3US8pWqJFQfOhhh
	Qa5qcAaEiroRGk7Eu5bh6EqduP5vFiznWFUBja02zyxkEQ4sKCP7UAa2fsTGx/MFdxYrI2JsxoA
	NUxo/0B3b8KFjRaolL3RQCedC3ojPIqPfs9MQYmdA1TDPVSS8VSvoAVjh0CQF9NxnEURWKKPe9x
	cDjANQZnWu9Bwx8SkvSKDxmb4fYg8t4cOf910OlnjEn8
X-Received: by 2002:a05:6122:88a:b0:5bd:8c84:59aa with SMTP id
 71dfb90a1353d-5c681777357mr2723173e0c.8.1787912188834; Fri, 28 Aug 2026
 03:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819010523.1057789-1-main.kalliope@gmail.com> <20260819010523.1057789-3-main.kalliope@gmail.com>
In-Reply-To: <20260819010523.1057789-3-main.kalliope@gmail.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Fri, 28 Aug 2026 12:16:17 +0200
X-Gm-Features: AcwNN1UufzODx6ajZ2Cvlnuoud8Jym1z7VvkRIkj38LXxzb7tykFlkvxDcgn1Wc
Message-ID: <CAM1=_QTDhirxjCmXUqvPqTqXMY=uVVcPXE0H=qHH_B+7XFrnpQ@mail.gmail.com>
Subject: Re: [RFC bpf-next 2/2] bpf, mips: Add support for BPF_MOVSX in the JITs
To: Nicholas Dudar <main.kalliope@gmail.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, paulburton@kernel.org, 
	tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nicholas,

The MOV/MOVSX structure looks good in general. Some remarks on the
implementation of individual emittor functions.

> +/* Register move operation (32-bit), optionally with sign extension */
>  static void emit_mov_r32(struct jit_context *ctx, const u8 dst[],
> -                        const u8 src[])
> +                        const u8 src[], s16 off)
>  {
> -       emit_mov_r(ctx, lo(dst), lo(src));
> +       switch (off) {
> +       case 8:
> +               emit(ctx, sll, lo(dst), lo(src), 24);
> +               emit(ctx, sra, lo(dst), lo(dst), 24);
> +               clobber_reg(ctx, lo(dst));
> +               break;
> +       case 16:
> +               emit(ctx, sll, lo(dst), lo(src), 16);
> +               emit(ctx, sra, lo(dst), lo(dst), 16);
> +               clobber_reg(ctx, lo(dst));
> +               break;
> +       default:
> +               emit_mov_r(ctx, lo(dst), lo(src));
> +               break;
> +       }
>         emit_zext_ver(ctx, dst);
>  }

I would move the clobber marker to the end to reduce code duplication.
That is the pattern used in other places in the jit. Also consider
collapsing the cases off=8 and off=16 into one, with the shift
argument computed as 32 - off. That would parameterize the shift logic
instead of duplicating it.

The above applies to all four variants of the mov emittor.

> +/* Register move operation (64-bit), optionally with sign extension */
>  static void emit_mov_r64(struct jit_context *ctx, const u8 dst[],
> -                        const u8 src[])
> +                        const u8 src[], s16 off)
>  {
> -       emit_mov_r(ctx, lo(dst), lo(src));
> -       emit_mov_r(ctx, hi(dst), hi(src));
> +       switch (off) {
> +       case 8:
> +               emit(ctx, sll, lo(dst), lo(src), 24);
> +               emit(ctx, sra, lo(dst), lo(dst), 24);
> +               break;
> +       case 16:
> +               emit(ctx, sll, lo(dst), lo(src), 16);
> +               emit(ctx, sra, lo(dst), lo(dst), 16);
> +               break;
> +       case 32:
> +               emit(ctx, move, lo(dst), lo(src));
> +               break;
> +       default:
> +               emit_mov_r(ctx, lo(dst), lo(src));
> +               emit_mov_r(ctx, hi(dst), hi(src));
> +               return;
> +       }
> +       clobber_reg(ctx, lo(dst));
> +       emit(ctx, sra, hi(dst), lo(dst), 31);
> +       clobber_reg(ctx, hi(dst));
>  }

I have tried to avoid returns in the middle like this. If you combine
cases 8 and 16 as suggested, you can put the sra sign extension into
cases 8/16 and 32, and get rid of the return in the default case.

> -static void emit_mov_r64(struct jit_context *ctx, u8 dst, u8 src)
> +/* Register move operation (64-bit), optionally with sign extension */
> +static void emit_mov_r64(struct jit_context *ctx, u8 dst, u8 src, s16 off)
>  {
> -       emit_mov_r(ctx, dst, src);
> +       switch (off) {
> +       case 8:
> +               emit(ctx, dsll32, dst, src, 24);
> +               emit(ctx, dsra32, dst, dst, 24);
> +               break;
> +       case 16:
> +               emit(ctx, dsll32, dst, src, 16);
> +               emit(ctx, dsra32, dst, dst, 16);
> +               break;
> +       case 32:
> +               emit(ctx, sll, dst, src, 0);
> +               break;
> +       default:
> +               emit_mov_r(ctx, dst, src);
> +               return;

This return is not needed. Replace with break. Consider using the
emit_sext helper instead of raw sll to b better convey intent.

Thanks,
Johan
