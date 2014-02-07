Received: from multi.imgtec.com ([194.200.65.239]:3426 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6825879AbaBGKN4UiYKR (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 7 Feb 2014 11:13:56 +0100
Date: Fri, 7 Feb 2014 10:13:49 +0000
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [RFC PATCH] MIPS: fix CONFIG_* error in fpu code
Message-ID: <20140207101346.GP54230@pburton-linux.le.imgtec.org>
References: <1391746972-25277-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1391746972-25277-1-git-send-email-chenhc@lemote.com>
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Huacai Chen <chenhc@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, John Crispin <john@phrozen.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>
Message-ID: <20140207101349.VMoYAdwt-NgV-ZgInG5aUj9MvUuxOCxDD_kPwcj2C-w@z>

On Fri, Feb 07, 2014 at 12:22:52PM +0800, Huacai Chen wrote:
> Commit 597ce1723e0f (MIPS: Support for 64-bit FP with O32 binaries)
> brings some CONFIG_MIPS64, but CONFIG_MIPS64 doesn't exist in any
> Kconfig file. I guess the correct thing is CONFIG_64BIT, so fix it.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/include/asm/asmmacro.h |    4 ++--
>  arch/mips/include/asm/fpu.h      |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
> index 3220c93..69a9a22 100644
> --- a/arch/mips/include/asm/asmmacro.h
> +++ b/arch/mips/include/asm/asmmacro.h
> @@ -106,7 +106,7 @@
>  	.endm
>  
>  	.macro	fpu_save_double thread status tmp
> -#if defined(CONFIG_MIPS64) || defined(CONFIG_CPU_MIPS32_R2)
> +#if defined(CONFIG_64BIT) || defined(CONFIG_CPU_MIPS32_R2)
>  	sll	\tmp, \status, 5
>  	bgez	\tmp, 10f
>  	fpu_save_16odd \thread
> @@ -159,7 +159,7 @@
>  	.endm
>  
>  	.macro	fpu_restore_double thread status tmp
> -#if defined(CONFIG_MIPS64) || defined(CONFIG_CPU_MIPS32_R2)
> +#if defined(CONFIG_64BIT) || defined(CONFIG_CPU_MIPS32_R2)
>  	sll	\tmp, \status, 5
>  	bgez	\tmp, 10f				# 16 register mode?
>  
> diff --git a/arch/mips/include/asm/fpu.h b/arch/mips/include/asm/fpu.h
> index cfe092f..f80a07e 100644
> --- a/arch/mips/include/asm/fpu.h
> +++ b/arch/mips/include/asm/fpu.h
> @@ -57,7 +57,7 @@ static inline int __enable_fpu(enum fpu_mode mode)
>  		return 0;
>  
>  	case FPU_64BIT:
> -#if !(defined(CONFIG_CPU_MIPS32_R2) || defined(CONFIG_MIPS64))
> +#if !(defined(CONFIG_CPU_MIPS32_R2) || defined(CONFIG_64BIT))
>  		/* we only have a 32-bit FPU */
>  		return SIGFPE;
>  #endif
> -- 
> 1.7.7.3
> 
> 

Oops, right you are - looks good to me.

Thanks,
    Paul
