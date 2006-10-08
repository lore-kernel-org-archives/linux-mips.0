Received: from mx.mips.com ([63.167.95.198]:710 "EHLO dns0.mips.com")
	by ftp.linux-mips.org with ESMTP id S20038875AbWJHSZh (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Sun, 8 Oct 2006 19:25:37 +0100
Message-ID: <006501c6eb07$4fbf66c0$8003a8c0@Ulysses>
From: "Kevin D. Kissell" <KevinK@mips.com>
References: <20061009.012423.59032950.anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH] ret_from_irq adjustment
Date: Sun, 8 Oct 2006 20:26:44 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <KevinK@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc: ralf@linux-mips.org
Message-ID: <20061008182644.qnyWzgFBpBfTDHNisp7EJX3vW-EZEmre70YS-90lb5I@z>

While setting up ra "by hand" and transferring control via the jr
is a reasonable optimization, you're otherwise breaking things for SMTC.
While the comments are misleading (they accurately described an earlier
version of the code), the function being called here is ipi_decode(), which
 needs a pt_regs * in the first argument (hence the copy of the sp), and 
the pointer to the IPI message descriptor in the second.

Do you have access to a 34K to test changes to SMTC?  I'd have
expected this one to have been pretty quickly fatal.

            Regards,

            Kevin K.

> diff --git a/arch/mips/kernel/smtc-asm.S b/arch/mips/kernel/smtc-asm.S
> index 76cb31d..1cb9441 100644
> --- a/arch/mips/kernel/smtc-asm.S
> +++ b/arch/mips/kernel/smtc-asm.S
> @@ -97,15 +97,12 @@ FEXPORT(__smtc_ipi_vector)
>   SAVE_ALL
>   CLI
>   TRACE_IRQS_OFF
> - move a0,sp
>   /* Function to be invoked passed stack pad slot 5 */
>   lw t0,PT_PADSLOT5(sp)
>   /* Argument from sender passed in stack pad slot 4 */
> - lw a1,PT_PADSLOT4(sp)
> - jalr t0
> - nop
> - j ret_from_irq
> - nop
> + lw a0,PT_PADSLOT4(sp)
> + PTR_LA ra, _ret_from_irq
> + jr t0
>  
>  /*
>   * Called from idle loop to provoke processing of queued IPIs
> 
> 
