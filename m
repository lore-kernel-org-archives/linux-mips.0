Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEC63EC810
	for <linux-mips@vger.kernel.org>; Fri, 21 Aug 2026 19:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338903; cv=pass; b=HT5HapuRce1rYyEWs0x18FKF/8PrBwSsLsEVLHfDk1qkvBZskWWI/N5IOZod2D4NXBQxi151enwJMVRoZRE2Y8yUfuM9rh7QMp8wiGAsj4Ib1+1vOWJgh6liYdfPq6/F9eDMZ9KcLC3/Wn0BghQoHlU7UDqTtL5JOsKGMc7NkaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338903; c=relaxed/simple;
	bh=KUZeMo7shoPylg24U5wxGwv6v8UB+b7bcEQAIWDFH1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWCQtss4o3a4n2vhUgjC4BgHhBrCcgpXK8hZuyGtUHeXZZ5NOeaDP+3aFgbqaPaPjCbQByONxz++CR1YnlVCj/xbTPI+5nimg52nFQt+uvYRanHNlGXrRGMObqhGUsxIMg7aOXxb4rR6GpvytHAxoTf8z1vTqvjkuHyU6sNN+5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHygJJ08; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHygJJ08"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c197e7e4e94so252903966b.2
        for <linux-mips@vger.kernel.org>; Fri, 21 Aug 2026 12:01:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787338900; cv=none;
        d=google.com; s=arc-20260327;
        b=azlSVqodizhXnazXj+w4pXFlpjRUFrzzGO/8T7iuQhwIabNLqjx1i/CIDkXJi98ALX
         bE35hVAhQUdzGUZx3EAadG5XLU+DcA5bRxTfgQxMZaF1nJuu47RHfnlJ6P4ueIYCFRIM
         ZcMZdwj+/k09/zU89yAw9I5QowzO5jg2lInuWxfS7KHDKJ5qmBi3tvjsi7hBxlcFCNmN
         7DAAUEaPPS1DxUqoPoAcn4cMpOD0J0nOTdjwRcdqfS2dpQRFa4YeUxc76DD7II9fJ1ge
         QhhaaK5p3+vOLfQRxD/JimZQqhOHBuLoXOU9c6QLC0XGuZKaXC8h7l2YP1BVD1TvwIBM
         7C8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KUZeMo7shoPylg24U5wxGwv6v8UB+b7bcEQAIWDFH1o=;
        fh=GWsw/ZD0aQEEKms8FwIIKQvUxJDV06ABJcOpiuK0HNg=;
        b=SWSW4yGLLJi70ZWUk1h7NjNC/zMai8LGtkfYgC0MCr9zWbb8UutUIHuVFJydhq1wxx
         cFM0p0NpMhbuRasLJREphUEEiSr7e3LyZl9pVH/7M9U4Jqj4Lwxh1xbR4BgwzU5knd8J
         bfWRLP39OUzvanR9PUjdhObd6HnAbAr0BmVXca68vJ6+dIP0P7HmaZioRcqlGUyEWUbC
         BRcwyHBrp92jbJlzispUKippAzjJaxYwd7NM1iR8HK8io/3MPn/tFrmp1F8ViIpSsH7R
         x3N21xdrOV17BM063+Fj5GvHEHxWYn/spP/x7X2k73J6aIZ+DhbNCE+l7nvePFIrvslg
         ftIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787338900; x=1787943700; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUZeMo7shoPylg24U5wxGwv6v8UB+b7bcEQAIWDFH1o=;
        b=mHygJJ08DssyPjk4c0aOAVpKcEnzlTBkFQsuI2oJNAGtdKPcvKKoDPuc0hVrv5mU7Y
         8o9MlgQJc1PffcTdsWggeYG/LGdAWpTqGqX6DTKF7Gha+o/ZP3bEIvfQSH1UwYJtmXsf
         qrILvS+llD6c6suK31d+ahorocek/sLiSEEB0+NAGflixmStKp338mhEJALPdzNL2nTH
         VVYBgQY1/EjLu6BWHwGg7DFvNHVJkm8ixBhgGyzAtVE1Qco3+zULBRfYUYbKnoKB5BHD
         o1/2hl9b6SFnoid8a20aiGprAr42sxn7a5Ah0hrUPUcb05FRSJFWZnUTh/5ks/MRkDz1
         liXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338900; x=1787943700;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KUZeMo7shoPylg24U5wxGwv6v8UB+b7bcEQAIWDFH1o=;
        b=r8pUtetIG/0xadov2kE11udz1gDjYEgjFzgtAiejmRC7kDTEhC4K9TknCUTNivlLSX
         GnOE8lM8isRtyTY8SSR6rDeOHFK6xGcm4XEPA36896fkbFcmTKgVUNiSBJY821zJ7jmO
         DkOr3S5XEAyrrRDWaYWRveacrLBUP5EHupNgOn6kiPgApUETvmAb6VtfSUPUGho+whuM
         rkJ/xux+tD7BW2OTH8+fJzeNc9nh1q+zufpEcy0qldSN9lfteQXHZKNcjuXTEsGPkdi9
         zx5x8k3D1FZH3wll708GSNvhQBxGJ88opEKXnmc8j8k3ctPA507ci7V6ABZ9q1IHHxqH
         1NrA==
