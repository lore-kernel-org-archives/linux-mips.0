Date: Fri, 9 May 2003 22:44:13 -0700 (PDT)
From: Muthukumar Ratty <muthu@iqmail.net>
Subject: Re: Linux for MIPS Atlas 4Kc board
In-Reply-To: <BAY1-F45jlKqwWil63h0000a6fd@hotmail.com>
Message-ID: <Pine.LNX.4.33.0305092241080.12630-100000@Muruga.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <muthu@iqmail.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Michael Anburaj <michaelanburaj@hotmail.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20030510054413.xbiF4TDJDYSlLHx3CRSxiMYRuFVOtnFW8BOKL7j3RJc@z>

> Warning: unable to open an initial console.
> Kernel panic: No init found.  Try passing init= option to kernel.
>


do you have init in /export/.../sbin Probably exporting wrong
directory?

>
> in src/linux/init/main.c
>
> open("/dev/console", O_RDWR, 0) is returning a negative value. I don't have
> a video device on board., required? Will /dev/console open a UART port
> (/dev/ttyS0 or /dev/tty0)? Why am I getting this error?
>
> 1. Is the kernel not build properly (did not include console driver)?
> 2. Should I pass init=blablabla as a parameter? <but nothing like that is
> specified in the doc.>.
>
> Advice me please...
>
> Thanks,
>
> -Mike.
>
> _________________________________________________________________
> MSN 8 with e-mail virus protection service: 2 months FREE*
> http://join.msn.com/?page=features/virus
>
>
