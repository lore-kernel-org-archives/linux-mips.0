Received: from mailapp01.imgtec.com ([195.59.15.196]:59964 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993879AbdGFAAzWovkG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 6 Jul 2017 02:00:55 +0200
Date: Thu, 6 Jul 2017 01:00:34 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH v2 2/4] MIPS: VDSO: Add implementation of clock_gettime()
 fallback
In-Reply-To: <1498665337-28845-3-git-send-email-aleksandar.markovic@rt-rk.com>
Message-ID: <alpine.DEB.2.00.1707060055470.3339@tp.orcam.me.uk>
References: <1498665337-28845-1-git-send-email-aleksandar.markovic@rt-rk.com> <1498665337-28845-3-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Cc: linux-mips@linux-mips.org, Goran Ferenc <goran.ferenc@imgtec.com>, Miodrag Dinic <miodrag.dinic@imgtec.com>, Aleksandar Markovic <aleksandar.markovic@imgtec.com>, Douglas Leung <douglas.leung@imgtec.com>, James Hogan <james.hogan@imgtec.com>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>, Petar Jovanovic <petar.jovanovic@imgtec.com>, Raghu Gandham <raghu.gandham@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170706000034.bJ2COaZFyHYlbYb4erw1J7IkZb4GTHajU-S2FQecGfs@z>

On Wed, 28 Jun 2017, Aleksandar Markovic wrote:

> diff --git a/arch/mips/vdso/gettimeofday.c b/arch/mips/vdso/gettimeofday.c
> index fd7d433..5f63375 100644
> --- a/arch/mips/vdso/gettimeofday.c
> +++ b/arch/mips/vdso/gettimeofday.c
> @@ -20,6 +20,24 @@
>  #include <asm/unistd.h>
>  #include <asm/vdso.h>
>  
> +static __always_inline long clock_gettime_fallback(clockid_t _clkid,
> +					   struct timespec *_ts)
> +{
> +	register struct timespec *ts asm("a1") = _ts;
> +	register clockid_t clkid asm("a0") = _clkid;
> +	register long ret asm("v0");
> +	register long nr asm("v0") = __NR_clock_gettime;
> +	register long error asm("a3");
> +
> +	asm volatile(
> +	"       syscall\n"
> +	: "=r" (ret), "=r" (error)
> +	: "r" (clkid), "r" (ts), "r" (nr)
> +	: "memory");
> +
> +	return error ? -ret : ret;
> +}

 Hmm, are you sure it is safe nowadays WRT the syscall restart convention 
to leave out the instruction explicitly loading the syscall number that 
would normally immediately precede SYSCALL (and would have to forcibly use 
the 32-bit encoding in the microMIPS case)?

  Maciej
