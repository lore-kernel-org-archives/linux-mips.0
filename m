From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200202050839.JAA00051@copsun18.mips.com>
Subject: Re: PATCH: Fix ll/sc for mips (take 3)
Date: Tue, 5 Feb 2002 09:39:27 +0100 (MET)
In-Reply-To: <1012887022.3343.9.camel@xyzzy.stargate.net> from "Justin Carlson" at Feb 05, 2002 12:30:22 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Justin Carlson <justinca@ri.cmu.edu>
Cc: Daniel Jacobowitz <dan@debian.org>, "H . J . Lu" <hjl@lucon.org>, Dominic Sweetman <dom@algor.co.uk>, GNU C Library <libc-alpha@sources.redhat.com>, linux-mips@oss.sgi.com
Message-ID: <20020205083927.DguPc_axNnD19S10ai1D7Ys02JcEpjvNQnvm9M3xsXc@z>

Note that the issue of a "LL" will trigger bus watching activity in the
system logic (and maybe delays?) I would personally try to avoid issuing
"dangling" ll's in the normal case, even though the functionality would
be ok, and in some cases they are inavoidable.

/Hartvig

Justin Carlson writes:
> 
> On Mon, 2002-02-04 at 23:47, Daniel Jacobowitz wrote:
> > 
> > Won't this cause some gratuitous thrashing if someone else is trying to
> > get the spinlock at the same time?
> > 
> 
> Actually, if you look at the required semantics of ll, no.  A ll by
> itself can never cause a sc from another cpu to fail.  It's part of the
> semantic definition to avoid potential livelock cases, e.g.
> 
> A does ll
> B does ll, foiling A's lock attempt
> A does sc, which fails
> A does ll, foiling B's lock attempt
> B does sc, which fails
> B does ll, foiling A's lock attempt
> ...
> 
> Instead, this case becomes:
> A does ll
> B does ll
> A does sc, which succeeds, even though B has done a ll
> B does sc which fails
> A does critical section work
> B spins on ll until A releases the lock
> 
> 
> -Justin
> 
> 


-- 
 _    _   _____  ____     Hartvig Ekner        Mailto:hartvige@mips.com
 |\  /| | |____)(____                          Direct: +45 4486 5503
 | \/ | | |     _____)    MIPS Denmark         Switch: +45 4486 5555
T E C H N O L O G I E S   http://www.mips.com  Fax...: +45 4486 5556
