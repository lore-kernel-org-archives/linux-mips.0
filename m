Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199705300847.KAA25091@informatik.uni-koblenz.de>
Subject: Re: userland cometh
Date: Fri, 30 May 1997 10:47:18 +0200 (MET DST)
In-Reply-To: <199705300548.BAA09588@neon.ingenia.ca> from "Mike Shaver" at May 30, 97 01:48:34 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@neon.ingenia.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970530084718.asRAW0F2eUU9quML-IPo7jgDivTs8iC4ccr_lM3lqBI@z>

Hi,

> OK, I think I've got this cross-compiling thing licked.
> 
> Modulo some bogus interactions between the mostly-hacked 2.1.36 kernel
> headers and the glibc 2.0.1 stuff (which seems to be a bit off itself,
> but that's for another day), userland is coming along nicely.
> 
> I've been rebuilding with the glibc-2.0.1 stuff and all-dynamic
> linking, and I've got:
> fileutils-3.16
> tar-1.12
> sh-utils-1.16
> textutils-1.22
> ncurses_1.9.9g (just the libncurses.a, ma'am)
> net-tools' inetd, arp, ifconfig, rarp, route and telnetd
> 
> I can't get ping or bash to work build just yet (ping was _not_ happy with
> my headers), but I'll keep at it.
> 
> Once I'm done here, I'll be making a new root.tar.gz for anyone who
> wants to play around with it.

Take a look at the little endian RPM packages I've published on
kernel.panic.julia.de.  All these packages were build from the vanilla
SRPM packages on the RedHat 4.1 package.

I'd like to keep the number of .tar packages as low as possible; the
root.tar.gz package has proven not to be very updateable.

  Ralf
