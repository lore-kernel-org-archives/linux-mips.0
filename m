Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4864D448BBE
	for <linux-mips@vger.kernel.org>; Wed, 23 Sep 2026 15:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177805; cv=pass; b=NPIMvgXSWZEIiANpxQUnCnVsNUvuN9941z5oYt9o2juRVXe2A3GqjMza7uUySePQS9yVutGLEkLmx9cBPFs8kF4CWFtckjIC5xdVw5QPzhKvtzb8aZ/TgNbYuaN1HOEyx1gTHQ/K2ty3G5dWSdPQOp3t47k1Y/4jY6oJw8GcGDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177805; c=relaxed/simple;
	bh=MckAIFt7y6KQiCveSZvFBLKgfYCSm/ZaqCz+bYvfhus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhyKT7PtX5aZ4bXNEM9En2vMwPKuandgwNLQ0fSxOK5sKkiwwlm58aTxbTehS8b1Gsdhm3B60UUnZ1RcVQaMVo/GMxAxHCugYxY+O9c3IIzG8WxusxHRUraeXXwEsXpDMKyXm7MTMQ9LRsPf4hakPp4f1vEFpPlfWFGfUatx5do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=none smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b=l2TOw4Lx; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b="l2TOw4Lx"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e97e2c7b3so654928241.0
        for <linux-mips@vger.kernel.org>; Wed, 23 Sep 2026 08:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790177803; cv=none;
        d=google.com; s=arc-20260327;
        b=sfoYew9IisXnJC6+rZuutqW1eCSBBRER95fciHNm0uHbO8Vgm/8YsVnFK9EkpMhcIr
         NL+GYE1c2E1xgvjEV2GUM7QbFK7ygsHA0sC4L3xC2kmr+YyOcVuERnh9D+5QZQ18h7xR
         xHdnyHwkwumgSDTp0naA9IcMdhrDKi1WIR86C6EoL5/PVxh8CjLzYSSlxMaKI4g2yLhl
         FQfNDNcdIdSLilqP3KlZK+Zzz1aPZac+/NpEL4JvwQ0M0rf4TZU8U+1ogTCJAfm0BLut
         fZu1RL5J1V5QCk+hP60+IO3hyoOgPRl+6u8p7qSPmiW50q8huQbR0pvTCpFZVVTE599Z
         qeIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WyKcbkEZlymHx0VcQ7j5z0yvfYLusEKHMFeFnghlEvU=;
        fh=FBqfWiUcqf/c/VhUJTfevn6hRQPd6zdQvjJN6p21zlk=;
        b=lh3GisMR5iSjwPyfr6lSYXL7yyp2ErwjILLT+OyXUVD05MYaQnrPMxtT8MZS+xG0B8
         O1MPPB2VChheMVHWHIRj9SPNRPygbW2Ji/tviA6DhYQIlydujN7QnANS8/NunSX7m6et
         WvJq22Nnxe2fx5Uu3kEme8Q7fNql6PGniz3jjSFuUKMRWlL3Y8JzXQyQ4JC4AFFJ7v/y
         jyaLN4ZhWhielD8GvE3aISg+tJEIncbNlhlgqjy+dsRuUl1aMwnAoeS8FNDsPiyBipZV
         z9ZYoKvX0d+TXJ4HPgD/EO3kX79gaYb2JC8ZTbIeoxGvtdozSv/u0BWQKd6Gqr5CSimx
         A2HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20251104.gappssmtp.com; s=20251104; t=1790177803; x=1790782603; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WyKcbkEZlymHx0VcQ7j5z0yvfYLusEKHMFeFnghlEvU=;
        b=l2TOw4LxGBKykjSF6yNa2YP4rRN+HRl2i7AntiIAVw6rxJINw/YSTkq0NvZycm3N/e
         ne4Lc/zLTwN3UeZDESODBDOOcEbzZDs4neg9holUuBm7QbL8+LVLWVZDM0ALbCtbAeDo
         0eDAQn+lIzXrndwUjlVhPMdk5+U6CTCiJFzrxB7SM3W5UViZJzcFq42ZUngGYo+i/XO3
         v42WFEV8rxgGpQMVFC2kC/3N34lvxKXVzuplNyxshLjYPNJJObWJgHS08RWIZUVKCVfK
         xdY7cj8P703FrBFSBKWENWXDeru76REFVDSSdM0jFsqzwPUaaYONs6kq6NItxq1Z/7nr
         uDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177803; x=1790782603;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WyKcbkEZlymHx0VcQ7j5z0yvfYLusEKHMFeFnghlEvU=;
        b=kj/LatdVWLPC35Ga47spxLI87sWHSJhpgv1YHD7Uz7z/xAmeP1R6Sz/wcs63HwAo4j
         8QICWUrm2aQ1rACqHzt1NO7v0LRB0owwYMvFfge59k/Hgk/JgSEyEeyCMwuObxGJXopN
         rwqlZ5rzhtVUtkgyrTcMrfxRCO5GSEF2yVNVMU8qBWmk6EBz0dyNWRu+98+x7ZGnsL0K
         gtiyDRauzJJpSIv1AY+GFz53pQED8a5ss6m1VzbwGUHVdayjl6yUcVenQNxNcIo3Y8JZ
         XXmvTg++D3DG0ipyindRcQj673ZFSe3GdBTXTJsbJYLiUwsGnDhf6keskWMb7lP7cqiW
         //6g==
