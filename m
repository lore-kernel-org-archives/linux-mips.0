Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:43750 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994750AbeAaL7mg6XXW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 31 Jan 2018 12:59:42 +0100
Subject: Re: [PATCH v2 1/2] Add notrace to lib/ucmpdi2.c
References: <20180130224202.7682-1-antonynpavlov@gmail.com>
 <20180130224202.7682-2-antonynpavlov@gmail.com>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <aeb636ad-571e-104d-e180-8f60877de571@mips.com>
Date: Wed, 31 Jan 2018 11:54:48 +0000
MIME-Version: 1.0
In-Reply-To: <20180130224202.7682-2-antonynpavlov@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Antony Pavlov <antonynpavlov@gmail.com>, linux-mips@linux-mips.org
Cc: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>
Message-ID: <20180131115448.H_EpKmr4yDm34zdUdKI3qgP2VJZXXolP5i4WAcW46So@z>

Hi

On 30/01/18 22:42, Antony Pavlov wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
> 
> As part of the MIPS conversion to use the generic GCC library routines,
> Matt Redfearn discovered that I'd missed a notrace on __ucmpdi2().  This
> patch rectifies the problem.
> 
> CC: Matt Redfearn <matt.redfearn@mips.com>
> CC: Antony Pavlov <antonynpavlov@gmail.com>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>


Looks good to me :-)
Reviewed-by: Matt Redfearn <amtt.redfearn@mips.com>

> ---
>   lib/ucmpdi2.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/ucmpdi2.c b/lib/ucmpdi2.c
> index 25ca2d4c1e19..597998169a96 100644
> --- a/lib/ucmpdi2.c
> +++ b/lib/ucmpdi2.c
> @@ -17,7 +17,7 @@
>   #include <linux/module.h>
>   #include <linux/libgcc.h>
>   
> -word_type __ucmpdi2(unsigned long long a, unsigned long long b)
> +word_type notrace __ucmpdi2(unsigned long long a, unsigned long long b)
>   {
>   	const DWunion au = {.ll = a};
>   	const DWunion bu = {.ll = b};
> 
