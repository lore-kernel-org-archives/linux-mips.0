From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200202251921.UAA27344@copsun18.mips.com>
Subject: Re: Setting up of GP in static, non-PIC version of glibc?
Date: Mon, 25 Feb 2002 20:21:00 +0100 (MET)
In-Reply-To: <20020225193928.A4385@dea.linux-mips.net> from "Ralf Baechle" at Feb 25, 2002 07:39:28 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: Johannes Stezenbach <js@convergence.de>, Hartvig Ekner <hartvige@mips.com>, linux-mips@oss.sgi.com
Message-ID: <20020225192100.5dKxmHkEEWFKVaWLdRrk4ex0ZmN_A_gF4z-WN3-qa3g@z>


Ralf Baechle writes:
> 
> On Mon, Feb 25, 2002 at 07:31:41PM +0100, Johannes Stezenbach wrote:
> > BTW: Who is "we"? Do you mean global data optimization is broken
> > in gcc/binutils or just that no one at SGI is using it?
> 
> It's an ECOFF specific optimization that just has been forward ported into
> the ELF world.  And what does this have to do with SGI anyway?

I still don't get it. Why would one not use GP optimization with non-shared
non-PIC code? It certainly is used throughout in the non-Linux MIPS world,
and on the limited testing I did today it also worked fine. Is there 
something which is known not to work, or some conflict somewhere which
prevents the general use of GP?

/Hartvig
