Received: from mail-bl2nam02on0073.outbound.protection.outlook.com ([104.47.38.73]:27238
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993085AbdAISyHaZwUg (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 9 Jan 2017 19:54:07 +0100
Subject: Re: [PATCH] MIPS: OCTEON: Fix copy_from_user fault handling for large
 buffers
References: <ede411ad-ee19-e4e4-e6a2-585a85c640db@imgtec.com>
From: David Daney <ddaney@caviumnetworks.com>
Message-ID: <5cda2d81-6372-f3a6-6f71-1d659515ffb0@caviumnetworks.com>
Date: Mon, 9 Jan 2017 10:53:57 -0800
MIME-Version: 1.0
In-Reply-To: <ede411ad-ee19-e4e4-e6a2-585a85c640db@imgtec.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
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
To: James Cowgill <James.Cowgill@imgtec.com>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170109185357.55mUM6XnA1R15rRiXaPEOZZAsUVWR-SCe7OHqMpBVy8@z>

On 01/09/2017 08:52 AM, James Cowgill wrote:
> If copy_from_user is called with a large buffer (>= 128 bytes) and the
> userspace buffer refers partially to unreadable memory, then it is
> possible for Octeon's copy_from_user to report the wrong number of bytes
> have been copied. In the case where the buffer size is an exact multiple
> of 128 and the fault occurs in the last 64 bytes, copy_from_user will
> report that all the bytes were copied successfully but leave some
> garbage in the destination buffer.

Yikes!

>
> The bug is in the main __copy_user_common loop in octeon-memcpy.S where
> in the middle of the loop, src and dst are incremented by 128 bytes. The
> l_exc_copy fault handler is used after this but that assumes that
> "src < THREAD_BUADDR($28)". This is not the case if src has already been
> incremented.
>
> Fix by adding an extra fault handler which rewinds the src and dst
> pointers 128 bytes before falling though to l_exc_copy.
>
> Thanks to the pwritev test from the strace test suite for originally
> highlighting this bug!
>
> Signed-off-by: James Cowgill <James.Cowgill@imgtec.com>

Good catch,
Acked-by: David Daney <david.daney@cavium.com>

> Cc: stable@vger.kernel.org
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-mips@linux-mips.org
> ---
>  arch/mips/cavium-octeon/octeon-memcpy.S | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/arch/mips/cavium-octeon/octeon-memcpy.S b/arch/mips/cavium-octeon/octeon-memcpy.S
> index 64e08df51d65..4668537b09c2 100644
> --- a/arch/mips/cavium-octeon/octeon-memcpy.S
> +++ b/arch/mips/cavium-octeon/octeon-memcpy.S
> @@ -208,18 +208,18 @@ EXC(	STORE	t2, UNIT(6)(dst),	s_exc_p10u)
>  	ADD	src, src, 16*NBYTES
>  EXC(	STORE	t3, UNIT(7)(dst),	s_exc_p9u)
>  	ADD	dst, dst, 16*NBYTES
> -EXC(	LOAD	t0, UNIT(-8)(src),	l_exc_copy)
> -EXC(	LOAD	t1, UNIT(-7)(src),	l_exc_copy)
> -EXC(	LOAD	t2, UNIT(-6)(src),	l_exc_copy)
> -EXC(	LOAD	t3, UNIT(-5)(src),	l_exc_copy)
> +EXC(	LOAD	t0, UNIT(-8)(src),	l_exc_copy_rewind16)
> +EXC(	LOAD	t1, UNIT(-7)(src),	l_exc_copy_rewind16)
> +EXC(	LOAD	t2, UNIT(-6)(src),	l_exc_copy_rewind16)
> +EXC(	LOAD	t3, UNIT(-5)(src),	l_exc_copy_rewind16)
>  EXC(	STORE	t0, UNIT(-8)(dst),	s_exc_p8u)
>  EXC(	STORE	t1, UNIT(-7)(dst),	s_exc_p7u)
>  EXC(	STORE	t2, UNIT(-6)(dst),	s_exc_p6u)
>  EXC(	STORE	t3, UNIT(-5)(dst),	s_exc_p5u)
> -EXC(	LOAD	t0, UNIT(-4)(src),	l_exc_copy)
> -EXC(	LOAD	t1, UNIT(-3)(src),	l_exc_copy)
> -EXC(	LOAD	t2, UNIT(-2)(src),	l_exc_copy)
> -EXC(	LOAD	t3, UNIT(-1)(src),	l_exc_copy)
> +EXC(	LOAD	t0, UNIT(-4)(src),	l_exc_copy_rewind16)
> +EXC(	LOAD	t1, UNIT(-3)(src),	l_exc_copy_rewind16)
> +EXC(	LOAD	t2, UNIT(-2)(src),	l_exc_copy_rewind16)
> +EXC(	LOAD	t3, UNIT(-1)(src),	l_exc_copy_rewind16)
>  EXC(	STORE	t0, UNIT(-4)(dst),	s_exc_p4u)
>  EXC(	STORE	t1, UNIT(-3)(dst),	s_exc_p3u)
>  EXC(	STORE	t2, UNIT(-2)(dst),	s_exc_p2u)
> @@ -383,6 +383,10 @@ done:
>  	 nop
>  	END(memcpy)
>
> +l_exc_copy_rewind16:
> +	/* Rewind src and dst by 16*NBYTES for l_exc_copy */
> +	SUB	src, src, 16*NBYTES
> +	SUB	dst, dst, 16*NBYTES
>  l_exc_copy:
>  	/*
>  	 * Copy bytes from src until faulting load address (or until a
>
