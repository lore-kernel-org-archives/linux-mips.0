Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB6141DDE4
	for <linux-mips@vger.kernel.org>; Thu, 13 Aug 2026 06:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786603112; cv=pass; b=k+NwSZ6Kj4xN+5cd/pzcqAbKXs5uAxSkjLVYjdMA2WAW/b2xbUDjK75+9drmAajmHU+LljwYR+pHpqQjiehGPTnebShjSbvN27bHMmRMDL10pD9gwXCG82+vktLyJNKngvF3DV3yfz3HjYlqlA86wu5+/GXnBGAWsbt2Rfd1IEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786603112; c=relaxed/simple;
	bh=+A24NtONRwnbr6r3D7xaRVes2nGA+7zLWQBwcOligMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYsNA4tRxV5OQIdhoS2mR//T5Gf34khqGXjZXBeUA5IOnNoELrVCZTDPdBEw1/N8WlkdQ6kfv5MN7Mp9fo2VxasuVomwmzeejGuFwHD7/rC3dfpfKqKfPWNhmswV7EOEeF84mf7Cv5enzHrtd82VifZt0tT8Wqs+U2gS0cZmRxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=none smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b=seICwRt/; arc=pass smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b="seICwRt/"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c38568d9e1so699279e0c.3
        for <linux-mips@vger.kernel.org>; Wed, 12 Aug 2026 23:38:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786603110; cv=none;
        d=google.com; s=arc-20260327;
        b=mP4xkULz9qIkDIMLXLHm6Rmj2bc7Z7vWf0GBFVGiu6/VdS/4ZwCxglQ6pDzZZNcCWf
         ylWUcXHITcfYdl/RwlXlG5K/CL779mh3T3tqzslqoyiAidil+aj2mv6utekzclrcSX2+
         G6WEPh9uxgpG4sPLXoJvcgKMSDD/4HJ3VuobFpk+KgiJXzRcFkotbTL1B6sKB5gNmoSn
         C+7xu6OGUnma+2a0sMGpGZZKHdwQU8uowhtZGx3QUqduw/H6O5dvVDEizyAcCEv2p2QV
         DwW6OdpcWJbSG3MLBfJK1+oOxYPOo+PWLAxZVLoXnAHWpv6/cdf2vrBUkZqcTY08iTtW
         /kDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+A24NtONRwnbr6r3D7xaRVes2nGA+7zLWQBwcOligMI=;
        fh=BEt9+NbzmpWlsfpKBi+35GGXcXn5JjCx1fkFYSXtK8c=;
        b=jcAT+GCqogAEVk7Py/DyReKd3jsSDUy3mpXlBYT+VN4QbuBB8nvvxEUekUlOYOQV2V
         nqyNjYWqhNYJzPdAvKVmgqgWbtY21DBASv3FisCqwwfMtWuuhA3QIKm4yLE6KYM6Gnik
         ZGA7+JvR3Nv7500OrfltqWwUv2b2ze1XsfS4EGEVNGDuag3qUR7DOd3dyDngruBJwKvB
         vlvT3IzLzSiFZ1xoB+oIcyYdXWZ57b6N5ZaFVIHWx9Bvw0xn0SCtqBVaP4RNi2LaSjHi
         XNeV8lC9twcZWLwNyHYzk7IQoEWrqP40B60DgSntJ7z0fpZ1s/H1yNqWwz6kFIw6aYdn
         pzpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20251104.gappssmtp.com; s=20251104; t=1786603110; x=1787207910; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+A24NtONRwnbr6r3D7xaRVes2nGA+7zLWQBwcOligMI=;
        b=seICwRt/JeBBzfHlC41orlrh+jIQOO9ErSfHMZyRvAxm4pRcjwaWrEaL7Hh4NBL5vG
         RKtODZQ8PL8KQVZU9Cz6GEaVQl5KJ9OcUBxu902VsyLMt+UnFEzTq1k3LNwKQcZ8iGbF
         kLekaE/Bk0W1BHFsljuhWBOTgGRq5gQEnYnxnX0QKuRBIdvTzVG02d+CjqRe9Gont2a+
         AW+bBC0nyo/NcGPHfo5BDdHCGuWWaMcMsbVyaK4F2uB8C9GmqAYXRlbu/0sdAgGdjQCW
         27yv2xvTQokDu2HkvNdFuAJLaaqiU9sKYXxDWPvykMtKSps9vBhjM5hiqW+74f3OWgJL
         ACZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786603110; x=1787207910;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+A24NtONRwnbr6r3D7xaRVes2nGA+7zLWQBwcOligMI=;
        b=g6TPaXXpMgDDfM/NVLZr7hOY1yz0PYApbykiPGd3EcYOzCEQAril/zoaxPWybgyTRy
         gKfITEod9CFBsXrHc5fF4iKvxYBSMdl3p1ouZTq1pyf2m9IDxVaR7lCLcDTO9Tm2xtHA
         kWLfj1q5xeExtRj+GX523XO35EGu/Bci8s4fblFrAyxyJQvpbtkzxav3VoswNnpBIE4d
         pN0EmVHy2xb73/eXAerIatz2Lovn1af7jK8lU6l+z8idVfvhXn4QY/h9JFZOCjoocOKJ
         HDH3Iv+SyV4+rb228wtIv2IlvFliupxae251NhL2TykikQXP+sXvm/vHxrqljvjLsVpz
         QxSg==
