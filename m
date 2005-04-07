From: "Michael Uhler" <uhler@mips.com>
Subject: RE: memcpy prefetch
Date: Thu, 7 Apr 2005 05:25:15 -0700
Message-ID: <003901c53b6c$da8938e0$cf14a8c0@MIPS.COM>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
In-Reply-To: <4255240E.4050701@timesys.com>
Return-Path: <uhler@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Greg Weeks' <greg.weeks@timesys.com>, 'Ralf Baechle' <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20050407122515.8JawiMYYo8xzqpUywNp3qahn6ebz0887gkaIVXB3Cuk@z>

> What's the performance hit for doing a pref on a cache line that is 
> already pref'd? Does it turn into a nop, or do we get some horrible 
> degenerate case? Are 64 bit processors always at least 32 byte cache 
> line size? I don't really expect anyone to know the answers 
> right now. I 
> expect I'll need to time code to tell. This makes generating 
> them at run 
> time look better and better.

As very general rules of thumb:

- A pref to a line which is already in the cache take a cycle in the
load/store unit and does not go back out to the memory subsystem.  There are
some possible ships-passing-in-the-night scenarios, but most processors do
what you'd expect.

- Most 64-bit processors are built for high-end applications, and most
high-end processors most likely have at least 32-bit lines.  One usually has
smaller line sizes when the processor is intended for lower-end
applications, or where the memory subsystem isn't all that good.

/gmu

---
Michael Uhler, Chief Technology Officer
MIPS Technologies, Inc.   Email: uhler at mips.com
1225 Charleston Road
Mountain View, CA 94043
