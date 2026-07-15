Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BB447A0AE
	for <linux-mips@vger.kernel.org>; Wed, 15 Jul 2026 15:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128086; cv=none; b=lJp2SfJsPUgPbogL0iOF720HludfZzP75DTCWXRx8bAlM0b9Lxx5PViE20Lftj6Zpn5ZKAggbQ8IqW9uXoCdv0cM/VO5JnPYMtVrPcTbkqZHMKuMFMjoIn7iRnssUPOBbg9hlXVdHMhxyqpL+ABvLR7ldMUOCoH6auPhxoEtEf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128086; c=relaxed/simple;
	bh=FzrrTcnxFH3R3YfSjZCvaEa0Ximvyn47zDyBBRonKnQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQGGWnbwcYXvnSIhTsk/nBIhGrnOr6u7nRhHSb/ZLOKKu8+Y+msEbsig276/bDH7JR6t0wTZKy7AGsyNJTLBT4Wx0Z051wNY56ir05tALX3uplniaZec38GGzDa+Sny6EZPQEQIeGwISCa2fSJidkiDGLbesle330EXG2KJbdSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YmCHCoNb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YmCHCoNb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0151F00A3D
	for <linux-mips@vger.kernel.org>; Wed, 15 Jul 2026 15:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784128084;
	bh=jyYKF62rTjAH+wFy830P3VX9/15gIsVD1Y4iMbxkmOc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=YmCHCoNbNqGk5gqvwu8VjBngZaM9iZuYm8D1tD8Slys4PYSaK6iT3M4sHaceqipKh
	 KqOGIVTmrFYIDq17j46oCeoIYyfMOcyB4N2pfh5iM2knixP8RFoujhydqy6ffBL6Rt
	 U8dcrJXzc+rEhtWFH8O63ccqdFTBcGNmNpe+0lL/3/m/1QI/F+5FzZDJS1CEuEH/Na
	 oqoT0/XwjSOaJRG8S7kQ6tS3XcV86s4yvh5GBWHsiV4YIQbN4QnBFLR2fc1keYtWzz
	 KvwUh5NYR5YrxMr1cwrtWzHeHawx6EzdcSWBCHG9BqQOPYfHw1Ix4dpNlItdGy4Sg6
	 FhXnsfllHaanA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c9bb9d2fbso19579451fa.2
        for <linux-mips@vger.kernel.org>; Wed, 15 Jul 2026 08:08:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rof01y1ek3gYrBzfNRkwGsy4dgpqMBeABhVS01iRC3z8a0h3t8lYkqKD4i2N9OHGr7bsCEvsDW6ZJ86@vger.kernel.org
X-Gm-Message-State: AOJu0YxjWZYIbzCvdrJr0vI77WEgvgY1U2HDEx1Qi91k3SUq8kPX8Mht
	5jLbO6iKQxEDyFUD0ofUNCqzblFNS3BdMP36RUcNCgp7PRZE7A0+3esGdI7q/Bxkh8N37hEntvp
	lIJcQOfKiiEeTmHrAZIYk4hF6UdMGvd5IKFfFzLJ57g==
X-Received: by 2002:a05:651c:221c:b0:38e:a12c:418c with SMTP id
 38308e7fff4ca-39caa854812mr44403781fa.11.1784128083459; Wed, 15 Jul 2026
 08:08:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 08:08:00 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 08:08:00 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260715150551.1239925-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715150551.1239925-1-andriy.shevchenko@linux.intel.com>
Date: Wed, 15 Jul 2026 08:08:00 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf_WVU__qRuv5zBpTcrZDewfVCUN0aXLOft5csv7OWRnw@mail.gmail.com>
X-Gm-Features: AUfX_mxIWihrc3w6RLH-Feya15JP63D6ra3fQRErlE9MzcPr76oPuaXIY_wSctc
Message-ID: <CAMRc=Mf_WVU__qRuv5zBpTcrZDewfVCUN0aXLOft5csv7OWRnw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] MIPS: Alchemy: Remove unused forward declaration
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 17:03:48 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> The 'struct gpio' is not used in the code, remove unneeded forward declaration.
> This seems to be a leftover for a 5 years.
>
> Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
>
> This patch is floating around for more than a year without anybody
> taking it! Please, please, do something about this. Since it has
> an ack by MIPS maintainer, Bart, can you just pick this up?
>
>  arch/mips/include/asm/mach-au1x00/gpio-au1300.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
> index 912534ecb1a4..c92d3c2a5ef8 100644
> --- a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
> +++ b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
> @@ -12,7 +12,6 @@
>  #include <asm/io.h>
>  #include <asm/mach-au1x00/au1000.h>
>
> -struct gpio;
>  struct gpio_chip;
>  struct software_node;
>
> --
> 2.50.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
