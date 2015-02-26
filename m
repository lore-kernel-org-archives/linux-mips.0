Received: from mail-ie0-f181.google.com ([209.85.223.181]:39465 "EHLO
        mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27007512AbbBZWn3ns2dZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 26 Feb 2015 23:43:29 +0100
Received: by iecvy18 with SMTP id vy18so22415143iec.6
        for <linux-mips@linux-mips.org>; Thu, 26 Feb 2015 14:43:24 -0800 (PST)
Message-ID: <54EFA189.3010509@gmail.com>
Date: Thu, 26 Feb 2015 14:43:21 -0800
From: David Daney <ddaney.cavm@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Fix offset2lib issue for x86*, ARM*, PowerPC and MIPS
References: <54EB735F.5030207@upv.es>        <CAGXu5j+SBRcj+BGyxEwUzgKsB2fdzNiPY37Q=JTsf=-QbGwoGA@mail.gmail.com>        <20150223205436.15133mg1kpyojyik@webmail.upv.es>        <20150224073906.GA16422@gmail.com> <20150226143815.09386fe280c7bd8797048bb2@linux-foundation.org>
In-Reply-To: <20150226143815.09386fe280c7bd8797048bb2@linux-foundation.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <ddaney.cavm@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ingo Molnar <mingo@kernel.org>, Hector Marco Gisbert <hecmargi@upv.es>, Kees Cook <keescook@chromium.org>, LKML <linux-kernel@vger.kernel.org>, ismael Ripoll <iripoll@upv.es>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, linuxppc-dev@lists.ozlabs.org
Message-ID: <20150226224321.8kRalpUQv3Yf3WLmblM1_BvCKIs0eFKpKCVE40alycY@z>

On 02/26/2015 02:38 PM, Andrew Morton wrote:
[...]
>
> From: Andrew Morton<akpm@linux-foundation.org>
> Subject: fix-offset2lib-issue-for-x86-arm-powerpc-and-mips-fix
>
> Consolidate randomize_et_dyn() implementations into fs/binfmt_elf.c.
>
> There doesn't seem to be a compile-time way of making randomize_et_dyn()
> go away on architectures which don't need it, so mark it __weak to cause
> it to be discarded at link time.
>
> Cc: "H. Peter Anvin"<hpa@zytor.com>
> Cc: Benjamin Herrenschmidt<benh@kernel.crashing.org>
> Cc: Catalin Marinas<catalin.marinas@arm.com>
> Cc: Hector Marco Gisbert<hecmargi@upv.es>
> Cc: Hector Marco-Gisbert<hecmargi@upv.es>
> Cc: Ingo Molnar<mingo@kernel.org>
> Cc: Ismael Ripoll<iripoll@upv.es>
> Cc: Kees Cook<keescook@chromium.org>
> Cc: Ralf Baechle<ralf@linux-mips.org>
> Cc: Russell King<rmk@arm.linux.org.uk>
> Cc: Thomas Gleixner<tglx@linutronix.de>
> Cc: Will Deacon<will.deacon@arm.com>
> Signed-off-by: Andrew Morton<akpm@linux-foundation.org>
[...]
> diff -puN arch/arm64/include/asm/elf.h~fix-offset2lib-issue-for-x86-arm-powerpc-and-mips-fix arch/arm64/include/asm/elf.h
> --- a/arch/arm64/include/asm/elf.h~fix-offset2lib-issue-for-x86-arm-powerpc-and-mips-fix
> +++ a/arch/arm64/include/asm/elf.h
> @@ -1,5 +1,5 @@
>   /*
> - * Copyright (C) 2012 ARM Ltd.
> + * Copyright (C) 20q12 ARM Ltd.

This particular change looks like it may be a typo.

>    *
>    * This program is free software; you can redistribute it and/or modify
>    * it under the terms of the GNU General Public License version 2 as
