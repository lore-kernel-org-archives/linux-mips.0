Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Fri, 30 May 1997 13:03:53 -0700
Message-ID: <199705302003.NAA04356@fir.engr.sgi.com>
From: "William J. Earl" <wje@fir.engr.sgi.com>
Subject: Re: ah...
In-Reply-To: <199705301804.UAA18639@informatik.uni-koblenz.de>
References: <199705301743.NAA20046@neon.ingenia.ca>
	<199705301804.UAA18639@informatik.uni-koblenz.de>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Cc: Mike Shaver <shaver@neon.ingenia.ca>, linux@cthulhu.engr.sgi.com
Message-ID: <19970530200353.Wz52OpW7od6eGmyr4gaRkVFnEQ7WPBHPZ8gWKnrwr4U@z>

Ralf Baechle writes:
 > > Thus spake Ralf Baechle:
 > > > Hurz...  Looks like you either you disabled TCI/IP networking or libc
 > > > and the kernel use different constants for the arguments of socket(2).
 > > 
 > > I've added some more verbosity, and the constants are AF_INET=2,
 > > SOCK_STREAM=2, IPPROTO_TCP=6.
 > > 
 > > TCP is correct, but SOCK_STREAM in my kernel headers is 1, SOCK_DGRAM being
 > > 2.  That'd explain the UDP thing, anyway.
 > 
 > One of the fun things with SGI...  Long time ago checked two SGI machines
 > running different OS versions for reference.  In one of them the values
 > for SOCK_STREAM and SOCK_DGRAM are swapped compared to the other.  I wonder
 > why.  But anyway, at that time I choose to clone the constants from the
 > newer one.
...

      The change was for SVR4 compatibility.  The older numbering (STREAM==1,
DGRAM==2) was the BSD variation; the newer numbering is derived from the TPI
(Transport Provider Interface) constants.  RISC/os had the same thing, except
it supported both (-systype bsd43 for the BSD headers and libraries,
-systype svr4 for the SVR4 headers and libraries).  (The number conflict
was resolved in the system calls, depending on the type of the executable.)
