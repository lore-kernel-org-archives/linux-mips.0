From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200205302125.g4ULPgq05186@coplin09.mips.com>
Subject: Re: cross-compiler for MIPS_RedHat7.1_Release-01.00 on Atlas/4Kc
Date: Thu, 30 May 2002 23:25:42 +0200 (CEST)
In-Reply-To: <Pine.LNX.4.33.0205301346530.4760-100000@Muruga.localdomain> from "Muthukumar Ratty" at May 30, 2002 02:05:17 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Muthukumar Ratty <muthu5@sbcglobal.net>
Cc: David Christensen <dpchrist@holgerdanske.com>, linux-mips@oss.sgi.com, Hartvig Ekner <hartvige@mips.com>
Message-ID: <20020530212542.ak-I0zfsKwpu99otEsGyDL8vCl2pc2SXBhODiNDIa_g@z>

Hi,

Muthukumar Ratty writes:
> 
> On Thu, 30 May 2002, David Christensen wrote:
> 
> > linux-mips@oss.sgi.com & Hartvig:
> >
> > Hartvig Ekner wrote:
> > > from H.J.) as well on an Atlas, you'll just have to use the 2.4.3
> > > install kernel from the 01.00 CD image you downloaded, and everything
> > > else from the new release.
> 
> Is there any latest kernel (2.5.xx) available for MIPS/Atlas?

No. Not from us anyway. Internally, we use the Linux systems heavily for
processor testing, so we tend to stay away from the bleeding edge (==
too  many problems and SW bugs). That is also why we haven't switched
to 2.4.18 until now.

That being said, there are probably many others who compile & use 2.5
kernels for MIPS.

> I played around with some cross-compilers and what I understood is
> 
> 1. Algorithmics sde4 is not matured enough to compile 2.4.xx kernels (As
> Dominic Sweetman mentioned in his reply to my help mail). He said sde5
> will do but I dint get a chance to try this. Any update from anyone used it?

We're using a beta of it - and there are known issues being worked on,
both compiling userland natively and kernel cross compiles.
You'll have to ask Dom when he expects final 5.0 to go out the door.

/Hartvig
