From: "Matthew Dharm" <mdharm@momenco.com>
Subject: RE: MIPS 64?
Date: Wed, 15 May 2002 15:08:05 -0700
Message-ID: <NEBBLJGMNKKEEMNLHGAIAEABCHAA.mdharm@momenco.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3CE2D95B.E1E43662@broadcom.com>
Sender: owner-linux-mips@oss.sgi.com
To: kwalker@broadcom.com
Cc: Linux-MIPS <linux-mips@oss.sgi.com>
Message-ID: <20020515220805.H0ysYOjRxoDUTU5gii347nBPmbfTz0Ru_ILdy9cxKWQ@z>

I don't suppose anyone has a primer or white paper on the High Memory
stuff?  i.e. Applications, requirements, or a quick HOWTO?

Matt

--
Matthew D. Dharm                            Senior Software Designer
Momentum Computer Inc.                      1815 Aston Ave.  Suite 107
(760) 431-8663 X-115                        Carlsbad, CA 92008-7310
Momentum Works For You                      www.momenco.com

> -----Original Message-----
> From: kwalker@broadcom.com [mailto:kwalker@broadcom.com]
> Sent: Wednesday, May 15, 2002 2:56 PM
> To: Matthew Dharm
> Cc: Linux-MIPS
> Subject: Re: MIPS 64?
>
>
>
> Since traditionally the mips kernel could only manage RAM
> reachable by
> Kseg you were limited to 512MB, right?  But now the High
> Memory stuff is
> stable enough that you can reach any RAM that's physically
> addressable
> in 32-bits.  And after that, there's the 64bit-physical-address
> extension which allows you to reach physical pages that
> need > 32-bits
> to address.
>
> Kip
>
> Daniel Jacobowitz wrote:
> >
> > On Wed, May 15, 2002 at 02:34:47PM -0700, Matthew Dharm wrote:
> > > So... I'm looking at porting Linux to a system with
> 1.5GiB of RAM.
> > > That kinda blows the 32-bit MIPS port option right out
> of the water...
> >
> > Not unless you count bits differently than I do... 32-bit
> is 4 GiB.  Is
> > there any reason MIPS has special problems in this area?
> >
> > >
> > > What does it take to do a 64-bit port?  The first
> problem I see is the
> > > boot loader -- do I have to be in 64-bit mode when the
> kernel starts,
> > > or can I start in 32-bit mode and then transfer to 64-bit mode?
> > >
> > > I looked in the arch/mips64/ directory, but I don't see much for
> > > specific boards there, but there are references to the Malta
> > > boards....
> > >
> > > Matt
> > >
> > > --
> > > Matthew D. Dharm                            Senior
> Software Designer
> > > Momentum Computer Inc.                      1815 Aston
> Ave.  Suite 107
> > > (760) 431-8663 X-115                        Carlsbad,
> CA 92008-7310
> > > Momentum Works For You                      www.momenco.com
> > >
> > >
> >
> > --
> > Daniel Jacobowitz                           Carnegie
> Mellon University
> > MontaVista Software                         Debian
> GNU/Linux Developer
>
