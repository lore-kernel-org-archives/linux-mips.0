Received: from mailapp01.imgtec.com ([195.59.15.196]:27232 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007677AbaIRI6KRh9zW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Sep 2014 10:58:10 +0200
Date: Thu, 18 Sep 2014 09:57:56 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH v2 5/6] mips: use per-mm page to execute FP branch delay
 slots
Message-ID: <20140918085756.GU17248@pburton-laptop>
References: <CAO_EM_k0Qp_VPEd2Q+WTJWsvE8cmyAuC780SwGfDxhTt_GzMeg@mail.gmail.com>
 <20140704080641.GY804@pburton-laptop>
 <20140704085246.GH13532@linux-mips.org>
 <20140704090601.GZ804@pburton-laptop>
 <20140704093809.GI13532@linux-mips.org>
 <20140704113007.GA804@pburton-laptop>
 <alpine.LFD.2.11.1409132359450.11957@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.11.1409132359450.11957@eddie.linux-mips.org>
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
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Ed Swierk <eswierk@skyportsystems.com>, linux-mips@linux-mips.org, ddaney.cavm@gmail.com
Message-ID: <20140918085756.S0LtzdA3LLByT3bzVYxxmHeHYnax3SUmr_KrkSGtD9E@z>

On Sun, Sep 14, 2014 at 12:06:03AM +0100, Maciej W. Rozycki wrote:
> On Fri, 4 Jul 2014, Paul Burton wrote:
> 
> > > > I'm in 2 minds about this - it sounds crazy but perhaps it's the most
> > > > sane option available :)
> > > 
> > > Sanity is overrated anyway ;-)
> > 
> > I had originally left this patch at the point I started considering
> > implementing emulation for the whole ISA in the kernel, figuring I was
> > going insane & should probably do something else for a while. Perhaps I
> > shouldn't worry so much ;)
> 
>  One question: does this emulation handle PC-relative instructions placed 
> in a branch delay slot correctly?  This only applies to microMIPS ADDIUPC 
> at the moment I believe, but still that has to work correctly whether on 
> FP hardware or emulated.
> 
>   Maciej

Hi Maciej,

That's a good question, and no I don't believe the current dsemul code
will handle that correctly. Perhaps that's another argument in favor of
the full on emulator...

Paul
