Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDBF3B0AC3
	for <linux-mips@vger.kernel.org>; Sat,  1 Aug 2026 09:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785577500; cv=pass; b=O2RrPEVqS5S7+7aOasmUit6ap7eG5p5TqaaZWTTliNYucf32+VYZLP0Vain/3pAX7bwI9dYiLlieHem1FHxQ35HnLjvTDFfhKUN9SNGXVdmi0kiZnCAGhPcdq9ADf5NW+XMl58xCnjj4bdv2kD4jqR+aPnnwv7/GXfnUluM4AoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785577500; c=relaxed/simple;
	bh=+8T3x6BTgIdAaarTuQS+9WrA0w1pBOk6DXEebwZZ/y8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ExW78/JzS6B9Sk4kcHsWWDk3Gk+96NSSwNgFhxWbqrhIZQamR4JeDYd0iFdbX6dVJwEo9MZdI8VE1VvQiiGr5AYwErcKcLvRqvECBMJoBVEnUzWaWMwNy+2PNki032d9e3s8e6JOD9KmgfXefaaT9QEKbDJ+IYoKH8DCDrw+LDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=none smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b=ZkqxCZrC; arc=pass smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b="ZkqxCZrC"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9696319e14dso583710241.3
        for <linux-mips@vger.kernel.org>; Sat, 01 Aug 2026 02:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785577497; cv=none;
        d=google.com; s=arc-20260327;
        b=TSiWhIeDNjJ3WNBxjJYS3bXLFIbwUfahK7YPb76mkkB3uYY3U9mJYVFr8E+fVR7X/A
         uOi19nP5c/0N84u4SxbfloO5LN4NENGV9BXUCx9KvLNaIYd+ABxMQ1ktbDd1HlcjnxMo
         500CONmvb/fIy9O9AVR+NkmsgKzpz1ABMQbzKB5JlKH85l1m2rO/Rn3Bi2/D+xGG8pN9
         bfsgUPk4l6pUgY2gUZxZNPXP6Nt1TH2G40NI3uHiIW2CPavb8UDHEYPmgbpZ5mZwOr09
         kTUziWFqpHsHYG+b0SCC9bSfdPFzgPktz3KkXzu5pXxwX8R4BxZQZAb2zJxA2tjNWgM/
         /mdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+8T3x6BTgIdAaarTuQS+9WrA0w1pBOk6DXEebwZZ/y8=;
        fh=K+gNulFC1b9oB/7JCtp43fvNP7CreRdFGCkjL7AdvSU=;
        b=q+2dktzQIxfRc08ALDE07zxnuBqsRQF5U4vAJgk7ieR+IRTy1oA+VTbd1Pm0NUA+4O
         qLVtQJbhWmjPxi70hs5DuJY3PmC7erMm0kdyAlzr3wqDi5wlzq+bMtT1HeloH+q+EBdL
         COBxW92mwQKEpFVrruQuqdivQYgcQEfhfHPJ59m/b4aCgIvbu5T4YZTF9bAfFkC9jNcf
         4mLxgVTPAhEAzz0Y83y+c0FTVYAD8GGYrA5jvxfbsE6uqL5gj5pqbkKUMMh8v6EzKuIM
         EiZIklss3OL3TzhNLsqG6sPt0uO8VFl/yQs1/eEn3dxZ4ZpAnn2XQMnBWnAzLbKHrEeA
         Dy/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20251104.gappssmtp.com; s=20251104; t=1785577497; x=1786182297; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8T3x6BTgIdAaarTuQS+9WrA0w1pBOk6DXEebwZZ/y8=;
        b=ZkqxCZrCW8CLOm1gLO9RqcOQhVJ37cU7GbI/7EgTXtPb/Zg7NB0nI3sOVEcLey3gyz
         GT+iMQwKgwsOH4Ajd8QtSSsXbHgMOqQS6D28N+ykBAWiMVNGpsGHNJXklb/VgwqXUkbM
         qWMIyiNvhs7InDxV0fcC6/UcnlyRqy1tiMNR809VQ+h716Qm036c7GrWaI53vw1JgduR
         +RpbWk7uzUiArxY49qNFwtUWcC8D+9/WLvCj9l1MGsBT/xTo8VqG61e08Bx6tzyRC2MQ
         MUBNsrXlDXw/Rai3Pb+WxOPjab/2i9wpKINySe4vW+T6UIS7NJxX1uD0WCnRiNiET147
         23Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785577497; x=1786182297;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+8T3x6BTgIdAaarTuQS+9WrA0w1pBOk6DXEebwZZ/y8=;
        b=LPSrerPD5G7iFFKwlRAcJCrtoceEs3CU6XsdQIY9FoHeXihChHy+n+rFUCweoK9z/l
         PU/GYbu+zRexavF4EX24qRdURK1QDbkAkgGp6E4SK5gFkyghl1rfV6D260O1AL/ojnC/
         lt8ESb5LuG5stBgE+nJE4Cw7LhRMFFBUxx9utI0jXOZQjnmfyoRUIjBJyWcZWYSb3TAq
         dlkSGrpCKM145wMkg6Vxass5Neeb7Pv0qGcuQcbYjW5Av973fpPygljiTfjgXrVnt2hQ
         /nCQiEBNgFUDkf/NlWlCr8jkcJHSwMRtIlVNYMFLNc8RkovSj6LLtWIQAwj9yqJRndW5
         vzlg==
