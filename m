From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200210041307.g94D72G02838@copfs01.mips.com>
Subject: Re: Promblem with PREF (prefetching) in memcpy
Date: Fri, 4 Oct 2002 15:07:02 +0200 (MEST)
In-Reply-To: <1033736983.31861.26.camel@irongate.swansea.linux.org.uk> from "Alan Cox" at Oct 04, 2002 02:09:43 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-Path: <hartvige@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Carsten Langgaard <carstenl@mips.com>, Dominic Sweetman <dom@algor.co.uk>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20021004130702.njhUd8KAb-aXfUmIzZE0P0tJKlMKFTCremPCzpV5_jg@z>

Yes, I think that must be the safest solution.

Any kernel routine which uses PREF instructions (but actually also user
space code as Ralf's example pointed out), must guarantee that it does
not issue prefetches to addresses which it is not specifically being
asked to mess around with. 

The other solutions seem too fragile, and will break at some point.

/Hartvig

Alan Cox writes:
> 
> On Fri, 2002-10-04 at 13:35, Carsten Langgaard wrote:
> > That's exactly the problem.
> > The actually loads and stores in memcpy is fine, it's the prefetching that
> > prefetch too much.
> 
> Then fix your prefetching code 8). We had problems with that on x86 too,
> prefetching off the last page into ISA space -> death. Was umm fun to
> debug
> 
> 
> 


-- 
 _    _   _____  ____     Hartvig Ekner        Mailto:hartvige@mips.com
 |\  /| | |____)(____                          Direct: +45 4486 5503
 | \/ | | |     _____)    MIPS Denmark         Switch: +45 4486 5555
T E C H N O L O G I E S   http://www.mips.com  Fax...: +45 4486 5556
