Received: from mailapp01.imgtec.com ([195.59.15.196]:12243 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010829AbaJHKeeRaje0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 8 Oct 2014 12:34:34 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 54604237F115A
        for <linux-mips@linux-mips.org>; Wed,  8 Oct 2014 11:34:25 +0100 (IST)
Message-ID: <54351332.9020309@imgtec.com>
Date: Wed, 8 Oct 2014 11:34:26 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: IP22/IP32: Add missing ifdefs to Platform files
References: <543496C6.7000005@gentoo.org>
In-Reply-To: <543496C6.7000005@gentoo.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Message-ID: <20141008103426.AtGYuuJwhYXjwpG0z_27eQnqhFMhjCj8C_rSB4YfkDM@z>

On 10/08/2014 02:43 AM, Joshua Kinard wrote:
> In arch/mips/sgi-ip22/Platform and arch/mips/sgi-ip32/Platform, ifdefs for
> CONFIG_SGI_IP22 and CONFIG_SGI_IP32 are missing, which can cause the
> definitions for these platforms to get included in builds for other platforms.
>  This patch adds these missing ifdefs, which matches IP27's Platform file.
> 
> Signed-off-by: Joshua Kinard <kumba@gentoo.org>
> ---
>  arch/mips/sgi-ip22/Platform |    8 +++++---
>  arch/mips/sgi-ip32/Platform |    9 ++++++---
>  2 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/mips/sgi-ip22/Platform b/arch/mips/sgi-ip22/Platform
> index b7a4b7e..5fa3c7a 100644
> --- a/arch/mips/sgi-ip22/Platform
> +++ b/arch/mips/sgi-ip22/Platform
> @@ -7,7 +7,8 @@
>  # current variable will break so for 64-bit kernels we have to raise the start
>  # address by 8kb.
>  #
> -platform-$(CONFIG_SGI_IP22)		+= sgi-ip22/
> +ifdef CONFIG_SGI_IP22
> +platform-$(CONFIG_SGI_IP22)	+= sgi-ip22/
>  cflags-$(CONFIG_SGI_IP22)	+= -I$(srctree)/arch/mips/include/asm/mach-ip22
>  ifdef CONFIG_32BIT
>  load-$(CONFIG_SGI_IP22)		+= 0xffffffff88002000
> @@ -15,6 +16,7 @@ endif
>  ifdef CONFIG_64BIT
>  load-$(CONFIG_SGI_IP22)		+= 0xffffffff88004000
>  endif
> +endif
>  

I could be wrong but isn't that functionally the same thing? As in, if
CONFIG_SGI_IP22 is not enabled, the sgi-ip22 etc are not included.
That's the same thing as the original code was doing no? Why do you need
to hide all the $FOO-$(CONFIG_SGI_IP22) in a separate #ifdef block. What
problem are you trying to solve?

-- 
markos
