From: "Mike Klar" <mfklar@ponymail.com>
Subject: RE: userspace spinlocks
Date: Wed, 1 Nov 2000 08:40:30 -0800
Message-ID: <NDBBIDGAOKMNJNDAHDDMKECHCNAA.mfklar@ponymail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20001101143611.B7375@bacchus.dhis.org>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20001101164030.VXxsb1SQ7Na0InzEXd8suIkz4RZp1Ghcm9aMlleE_7k@z>

Ralf Baechle wrote:

> Ok, I'll take this and try to hack it into shape.  I especially don't
> like putting anything into the scheduler - another 5 ns for a 200MHz box
> per cotext switch go down the drain.

I agree that's pretty nasty, but I don't see any other way to break the link
on context switches that doesn't also add the same overhead (if not more).
The worst part of it is the extra store per context switch happens even if
you don't ever use ll/sc.

You could probably implement locking primitives without it, but then you're
getting away from actually emulating ll and sc.  I guess that's not a big
deal, since we're already not emulating them 100%, but the further you get
from the actual functionality of the instructions, the more likely it is to
break some user space code when someone decides to be "clever" with ll/sc by
using them per the hardware ll/sc specification.

Then again, I'm just ranting here, since the clear-it-in-the-resume-function
approach apparently wasn't doing what it should have 100% anyway.

> For sanity reasons I also think we
> don't want to support SMP for the ll/sc emulation.

I agree.  It's not impossible to do, but very much non-trivial, for
something that will probably never be used anyway.  The embedded R4K CPUs
that I've seen without ll/sc give lack of SMP support as the reason for not
implementing ll/sc.  Sigh... as if uniprocessor systems never need locking
primitives....

Mike K.
