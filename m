Received: from mailapp01.imgtec.com ([195.59.15.196]:44728 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990552AbdBQHXHpHO4E (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 17 Feb 2017 08:23:07 +0100
Subject: Re: [PATCH] MIPS: DTS: add img directory to Makefile
References: <1487248410-9493-1-git-send-email-Ian.Pozella@imgtec.com>
From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Message-ID: <974d44f8-c234-b708-b9e9-4bb84745d776@imgtec.com>
Date: Fri, 17 Feb 2017 12:52:58 +0530
MIME-Version: 1.0
In-Reply-To: <1487248410-9493-1-git-send-email-Ian.Pozella@imgtec.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Rahul.Bedarkar@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ian Pozella <Ian.Pozella@imgtec.com>
Cc: ralf@linux-mips.org, James.Hogan@imgtec.com, linux-mips@linux-mips.org
Message-ID: <20170217072258.lpFoJPwz6RDKM7TuCWYP2MG3a6LX6GQWyd7nRZFv9c8@z>

Hello,

On Thursday 16 February 2017 06:03 PM, Ian Pozella wrote:
> An img directory exists for the Pistchio Soc but the directory
> itself isn't in the dts Makefile meaning the dtbs never get built.
>
> Signed-off-by: Ian Pozella <Ian.Pozella@imgtec.com>
> ---
>  arch/mips/boot/dts/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
> index fc7a0a9..b9db492 100644
> --- a/arch/mips/boot/dts/Makefile
> +++ b/arch/mips/boot/dts/Makefile
> @@ -1,5 +1,6 @@
>  dts-dirs	+= brcm
>  dts-dirs	+= cavium-octeon
> +dts-dirs	+= img
>  dts-dirs	+= ingenic
>  dts-dirs	+= lantiq
>  dts-dirs	+= mti
>

Thanks for fixing this. You might want to consider adding 'Fixes' tag to 
refer to original commit that this patch fixes.

Fixes: daa10170da27 ("MIPS: DTS: img: add device tree for Marduk board")

I had tested original change with Buildroot configuration that builds 
DTS out of the tree, so failed to notice that 'img' directory needs to 
be added to Makefile.

Thanks,
Rahul
