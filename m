Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3AE371D13
	for <linux-mips@vger.kernel.org>; Fri, 28 Aug 2026 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787914206; cv=pass; b=ujcf1c11d8E26kcnFfCKLpI5eFsM3qB/K+D+Kj+3L9MDQOBO6ioQkS5kZ3Q8LdqIyf48OfTCbx3RCqYyrtp7nxQlbQ8F/DQFRtcZcCiF665zzc1OXCS40DokjcaeMchBLwTOx+xh7fjqzqah+GRLcZTmpa8VkAyaTTlYDsyeqgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787914206; c=relaxed/simple;
	bh=/cmKlDq8DFYSfOEtJaUMv5tjE2XNmgf878iFonULAYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KpgVgKoYH7HIOkDcZ+W+SHlKZsYnGGVs0l1XvndUKQURxi0TSMV9V0eyHigXoQRiYtvvf7LvCNp50tqHWhrvwxo1E1K5y25qGmGYRiHtBoerFTH4w6K1ERxQaG9njs0fQIux7w5cRSfvsS7ECSqr0QS8be4iQz8s8G7n5u4HRjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=none smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b=hk8c+ewE; arc=pass smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b="hk8c+ewE"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c2ae02f69eso667124e0c.2
        for <linux-mips@vger.kernel.org>; Fri, 28 Aug 2026 03:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787914202; cv=none;
        d=google.com; s=arc-20260327;
        b=m+5u6zIXOcq4CrfEjygFnLyhj8zayg7qvmOAej0p7E80A3xS4G20fHIJJPZ8BefV4y
         taTn3GiCn3fazpFv0Lp03SfkhnNSkKXYyLRrVusYIcw05OYk7UIoAF5f1FYmnB/XoA43
         DA/fsDEDmPGjNLuONeAZ57uyzldV+an3wNvFibXgul0YSD0uzNbHuNgOqjA2fBSbihw0
         wiSO8LX2CVLiIip/35Vqx4Fw7h+c0dNDE2GEFGCkTn9rCmCKe8TIJ9ORa5ZTgshAZx0j
         yRnXmk6cfF8Gz4r/3BXjZlfKN0MCs1lkr9iPkoDmEC5PFN6eNQ7uIGvJbAcbNXr1gEyt
         rONQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u8lFH0HcIkW98kTciUv5DunOUausL9QXc09fXIwSfCY=;
        fh=VyYHL0f1QZq0bIenlZ/zuNn16kFsWGWqFNaMX41LPY0=;
        b=Mklw5NYa1Lh9pE9s/rZjHuP+7rrvc4Yn/AyY6b90QIZ6Xbbp/KlrumYMd/bvTEPDfd
         3KriGpKYFoapthsgGi70K0h9HoN1YA+2/eXsHyhnsaNEyDJBg6Z8CHrbJAktXk4tmUeS
         XZj+zah0iLzrxlD4ZsKfVL/1BMtwK88bG+/x9eL3ZNXEPGOfG5+iGJe2yu9tFmmI8l/K
         Wd9OwUaMdlWXVNsjtZUr9jQai3aT65mtBs1uIpj6iAFwD6WFGvKk1qAOaHsn8IJWRlRB
         yVoUQ9ZhbjT1JApxMvxn1DZnUQWa4q0bVAObsh0ZAwDyVCa0JfPeSNl21OOp7EYQD592
         WoCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20251104.gappssmtp.com; s=20251104; t=1787914202; x=1788519002; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8lFH0HcIkW98kTciUv5DunOUausL9QXc09fXIwSfCY=;
        b=hk8c+ewE0E7JdEzNTQ4K9HZ8m44/906X7j2n5FSgllioAW6FiJswuo7vLJ88sz2km3
         /I/imYCSm28c/IPK9f0Ts7uVjTpWFKS6tQL2X+JWo84oTZsn23RgIB0B6J7NGQVWvNWF
         DoTzs7SMykRzGF9gE9Gw6b5uwTDWsIv/Xutdrq6QclZ0EA20SvVh45diZ2lGRaSt8Weh
         zrMQtNvgLpKJm/vzUVXbEbwb7VLdM4H4EofD7szdp9nwXHqzUyffnytTG+qWRV8UM0bQ
         PyNav6Qnnr2NvkrFiWXLnOtUkw5frqGaSsZc3m5Gha3tSweh+69ePR3YVUn15rSv0h/d
         XXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787914202; x=1788519002;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u8lFH0HcIkW98kTciUv5DunOUausL9QXc09fXIwSfCY=;
        b=m6nnjvYT517Mznym6bIybSePeLTHdut0fP75J8VAH/yqMogavgDiNPBilGMAzzs+TE
         /7rwT7gaVmYhrbDLjk89ueShvSL1tOhCxVdxRpDjDxLB07ABDV/JYXMgvXxuBvcvKAsA
         4+myQZU8Ymd4TJzr12W0L/qq1xB+x7KcS2IKhWiqtFx63xa7QwYscq7NLNdRYPWtdsZl
         ZA12BGurM+va0PhINK/DvMaAhVJnRwOnqwlfrdxSJ9paPFqCyVKPXSEB4Dr4OvWO9fR/
         Uc/yxRDZExcBTWzdbKm10RNgtdg0bu7nBB2ZCJHwGfe/88E9E1PaXCtz2YFK7YHNYtc6
         eFqg==
