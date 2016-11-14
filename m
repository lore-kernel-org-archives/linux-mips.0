Received: from mailapp01.imgtec.com ([195.59.15.196]:27567 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993008AbcKNOsIpEHN2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 14 Nov 2016 15:48:08 +0100
Date: Mon, 14 Nov 2016 14:47:53 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 6/7] MIPS: memcpy: Use a3/$7 for source end address
In-Reply-To: <20161107111802.12071-7-paul.burton@imgtec.com>
Message-ID: <alpine.DEB.2.20.17.1611141435170.10580@tp.orcam.me.uk>
References: <20161107111802.12071-1-paul.burton@imgtec.com> <20161107111802.12071-7-paul.burton@imgtec.com>
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
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20161114144753.b-sbaBp11bs-RbEfEb3VyYR7SAMBTE8dxNh33RR4MVY@z>

On Mon, 7 Nov 2016, Paul Burton wrote:

> Instead of using the at/$1 register (which does not form part of the
> typical calling convention) to provide the end of the source region to
> __copy_user* functions, use the a3/$7 register. This prepares us for
> being able to call __copy_user* with a standard function call.
> 
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> ---
> 
>  arch/mips/cavium-octeon/octeon-memcpy.S |  8 ++++----
>  arch/mips/include/asm/uaccess.h         | 21 ++++++++++++---------
>  arch/mips/lib/memcpy.S                  |  8 ++++----
>  3 files changed, 20 insertions(+), 17 deletions(-)
> 
[...]
> diff --git a/arch/mips/lib/memcpy.S b/arch/mips/lib/memcpy.S
> index 48684c4..5af9f03 100644
> --- a/arch/mips/lib/memcpy.S
> +++ b/arch/mips/lib/memcpy.S
> @@ -70,13 +70,13 @@
>  
>  /*
>   * The exception handler for loads requires that:
> - *  1- AT contain the address of the byte just past the end of the source
> + *  1- a3 contain the address of the byte just past the end of the source
>   *     of the copy,
> - *  2- src_entry <= src < AT, and
> + *  2- src_entry <= src < a3, and
>   *  3- (dst - src) == (dst_entry - src_entry),
>   * The _entry suffix denotes values when __copy_user was called.
>   *
> - * (1) is set up up by uaccess.h and maintained by not writing AT in copy_user
> + * (1) is set up up by uaccess.h and maintained by not writing a3 in copy_user
>   * (2) is met by incrementing src by the number of bytes copied
>   * (3) is met by not doing loads between a pair of increments of dst and src
>   *
> @@ -549,7 +549,7 @@
>  	 nop
>  	LOADK	t0, THREAD_BUADDR(t0)	# t0 is just past last good address
>  	 nop
> -	SUB	len, AT, t0		# len number of uncopied bytes
> +	SUB	len, a3, t0		# len number of uncopied bytes
>  	bnez	ta2, .Ldone\@	/* Skip the zeroing part if inatomic */
>  	/*
>  	 * Here's where we rely on src and dst being incremented in tandem,

 With the lone explicit use of $at gone from this code I think you can 
remove `.set noat/at=v1' pseudo-ops across this source file as well.

 I think it would be good actually to do both changes with a single patch 
as it will ensure that whoever comes across them in the future in a look 
through our repo history will know immediately that one is a direct 
consequence of the other (i.e. that we only have those `.set noat/at=v1' 
pseudo-ops because of the special use of $at in this code).

 Thanks for doing these clean-ups; I actually have found this use of $at 
here particularly irritating.

  Maciej
