Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199705272037.WAA12797@informatik.uni-koblenz.de>
Subject: Re: strace/truss equiv?
Date: Tue, 27 May 1997 22:37:11 +0200 (MET DST)
In-Reply-To: <199705271919.PAA21206@neon.ingenia.ca> from "Mike Shaver" at May 27, 97 03:19:29 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@neon.ingenia.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970527203711.WYpWoSwu0LTAc5lhbC9oT-mEWHO3tkToVLRIFySfVvo@z>

> OK, I'll bite.
> What's the strace/truss equivalent under IRIX?
> 
> I'm trying to figure out why my "dynamically-linked" hello world
> binaries are 115K, and I can't tell where the heck the linker is
> finding the static libs.

The GNU linker has a verbose option which will make it print all the
files as it tries to open them.  Check the docs.  You should have

<prefix>/mips-linux/lib/libc.so             (A linker script)
<prefix>/mips-linux/lib/libc.so.6           (A symlink to the acutal shlib)
<prefix>/mips-linux/lib/libc-<version>.so   (The actual shared library image)
<prefix>/mips-linux/lib/libc.a              (The static libc)

Note that libc.so is an ASCII file containing a short linker script
unlike Linux libc.

Does that help?

  Ralf
