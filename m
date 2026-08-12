Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E236844A3F2
	for <linux-mips@vger.kernel.org>; Wed, 12 Aug 2026 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540373; cv=pass; b=UasQADSd5mcSLNBrC/7mW/DGr7IanR2T7SZjMaKRQCAsnTE7IIP4tqk/pujvhFKIp/33q26k/BkzJvhDn4uM20bJKccaR1IRpjFH/His03ghxN90QGEwOctN78S5ix0qSwUhWKD9VNcCInWyeWT8INN1UA107pWyhnBrGbei2vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540373; c=relaxed/simple;
	bh=dc6rbVeNm4QyL/3V2XIAHuNy7OAGezNGW5gOE7R8CLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fP7v17/97vPuWtnWuU7WqrYDLb2R1yHSWq8Si1xk5MVGkJXDE4AZW/nO4kdsERbu79+1jigLSbbXF/KS7g1JckYKVTO4BdKh99yTE4+4SeVwafC+3wHuVtJ3dKtCj/EwfFNrE2F1gZYFoCeF3nXkTjwOXaU+bCwDP95NSb4IpcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfW7qdMd; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfW7qdMd"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81e8fa1b8d6so11352057b3.1
        for <linux-mips@vger.kernel.org>; Wed, 12 Aug 2026 06:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786540371; cv=none;
        d=google.com; s=arc-20260327;
        b=ErytQF/zvIsO86jZFdG16h/IMEqeN83WA2kzqAb6cLdL7/CvmZwikeXflDc0s9n09T
         9ZHE5paHNz9WY5/26T+FEC0VNnnPfz3fXMCeor68xK4WK8w3U2sWs5+32FJQ5OKBotAt
         jJEjf+pPCYMKSGNCOnY0f/8fw0slIfz88AZYnUbgUzx8WOCxwFmmpI2kcveqyu/p6OYg
         gjTh4C3V2HrhkdBIC6HBMZBEpm/+gZMoqljsaUEsNmNevBdX+vXfbEKxdNdRFFLO1vVX
         OppaOROLi9UY3GT0DPyS8RcKUozmNi1Wvp8EVG9k7utURbTqE43cH6GCILnxFaS7GuXk
         Vs4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fi38d1Z8508AImQRjqHp2NM+8Y+VGSxOJGHio2DOJyQ=;
        fh=zQEnIZgpSb2IhTkCmKTa6UjuDXPUbKC1zgBkwPudo+8=;
        b=I2CS0jukQlIckELDpaqI7IpFliNmQAcpmV7uROci4Gm9O+EJAubouZsoxM6Pb6opYv
         5hsw4p3qUC4CZVrkJatmQ8CcxcNx2MFt28RlBoieILvj0lWasmkBdB6wbAos+ZYmakvB
         LDiVuI08BtbMcPDcOg9EfnD7nQzwuBoAX6EtoHFHYG3L7ztmMyOafw5hhvJSauT7g8pi
         icTzSk84ElrElqYwRXsvDBG4XbI94qFNgdKtUBul6K/WAatWBO7SUl4z/GfTi9uoMJtJ
         u/6ApI8frzdnHdP1XTAhixOKxMGGabBwyTZW9sgVJImOtqrEM5SGAUNRT4VVJLFkL23T
         jUUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786540371; x=1787145171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fi38d1Z8508AImQRjqHp2NM+8Y+VGSxOJGHio2DOJyQ=;
        b=NfW7qdMdRDqtxqzz3UGcx6KNF8tfCGFWgG4VJJMB5l4IZBq8ioWeGKki6pe/3Ss0XA
         iGiErjB+3BjYeB2mJ2EPwx0wYAfiZz7NgnRmPZKZQXIponjVVJwRqQ5T+UcoSVxF7tnq
         CJ5CblSwk15yqhVbDZbVW/wO/nIX7xKyd6EI2ze0/VIf+b9lpd5a52Xq2Di25gmMdxCv
         +6RzJsjyuWVDdNtobzQiZUgeG4uUTsTcf6kG0tX0UqnlXaCSSEu3BdepDTlbOd1iKx8T
         IbVe8t9QZnlyUUm7g6VT0kRI3bQFENFFfOI7h1hWJLeh9+zgqbbnlesVZfobXQLQOCDe
         H+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786540371; x=1787145171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fi38d1Z8508AImQRjqHp2NM+8Y+VGSxOJGHio2DOJyQ=;
        b=DciR3FQZUT3ZPjY4q4VyMY8k9Mx1uogYBNqrvt79LSA8z1dmdCUU92ibB1T/q8eiOL
         HyuaRuRxYM93IsRwlmABC7gJaEkQ5h39Q5x82ruJW2jfhf2SjJCGg3gWmnpEgcKx82wd
         3Tu9jIb0ekifg+yztYSRFTcsGYEw9Blp1b4Pt3HzH5/ZwfCuAEmZm06ZylVCajVw0mUq
         CD+qiEZ7dIxTTPAT12Qn6vvNw6/TbgP/V38c6nPJWKGC4KPrlXL9Zusr0hKKJ9jEb+pd
         vb7NOou6BZmRuFHYAB8Y2YQj6NsGOhbfxwakeGHWTVVt1RjDozSkiK4oYHDoSzbWq5Om
         jwWw==
