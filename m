Received: from mailapp01.imgtec.com ([195.59.15.196]:28676 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008898AbbJPIL2zKpgw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Oct 2015 10:11:28 +0200
Subject: Re: [PATCH] MIPS64: signal: n64 kernel bugfix of MIPS32 o32 ABI
 sigaction syscall
References: <20151015185020.37483.82586.stgit@ubuntu-yegoshin>
From: Markos Chandras <Markos.Chandras@imgtec.com>
Message-ID: <5620B129.4020008@imgtec.com>
Date: Fri, 16 Oct 2015 09:11:21 +0100
MIME-Version: 1.0
In-Reply-To: <20151015185020.37483.82586.stgit@ubuntu-yegoshin>
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
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linux-mips@linux-mips.org, paul.burton@imgtec.com, richard@nod.at, linux-kernel@vger.kernel.org, ralf@linux-mips.org, luto@amacapital.net, alex.smith@imgtec.com
Message-ID: <20151016081121.FOsTAEDFF5wlDuIJkaPQqfzFC-Pg0JfAFVha8Fuk4ko@z>

On 10/15/2015 07:50 PM, Leonid Yegoshin wrote:
> MIPS32 o32 ABI sigaction() processing on MIPS64 n64 kernel was incorrectly
> set to processing aka rt_sigaction() variant only.
> 
> Fixed.
> 
> Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
> ---
>  arch/mips/include/asm/signal.h |   15 ++++++++++++---
>  arch/mips/kernel/signal.c      |    2 +-
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/mips/include/asm/signal.h b/arch/mips/include/asm/signal.h
> index 003e273eff4c..06fe599782df 100644
> --- a/arch/mips/include/asm/signal.h
> +++ b/arch/mips/include/asm/signal.h
> @@ -11,11 +11,20 @@
>  
>  #include <uapi/asm/signal.h>
>  
> +#ifdef CONFIG_MIPS32_COMPAT
> +extern struct mips_abi mips_abi_32;
>  
> -#ifdef CONFIG_TRAD_SIGNALS
> -#define sig_uses_siginfo(ka)	((ka)->sa.sa_flags & SA_SIGINFO)
> +#define sig_uses_siginfo(ka, abi)                               \
> +	(config_enabled(CONFIG_64BIT) ?                         \
> +		(config_enabled(CONFIG_MIPS32_COMPAT) ?         \
> +			(abi != &mips_abi_32) : 1) :            \
> +		(config_enabled(CONFIG_TRAD_SIGNALS) ?          \
> +			((ka)->sa.sa_flags & SA_SIGINFO) : 1) )
>  #else
> -#define sig_uses_siginfo(ka)	(1)
> +#define sig_uses_siginfo(ka, abi)                               \
> +	(config_enabled(CONFIG_64BIT) ? 1 :                     \
> +		(config_enabled(CONFIG_TRAD_SIGNALS) ?          \
> +			((ka)->sa.sa_flags & SA_SIGINFO) : 1) )
>  #endif
>  
>  #include <asm/sigcontext.h>
> diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
> index bf792e2839a6..5f18d0b879e0 100644
> --- a/arch/mips/kernel/signal.c
> +++ b/arch/mips/kernel/signal.c
> @@ -798,7 +798,7 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
>  		regs->regs[0] = 0;		/* Don't deal with this again.	*/
>  	}
>  
> -	if (sig_uses_siginfo(&ksig->ka))
> +	if (sig_uses_siginfo(&ksig->ka, abi))
>  		ret = abi->setup_rt_frame(vdso + abi->vdso->off_rt_sigreturn,
>  					  ksig, regs, oldset);
>  	else
> 

Is this similar to

https://www.linux-mips.org/archives/linux-mips/2015-08/msg00449.html ?

-- 
markos
