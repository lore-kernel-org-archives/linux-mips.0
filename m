Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <199608122120.OAA18080@refugee.engr.sgi.com>
Subject: Re: Linux: the next step 
In-reply-to: Message from lm@gate1-neteng of 12 Aug 1996 14:09:39 PDT
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 12 Aug 1996 14:20:39 -0700
From: Steve Alexander <sca@refugee.engr.sgi.com>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Larry McVoy <lm@gate1-neteng.engr.sgi.com>
Cc: lm@neteng.engr.sgi.com, Nigel Gamble <nigel@cthulhu.engr.sgi.com>, Alistair Lambie <alambie@wellington.sgi.com>, ariel@cthulhu.engr.sgi.com, linux@yon.engr.sgi.com
Message-ID: <19960812212039.c769l5TYMc9qsKBuR_RKDS80QC6n7gsVb8bAAN-XuQE@z>

lm@gate1-neteng (Larry McVoy) writes:
>You'll have to borrow my copy, Usenix rejected it.  Fuckheads.

No doubt to make room for some paper on TCL scripts or something.  Feh.
Yeah, if you can make me a copy or convince the authors to send me one I'd
appreciate it.

>A more concrete example: IRIX syscall entry is something like 15-30 usecs,
>if I remember correctly.  On Linux, it's about .5 - 5 usecs.  In the
>Linux world, optimizations that made a 100% difference would be lost in
>the bloat in IRIX.  Does that mean that those optimizations are pointless?

To some degree, yes.  This is why application developers often have a lot of
platform-specific code; optimizations that work on one system won't necessarily
work on all systems.  I'm not saying this is good, mind you.

-- Steve
