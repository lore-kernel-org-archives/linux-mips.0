From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200202151205.NAA25636@copsun18.mips.com>
Subject: Re: [patch] linux 2.4.17: The second mb() rework (final)
Date: Fri, 15 Feb 2002 13:05:16 +0100 (MET)
In-Reply-To: <200202151156.LAA17485@mudchute.algor.co.uk> from "Dominic Sweetman" at Feb 15, 2002 11:56:59 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Dominic Sweetman <dom@algor.co.uk>
Cc: "Kevin D. Kissell" <kevink@mips.com>, Atsushi Nemoto <nemoto@toshiba-tops.co.jp>, macro@ds2.pg.gda.pl, mdharm@momenco.com, ralf@uni-koblenz.de, linux-mips@fnet.fr, linux-mips@oss.sgi.com
Message-ID: <20020215120516.JIn8zYYubwpi-wcAu7fzPulZ_FL6WFbBtBDbdAon5Q4@z>

But in-order for the CPU is not enough - it also needs to make sure all
written data is visible for DMA accesses to memory from the outside, which
is why the writebuffer needs to be flushed by a SYNC as well. From the
definition of "SYNC":

	"A store is completed when the stored value is visible to every other
	processor in the system". 

Which presumably also includes DMA I/O devices...

/Hartvig

Dominic Sweetman writes:
> 
> 
> Kevin D. Kissell (kevink@mips.com) writes:
> 
> > > Note that SYNC on TX39/H and TX39/H2 does not flush a write buffer.
> > > Some operation (for example, bc0f loop) are required to flush a write
> > > buffer.
> > 
> > That is, I would say, a bug in the TX39 implementation of SYNC.
> 
> That's only a problem if the CPU permitted reads to overtake buffered
> writes.  [Early R3000 write buffers did that (with an address check to
> avoid the disaster of allowing a read to overtake a write to the same
> location).]
> 
> But my recollection is that the TX39 does all memory operations in
> order: so SYNC has very little to do, but it isn't a bug.
> 
> Dominic Sweetman
> Algorithmics
> 


-- 
 _    _   _____  ____     Hartvig Ekner        Mailto:hartvige@mips.com
 |\  /| | |____)(____                          Direct: +45 4486 5503
 | \/ | | |     _____)    MIPS Denmark         Switch: +45 4486 5555
T E C H N O L O G I E S   http://www.mips.com  Fax...: +45 4486 5556
