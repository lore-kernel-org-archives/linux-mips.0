Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199708060925.LAA11554@informatik.uni-koblenz.de>
Subject: Re: indyIRQ.S
Date: Wed, 6 Aug 1997 11:25:54 +0200 (MET DST)
In-Reply-To: <199708052111.XAA01741@alpha.franken.de> from "Thomas Bogendoerfer" at Aug 5, 97 11:11:49 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: shaver@neon.ingenia.ca, linux@cthulhu.engr.sgi.com
Message-ID: <19970806092554.vUvPGDhbYei8hkQPB9uOUZmjJWHDJuCPLdJXojsdcvA@z>

> > mips-linux-gcc -D__KERNEL__ -I/export/sgi-linux/kernel/linux/include -D__GOGOGO__ -c indyIRQ.S -o indyIRQ.o
> > indyIRQ.S: Assembler messages:
> > indyIRQ.S:72: Warning: No .cprestore pseudo-op used in PIC code
> > [...] 
> > Any ideas?
> 
> yes, add a -fno-pic to your CFLAGS. The default for the current mips-linux-gcc
> is to produce PIC code and most of the .S files aren't prepared to be compiled
> this way.

None will compile not will the linker accept mixtures of PIC and non-PIC
object files.  I suppose the cause is didling with the makefiles since
-G 0 -mno-abicalls -fno-pic is default for MIPS.

  Ralf