X-Forwarded-Encrypted: i=1; AKwUvBzoor+NHEifQ2ksrCgF2aOPI6yqQZvn22pNoMgUG5wgfCg9EUI/jGFQRjydfmDACsd1m94fbajKEkhe@vger.kernel.org
X-Gm-Message-State: AFuF++m+sL7JB2XxxwHggYU5wocyDgs4IW8oHIroMfmbP8hMyMn7jTcM
	moVsxB4w1eiLKsj+qy6O5ipXfF/cEvPwzwb+Me76s7KMSHEB4AOCFsvFMVuvtIF4xh7UShtiZzt
	H13mXzO84biKyiqopxMyhWezwzDNkHoz+89yV/ss3bQ==
X-Gm-Gg: AYBFou0f36Z4jG9LcL3BA/T2fKEWRTJvP5ajbRpllfz/epaTnb2hmaZb/MVRT6ggpvL
	6/tclQAJuwrUv6wD7RXZE6p7m3RK9DeKNSlJGlmXEduhVnwqQqN2dXBjFCHiKkjRXaAJHsSSoUo
	cgJ/2kP8yrg47XFVV8Dpg23GMwl6XSVV8mMO8I3jNlmbOeT1RVlzPYLst2zG5sbGdeDcJw/NP7O
	bDpG+dUuBXz8b7CwF/pY3W6FjllttckRGG9e60qJKpTuQMSCcCIH4smvYBKCEqlTAuApABFj32U
	Pg6+h23of1srwQbj697HB3UJvjjY/6HRHQWD3EZOWnMOp3Oc/+mT1ag=
X-Received: by 2002:a05:6102:c94:b0:7a7:19aa:8a81 with SMTP id
 ada2fe7eead31-7ac1ceab000mr2765066137.28.1790177803157; Wed, 23 Sep 2026
 08:36:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911213340.3767930-1-main.kalliope@gmail.com>
In-Reply-To: <20260911213340.3767930-1-main.kalliope@gmail.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Wed, 23 Sep 2026 17:36:32 +0200
X-Gm-Features: AclHuK9A_heK5XpfCJuEwPoemEBWBt68h_7NVvsiHk4qVRuUG-8IlkgYOWm5Ax8
Message-ID: <CAM1=_QT3=gVshfds+0dZbmHy3vrturgddDfzj8MQYaj_mCchMg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 0/3] bpf, mips: Add signed div/mod support
To: Nicholas Dudar <main.kalliope@gmail.com>
Cc: tsbogend@alpha.franken.de, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, paulburton@kernel.org, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	philmd@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

> Nicholas Dudar (3):
>   bpf, mips: Factor out div/mod emission helpers
>   MIPS: uasm: Add signed div/mod and sign-extension emitters
>   bpf, mips: Add support for BPF_SDIV and BPF_SMOD

Tested together with the other MIPS BPF JIT series and fixes. See
https://lore.kernel.org/bpf/CAM1=_QTjcyMtMLawSFnCt2c5wJJ-if40GSfo+o-CoZqcgx5wYQ@mail.gmail.com/
for test setup and results.

For the series:
Tested-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Acked-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>

Thanks,
Johan
