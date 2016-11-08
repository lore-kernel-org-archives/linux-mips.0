Received: from mailapp01.imgtec.com ([195.59.15.196]:47597 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992078AbcKHLRTlQUtg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Nov 2016 12:17:19 +0100
Date: Tue, 8 Nov 2016 11:17:02 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] MIPS: R2-on-R6 emulation bugfix of BLEZL and BGTZL
 instructions
In-Reply-To: <20161107183928.27456.13089.stgit@ubuntu-yegoshin>
Message-ID: <alpine.DEB.2.20.17.1611080426360.10580@tp.orcam.me.uk>
References: <20161107183928.27456.13089.stgit@ubuntu-yegoshin>
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
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: linux-mips@linux-mips.org, paul.burton@imgtec.com, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, yamada.masahiro@socionext.com
Message-ID: <20161108111702.9vId89b72h06Qt78mdJa_1zHNqSuKBw4gYCd3CUKgJY@z>

On Mon, 7 Nov 2016, Leonid Yegoshin wrote:

> MIPS R2 emulation doesn't take into account that BLEZL and BGTZL instructions
> require register RT = 0. If it is not zero it can be some legitimate MIPS R6
> instruction.

 Well, it *is* rather than just can be -- one of BLEZC/BGEZC/BGEC or 
BGTZC/BLTZC/BLTC, respectively, according to the bit patterns in RS/RT, 
all these instructions being compact branches, so we can stop emulation 
rather than decoding them.

 Also please line-wrap your description at 75 columns, as per 
Documentation/SubmittingPatches.

> diff --git a/arch/mips/kernel/mips-r2-to-r6-emul.c b/arch/mips/kernel/mips-r2-to-r6-emul.c
> index 22dedd62818a..b0c86b08c0b9 100644
> --- a/arch/mips/kernel/mips-r2-to-r6-emul.c
> +++ b/arch/mips/kernel/mips-r2-to-r6-emul.c
> @@ -919,6 +919,7 @@ int mipsr2_decoder(struct pt_regs *regs, u32 inst, unsigned long *fcr31)
>  		BUG();
>  		return SIGEMT;
>  	}
> +	err = 0;
>  	pr_debug("Emulating the 0x%08x R2 instruction @ 0x%08lx (pass=%d))\n",
>  		 inst, epc, pass);

 Is this because of BRANCH_LIKELY_TAKEN?  It has to be a separate patch 
then, with a suitable description.

> @@ -1096,10 +1097,16 @@ int mipsr2_decoder(struct pt_regs *regs, u32 inst,
> unsigned long *fcr31)
>  		}
>  		break;
>  
> -	case beql_op:
> -	case bnel_op:
>  	case blezl_op:
>  	case bgtzl_op:
> +		/* return MIPS R6 instruction to CPU execution */
> +		if (MIPSInst_RT(inst)) {
> +			err = SIGILL;
> +			break;
> +		}

 Please add:

		/* Fall through.  */

here so that it is clear it's not a bug; also GCC 7 will catch such cases 
and issue warnings, which I expect according to our settings will cause a 
build failure here if this is missing.

> +
> +	case beql_op:
> +	case bnel_op:

 This part looks fine to me otherwise.

  Maciej
