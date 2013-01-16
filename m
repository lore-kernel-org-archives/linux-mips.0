Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]:38944
        "EHLO co9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6832231Ab3APR5KCYuq3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Jan 2013 18:57:10 +0100
Message-ID: <50F6E9B3.5010202@caviumnetworks.com>
Date: Wed, 16 Jan 2013 09:56:03 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] mpis: cavium-octeon/executive/cvmx-l2c.c: fix uninitialized
 variable
References: <1358200025-15994-1-git-send-email-dinggnu@gmail.com> <20130116105757.GB26569@linux-mips.org>
In-Reply-To: <20130116105757.GB26569@linux-mips.org>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Cong Ding <dinggnu@gmail.com>, Jim Quinlan <jim2101024@gmail.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20130116175603.YdYGw-_xMiR4_waP_EMYZJkRGVw6RJZk9USZGMCj8Nk@z>

On 01/16/2013 02:57 AM, Ralf Baechle wrote:
> On Mon, Jan 14, 2013 at 10:47:03PM +0100, Cong Ding wrote:
>
>> the variable dummy is used without initialization.
>
> Interesting - I wonder how you found this one.  My compiler (gcc 4.7)
> doesn't warn about this one.
>

I get no warnings either.  So I wonder what the point of churning up the 
code is.

David Daney

> Nor does gcc notice that the whole summing up business is wasted efford.
>
> So here's my counter proposal.  It works because ptr is a volatile pointer
> so the compiler will always dereference it even if the returned value is
> not being used.  The resulting code is a bit smaller.
>
>    Ralf
>
> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
>
>   arch/mips/cavium-octeon/executive/cvmx-l2c.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/cavium-octeon/executive/cvmx-l2c.c b/arch/mips/cavium-octeon/executive/cvmx-l2c.c
> index 9f883bf..ec3e059 100644
> --- a/arch/mips/cavium-octeon/executive/cvmx-l2c.c
> +++ b/arch/mips/cavium-octeon/executive/cvmx-l2c.c
> @@ -286,7 +286,7 @@ uint64_t cvmx_l2c_read_perf(uint32_t counter)
>   static void fault_in(uint64_t addr, int len)
>   {
>   	volatile char *ptr;
> -	volatile char dummy;
> +
>   	/*
>   	 * Adjust addr and length so we get all cache lines even for
>   	 * small ranges spanning two cache lines.
> @@ -300,7 +300,7 @@ static void fault_in(uint64_t addr, int len)
>   	 */
>   	CVMX_DCACHE_INVALIDATE;
>   	while (len > 0) {
> -		dummy += *ptr;
> +		*ptr;
>   		len -= CVMX_CACHE_LINE_SIZE;
>   		ptr += CVMX_CACHE_LINE_SIZE;
>   	}
>
>
>
