From: "William J. Earl" <wje@cthulhu.engr.sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <14504.31299.82555.477086@liveoak.engr.sgi.com>
Date: Mon, 14 Feb 2000 13:57:23 -0800 (PST)
Subject: Re: Indy crashes
In-Reply-To: <022301bf7730$92b87180$0ceca8c0@satanas.mips.com>
References: <022301bf7730$92b87180$0ceca8c0@satanas.mips.com>
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: "Kevin D. Kissell" <kevink@mips.com>
Cc: geert@linux-m68k.org, Ralf Baechle <ralf@oss.sgi.com>, linux@cthulhu.engr.sgi.com, linux-mips@fnet.fr, linux-mips@vger.rutgers.edu
Message-ID: <20000214215723.xfPzQEpkr52osM9oq-ARcQLf9Ya8nIauuga0q9zsbGg@z>

Kevin D. Kissell writes:
...
 > However, I have not had the opportunity to test this code on
 > an R5000SC platform.   Looking at the R5000 spec, it is a
 > little ambiguous.  The special case of sc HWIs affecting
 > the primary isn't there, but then again sc HWIs aren't even
 > called out in the table of defined cache operations.  Indeed,
 > one *could* interpret the spec to mean that HWI on the 
 > *primary* flushes the secondary, the reverse of the R4000,
 > but it's by no means clear.   Thus I suggest hitting 'em both.
 > 
 > Does anybody on this list have an R527x manual?   How
 > is HWI of the primary/seconday caches defined there?

      I am very familiar with how the R5000 and similar processors
works.  The secondary cache is essentially independent of the primary
caches, and is write-through.  It hangs on the SysAD bus and captures
cache lines being read, and returns a captured cache line on a later
read.

     You must separately invalidate the primary and secondary caches.
If you care about instruction cache coherency (as when reading in executable
pages), you have to invalidate the primary instruction cache, not just
the primary data cache.

     Since the secondary cache is write-through, you need only invalidate
it on reads; you can ignore it on writes.
