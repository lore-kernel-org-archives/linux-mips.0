Received: from mail-bn1on0099.outbound.protection.outlook.com ([157.56.110.99]:45312
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27012460AbbHEX4MEvpH1 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 6 Aug 2015 01:56:12 +0200
Message-ID: <55C2A28C.7000809@caviumnetworks.com>
Date: Wed, 5 Aug 2015 16:55:56 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/3] MIPS: set stack/data protection as non-executable
References: <20150805234348.20722.71740.stgit@ubuntu-yegoshin> <20150805234936.20722.60927.stgit@ubuntu-yegoshin>
In-Reply-To: <20150805234936.20722.60927.stgit@ubuntu-yegoshin>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
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
Cc: daniel.sanders@imgtec.com, linux-mips@linux-mips.org, cernekee@gmail.com, Zubair.Kakakhel@imgtec.com, geert+renesas@glider.be, david.daney@cavium.com, peterz@infradead.org, heiko.carstens@de.ibm.com, paul.gortmaker@windriver.com, behanw@converseincode.com, macro@linux-mips.org, cl@linux.com, pkarat@mvista.com, linux@roeck-us.net, tkhai@yandex.ru, james.hogan@imgtec.com, alexinbeijing@gmail.com, rusty@rustcorp.com.au, Steven.Hill@imgtec.com, lars.persson@axis.com, aleksey.makarov@auriga.com, paul.burton@imgtec.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, luto@amacapital.net, dahi@linux.vnet.ibm.com, markos.chandras@imgtec.com, eunb.song@samsung.com, kumba@gentoo.org
Message-ID: <20150805235556.U0uMDXJmO28l_yv1l9xKUpJvsQ63VNOQaBJplEhHhpI@z>

On 08/05/2015 04:49 PM, Leonid Yegoshin wrote:
> This is a last step of 3 patches which shift FPU emulation out of
> stack into protected area. So, it disables a default executable stack.
>

NAK.

You cannot change the default.

If you want a non-executable stack, the program has to request it with 
the proper annotations in its ELF file.

David Daney.


> Additionally, it sets a default data area non-executable protection.
>
> Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
> ---
>   arch/mips/include/asm/page.h |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
> index 89dd7fed1a57..0b6cec4a1b80 100644
> --- a/arch/mips/include/asm/page.h
> +++ b/arch/mips/include/asm/page.h
> @@ -228,7 +228,7 @@ extern int __virt_addr_valid(const volatile void *kaddr);
>   #define virt_addr_valid(kaddr)						\
>   	__virt_addr_valid((const volatile void *) (kaddr))
>
> -#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
> +#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | \
>   				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
>
>   #define UNCAC_ADDR(addr)	((addr) - PAGE_OFFSET + UNCAC_BASE)
>
