Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:58094 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990482AbdK1TnaTXPgS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Nov 2017 20:43:30 +0100
Date: Tue, 28 Nov 2017 11:31:33 -0800
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: Validate PR_SET_FP_MODE prctl(2) requests against
 the ABI of the task
Message-ID: <20171128193133.ip6weo4tgstqun44@pburton-laptop>
References: <alpine.DEB.2.00.1711251259130.3865@tp.orcam.me.uk>
 <20171127184642.ny2lad4y6zz6am2b@pburton-laptop>
 <alpine.DEB.2.00.1711272105460.31156@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1711272105460.31156@tp.orcam.me.uk>
Return-Path: <Paul.Burton@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Maciej W. Rozycki" <macro@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@mips.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Message-ID: <20171128193133.czlOVws3qnGO4y9LppU5tEoGQNR4hKwjgs4uVhuLQvQ@z>

Hi Maciej,

On Mon, Nov 27, 2017 at 09:39:10PM +0000, Maciej W. Rozycki wrote:
> > > Always succeed however without taking any further action if the mode 
> > > requested is the same as one already in effect, regardless of whether 
> > > any mode change, should it be requested, would actually be allowed for 
> > > the task concerned.
> > 
> > This seems like a distinct change that I think would be worth splitting
> > out to a separate patch.
> 
>  I've been thinking about it before posting and decided it's inherent.  
> 
>  Indeed in developing this fix this part was the last one I realised that 
> had to be done for the change to be overall self-consistent, following a 
> principle typically applied to hardware registers where the programmer is 
> architecturally allowed to write individual bits with the values 
> previously read from them even if these bits are undefined in the 
> specification of hardware concerned.
> 
>  So here you'll be able to issue a PR_SET_FP_MODE request with a value 
> previously obtained with PR_GET_FP_MODE and it will succeed, even if all 
> the bits are actually read-only for the ABI in effect.  This is important 
> as GDB will soon be using these calls and expect PR_SET_FP_MODE not to 
> fail if an attempt is made to write back a value previously obtained with 
> PR_GET_FP_MODE.
> 
>  I could have buried this check in the two conditions that follow, making 
> execution fall through if the mode remains unchanged, however I have 
> realised that making the check upfront makes the resulting code cleaner.
> 
>  That written, I could make it 1/2 with the ABI checks becoming 2/2, but 
> then 1/2 wouldn't make sense on its own (except perhaps as a 
> microoptimisation, but that would be an entirely different purpose) and 
> would have to be considered in conjunction with 2/2 anyway.

Ah - OK, I see. Prior to this patch the value returned by PR_GET_FP_MODE
would always be one accepted by PR_SET_FP_MODE anyway, but with the
patch that will cease to be true for non-o32 ABIs without the special
case. Gotcha.

> > Both changes look good to me though, so feel free to add:
> > 
> >     Reviewed-by: Paul Burton <paul.burton@mips.com>
> 
>  Thanks for your review.  Do you feel convinced with the justification I 
> gave?

Yes - I follow, please consider the Reviewed-by tag valid for the patch
as-is.

Thanks,
    Paul
