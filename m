Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@Julia.DE>
Message-ID: <199704101422.QAA10766@kernel.panic.julia.de>
Subject: Re: all in the family
Date: Thu, 10 Apr 1997 16:22:14 +0200 (MET DST)
In-Reply-To: <199704101453.KAA21432@neon.ingenia.ca> from "Mike Shaver" at Apr 10, 97 10:53:19 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@neon.ingenia.ca>
Cc: miguel@nuclecu.unam.mx, linux@cthulhu.engr.sgi.com
Message-ID: <19970410142214.sOmCMgETsloqqgLnnLN5DorHKBNmtHUe9kXVWPpoxqw@z>

Hi,

> Thus spake Miguel de Icaza:
> > > Anyone know if the emulation is up to hosting the Linux/Indy
> > > cross-compiler?
> > 
> > Why do you need the emulation for on Linux/SPARC?   You just need to
> > run configure on Linux/SPARC with the proper --target option and you
> > will get your native cross-compiler in a second.
> 
> I was under the impression that building GCC for the Linux/SGI target
> was non-trivial.  Ralf made mention of some patches, and since there
> are binaries available for Solaris...
> 
> If GCC can support it with a --target choice, that'll be great.

(I think you're confusing host and target.  If you want IRIX to generate
code for Linux the IRIX is the host and Linux the target os).

GCC does that as well as the binutils.  Truely pervert people can even
build GCC / binutils on a host of type a to run on type b and generate
code for type c.  I did that once or twice to build the first native
compiler for Linux/MIPS.

Try something like:

  ./configure --prefix=/usr --target=mips-linux

to configure binutils and GCC.

  Ralf
