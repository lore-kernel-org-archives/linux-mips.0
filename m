From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200202051928.UAA21774@copsun18.mips.com>
Subject: Re: PATCH: Fix ll/sc for mips (take 3)
Date: Tue, 5 Feb 2002 20:28:34 +0100 (MET)
In-Reply-To: <Pine.GSO.3.96.1020205134113.9674G-100000@delta.ds2.pg.gda.pl> from "Maciej W. Rozycki" at Feb 05, 2002 02:28:59 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020205192834.izhJKFDWfmtmo-Rp6fguLHqqEFbzDxM0X2514O62iNk@z>


Maciej W. Rozycki writes:
>  How do you maintain coherency on such a system?  To support such a model
> all shared area write accesses should be followed by explicit
> synchronization requests.  It should be trivial but tedious to do for
> Linux, but it might not be that easy for threads.

This would have to be a loosely coupled system - something using either
software coherency or uncached accesses for the shared areas. And then
LL/SC for synchronization primitives.

There are a fair number of SOC designs like this, even with more than
two processors.

/Hartvig