X-Forwarded-Encrypted: i=1; AHgh+RoyJ1K4vQ1r+SITaOm3ROOO2h6Y8ByJEhugNsAa2pGe1rAP2VyqBnzOn9lrYY3IcLTb7BE+AvBd/yS4@vger.kernel.org
X-Gm-Message-State: AFuF++lQr2Fj1N1j7yOgCUACjlmexbUV7u7DQ58oNprpUrpVKujgEmV1
	kiYLgv085kZbEjFlMAAoIKlUUym59Z312XHvs0CYNZ88jG1XLfty8W2Khf8OUnu1NIuv3QTOcPF
	PizXwoTUcPdh/gRY+/v11bo2TVRGWouPxH+0bkrpc0LG7U0XTdKz3t5w=
X-Gm-Gg: AR+sD120Qpl8q2ahqwCaP3PZeY4qyREQbBj/tzgsi0cDhxdirvujScUSt5/rycmQbYf
	mPjz4nG9D+dQbUsLR+m9wIG3zcjOA+LFx6vxhuLCYYWEAXT7NXKwxaUTmjphhLQl0AdecV+1i4O
	T6JE/mYsY3N44u2nf29sN0lAdR+a+mZjQVTdj0HViPFLEBsH6dHlUAzWLiFcjwd93e++fr1ZM6b
	G2cZ+yYu10ZoA+a31zLLoqdC6uDNatpdNNJeMRUJnhFCojyjwOCBkjsR9FMX3zgXiMo8CxMGbBq
	cf0uR+wQFdOi0zFxHUnSkU60qlUDSU8NUaVHiSSxOHYK
X-Received: by 2002:a05:6122:9001:b0:5c6:7f44:b001 with SMTP id
 71dfb90a1353d-5c680967056mr2568641e0c.0.1787914202558; Fri, 28 Aug 2026
 03:50:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821024640.1601299-1-main.kalliope@gmail.com> <20260821024640.1601299-3-main.kalliope@gmail.com>
In-Reply-To: <20260821024640.1601299-3-main.kalliope@gmail.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Fri, 28 Aug 2026 12:49:51 +0200
X-Gm-Features: AcwNN1UMwJxqSjr7UcYRArvxGmZya0K67Rn2WYUklgep4iJra1Tjsl0TpYlszf8
Message-ID: <CAM1=_QQTv--NiWorjiFSrF+Ua9XaBL1MobNZSOgFqOb9w1FPKg@mail.gmail.com>
Subject: Re: [RFC bpf-next 2/2] bpf, mips: Add BPF_MEMSX support to the JITs
To: Nicholas Dudar <main.kalliope@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, paulburton@kernel.org, tsbogend@alpha.franken.de, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	bpf@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nicholas,

>  /* Narrow load operation: dst = *(size *)(src + off) */
>  static void emit_ldx_narrow(struct jit_context *ctx,
> -                           u8 dst, u8 src, s16 off, u8 size)
> +                           u8 dst, u8 src, s16 off, u8 size,
> +                           bool sign_extend)
>  {
>         switch (size) {
>         /* Load a byte */
>         case BPF_B:
> -               emit(ctx, lbu, dst, off, src);
> +               if (sign_extend)
> +                       emit(ctx, lb, dst, off, src);
> +               else
> +                       emit(ctx, lbu, dst, off, src);
>                 break;
>         /* Load a half word */
>         case BPF_H:
> -               emit(ctx, lhu, dst, off, src);
> +               if (sign_extend)
> +                       emit(ctx, lh, dst, off, src);
> +               else
> +                       emit(ctx, lhu, dst, off, src);
>                 break;
>         /* Load a word */
>         case BPF_W:
> -               emit(ctx, lwu, dst, off, src);
> +               if (sign_extend)
> +                       emit(ctx, lw, dst, off, src);
> +               else
> +                       emit(ctx, lwu, dst, off, src);
>                 break;
>         }
>  }

I would actually prefer to keep the original structure and not combine
ldx and ldsx into a single function with a boolean lever. The helper
does two completely different things depending on the boolean
argument, and the two modes have nothing (MIPS64) or very little
(MIPS32) code in common.

Another aspect to consider is this: An implementation principle has
been that each emittor should take care of its own "dirty laundry".
This means that the emittor should mark everything it touches as
clobbered, and emit necessary delay slot(s). You could easily call
clobber_reg() in the emit_ldx_narrow() helper, but it does not have
enough context to know if a load delay slot is needed or not. Without
the load delay slot in the helper, an implicit contract between with
the calling function is created. That is fragile and is easy to
overlook if the functionality is further extended in the future. If
you keep the loads inline in the ldx and ldsx emittors, the delay slot
lives together with load that needs it. Note that the clobber_reg()
helper is just idempotent JIT-time book keeping, whereas a delay slot
has a run time penalty.

Thanks,
Johan
