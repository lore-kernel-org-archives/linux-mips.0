Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199708091741.TAA09294@informatik.uni-koblenz.de>
Subject: Re: your mail
Date: Sat, 9 Aug 1997 19:41:39 +0200 (MET DST)
In-Reply-To: <Pine.LNX.3.95.970809175116.19882B-100000@odin.waw.com> from "Vincent Renardias" at Aug 9, 97 06:16:02 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Vincent Renardias <vincent@waw.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970809174139.QxJ9L4M9RnNGzv8z2f0_gazUVnm2mIIu8K1c9fP_qd8@z>

> 	I've just joined this ML, and I'm trying to contribute to the
> Linux/SGI development. Since I'm not too good at kernel hacking, I've
> tough about working on porting the userland part (I have some experience
> with this part since I've been a Debian developper for a while and
> initiated the Debian/PowerPC port).
> 	By now I don't have access to any SGI hardware, but i've been able
> to build some packages with the crossdev (i486-linux) packages from
> ftp.linux.sgi.com.
> 
> 	So here are my questions:
> 
> 1/ Which are the 'most wanted' packages not yet recompiled/ported to
> Linux/SGI? I've looked at the RPMs available RPM list, and some important
> packages seem unavailable yet. (sed,tar,perl come to mind).

sed, tar: confilicting declaration in source and libc.  Both work other-
wise.  Perl: builds shrink wrapped & works, just the binary packaging
with RPM fails.  I think because groff/man are missing.  I've got another
two dozen packages on disk which I'll upload when I next pass by in
Mountain View ...

> 2/ While using the crossdev gcc, several times I got complains about a
> file 'sgidefs.h' missing (from
> /usr/local/lib/gcc-lib/mips-linux/2.7.2/include/va-mips.h, line 41). 
> Commenting the '#include' file made the compile work, but I not sure it's
> the right fix. 

Not the right thing, but won't hurt.  I shows that your libc is
not installed correctly.

> 3/ Can any1 confirm/correct the following values for GNU/autoconf:

> ac_cv_c_bigendian=no

MIPS CPUs can be configured for both byte orders.  SGI, Mips Inc.,
Sony machines are wired big endian, most other machines are little
endian or configurable by replacing the firmware.  As a consequence
we have to build all packages twice, once for each byte sex.
mips-linux-* tools are big endian by default, mipsel-linux-* tools
little endian.

> ac_cv_c_char_unsigned=no

True by default, unless you give -funsigned-char.

> ac_cv_sizeof_long=4
> ac_cv_sizeof_int=4

True by default in the mips{el}-linux configurations; the size of
these types can be changed by -mlong64 and -mint64.  These options
are incompatible with libc, so I mention them only for completeness.

  Ralf
