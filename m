Received: from 19pmail.ess.barracuda.com ([64.235.150.244]:53173 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990901AbdKONsfaYtL0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 15 Nov 2017 14:48:35 +0100
Date: Wed, 15 Nov 2017 13:48:06 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH] MIPS: Fix exception entry when CONFIG_EVA enabled
In-Reply-To: <9a2d2b4b-9b6a-a7e2-78be-ff6a019d6e05@mips.com>
Message-ID: <alpine.DEB.2.00.1711151334200.3893@tp.orcam.me.uk>
References: <1507712360-20657-1-git-send-email-matt.redfearn@mips.com> <605f6a96-a843-085c-efc6-a2c0f2afd84a@mvista.com> <20171031234853.GD15260@jhogan-linux> <alpine.DEB.2.00.1711131045460.3893@tp.orcam.me.uk>
 <9a2d2b4b-9b6a-a7e2-78be-ff6a019d6e05@mips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Matt Redfearn <matt.redfearn@mips.com>
Cc: James Hogan <james.hogan@mips.com>, Corey Minyard <cminyard@mvista.com>, Ralf Baechle <ralf@linux-mips.org>, Matthew Fortune <matthew.fortune@mips.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, "Jason A. Donenfeld" <jason@zx2c4.com>, Paul Burton <paul.burton@mips.com>
Message-ID: <20171115134806.mkoNVpyJbukhjB5v3-4K9JMLqZneK4ySq_aYsjoDaN4@z>

On Wed, 15 Nov 2017, Matt Redfearn wrote:

> I like the change you propose, however I can't coax GAS to reorder the
> instructions appropriately. With this patch on top of 4.14:
> 
> --- a/arch/mips/include/asm/stackframe.h
> +++ b/arch/mips/include/asm/stackframe.h
> @@ -195,14 +195,16 @@
>                 .set    push
>                 .set    noat
>                 .set    reorder
> -               mfc0    k0, CP0_STATUS
> -               sll     k0, 3           /* extract cu0 bit */
> -               .set    noreorder
> -               bltz    k0, 8f
> -                move   k0, sp
> +               mfc0    k1, CP0_STATUS
> +               sll     k1, 3           /* extract cu0 bit */
> +
> +               move    k0, sp
>                 .if \docfi
>                 .cfi_register sp, k0
>                 .endif
> +
> +               bltz    k1, 8f
> +
>  #ifdef CONFIG_EVA
>                 /*
>                  * Flush interAptiv's Return Prediction Stack (RPS) by writing
> @@ -228,7 +230,6 @@
>                 MFC0    k0, CP0_ENTRYHI
>                 MTC0    k0, CP0_ENTRYHI
>  #endif
> -               .set    reorder
>                 /* Called from user mode, new stack. */
>                 get_saved_sp docfi=\docfi tosp=1
>  8:
> 
> 
> The generated assembly is:
> 
> 80405d00 <handle_int>:
> 80405d00:       401b6000        mfc0    k1,c0_status
> 80405d04:       001bd8c0        sll     k1,k1,0x3
> 80405d08:       03a0d025        move    k0,sp
> 80405d0c:       07600007        bltz    k1,80405d2c <handle_int+0x2c>
> 80405d10:       00000000        nop
> 80405d14:       401a2000        mfc0    k0,c0_context
> 
> Apparently GAS has not been able to reorder the move into the branch delay
> slot for some reason. Any ideas?

 It could be the `.cfi_register' pseudo-op acting as a scheduling barrier.  
I think it can be moved further down, beyond the branch, because until 
clobbered later on $sp still holds the original value, so using either 
register for frame access or the value itself will yield the same result.

 Can you send me .i output from the offending source along with GCC 
options used to make .o output (use `V=1' with `make' if needed)?  I'll 
check if my hypothesis is right or find the actual cause otherwise.

  Maciej
