Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <199608122052.NAA08696@ratliff.engr.sgi.com>
Subject: Re: Linux: the next step 
In-reply-to: Your message of "Mon, 12 Aug 96 13:32:01 PDT."
             <199608122032.NAA17431@refugee.engr.sgi.com>
Date: Mon, 12 Aug 96 13:52:47 -0700
From: Bob English <renglish@ratliff.engr.sgi.com>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Steve Alexander <sca@refugee.engr.sgi.com>
Cc: Larry McVoy <lm@gate1-neteng.engr.sgi.com>, Nigel Gamble <nigel@cthulhu.engr.sgi.com>, Alistair Lambie <alambie@wellington.sgi.com>, ariel@cthulhu.engr.sgi.com, linux@yon.engr.sgi.com
Message-ID: <19960812205247.gXg4YkYovvJAZtUctSsjcQA8y3KIr_YDvswx-BOXjIc@z>

>lm@gate1-neteng (Larry McVoy) writes:
>The fine grained locking is a lose.  It costs us way too much and what I
>am seeing is a trend backwards towards coarser grained locking...

In message <199608122032.NAA17431@refugee.engr.sgi.com> you write:
>I'd like to see some hard numbers for these assertions.  All of the bottlenecks
>in ficus (that I am aware of) have to do with context-switching due to use of
>mutexes rather than spinlocks.  The locking overhead itself isn't even on the
>map as far as I can tell.

If you look at larry's context switch and pipe benchmarks, you'll see
that they run much faster on a single CPU than on two or more.  A lot of
the difference is due to fine-grained locking, which causes more dirty
cache lines to thrash than is actually necessary for the operations
involved.  Pipe communication takes locks at the vnode and inode
level.  Context switches take locks on threads, accounting structures,
and queues.

It all adds up.

>If it makes no difference, what difference does it make what platform you try
>it on?  If it does make a difference, you would be able to measure it despite
>the underlying bloat, and again the underlying platform makes no difference.

Back to the previous discussion.  Getting rid of any one of those locks
wouldn't make much difference.  Getting rid of all of them would, but is
a much taller order.

--bob--
