From: "William J. Earl" <wje@cthulhu.engr.sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <14452.58782.750095.352886@liveoak.engr.sgi.com>
Date: Thu, 6 Jan 2000 10:57:34 -0800 (PST)
Subject: Re: Decstation 5000/150 2.3.21 Boot successs
In-Reply-To: <000601bf5826$273af500$0ceca8c0@satanas.mips.com>
References: <000601bf5826$273af500$0ceca8c0@satanas.mips.com>
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: "Kevin D. Kissell" <kevink@mips.com>
Cc: Florian Lohoff <flo@rfc822.org>, linux@cthulhu.engr.sgi.com
Message-ID: <20000106185734.M_XJOXn4y2GHH_4Fd6iYiAmowIbAWAr3GsIlyN_TWOA@z>

Kevin D. Kissell writes:
...
 > The default SGI/MIPS Linux kernel startup sets the
 > "FR" bit in the CP0.Status register, which enables
 > R4000-style FPU registers, which is to say a full
 > compliment of 32 double-precision registers.  This
 > has the side-effect of making the kernel incompatible
 > with the distributed mipsel binaries and the distributed
 > DECstation root file system, since those binaries which
 > do double-precision floating point load their initial values
 > from memory as two singles.  That works on an R3000
 > or an R4000-with-FR=0, but not on an R4000-with-FR=1.
...

     Note that the SVR4 MIPS ABI assumes FR=0 (R3000-compatible), as
do SGI IRIX "-32" ("O32") binaries (and, I believe, default gcc
binaries).  SGI IRIX "-n32" and "-n64" binaries assumes FR=1 (R4000-compatible),
and also have a somewhat different register calling convention (which
affects where arguments to system calls reside).
