Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199708060942.LAA13489@informatik.uni-koblenz.de>
Subject: Re: Kernel instructions...
Date: Wed, 6 Aug 1997 11:42:02 +0200 (MET DST)
In-Reply-To: <9708050920.ZM6923@ratbert.daic.dsai.com> from "Mark Schaefer" at Aug 5, 97 09:20:19 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mark Schaefer <schaefer@dsai.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970806094202.SVkjcFLpvw_E-5Sqrd35XyDlz8TA_WwRHHL7mOsRz90@z>

> 	Are there any further instructions on how to install the Linux kernel
> after it's been compiled?  I know IRIX will automatically install unix.new on
> bootup, is there some method like that to use?  Is there a reason MILO is
> included on the ftp site?

The way the kernel needs to be installed depends from the particular
machine.  On the little endian machines we use a two stage boot process,
the kernel loads Milo, then Milo load the kernel possibly other files,
then runs it.  You might also need something like Milo because your old
M120's firmware expects (at least I believe that ...) ECOFF exectuables,
while the kernel is being built as an ELF executable.  Milo won't work
on the M120 firmware, though because it has a different firmware, but
this shouldn't be tooo hard to fix.

Maybe one of the SGI or ex-Mips people on this list knows more about that
firmware.  Is it similar or identical to pre-ARC SGI firmware as I suppose?

  Ralf
