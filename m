Received: from mail-sn1nam01on0083.outbound.protection.outlook.com ([104.47.32.83]:12016
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992227AbcHVW4A1ohoC (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 23 Aug 2016 00:56:00 +0200
Message-ID: <57BB82F3.2030103@caviumnetworks.com>
Date: Mon, 22 Aug 2016 15:55:47 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: OCTEON: mangle-port: fix build failure with VDSO
 code
References: <20160822220735.13865-1-aaro.koskinen@iki.fi>
In-Reply-To: <20160822220735.13865-1-aaro.koskinen@iki.fi>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, "Steven J. Hill" <steven.hill@cavium.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org, Alex Smith <alex.smith@imgtec.com>
Message-ID: <20160822225547.fj_7HX6KZ5nT_dZuZTyugmLBO_nCmXb7siLexZboaco@z>

On 08/22/2016 03:07 PM, Aaro Koskinen wrote:
> Commit 1685ddbe35cd ("MIPS: Octeon: Changes to support readq()/writeq()
> usage.") added bitwise shift operations that assume that unsigned long
> is always 64-bits. This broke the build of VDSO code, as it gets compiled
> also in "faked" 32-bit mode. Althought the failing inline functions are
> never executed in 32-bit mode, they still need to pass the compilation.
> Fix by using 64-bit types explicitly.
>
> The patch fixes the following build failure:
>
>    CC      arch/mips/vdso/gettimeofday-o32.o
> In file included from los/git/devel/linux/arch/mips/include/asm/io.h:32:0,
>                   from los/git/devel/linux/arch/mips/include/asm/page.h:194,
>                   from los/git/devel/linux/arch/mips/vdso/vdso.h:26,
>                   from los/git/devel/linux/arch/mips/vdso/gettimeofday.c:11:
> los/git/devel/linux/arch/mips/include/asm/mach-cavium-octeon/mangle-port.h: In function '__should_swizzle_bits':
> los/git/devel/linux/arch/mips/include/asm/mach-cavium-octeon/mangle-port.h:19:40: error: right shift count >= width of type [-Werror=shift-count-overflow]
>    unsigned long did = ((unsigned long)a >> 40) & 0xff;
>                                          ^~
>
> Fixes: 1685ddbe35cd ("MIPS: Octeon: Changes to support readq()/writeq() usage.")
> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>

This looks like it should work.

Steven, can you test this patch for us to get independent confirmation 
that it works?

If testing shows that it is good, please add Acked-by: David Daney 
<david.daney@cavium.com>



> ---
>   arch/mips/include/asm/mach-cavium-octeon/mangle-port.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-cavium-octeon/mangle-port.h b/arch/mips/include/asm/mach-cavium-octeon/mangle-port.h
> index 0cf5ac1..8ff2cbd 100644
> --- a/arch/mips/include/asm/mach-cavium-octeon/mangle-port.h
> +++ b/arch/mips/include/asm/mach-cavium-octeon/mangle-port.h
> @@ -15,8 +15,8 @@
>   static inline bool __should_swizzle_bits(volatile void *a)
>   {
>   	extern const bool octeon_should_swizzle_table[];
> +	u64 did = ((u64)(uintptr_t)a >> 40) & 0xff;
>
> -	unsigned long did = ((unsigned long)a >> 40) & 0xff;
>   	return octeon_should_swizzle_table[did];
>   }
>
> @@ -29,7 +29,7 @@ static inline bool __should_swizzle_bits(volatile void *a)
>
>   #define __should_swizzle_bits(a)	false
>
> -static inline bool __should_swizzle_addr(unsigned long p)
> +static inline bool __should_swizzle_addr(u64 p)
>   {
>   	/* boot bus? */
>   	return ((p >> 40) & 0xff) == 0;
>
