Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Fri, 30 May 1997 14:59:07 -0700
Message-ID: <199705302159.OAA04831@fir.engr.sgi.com>
From: "William J. Earl" <wje@fir.engr.sgi.com>
Subject: Re: ah...
In-Reply-To: <199705302125.RAA22822@neon.ingenia.ca>
References: <199705301804.UAA18639@informatik.uni-koblenz.de>
	<199705302125.RAA22822@neon.ingenia.ca>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@neon.ingenia.ca>
Cc: Ralf Baechle <ralf@mailhost.uni-koblenz.de>, linux@cthulhu.engr.sgi.com
Message-ID: <19970530215907.7MYgmBGlPUEu063QMf90MbKF8ZBp5zgIisnQBtNgOKY@z>

Mike Shaver writes:
 > Thus spake Ralf Baechle:
 > > One of the fun things with SGI...  Long time ago checked two SGI machines
 > > running different OS versions for reference.  In one of them the values
 > > for SOCK_STREAM and SOCK_DGRAM are swapped compared to the other.  I wonder
 > > why.  But anyway, at that time I choose to clone the constants from the
 > > newer one.
 > 
 > Solaris is the same way...it's probably an SVR thing.
 > (If you're going to use sockets, though, why not use the BSD values?)

    SVR4 has sockets, and they are source-compatible with the BSD
version, but the detailed values needed to match the TPI values for
SVR4 implementation reasons.  When we did the MIPS SVR4 ABI, one
compromise MIPS and SGI had to make with the other vendors, who used
real SVR4 with fake sockets on top of TPI, instead of providing
compatibility on top of a non-SVR4 kernel with real BSD sockets,
was to agree to the SVR4 values for these constants.

 > > Grrr...  I somewhen moved the definitions of these constants from the
 > > generic header files to the machine specific header files and somehow
 > > lost the appropriate change to the library.  I did change this with an
 > > eye into the future (IRIX / ABI compatibility) so we wouldn't need some
 > > stupid conversion routine.  Actually I wonder why I was able to use
 > > bind, so I'll have to enquire my setup a bit closer.
 > 
 > FWIW, I'd prefer to keep the Linux constants, well, constant.
 > I don't see a problem with doing value swapping in an ABI routine
 > later on, a la Linux/SPARC<->Solaris.

      For these constants, at least, the value swapping is simple enough,
and, as you point out, is probably already done for Linux/SPARC.  IRIX 5 and
IRIX 6 binaries definitely require the SVR4-style values.
