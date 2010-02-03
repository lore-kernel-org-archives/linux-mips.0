Received: from bby1mta03.pmc-sierra.com ([216.241.235.118]:51728 "EHLO
        bby1mta03.pmc-sierra.bc.ca" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492528Ab0BCNjZ convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 3 Feb 2010 14:39:25 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: Cached Base address difference.
Date: Wed, 3 Feb 2010 05:38:28 -0800
Message-ID: <A7DEA48C84FD0B48AAAE33F328C0201404809DEA@BBY1EXM11.pmc_nt.nt.pmc-sierra.bc.ca>
In-Reply-To: <20100203123331.GB20375@linux-mips.org>
References: <1265015455-32553-1-git-send-email-wuzhangjin@gmail.com> <b2b2f2321002011903m7a090481m52d84a664beb5468@mail.gmail.com> <20100203012934.GA20375@linux-mips.org> <A7DEA48C84FD0B48AAAE33F328C0201404809DE0@BBY1EXM11.pmc_nt.nt.pmc-sierra.bc.ca> <20100203123331.GB20375@linux-mips.org>
From: "Anoop P.A." <Anoop_P.A@pmc-sierra.com>
Return-Path: <Anoop_P.A@pmc-sierra.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20100203133828.JV-cfXBBWqwO067eFF5YFtthrqwCHxflU6Wz4I5OesM@z>

Hi Ralf,

I am sorry if it is not clear from my last mail.

What I want to convey is, 

"See MIPS Run" explains "window on physical memory (cached)" will start
@ 0x9000_0000_0000_0000.  

You can see "See MIPS Run" page under suspect from this link
http://books.google.co.in/books?id=kk8G2gK4Tw8C&lpg=PP1&dq=see%20mips%20
run&pg=PA51#v=onepage&q=&f=false

How ever as you mentioned Linux source defines CAC_BASE
0x98000000_00000000

Thanks
Anoop 

> -----Original Message-----
> From: Ralf Baechle [mailto:ralf@linux-mips.org]
> Sent: Wednesday, February 03, 2010 6:04 PM
> To: Anoop P.A.
> Cc: linux-mips@linux-mips.org
> Subject: Re: Cached Base address difference.
> 
> On Wed, Feb 03, 2010 at 03:34:25AM -0800, Anoop P.A. wrote:
> 
> > I am seeing a address conflict in asm-generic/spaces.h  . in
spaces.h (
> > 64 bit)CAC_BASE has been defined as 0x9800000000000000 however see
mips
> > run says it is 0x9000000000000000
> >
http://books.google.co.in/books?id=kk8G2gK4Tw8C&lpg=PP1&dq=see%20mips%20
> > run&pg=PA51#v=onepage&q=&f=false
> >
> > Is this intentional?
> 
> <asm/mach-generic/spaces.h> defines:
> 
> #ifndef CAC_BASE
> #ifdef CONFIG_DMA_NONCOHERENT
> #define CAC_BASE                _AC(0x9800000000000000, UL)
> #else
> #define CAC_BASE                _AC(0xa800000000000000, UL)
> #endif
> #endif
> 
> No 0x9000000000000000 anywhere - and it would be wrong because it
stands
> for uncached.
> 
>   Ralf
