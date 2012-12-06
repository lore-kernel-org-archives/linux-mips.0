Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]:30852 "EHLO
        tx2outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6831898Ab2LFTRJzkZ31 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 6 Dec 2012 20:17:09 +0100
Message-ID: <50C0EF2C.3080705@caviumnetworks.com>
Date: Thu, 6 Dec 2012 11:17:00 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Check BITS_PER_LONG instead of __SIZEOF_LONG__
References: <1354821137-7562-1-git-send-email-geert@linux-m68k.org>
In-Reply-To: <1354821137-7562-1-git-send-email-geert@linux-m68k.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org
Message-ID: <20121206191700.jJwgsjgEVJ4djTkQx3cpn2K51Rl3r6AWiRbfYv73VCs@z>

On 12/06/2012 11:12 AM, Geert Uytterhoeven wrote:
> When building a 32-bit kernel for RBTX4927 with gcc version 4.1.2 20061115
> (prerelease) (Ubuntu 4.1.1-21), I get:
>
> arch/mips/lib/delay.c:24:5: warning: "__SIZEOF_LONG__" is not defined
>
> As a consequence, __delay() always uses the 64-bit "dsubu" instruction.
>
> Replace the check for "__SIZEOF_LONG__ == 4" by "BITS_PER_LONG == 32" to
> fix this.
>
> Introduced by commit 5210edcd527773c227465ad18e416a894966324f ("MIPS: Make
> __{,n,u}delay declarations match definitions and generic delay.h")
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: David Daney <david.daney@cavium.com>

> --
> Untested on real hardware.
> Ralf, is this sufficient to prevent you from nuking RBTX4927 support? ;-)
> ---
>   arch/mips/lib/delay.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/mips/lib/delay.c b/arch/mips/lib/delay.c
> index dc81ca8..288f795 100644
> --- a/arch/mips/lib/delay.c
> +++ b/arch/mips/lib/delay.c
> @@ -21,7 +21,7 @@ void __delay(unsigned long loops)
>   	"	.set	noreorder				\n"
>   	"	.align	3					\n"
>   	"1:	bnez	%0, 1b					\n"
> -#if __SIZEOF_LONG__ == 4
> +#if BITS_PER_LONG == 32
>   	"	subu	%0, 1					\n"
>   #else
>   	"	dsubu	%0, 1					\n"
>
