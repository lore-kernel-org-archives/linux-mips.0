Received: from mail-cys01nam02on0040.outbound.protection.outlook.com ([104.47.37.40]:37765
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993483AbcHLWgbJrqsp (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sat, 13 Aug 2016 00:36:31 +0200
Message-ID: <57AE4F63.4010506@caviumnetworks.com>
Date: Fri, 12 Aug 2016 15:36:19 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: OCTEON: Changes to support readq()/writeq() usage.
References: <5780652D.2030604@cavium.com> <20160812213801.GC10648@raspberrypi.musicnaut.iki.fi>
In-Reply-To: <20160812213801.GC10648@raspberrypi.musicnaut.iki.fi>
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
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: "Steven J. Hill" <steven.hill@cavium.com>, David Daney <david.daney@cavium.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20160812223619.m6PLxuKy-UG050ewkQLFjyFkaQxNFJoWUEBFwSXoJus@z>

On 08/12/2016 02:38 PM, Aaro Koskinen wrote:
> Hi,
>
> On Fri, Jul 08, 2016 at 09:45:01PM -0500, Steven J. Hill wrote:
>> Update OCTEON port mangling code to support readq() and
>> writeq() functions to allow driver code to be more portable.
>> Updates also for word and long function pairs. We also
>> remove SWAP_IO_SPACE for OCTEON platforms as the function
>> macros are redundant with the new mangling code.
>>
>> Signed-off-by: Steven J. Hill <steven.hill@cavium.com>
>> Acked-by: David Daney <david.daney@cavium.com>
>
> [...]
>
>> +static inline bool __should_swizzle_bits(volatile void *a)
>> +{
>> +	extern const bool octeon_should_swizzle_table[];
>> +
>> +	unsigned long did = ((unsigned long)a >> 40) & 0xff;
>> +	return octeon_should_swizzle_table[did];
>> +}
>
> v4.8-rc1 OCTEON build is now broken with GCC 6.1 when support for 32-bit
> ABIs is enabled:

I don't get it.  The kernel is always 64-bit, so unsigned long will have 
a width of 64.

What kernel config are you using?

>
>    CC      arch/mips/vdso/gettimeofday-o32.o
> In file included from /home/aaro/los/work/shared/linux-v4.8-rc1/arch/mips/includ
> e/asm/io.h:32:0,
>                   from /home/aaro/los/work/shared/linux-v4.8-rc1/arch/mips/includ
> e/asm/page.h:194,
>                   from /home/aaro/los/work/shared/linux-v4.8-rc1/arch/mips/vdso/v
> dso.h:26,
>                   from /home/aaro/los/work/shared/linux-v4.8-rc1/arch/mips/vdso/g
> ettimeofday.c:11:
> /home/aaro/los/work/shared/linux-v4.8-rc1/arch/mips/include/asm/mach-cavium-octe
> on/mangle-port.h: In function '__should_swizzle_bits':
> /home/aaro/los/work/shared/linux-v4.8-rc1/arch/mips/include/asm/mach-cavium-octe
> on/mangle-port.h:19:40: error: right shift count >= width of type [-Werror=shift
> -count-overflow]
>    unsigned long did = ((unsigned long)a >> 40) & 0xff;
>
> A.
>
