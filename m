Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <19971128161036.24017@thoma.uni-koblenz.de>
Date: Fri, 28 Nov 1997 16:10:36 +0100
From: Ralf Baechle <ralf@uni-koblenz.de>
Subject: Re: Bintuils
References: <19971128145410.36065@thoma.uni-koblenz.de> <m0xbRqY-0005FvC@lightning.swansea.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <m0xbRqY-0005FvC@lightning.swansea.linux.org.uk>; from Alan Cox on Fri, Nov 28, 1997 at 02:56:45PM +0000
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Ralf Baechle <ralf@mailhost.uni-koblenz.de>ralf@mailhost.uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19971128151036.ScukAcP7Oi_kTup89f2OMQQ5dkXe_B_sUjMBeXWNg7c@z>

On Fri, Nov 28, 1997 at 02:56:45PM +0000, Alan Cox wrote:
> >   - manually rebuild binutils 2.8.1 + patch.  When configuring binutils
> >     2.8.1 do not use the --enable-shared option, it will make binutils
> >     2.7 generate bad libraries.
> 
> Done that. I get a static and apparently workable binutils if I also turn
> gcc optimisation off (otherwise gcc dumps)
> 
> >   - install the binutils just built
> 
> Done that
> 
> >   - You should now be able to rebuild the rpm without problems
> 
> gcc still dumps, if I fix that I get back to the original problem. This
> is the 2.8.1 off sgi.com and has a "mips patch" listed in the spec file.
> 
> Im guessing the gcc one is a link bug that damaged gcc just slightly - zsh
> also dumps gcc.

In that case you are probably the victim of an older libc.  I'll rebuild
libc for my sources for big endian machines asap.

  Ralf
