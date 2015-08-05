Received: from mailapp01.imgtec.com ([195.59.15.196]:38312 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012495AbbHEXzwd5Rr1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 6 Aug 2015 01:55:52 +0200
Date: Wed, 5 Aug 2015 16:55:43 -0700
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH v4 3/3] MIPS: set stack/data protection as non-executable
Message-ID: <20150805235543.GG2057@NP-P-BURTON>
References: <20150805234348.20722.71740.stgit@ubuntu-yegoshin>
 <20150805234936.20722.60927.stgit@ubuntu-yegoshin>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20150805234936.20722.60927.stgit@ubuntu-yegoshin>
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
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: daniel.sanders@imgtec.com, linux-mips@linux-mips.org, cernekee@gmail.com, Zubair.Kakakhel@imgtec.com, geert+renesas@glider.be, david.daney@cavium.com, peterz@infradead.org, heiko.carstens@de.ibm.com, paul.gortmaker@windriver.com, behanw@converseincode.com, macro@linux-mips.org, cl@linux.com, pkarat@mvista.com, linux@roeck-us.net, tkhai@yandex.ru, james.hogan@imgtec.com, alexinbeijing@gmail.com, rusty@rustcorp.com.au, Steven.Hill@imgtec.com, lars.persson@axis.com, aleksey.makarov@auriga.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, luto@amacapital.net, dahi@linux.vnet.ibm.com, markos.chandras@imgtec.com, eunb.song@samsung.com, kumba@gentoo.org
Message-ID: <20150805235543.FaS6rBZ2nKyDC4bcGxgov6Y_fkl2ozCHxlYG54_mSmg@z>

On Wed, Aug 05, 2015 at 04:49:36PM -0700, Leonid Yegoshin wrote:
> This is a last step of 3 patches which shift FPU emulation out of
> stack into protected area. So, it disables a default executable stack.
> 
> Additionally, it sets a default data area non-executable protection.
> 
> Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
> ---
>  arch/mips/include/asm/page.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
> index 89dd7fed1a57..0b6cec4a1b80 100644
> --- a/arch/mips/include/asm/page.h
> +++ b/arch/mips/include/asm/page.h
> @@ -228,7 +228,7 @@ extern int __virt_addr_valid(const volatile void *kaddr);
>  #define virt_addr_valid(kaddr)						\
>  	__virt_addr_valid((const volatile void *) (kaddr))
>  
> -#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
> +#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | \
>  				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
>  
>  #define UNCAC_ADDR(addr)	((addr) - PAGE_OFFSET + UNCAC_BASE)
> 

Hi Leonid,

As was pointed out last time you posted this, it breaks backwards
compatibility with userland & thus cannot be applied. We should only be
changing executability of memory in the presence of a PT_GNU_STACK
header indicating that it's safe to do so, with cooperation from the
toolchain team to begin emitting it for MIPS. See the way ARM did it, or
the patches I've posted for this in the past.

Thanks,
    Paul
