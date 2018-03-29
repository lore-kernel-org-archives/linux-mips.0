Received: from mail-pf0-x243.google.com ([IPv6:2607:f8b0:400e:c00::243]:46466
        "EHLO mail-pf0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990425AbeC2V71z8vSz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 Mar 2018 23:59:27 +0200
Received: by mail-pf0-x243.google.com with SMTP id h69so4154098pfe.13
        for <linux-mips@linux-mips.org>; Thu, 29 Mar 2018 14:59:27 -0700 (PDT)
Date: Thu, 29 Mar 2018 14:59:20 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] Add notrace to lib/ucmpdi2.c
In-Reply-To: <1522320083-27818-1-git-send-email-matt.redfearn@mips.com>
From: Palmer Dabbelt <palmer@sifive.com>
Message-ID: <mhng-e7e3dffe-bc80-4bea-8cf5-4d8afb76565a@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-Path: <palmer@sifive.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Cc: antonynpavlov@gmail.com, jhogan@kernel.org, ralf@linux-mips.org, linux-mips@linux-mips.org, matt.redfearn@mips.com, geert@linux-m68k.org, linux-kernel@vger.kernel.org
Message-ID: <20180329215920.1ZVMcXI0A9SfZjflPYnO7FYoyp1A0kQYhn27CsDub_c@z>

On Thu, 29 Mar 2018 03:41:21 PDT (-0700), matt.redfearn@mips.com wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
>
> As part of the MIPS conversion to use the generic GCC library routines,
> Matt Redfearn discovered that I'd missed a notrace on __ucmpdi2().  This
> patch rectifies the problem.
>
> CC: Matt Redfearn <matt.redfearn@mips.com>
> CC: Antony Pavlov <antonynpavlov@gmail.com>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Reviewed-by: Matt Redfearn <matt.redfearn@mips.com>
> Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
> ---
>
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
>   add notrace to lib/ucmpdi2.c
>
>  lib/ucmpdi2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/ucmpdi2.c b/lib/ucmpdi2.c
> index 25ca2d4c1e19..597998169a96 100644
> --- a/lib/ucmpdi2.c
> +++ b/lib/ucmpdi2.c
> @@ -17,7 +17,7 @@
>  #include <linux/module.h>
>  #include <linux/libgcc.h>
>
> -word_type __ucmpdi2(unsigned long long a, unsigned long long b)
> +word_type notrace __ucmpdi2(unsigned long long a, unsigned long long b)
>  {
>  	const DWunion au = {.ll = a};
>  	const DWunion bu = {.ll = b};

Ah, thanks, I think I must have forgotten about this.  I assume these three are 
going through your tree?
