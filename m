Received: from mailapp01.imgtec.com ([195.59.15.196]:37715 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991955AbdFTIEXlHCZt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 Jun 2017 10:04:23 +0200
Subject: Re: [PATCH 3/8] MIPS: R6: Fix PREF instruction usage by memcpy for
 MIPS R6
References: <1497887415-13825-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1497887415-13825-4-git-send-email-aleksandar.markovic@rt-rk.com>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <a5842e4b-a75b-2dde-d835-6a488790dbda@imgtec.com>
Date: Tue, 20 Jun 2017 09:04:16 +0100
MIME-Version: 1.0
In-Reply-To: <1497887415-13825-4-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, linux-mips@linux-mips.org, James.Hogan@imgtec.com, Paul.Burton@imgtec.com
Cc: Raghu.Gandham@imgtec.com, Leonid.Yegoshin@imgtec.com, Douglas.Leung@imgtec.com, Petar.Jovanovic@imgtec.com, Miodrag.Dinic@imgtec.com, Goran.Ferenc@imgtec.com
Message-ID: <20170620080416.S9E-IOkt8Ep4HwZOEtAed0AQdlq-hIQXIxHXNBXoOE4@z>

Hi Aleksandar,

Wouldn't the more correct thing be to modify the memcpy loop such that 
prefetches do not fetch the larger offset? Just turning off prefetch 
altogether in memcpy for r6 seems like a heavy hammer to me...

Thanks,

Matt


On 19/06/17 16:50, Aleksandar Markovic wrote:
> From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
>
> Disable usage of PREF instruction usage by memcpy for MIPS R6.
>
> MIPS R6 redefines PREF instruction with smaller offset than
> ordinary MIPS. However, the memcpy code uses PREF instruction
> with offsets bigger than +-256 bytes.
>
> Malta kernels already disable usage of PREF for memcpy.
>
> This was found during adaptation of MIPS R6 for virtual board
> used by Android emulator.
>
> Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
> Signed-off-by: Miodrag Dinic <miodrag.dinic@imgtec.com>
> Signed-off-by: Goran Ferenc <goran.ferenc@imgtec.com>
> Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtech.com>
> ---
>   arch/mips/lib/memcpy.S | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/arch/mips/lib/memcpy.S b/arch/mips/lib/memcpy.S
> index 3114a2e..03e3304 100644
> --- a/arch/mips/lib/memcpy.S
> +++ b/arch/mips/lib/memcpy.S
> @@ -28,6 +28,9 @@
>   #ifdef CONFIG_MIPS_MALTA
>   #undef CONFIG_CPU_HAS_PREFETCH
>   #endif
> +#ifdef CONFIG_CPU_MIPSR6
> +#undef CONFIG_CPU_HAS_PREFETCH
> +#endif
>   
>   #include <asm/asm.h>
>   #include <asm/asm-offsets.h>
