From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200209051420.QAA26367@copcs01.mips.com>
Subject: Re: 64-bit and N32 kernel interfaces
Date: Thu, 5 Sep 2002 16:20:55 +0200 (MET DST)
In-Reply-To: <Pine.GSO.3.96.1020905155411.7444A-100000@delta.ds2.pg.gda.pl> from "Maciej W. Rozycki" at Sep 05, 2002 04:09:11 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-Path: <hartvige@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: "Kevin D. Kissell" <kevink@mips.com>, Tor Arntsen <tor@spacetec.no>, Carsten Langgaard <carstenl@mips.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20020905142055.iq3gRFGYsq6gtS6jX_1PuSIIBF83nLhmBMD4XZlmR2I@z>

I don't know the ultimate reasons why SGI choose ILP32 for n32, but one
could certainly be portability.

As defined, n32 provides all the benefits of 64-bit data (yes, you have
to use long long to get to it), and 100% backward compatability with 
o32 sources that assume (sizeof(void *)) = sizeof(long), plus binary data
file compatability with o32 as all structures are exactly identical between
o32 and n32.

/Hartvig


Maciej W. Rozycki writes:
> 
> On Thu, 5 Sep 2002, Kevin D. Kissell wrote:
> 
> > n32 has the same data types as o32, an "ILP32" C integer 
> > model.  n64 is a pretty normal "LP64" C integer model.
> > 
> > What do you consider to be broken, and how would you
> > have preferred it to have been done?
> 
>  For n32 it would be natural to have:
> 
> - sizeof(int) = 32
> 
> - sizeof(long) = 64
> 
> - sizeof(void *) = 32
> 
> as the underlying hardware directly supports 64-bit operations (n32
> requires at least MIPS III).  Thus there is no penalty for 64-bit
> arithmetics and if one uses longs one normally wants the largest native
> integer type -- using long long typically (i.e. on most platforms) implies
> double-precision arithmetics with all the drawbacks, especially for the
> division and multiplication operations. 
> 
>  With 32-bit long on 64-bit hardware software has no easy way to figure
> using 64-bit operations is still optimal performance-wise.  I can't see
> any technical benefit from such a setup -- is there any?  I doubt it. 
> 
> -- 
> +  Maciej W. Rozycki, Technical University of Gdansk, Poland   +
> +--------------------------------------------------------------+
> +        e-mail: macro@ds2.pg.gda.pl, PGP key available        +
> 
> 
> 


-- 
 _    _   _____  ____     Hartvig Ekner        Mailto:hartvige@mips.com
 |\  /| | |____)(____                          Direct: +45 4486 5503
 | \/ | | |     _____)    MIPS Denmark         Switch: +45 4486 5555
T E C H N O L O G I E S   http://www.mips.com  Fax...: +45 4486 5556
