Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@Julia.DE>
Message-ID: <199704111311.PAA01052@kernel.panic.julia.de>
Subject: Re: More on the serial strangeness
Date: Fri, 11 Apr 1997 15:11:52 +0200 (MET DST)
In-Reply-To: <199704090858.EAA08923@neon.ingenia.ca> from "Mike Shaver" at Apr 9, 97 04:58:17 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@neon.ingenia.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970411131152.1EkenFaNKvrYkGuGrdWDdYSTsy6UBrcLJ_-Z7vmHEjg@z>

Hi,

> Received: from sgi.sgi.com (SGI.COM [192.48.153.1])
>         by alles.intern.julia.de (8.8.5/8.8.5) with SMTP id KAA19302
>         for <ralf@Julia.DE>; Fri, 11 Apr 1997 10:51:21 +0200
[...]
>Date: Wed, 9 Apr 1997 04:58:17 -0400 (EDT)

Two days for that mail?

> - If I try to access /dev/console or /dev/tty[1234], I get "can't
> create /dev/whatever: Error 19", which seems to be "no such device".

Btw, Linux/MIPS errno values are (almost) the same as IRIX.

> If someone with the appropriate tools could build me a static tail
> binary, it'll make the experimentation go a fair bit faster.

This is the fun part.  You probably need to cheat to make textutils'
autoconf work for crosscompilation.  It's usually ok to run configure on
a Linux/Intel system (Using a glibc system is a good idea) and then
crosscompile with a command like

  make CC=mips-linux-gcc CFLAGS="-O2 -pipe" LDFLAGS="-static -s"

Autoconf is *nice* in almost all cases but it's often a bitch when
crosscompiling, so feel free to use every dirty trick in the book ...

> (If it'll help, I can set Miguel and Ralf up with appropriate access
> on neon so they can experiment.  It'll take a few days, but if it
> keeps those precious geek-cycle from going to waste...)

Thanks, would be useful.

  Ralf
