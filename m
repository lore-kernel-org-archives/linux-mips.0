Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:34632 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990400AbeEXRCR4mKlf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 24 May 2018 19:02:17 +0200
Date: Thu, 24 May 2018 10:02:08 -0700
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: ptrace: Fix PTRACE_PEEKUSR requests for 64-bit FGRs
Message-ID: <20180524170208.735ptogcn2uo4izl@pburton-laptop>
References: <alpine.DEB.2.00.1805161306260.10896@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1805161306260.10896@tp.orcam.me.uk>
Return-Path: <Paul.Burton@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Maciej W. Rozycki" <macro@mips.com>, James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Message-ID: <20180524170208.5dQ1CjjdBVjWdYZ2HoCsEbvUECTrgK1ki1gjzG0B9Vo@z>

Hi Maciej,

On Wed, May 16, 2018 at 04:39:58PM +0100, Maciej W. Rozycki wrote:
> Use 64-bit accesses for 64-bit floating-point general registers with 
> PTRACE_PEEKUSR, removing the truncation of their upper halves in the 
> FR=1 mode, caused by commit bbd426f542cb ("MIPS: Simplify FP context 
> access"), which inadvertently switched them to using 32-bit accesses.

Good catch:

  Reviewed-by: Paul Burton <paul.burton@mips.com>

Thanks,
  Paul

> The PTRACE_POKEUSR side is fine as it's never been broken and continues 
> using 64-bit accesses.
> 
> Cc: <stable@vger.kernel.org> # 3.19+
> Fixes: bbd426f542cb ("MIPS: Simplify FP context access")
> Signed-off-by: Maciej W. Rozycki <macro@mips.com>
> ---
> Hi,
> 
>  Here's another one, spotted in the course of GDB PR gdb/22286 regression 
> testing with the n64 ABI.  Please apply.
> 
>   Maciej
> ---
>  arch/mips/kernel/ptrace.c   |    2 +-
>  arch/mips/kernel/ptrace32.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> linux-mips-ptrace-peekusr-fp64.diff
> Index: linux/arch/mips/kernel/ptrace.c
> ===================================================================
> --- linux.orig/arch/mips/kernel/ptrace.c	2018-05-15 17:44:25.000000000 +0100
> +++ linux/arch/mips/kernel/ptrace.c	2018-05-16 11:22:00.714605000 +0100
> @@ -1070,7 +1070,7 @@ long arch_ptrace(struct task_struct *chi
>  				break;
>  			}
>  #endif
> -			tmp = get_fpr32(&fregs[addr - FPR_BASE], 0);
> +			tmp = get_fpr64(&fregs[addr - FPR_BASE], 0);
>  			break;
>  		case PC:
>  			tmp = regs->cp0_epc;
> Index: linux/arch/mips/kernel/ptrace32.c
> ===================================================================
> --- linux.orig/arch/mips/kernel/ptrace32.c	2018-05-15 17:45:16.000000000 +0100
> +++ linux/arch/mips/kernel/ptrace32.c	2018-05-16 11:22:16.313698000 +0100
> @@ -109,7 +109,7 @@ long compat_arch_ptrace(struct task_stru
>  						addr & 1);
>  				break;
>  			}
> -			tmp = get_fpr32(&fregs[addr - FPR_BASE], 0);
> +			tmp = get_fpr64(&fregs[addr - FPR_BASE], 0);
>  			break;
>  		case PC:
>  			tmp = regs->cp0_epc;
> 
