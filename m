Received: from relay1.mentorg.com ([192.94.38.131]:38628 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013849AbaKQQ6QU2mn8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Nov 2014 17:58:16 +0100
Date: Mon, 17 Nov 2014 16:57:59 +0000
From: "Maciej W. Rozycki" <macro@codesourcery.com>
Subject: Re: [PATCH 6/7] MIPS: Apply `.insn' to fixup labels throughout
In-Reply-To: <546A248F.4040604@imgtec.com>
Message-ID: <alpine.DEB.1.10.1411171650410.2881@tp.orcam.me.uk>
References: <alpine.DEB.1.10.1411140122420.2881@tp.orcam.me.uk> <alpine.DEB.1.10.1411152139430.2881@tp.orcam.me.uk> <546A248F.4040604@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej_Rozycki@mentor.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Steven J. Hill" <Steven.Hill@imgtec.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20141117165759.QOjnQhjlSYGnWnWyevUsl4QVrVyT-ec5EBZrIeR-VL8@z>

On Mon, 17 Nov 2014, Steven J. Hill wrote:

> > I see someone has just fixed this issue in one place, so I had to 
> > regenerate the change I originally made against 3.17, but I really
> > fail to see why not to fix it throughout at once.
> > 
> In our earlier branches I believe all of the '.insn' pseudo-ops were in
> place. I remember removing a number of them during release testing since
> they appeared to not make any difference. It appears that use of
> different toolchains has shown that to be in error.

 Well, people keep adding code so these fixups may well have not been 
there previously.  And not all source code is compiled in all 
configurations so if you rely on build-time checking then you may well 
miss a bit here or there.  The best way at the moment is to scan through 
all code or watch as people push changes and react.

 It would be better if we had a way to handle it automatically, or maybe 
even better yet if GAS did not lose the ISA bit on a label when there is 
a temporary section switch between the label and the following 
instruction.  As much as I'd like doing this changing GAS to be able to 
carry the ISA bit across a section switch is non-trivial though, it 
would be a major effort to implement it, so at least for the time being 
we have to live with what we have now.

 Thanks for your review.

  Maciej
