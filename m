Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <199807160723.JAA29043@aisa.fi.muni.cz>
Subject: Re: The pre-release of Hard Hat Linux for SGI...
In-Reply-To: <Pine.LNX.3.95.980715180435.22020I-100000@lager.engsoc.carleton.ca> from Alex deVries at "Jul 15, 98 06:13:15 pm"
Date: Thu, 16 Jul 1998 09:23:37 +0200 (MET DST)
From: Honza Pazdziora <adelton@informatics.muni.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: adelton@informatics.muni.cz, linux@cthulhu.engr.sgi.com
Message-ID: <19980716072337.w5XmqCYBNhdkg2SAs9FK6UDvhR4c1hYlUqTTC4qFRZY@z>

> 
> > About 3 packages before end, the install failed with Out of memory,
> > Install exited abnormally, messages about signal, etc.
> 
> That's a problem.  How much memory do you have?

32 MB.

> > So I rebooted and tried just with networked WS and development, this
> > failed in about 60 % with Install exited abnormally.
> 
> What package was installing at the time the install broke?

ncurses4, I believe.

> > The third attempt I did was only 126 packages of base and networked
> > WS, this finished fine.
> 
> Good.
> 
> > After booting the new kernel, I get Unable to open an initial console.
> 
> Did you pass a root= variable to the kernel when booting?  You should
> normally have to do something like:
> 
> boot vmlinux root=/dev/sdb1

Yes, sure. I do $linux ;-)

> Does the kernel see the partitions on your disk?

Yes, upto there everything is fine. The Unable to open an initial
console message comes after the message about freeing kernel memory
-- 44kB. The system however seems to be doing something after that
-- at least accoring to the sound of the disk. It works and then it
goes silent. When I boot init=/bin/bash, I again get the Unable to
open an initial console message and then nothing, but the while
before the disk goes silent is shorter. So I assume the prompt is
somewhere out there.

Interesting thing (for me, anyway ;-): when I tried to boot the old
kernel (RH 5.1 A 1, 2.1.99), I got the same message about initial
console. So there must be something wrong on the root filesystem.

During the isntallation, I was not able to run a single process (like
mount or cat, all end with Segmentation fault). When I booted to
Upgrade, I was able to work with the /mnt filesystem just fine. I
thought the initial console could be caused by a missing /etc/inittab
but it's there. What could be the case? The upgrade fails with signal
8 when it should start installing the first selected package, but
before that I can work rather well (just tried ls, cat, mount) with
the filesystem, so I could fix the initial console problem, if I knew
how ;-)

------------------------------------------------------------------------
 Honza Pazdziora | adelton@fi.muni.cz | http://www.fi.muni.cz/~adelton/
                   I can take or leave it if I please
------------------------------------------------------------------------