X-Forwarded-Encrypted: i=1; AHgh+RqD9JGpu/eHj/2MGOyjJSxfpD0B7elNFa8ybcS8esLftrQMNoWCaiAmOhcC2INftt/Oq8rJvOwWwx8W@vger.kernel.org
X-Gm-Message-State: AOJu0YxGi/OS53+pLM3y5V78sFyE1bwAf5xLw/poUeQunSH5R489ylqA
	HO2wSR6qiXTpOWB1odea52uJvnbOyKvEPdEldpk3Fju9FyGvOCO8MZH0qyn5YvspQHyGjUQHKoW
	Tc7BmW1n+b+1VmvcdRxXGhfmK9WDv3K8uPXLE/irvgBSXxNAkrrlVKzc=
X-Gm-Gg: AR+sD12035p84ovJH9yCIZ/juMbm81cqjFxSx0O7OsJL0y4NWWqBtcgnxHQ+CT4BNt5
	uJRZUEjCFJtRYFGZ83ucV4vhw8qVY4lHaHNmq1ND1FeLQcVcfusYPXXZ4jMls1QGIHNAZweX1FF
	mA7NZa6ReIcw4v8RAIhn4RDGM1DvKhLQLZH4dQaZ9QtQo+lzKjpRuEvbwF5YkBVbqNn/ooqsMD8
	9fRTZg6DZkfx0jH3euP74vQ1ewAl7ExNkUUMflgeWzenYyYVjCYRgkb5qXmnaHnrFn5kOG6ngC9
	0lg+dcap+KXfPKBIVJjPvlBVPDB7s998MKOEz75aB3KsxRXB5n98fw==
X-Received: by 2002:a05:6122:e24f:b0:5c1:2150:9de7 with SMTP id
 71dfb90a1353d-5c579cef23amr400695e0c.12.1786603109953; Wed, 12 Aug 2026
 23:38:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810194215.3754591-1-main.kalliope@gmail.com>
In-Reply-To: <20260810194215.3754591-1-main.kalliope@gmail.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Thu, 13 Aug 2026 08:38:18 +0200
X-Gm-Features: AUfX_mxnVKFrhzMvzU9GpBsrmWTwP-e51VBkRweV7y8XFEVr_QVxGwultt7UhUU
Message-ID: <CAM1=_QTvdWzBpSGnoLV7wiW0dsn_nc04V8KnYuntptQ5mF9Pyg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/3] bpf, mips: Add signed div/mod support
To: Nicholas Dudar <main.kalliope@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, tsbogend@alpha.franken.de, paulburton@kernel.org, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	philmd@oss.qualcomm.com, bpf@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nicholas,

Thanks for the v3 series. It looks good.

However, i am currently on holiday and do not have access to my full
QEMU test rig right now. I have verified your changes with the
test_bpf selftests on mips32 with QEMU on my laptop, but the remaining
arch variants will have to wait until I am back in about 12 days. I
would like to do that before giving my final approval.

Please proceed with the remaining opcodes in the meantime. I will do
the same on my part as we discussed, and then we can wrap up this
whole v4 compliance work when I am back.

Thanks,
Johan
