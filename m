Message-ID: <000f01c2bdfb$e2cb7220$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20030117012644.GA2058@wumpus.internal.keyresearch.com>
Subject: Re: Anyone running crashme?
Date: Fri, 17 Jan 2003 08:41:43 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Greg Lindahl <lindahl@keyresearch.com>, linux-mips@linux-mips.org
Message-ID: <20030117074143.Kva4NoxidVN4omV8rLIFK-mzBGcjEPJjLxKNT3ctLEQ@z>

Actiually, we've been using crashme at MIPS
for several years now, both to torture the Linux 
kernel and to push our chip designs into unexpected 
corner cases.  We found a fair number of kernel
bugs, and fixed them in our internal sources
(snapshots are generally available under
ftp://ftp.mips.com/pub/linux/mips/kernel )
and have pushed our fixes out toward the
mainline distributions.  That's not to say that
they all get there.

Two things to watch out for: There is a class
of crashme misbehavior, usually manifest in
forked threads that do not terminate correctly
until the program is shut down, that arises not
from a kernel bug, but from a libc built with
downrev kernel headers.  And if you have a
CPU that supports EJTAG, you either need to
make sure that your boot ROM has code at the
EJTAG debug exception vector that jumps to the
EJTAG kseg0 pseudo-vector used by the Linux
kernel (well, *our* Linux kernel anyway ;-), 
or you need to put a filter in crashme to ensure 
that it does not generate EJTAG debug breakpoint 
instructions.

But I'm glad to see that someone else is using it.

----- Original Message ----- 
From: "Greg Lindahl" <lindahl@keyresearch.com>
To: <linux-mips@linux-mips.org>
Sent: Friday, January 17, 2003 2:26 AM
Subject: Anyone running crashme?


> I've been running crashme a little against Linux mips, and from the
> bugs I immediately found I suspect that no one's been running it.
> Crashme generates random bytes and then executes them, catching the
> resulting signals and generating more random bytes. The random number
> seed is provided by the user, so that problems are repeatable.
> 
> If you like debugging, you can find the source at:
> 
> http://people.delphiforums.com/gjc/crashme.html
> 
> -- greg
> 
> 
> 
> 
> 
> 
