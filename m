Received: from rtp-iport-1.cisco.com ([64.102.122.148]:33128 "EHLO
	rtp-iport-1.cisco.com") by ftp.linux-mips.org with ESMTP
	id S21102852AbZAFVqf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 6 Jan 2009 21:46:35 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: [PATCH] MIPS: unsigned result is always greater than 0
Date: Tue, 6 Jan 2009 16:46:19 -0500
Message-ID: <FF038EB85946AA46B18DFEE6E6F8A2896606BB@xmb-rtp-218.amer.cisco.com>
In-Reply-To: <495E2E47.6080605@gmail.com>
References: <495E2E47.6080605@gmail.com>
From: "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>
Return-Path: <dvomlehn@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Roel Kluin <roel.kluin@gmail.com>, ralf@linux-mips.org
Cc: linux-mips@linux-mips.org
Message-ID: <20090106214619.zUKLrLzjqwlYjn62SG6mqIeT6ank_90s3WlZGNskxkg@z>

 

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org 
> [mailto:linux-mips-bounce@linux-mips.org] On Behalf Of Roel Kluin
> Sent: Friday, January 02, 2009 7:10 AM
> To: ralf@linux-mips.org
> Cc: linux-mips@linux-mips.org
> Subject: [PATCH] MIPS: unsigned result is always greater than 0
> 
> unsigned result is always greater than 0
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> ---
> I cannot determine whether the same bug occurs as well in assembly.
> Also shouldn't similar checks occur in atomic64_sub_return and in
> atomic64_add_return for negative values of i?
> 
> diff --git a/arch/mips/include/asm/atomic.h 
> b/arch/mips/include/asm/atomic.h
> index 1232be3..3cd07a9 100644
> --- a/arch/mips/include/asm/atomic.h
> +++ b/arch/mips/include/asm/atomic.h
> @@ -296,9 +296,10 @@ static __inline__ int 
> atomic_sub_if_positive(int i, atomic_t * v)
>  
>  		raw_local_irq_save(flags);
>  		result = v->counter;
> -		result -= i;
> -		if (result >= 0)
> +		if (i <= result) {
> +			result -= i;
>  			v->counter = result;
> +		}
>  		raw_local_irq_restore(flags);
>  	}
>  
> @@ -677,9 +678,10 @@ static __inline__ long 
> atomic64_sub_if_positive(long i, atomic64_t * v)
>  
>  		raw_local_irq_save(flags);
>  		result = v->counter;
> -		result -= i;
> -		if (result >= 0)
> +		if (i >= result) {
> +			result -= i;
>  			v->counter = result;
> +		}
>  		raw_local_irq_restore(flags);
>  	}

I agree that the code as it exists is wrong, but, as I see it, the
problem is that the type of result should be changed from unsigned long
to int. This fixes the comparison so it works correctly. In addition,
such a change means that result would be the same type as the counter
element of atomic_t, avoiding possible surprises should longs be larger
than ints.
