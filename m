Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325E044E055
	for <linux-mips@vger.kernel.org>; Mon,  7 Sep 2026 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774638; cv=none; b=YowEVqfO1RskDj91OVWOQQ6XWvCcs1M7s+leENMft8iNDCvzNIRSlAG4cfTsD+jKa3fERP8RgW+4WABpxUY2F/VQ5y3yGenW6CsHFFOG2bMgh46Fb08zTp3bynHxu/ATLWDakeJc0iutzsW+0Q5gthGjLqsTe8vccRqFds29Fa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774638; c=relaxed/simple;
	bh=EJi4g5va8T1f1BIn66h2FvU8Mw088XXg+dMLppSZj+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CN9orNHonrvys/uaCmrPugvOZODDifYX9U7w/jvQf7V2QOkr/r1xCaezAiI+XxH898IeJ+2Tq06aPQ/jLpjouBJucS/4dSic/f5KafvZq6I6uBBhP1Cg3ZxE650AZnqdNfMvsobzUydLZZi9GsSwO6QM+A+0X9/vk/Q8+Chx544=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bf83925ddaso1876601e0c.1
        for <linux-mips@vger.kernel.org>; Mon, 07 Sep 2026 02:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774631; x=1789379431;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jpyiT01uqi3z67FMkXpZRYNDQ41NByhvT2i+cHhX0n0=;
        b=m0/NLJwbzURJnO+WGLfbhLr2gapE7uG2y8ss3JAEEr6TUwKkDtWHAAS+qhL5qGFqZa
         +C1iBbCYsx/bxl++nhJmnALEZCKRDlOi1wrmgkgBF6bLJUvKFeseG4ZOgZbF3I7X5x/6
         zN35xWxCdjWtV14Lv1pIH9v86RBjeltfmewbC1djPtbM1PRlSsMbWPHnwtR3A05VUrYd
         QsD/vCeP+qkGJlYgrOOdVkvOxSfBLKbWGvesQdNTkhpk5kznleDFzGpPul2IJlra3KQj
         RUyiYC2qmJD92bAcmmjgMajiPXT5HZDpoJRKJOg5/EC1lyX6nQeQuNQ5KofEUkwNNncc
         SDbg==
X-Forwarded-Encrypted: i=1; AKwUvBxMBcuSVGhkVUx8IXBpR7lNP8GBfaYZ8FPZobJ4gWtUhuUBTzLMSH6SPdN3if0qfB9KjAmlBamm4TAr@vger.kernel.org
X-Gm-Message-State: AFuF++keP6mV/y0Y6MiD13Xaxk1VZUbWqydKs9ybsAn8ZzConq0CiRbP
	PnG8YWoGkLTjDIFQPZQxIoYJ97sLOo8VKRs48GAT+7/ezZU3FRgFahmWZNB9V11i
X-Gm-Gg: AYBFou0dc0HIf39jV6AENOZklfrj2mB8MYsB0IMaSkwBQNvG7B+O1wUiuvpANi726zT
	O7FwPOjuPyDDVd/w7NVrmFyfsrSl6FyseMf4YK9v0OHu/Zufzb2AYhYE05yjLKe1z0gV7CrOfef
	T2mt0/flc2ZyNrjxnR7BZzwpCR0ZWKL4u+zEqV6iODSkLUuJh4Oyr/6XhIS7WS0fHjZjG1v7Rmz
	N9xaHE42dwDk1s+T81jy8hPCeiQhBb6lcK/kUn11T1+BKk2Oda+e+YGv4ybwM4Nc7OxMhx2kpmb
	hh6CJ6svoQUjfUXbGIaXJJMRHS3JGHoGCil+L4Si60NCnGqDe6FL/f2p3ix46C09Vo7Xm6m1fia
	xX5bp8mfEuoEijD0z/Lj7vr/ilNUj2b8eLMZrq9Sd6v39MVZXEDCGOboI83YqRgHqmmEWrHfwG6
	yVh02QjOfBbaentB+4wEN4FM2H2UTHhEqY1hihphHRPZUq9Ez8Iv33+Zdh0PrwHJCRDj+dJQvZD
	r0+lNaOaezGT5KJ6uP7C+o/mQ==
X-Received: by 2002:a05:6123:2c9:b0:5c3:b805:1106 with SMTP id 71dfb90a1353d-5c7ed05c324mr9537535e0c.0.1788774631338;
        Mon, 07 Sep 2026 02:50:31 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1097f4sm7683376e0c.1.2026.09.07.02.50.31
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:50:31 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7855bfd6ab6so871688137.1
        for <linux-mips@vger.kernel.org>; Mon, 07 Sep 2026 02:50:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw00sbyQFh2yF/i2yo3kpzOdnawCMfUHzNu760XLAE9Lt9vG/AZ2nFmEW5NHGGbSvcq8UxL/Qresf9M@vger.kernel.org
X-Received: by 2002:a05:6102:2ac4:b0:778:30ee:f44b with SMTP id
 ada2fe7eead31-78a4ab31a99mr6505412137.13.1788774630709; Mon, 07 Sep 2026
 02:50:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907090956.2825703-1-arnd@kernel.org> <20260907090956.2825703-3-arnd@kernel.org>
In-Reply-To: <20260907090956.2825703-3-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 11:50:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULSA1XeuyNR2oM0m3bGt6HzKMZkYYKEchy49nztpgNww@mail.gmail.com>
X-Gm-Features: AcwNN1VEYucUOC047DGmcAJRGb8pjtBq2r0j3GGqGyncqZYd9LFOaI3FEXXAmV4
Message-ID: <CAMuHMdULSA1XeuyNR2oM0m3bGt6HzKMZkYYKEchy49nztpgNww@mail.gmail.com>
Subject: Re: [PATCH 2/2 v7] gpiolib: remove linux/gpio.h
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Gibson <warthog618@gmail.com>, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Sept 2026 at 11:10, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> After all other drivers have converted to linux/gpio/consumer.h
> or linux/gpio/legacy.h, remove the final leftover bits here.
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