X-Forwarded-Encrypted: i=1; AHgh+RoiuD7djnIYXXhnb5THDmZZo0jCbtumbMGZxrqpTZExmiWOAZ6n1T0A3sXB6Sxtz5HcJ3K6s8ObiKLt@vger.kernel.org
X-Gm-Message-State: AFuF++nPLdpjD1erVYxqYFcaXb5tLG/Km4cffpkOTPWl3lxIvZD52/It
	r8Hb44RqtJhM4Wnrdops7gYjIu3VnCI03LLoG/rJug1bnRxagGfUjUufgonZMl7Qxs1iavDjU/R
	WWL9b6gy4bAaSLKcqhEJyF5UjkJbHveo=
X-Gm-Gg: AR+sD112o3S/XA8zHLYb+JkEueePFREjr3LSZRVYo4O9MWnlzxroH1YsvXK9oWMawJ2
	O72u/sCZ48mJZEQDWJqK776Nqzvw8qKk9Lcxej04wGPUoEjN6OUtL6rUA/RVeNp+vQQMf0TZLfR
	hNJwDt8PsowoF0hq/KGmeIC5AXbrU4HWUEsY11jSc2he4ob2+X8Gdu2mxTinTx1cuVcNSvsPoi0
	i64GywHJnwjkShBwZOJtR82kpo30wWq9/eeds/zbNL+Sz2l0vd8wBs21L/WLLHNxUdD7hZcgpge
	9WZRztTc77l1DfxICmRIZhzXep+7JmJ6589999LJMNw=
X-Received: by 2002:a17:907:9607:b0:c1f:c7f0:b433 with SMTP id
 a640c23a62f3a-c24924b8575mr48102466b.9.1787338899730; Fri, 21 Aug 2026
 12:01:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810194215.3754591-1-main.kalliope@gmail.com>
 <CAM1=_QTvdWzBpSGnoLV7wiW0dsn_nc04V8KnYuntptQ5mF9Pyg@mail.gmail.com>
 <CAJZwKkis=3NGw9At0WfiZaRYEoMPbQfqJKN0e+vtRDvp4VY5Ng@mail.gmail.com> <CAM1=_QSk9W1z6mT3EdKV=_cbHm9d5FH1HVO6CFjHcppy+s8OOg@mail.gmail.com>
In-Reply-To: <CAM1=_QSk9W1z6mT3EdKV=_cbHm9d5FH1HVO6CFjHcppy+s8OOg@mail.gmail.com>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Fri, 21 Aug 2026 15:01:27 -0400
X-Gm-Features: AcwNN1WXi2IVhIXIR52V96B0x9b-lcjJRaQUscj5pPaZpyzP7f7V-TKtfA07Ceg
Message-ID: <CAJZwKkjtzQ0cz8z_b0p--sixppFrc=sM98jts2DxWNZY9wfQyA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/3] bpf, mips: Add signed div/mod support
To: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, tsbogend@alpha.franken.de, paulburton@kernel.org, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	philmd@oss.qualcomm.com, bpf@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> If I understand it correctly, I would then add BSWAP and JMP32_JA on
> top of your patches?

Yes, please. The strict requirements are that SDIV/SMOD and MOVSX come
first. MEMSX, BSWAP, and JMP32_JA can then follow in any order, but
stacking BSWAP and JMP32_JA after all three series gives us a simple
shared base.

The MOVSX and MEMSX RFCs are here:

https://lore.kernel.org/bpf/20260819010523.1057789-1-main.kalliope@gmail.com/
https://lore.kernel.org/bpf/20260821024640.1601299-1-main.kalliope@gmail.com/

I plan to post the non-RFC versions after bpf-next reopens, preserving
that ordering.

Thanks,
Nick