X-Forwarded-Encrypted: i=1; AHgh+RrNpmBHamJsaQQcSQeSWuFWx9yCO27M/k8U7zLjdAUlwx1swlOzsVsQigLZ1JHK0zCDVaVDuy1YKHU7@vger.kernel.org
X-Gm-Message-State: AOJu0YyCssKgNuK1SHUTsmNHj9jaXwBBzjau0qC8PyWmZVcfUGGYMPbs
	lKqNp1cPpHqdfXKG2Lk3XCJuVm4NuEo/uzku5esOs6351Y/VYMHMhLdt3R8Ff7JZTSMI1d+Bn+V
	WZ5w/kPazjkgf2FQH5LNRQWeg+yA50oEnuROsn6Wgpg==
X-Gm-Gg: AR+sD1129Z48RnTDshYoSftKAMSCVyt/iFFgDbvrWsbmLuGrSfT8rfzQwSyraAxaHoW
	7UJ3iFaMLvXbJsda24ra5CiNoCULi8m7kjtpjdGfWcMMBe9qbVJo0TcDLfn7IrvXbK0iUXL/QCt
	VtlMtxU2EY/J1A3BlmzyyVij0zMfHX+rdqr7sMebNeLM739mMvkdHTsRWQ4kF0XanOT9h/K2tki
	BD2RFik+x+vrqERkzmR/xs/h1Mk80r1iY9W4g6EBYGOvuG3Nob+G9tcS0BoceGqSDFbsoGpt6kC
	yKNr8sHtxW2YC5tGMWbzUcObKh8A4d6ekdAkabUVqZQ=
X-Received: by 2002:a05:6102:e0f:b0:74a:b1ee:e034 with SMTP id
 ada2fe7eead31-75b223602a6mr2689929137.8.1785577497619; Sat, 01 Aug 2026
 02:44:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729162931.2369353-1-main.kalliope@gmail.com>
 <20260729162931.2369353-3-main.kalliope@gmail.com> <CAM1=_QS79dDBfaaNQXnWd61AqHd1M4o9aDMMiftnoJveNr=FZg@mail.gmail.com>
 <CAJZwKkgXoHhaej_hkBfytY_6N0PdpwfGMt+GUcHJGyaH0+e7RA@mail.gmail.com>
In-Reply-To: <CAJZwKkgXoHhaej_hkBfytY_6N0PdpwfGMt+GUcHJGyaH0+e7RA@mail.gmail.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Sat, 1 Aug 2026 11:44:45 +0200
X-Gm-Features: AUfX_mzaM7ZKuNLIM5NDcwTn1wPXRR6WpbSUQa-TuJLiyYJnFzRMKLFC3IL_-jc
Message-ID: <CAM1=_QQ7XiJEozaetLt_+kVn91YAXWpJK_pyfT9=paXseW=wwA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] bpf, mips: Add support for BPF_SDIV and BPF_SMOD
To: Nicholas Dudar <main.kalliope@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, tsbogend@alpha.franken.de, paulburton@kernel.org, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	philmd@oss.qualcomm.com, visitorckw@gmail.com, bpf@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nicholas,

Thanks for putting in the work on this.

> I'm working on separate MOVSX and MEMSX patches. Would you be willing to
> take BSWAP and JMP32_JA?

Yes. I think BSWAP and JMP32_JA will be independent of the SDIV/SMOD
and MOVSX/MEMSX handling, so we can work in parallel on this.

> I'll pass the raw s16 off value through immediate validation and
> register emission, and interpret off == 1 only in DIV/MOD-specific paths.
> That leaves MOVSX free to interpret off as its source width.

Great.

> I will validate each series boundary on MIPS32r2, MIPS64r2, MIPS32r6, and
> MIPS64r6, and build the complete v3 together with the MOVSX and MEMSX
> candidates before posting it.

Good. I also have a QEMU test setup that I will use for verification:
mips32, mips32r2, mips32r6 and mips64 (pre-R6), both big and little
endian.

> Does that sound ok?

Yes, sounds like a good plan.

Thanks,
Johan
