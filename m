Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:57490 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990482AbdK2UVX5-Xgx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 29 Nov 2017 21:21:23 +0100
Date: Wed, 29 Nov 2017 20:20:35 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH] MIPS: Validate PR_SET_FP_MODE prctl(2) requests against
 the ABI of the task
In-Reply-To: <20171128193133.ip6weo4tgstqun44@pburton-laptop>
Message-ID: <alpine.DEB.2.00.1711292017300.31156@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1711251259130.3865@tp.orcam.me.uk> <20171127184642.ny2lad4y6zz6am2b@pburton-laptop> <alpine.DEB.2.00.1711272105460.31156@tp.orcam.me.uk> <20171128193133.ip6weo4tgstqun44@pburton-laptop>
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
To: Paul Burton <paul.burton@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@mips.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Message-ID: <20171129202035.wjUKzUuHkAo4BfiyK__qpRMTshQq9ybsqq3a5vb8rD0@z>

Hi Paul,

> >  That written, I could make it 1/2 with the ABI checks becoming 2/2, but 
> > then 1/2 wouldn't make sense on its own (except perhaps as a 
> > microoptimisation, but that would be an entirely different purpose) and 
> > would have to be considered in conjunction with 2/2 anyway.
> 
> Ah - OK, I see. Prior to this patch the value returned by PR_GET_FP_MODE
> would always be one accepted by PR_SET_FP_MODE anyway, but with the
> patch that will cease to be true for non-o32 ABIs without the special
> case. Gotcha.

 And also for !CONFIG_MIPS_O32_FP64_SUPPORT.

> > > Both changes look good to me though, so feel free to add:
> > > 
> > >     Reviewed-by: Paul Burton <paul.burton@mips.com>
> > 
> >  Thanks for your review.  Do you feel convinced with the justification I 
> > gave?
> 
> Yes - I follow, please consider the Reviewed-by tag valid for the patch
> as-is.

 Great!  Thanks again for your review.

  Maciej