X-Forwarded-Encrypted: i=1; AHgh+Rpv4z5xfCeMpVBrbdx0Oe4iY5ShOAqLHnqlvno7PImy/FRQcVP3aCT+PbOZ9lqlfs6yHRlAOzfLwIwS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz04DNqGG6HOuT56XdLUYhcC6nDdHOOKQutO1YQm/UnPzVbJ7g4
	JX0/DwcUlSI/wOQTOTvpSzWtRdAgtV4NZB5mCgMS6k99AEsEBvsLvEgE2DEAx6Vr+BdREE83uBP
	tGdu9ppwqB0tmDhi+U4d0bDG7F6aG0OI=
X-Gm-Gg: AR+sD1158tbIAQphmQReeXq2GCMr/6kPW73ygOZ3PyGARxdW18tot6Pav3Fh+LItDZo
	JS421mYLAiCyckm9+R3XGMs1zkEtxFE3aGvJmtCEmoBDVz5q7XxcnV1iCWsFCuFx6EKtPZPmZh3
	zOwP7ABdRpPkM102C+9IQmuhs6uEryEPj8/kz1G9I3Kceg5JWuPnzzEZyUzaYZU0u2B1vR3LEpy
	hfNmhvYezKibSppZI5mzafeLdBDGF+wNszk+cd/US3/mjOYsPBS2XgQYxxcLFGpVaOlJyteq61w
	IK3u2CTLi7EnXsjsSl9+g/rxS70aQBOZSPFYx27F5mkTKUZUzNFDUnqLWbsMlos/czNP3VLxtJ0
	ex4H81KjgmINFIXnY8S5gzP4JU10r0K7nZe1UKOOMv/i0hh4GSMVFYcVPcZt78VA9ZkrJqaN4uJ
	2mESkFV1qK
X-Received: by 2002:a05:690c:eca:b0:814:7238:390f with SMTP id
 00721157ae682-83104f89849mr26062767b3.10.1786540370632; Wed, 12 Aug 2026
 06:12:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812032622.1759569-1-rdunlap@infradead.org>
In-Reply-To: <20260812032622.1759569-1-rdunlap@infradead.org>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 12 Aug 2026 15:12:39 +0200
X-Gm-Features: AUfX_mzz_iX0krNhMwyAevf1l2T7b4mndqwqCvalRtUjOeTmgKJbdTH_wy5uMNM
Message-ID: <CAOiHx=mrJh0szu2B8NWideUH8RqUaM7S4OV9J4wN6p93-quW4Q@mail.gmail.com>
Subject: Re: [PATCH] mips: econet: fulfill unmet kconfig dependencies
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Caleb James DeLisle <cjd@cjdns.fr>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 12, 2026 at 5:27=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> ECONET selects SERIAL_8250 even though its TTY dependency is not met.
> ECONET selects SERIAL_OF_PLATFORM even though its TTY dependency is not
> met.
> ECONET selects EARLY_PRINTK_8250 even though its EARLY_PRINTK dependency
> is not met.
>
> Fix these kconfig warnings by adding selects for TTY and EARLY_PRINTK.
>
> WARNING: unmet direct dependencies detected for SERIAL_8250
>   Depends on [n]: TTY [=3Dn] && HAS_IOMEM [=3Dy] && !S390
>   Selected by [y]:
>   - ECONET [=3Dy]
>
> WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
>   Depends on [n]: TTY [=3Dn] && HAS_IOMEM [=3Dy] && SERIAL_8250 [=3Dy] &&=
 OF [=3Dy]
>   Selected by [y]:
>   - ECONET [=3Dy]
>
> WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
>   Depends on [n]: EARLY_PRINTK [=3Dn] && USE_GENERIC_EARLY_PRINTK_8250 [=
=3Dy]
>   Selected by [y]:
>   - ECONET [=3Dy]
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Caleb James DeLisle <cjd@cjdns.fr>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
>
>  arch/mips/Kconfig |    2 ++
>  1 file changed, 2 insertions(+)
>
> --- linux-next-20260810.orig/arch/mips/Kconfig
> +++ linux-next-20260810/arch/mips/Kconfig
> @@ -396,6 +396,7 @@ config ECONET
>         bool "EcoNet MIPS family"
>         select BOOT_RAW
>         select DEBUG_ZBOOT if DEBUG_KERNEL
> +       select EARLY_PRINTK
>         select EARLY_PRINTK_8250

I think the correct solution here is to drop EARLY_PRINTK_8250 instead.

ECONET already selects SYS_HAS_EARLY_PRINTK and
USE_GENERIC_EARLY_PRINTK_8250. EARLY_PRINTK defaults to y if
SYS_HAS_EARLY_PRINTK is y (unless EXPERT is enabled), and
EARLY_PRINTK_8250 defaults to y if both EARLY_PRINTK and
USE_GENERIC_EARLY_PRINTK_8250 are y.

That way users can actually disable EARLY_PRINTK if they wish.

>         select ECONET_EN751221_TIMER
>         select SERIAL_8250
> @@ -407,6 +408,7 @@ config ECONET
>         select SYS_SUPPORTS_32BIT_KERNEL
>         select SYS_SUPPORTS_MIPS16
>         select SYS_SUPPORTS_ZBOOT_UART16550
> +       select TTY

Here I don't know. ECONET seems to be the only platform (treewide)
that selects SERIAL_OF_PLATFORM and SERIAL_8250. Everyone else just
enables these via their defconfigs. No hard feelings one way or the
other, just noticed ECONET is the exception here.

>         select USE_GENERIC_EARLY_PRINTK_8250
>         select USE_OF
>         help
>

Best regards,
Jonas
