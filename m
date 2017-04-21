Received: from fllnx210.ext.ti.com ([198.47.19.17]:36612 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992178AbdDUKrjzKVZy (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 21 Apr 2017 12:47:39 +0200
Subject: Re: next/master build: 206 builds: 2 failed, 204 passed, 9 errors, 10
 warnings (next-20170420)
References: <58f869bd.84a0df0a.dc1f9.4547@mx.google.com>
 <CAK8P3a2uZFGXhNq+nwDQmgzNL5WH0VejQmotUZp3=0fKwsU1=w@mail.gmail.com>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <34ef293f-dc8b-5ab8-8130-90f723089e45@ti.com>
Date: Fri, 21 Apr 2017 16:17:15 +0530
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2uZFGXhNq+nwDQmgzNL5WH0VejQmotUZp3=0fKwsU1=w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-Path: <nsekhar@ti.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Arnd Bergmann <arnd@arndb.de>, "kernelci.org bot" <bot@kernelci.org>
Cc: kernel-build-reports@lists.linaro.org, "Steven J. Hill" <Steven.Hill@cavium.com>, David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org, Al Viro <viro@zeniv.linux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>
Message-ID: <20170421104715.EjlVUxygENaqC0OGL_nRdIctsdAxeOeU30f1YWegiAE@z>

Hi Arnd,

On Thursday 20 April 2017 02:53 PM, Arnd Bergmann wrote:
>> davinci_all_defconfig (arm) — PASS, 0 errors, 0 warnings, 0 section
>> mismatches
>>
>> Section mismatches:
>> WARNING: modpost: Found 1 section mismatch(es).
>> WARNING: modpost: Found 1 section mismatch(es).

> The 'section mismatches' detection in kernelci appears to be broken, so we
> don't actually see what happened. I can't reproduce it at the moment,
> so it's likely that this is fixed by an older patch of mine:

I cannot reproduce this as well.

> 
> commit aae89d7dddb831aece31997cdc1c5014fb5a51c1
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Sat Oct 10 21:19:48 2015 +0200
> 
>     [WRONG] davinci_mmc: remove incorrect __exit annotation
> 
>     WARNING: drivers/built-in.o(.exit.text+0x28ec): Section mismatch
> in reference from the function davinci_mmcsd_remove() to the function
> .init.text:davinci_release_dma_channels()
>     The function __exit davinci_mmcsd_remove() references
>     a function __init davinci_release_dma_channels().
>     This is often seen when error handling in the exit function
>     uses functionality in the init path.
>     The fix is often to remove the __init annotation of
>     davinci_release_dma_channels() so it may be used outside an init section.
> 
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
> index 621ce47e0e4a..9758d42f19a1 100644
> --- a/drivers/mmc/host/davinci_mmc.c
> +++ b/drivers/mmc/host/davinci_mmc.c
> @@ -496,7 +496,7 @@ static int mmc_davinci_start_dma_transfer(struct
> mmc_davinci_host *host,
>         return ret;
>  }
> 
> -static void __init_or_module
> +static void
>  davinci_release_dma_channels(struct mmc_davinci_host *host)
>  {
>         if (!host->use_dma)
> @@ -1361,7 +1361,7 @@ static int __init davinci_mmcsd_probe(struct
> platform_device *pdev)
>         return ret;
>  }
> 
> -static int __exit davinci_mmcsd_remove(struct platform_device *pdev)
> +static int davinci_mmcsd_remove(struct platform_device *pdev)
>  {
>         struct mmc_davinci_host *host = platform_get_drvdata(pdev);
> 
> @@ -1414,7 +1414,7 @@ static struct platform_driver davinci_mmcsd_driver = {
>                 .pm     = davinci_mmcsd_pm_ops,
>                 .of_match_table = davinci_mmc_dt_ids,
>         },
> -       .remove         = __exit_p(davinci_mmcsd_remove),
> +       .remove         = davinci_mmcsd_remove,
>         .id_table       = davinci_mmc_devtype,
>  };
> 
> This is a very old patch and I don't remember why I never submitted
> it or marked it as [WRONG], and I don't see why it only now showed
> up in kernelci.

I quite don't see how the existing code is wrong.
davinci_release_dma_channels() is marked __init_or_module and is
accessed in the .remove() routine. If modules are enabled,
davinci_release_dma_channels() is available at the time of module
removal since __init_or_module evaluates to nothing. And if modules are
disabled, then davinci_release_dma_channels() is marked as __init but
davinci_mmcsd_remove() is never called.

Thanks,
Sekhar
