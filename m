Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199705301438.QAA18776@informatik.uni-koblenz.de>
Subject: Re: userland cometh
Date: Fri, 30 May 1997 16:38:49 +0200 (MET DST)
In-Reply-To: <199705301346.JAA12694@neon.ingenia.ca> from "Mike Shaver" at May 30, 97 09:46:33 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@neon.ingenia.ca>
Cc: ralf@mailhost.uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19970530143849.fwu6rriZQMX6FJlR7MRw6vjfZOEfHNEcnBYlFDqNlEk@z>

Hi,

> Thus spake Ralf Baechle:
> > Take a look at the little endian RPM packages I've published on
> > kernel.panic.julia.de.  All these packages were build from the vanilla
> > SRPM packages on the RedHat 4.1 package.
> 
> Yeah, yeah... =)
> 
> Once I get a natively-hosted compiler working, I'll be cranking out
> RPMs[*].  In the meantime, convincing some of those packages to
> cross-compile is pretty interesting.  Lots of post-./configure
> Makefile munging with perl and the like.

Urgs...  Easier solution - in most cases running configure on a Intel
or even better Sparc Linux machine does the right thing.  Or even
better - you can save the generated config.cache files and feed them
into future runs of autoconf generated configure scripts.  I used these
two techniques to get my MIPS stuff crosscompiled.

  Ralf
