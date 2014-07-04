Received: from mailapp01.imgtec.com ([195.59.15.196]:3989 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6834666AbaGDLaQoQRmI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 4 Jul 2014 13:30:16 +0200
Date: Fri, 4 Jul 2014 12:30:07 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH v2 5/6] mips: use per-mm page to execute FP branch delay
 slots
Message-ID: <20140704113007.GA804@pburton-laptop>
References: <CAO_EM_k0Qp_VPEd2Q+WTJWsvE8cmyAuC780SwGfDxhTt_GzMeg@mail.gmail.com>
 <20140704080641.GY804@pburton-laptop>
 <20140704085246.GH13532@linux-mips.org>
 <20140704090601.GZ804@pburton-laptop>
 <20140704093809.GI13532@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20140704093809.GI13532@linux-mips.org>
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Ed Swierk <eswierk@skyportsystems.com>, linux-mips@linux-mips.org, ddaney.cavm@gmail.com
Message-ID: <20140704113007.ubB1il_OkR73dxQ_ZAHngubJiXACPjPBdimDFR2S7mU@z>

On Fri, Jul 04, 2014 at 11:38:09AM +0200, Ralf Baechle wrote:
> On Fri, Jul 04, 2014 at 10:06:01AM +0100, Paul Burton wrote:
> 
> > > The actual piece of code that needs to be installed is tiny.  So the page
> > > could be shared between many threads.  In fact a single page would
> > > suffice for most processes and only threads would require more slots
> > > than provided by a single page so more pags could be allocated or the
> > > process could sleep until a slot becomes available.
> > 
> > You just roughly described the v2 patch that we're replying to :)
> 
> Can't be that wrong then :-)
> 
> I seem to only have replies to that patch in my mail folder not the
> patch itself.

You can find it in patchwork if you're interested:

  http://patchwork.linux-mips.org/patch/6125/

> > > I'm also wondering how insane emulation would be.  We already have the
> > > capability to emulate a fair fraction of the instruction set.
> > 
> > Yeah, and I'm reasonably sure we're going to need some more once MIPSr6
> > is supported. I guess (perhaps only for the short term?) it could be
> > done in stages - if systems include ASEs or cop2 that the emulation
> > didn't implement then it could fall back to the current emuframe code.
> 
> And it's dependence on executable stackframe ...

...yup.

> > I'm in 2 minds about this - it sounds crazy but perhaps it's the most
> > sane option available :)
> 
> Sanity is overrated anyway ;-)

I had originally left this patch at the point I started considering
implementing emulation for the whole ISA in the kernel, figuring I was
going insane & should probably do something else for a while. Perhaps I
shouldn't worry so much ;)

Thanks,
    Paul
