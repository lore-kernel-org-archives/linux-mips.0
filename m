Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@Julia.DE>
Message-ID: <199706132152.XAA04791@kernel.panic.julia.de>
Subject: Re: Userland loader / run time loader
Date: Fri, 13 Jun 1997 23:52:05 +0200 (MET DST)
In-Reply-To: <199706132102.OAA18708@neteng.engr.sgi.com> from "Larry McVoy" at Jun 13, 97 02:02:24 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Larry McVoy <lm@neteng.engr.sgi.com>
Cc: ralf@mailhost.uni-koblenz.de, shaver@neon.ingenia.ca, linux@cthulhu.engr.sgi.com
Message-ID: <19970613215205.gSfzntgVJNTmuHySLqvxjrASR-Id7gBWaQt3UmiHaXI@z>

> Can someone give me some info on what has been done or needs to be done to
> have a 100% self hosting Linux development suite on MIPS?  Last I checked,
> it was missing the loader & rld.  Is that still true?  If so, do we know
> why it is hard?  I have someone that may be willing to fix this if it is
> still a problem.  Thanks.

The development suite is fully useable for bootstrapping itself.  Check
the little endian rpm packages on my workstation kernel.panic.julia.de;
they all were built from unchanged RedHat 4.1 source packages and use
shared libraries.

Aside of a possibility to load the kernel from an ext2fs filesystem the
most urgent thing we need currently is debugging, debugging ...

Things look different if we're talking about 64bit.  Last time I checked
with the Kazumoto Koshima who did a 64bit Hurd port to Sony NeWS the
64bit linker was still not what I'd call reliable ...

  Ralf
