Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <199608122032.NAA17431@refugee.engr.sgi.com>
Subject: Re: Linux: the next step 
In-reply-to: Message from lm@gate1-neteng of 2 Aug 1996 18:11:31 PDT
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 12 Aug 1996 13:32:01 -0700
From: Steve Alexander <sca@refugee.engr.sgi.com>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Larry McVoy <lm@gate1-neteng.engr.sgi.com>
Cc: Nigel Gamble <nigel@cthulhu.engr.sgi.com>, Alistair Lambie <alambie@wellington.sgi.com>, ariel@cthulhu.engr.sgi.com, linux@yon.engr.sgi.com
Message-ID: <19960812203201._Fz9cHLbL9IYKlcpDBFHKTLYVwuwpLk4RRgzL6ticSA@z>

lm@gate1-neteng (Larry McVoy) writes:
>The fine grained locking is a lose.  It costs us way too much and what I
>am seeing is a trend backwards towards coarser grained locking.  If this
>wasn't true, why did we build lego?  Why are we building Nexus?

I'd like to see some hard numbers for these assertions.  All of the bottlenecks
in ficus (that I am aware of) have to do with context-switching due to use of
mutexes rather than spinlocks.  The locking overhead itself isn't even on the
map as far as I can tell.

However, I agree that more locking is not the answer.  Eliminating as much
shared, global data as possible is the answer.  Nexus doesn't really do
anything towards that end that I can see.

>Linux already has a RT kernel.  I just reviewed a fantastic Usenix paper
>that added RT to Linux - fully preemptable, hard real time to < 100 usecs,
>and less than 3K lines of code change.  Their test case was a 100Khz clock
>pulse on a parallel port; they got it every time, with less than 15usecs
>skew, while the system was tar-ing one file system to another, running 
>netscape, and generally doing same old Unix stuff just like normal.  It's
>really impressive and very uninvasive.

I'd like to see that when it comes out.

>Finally, think about this:  how many times have you had a "great idea"
>for better IRIX performance, gone off an prototyped it, only to find
>that it makes no difference?  Linux lets you test out those ideas and
>see the real performance difference, unadulterated by any surrounding
>bloat.  That's cool.  We want that.

If it makes no difference, what difference does it make what platform you try
it on?  If it does make a difference, you would be able to measure it despite
the underlying bloat, and again the underlying platform makes no difference.

I'm in favor of some amount of Linux work on SGI gear, but this is a pretty
weak argument.

-- Steve
