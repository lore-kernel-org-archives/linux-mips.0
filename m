Date: Tue, 15 Feb 2000 01:37:39 +0100
From: Ralf Baechle <ralf@oss.sgi.com>
Subject: Re: Indy crashes
Message-ID: <20000215013739.E828@uni-koblenz.de>
References: <022301bf7730$92b87180$0ceca8c0@satanas.mips.com> <14504.31299.82555.477086@liveoak.engr.sgi.com> <200002142345.XAA00626@gladsmuir.algor.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200002142345.XAA00626@gladsmuir.algor.co.uk>
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Dominic Sweetman <dom@algor.co.uk>
Cc: "William J. Earl" <wje@cthulhu.engr.sgi.com>, "Kevin D. Kissell" <kevink@mips.com>, geert@linux-m68k.org, Ralf Baechle <ralf@oss.sgi.com>, linux@cthulhu.engr.sgi.com, linux-mips@fnet.fr, linux-mips@vger.rutgers.edu
Message-ID: <20000215003739.CA3TllJqOKn2NR030K_Ra7MBuQEM03cBZAcFvLsjyI8@z>

On Mon, Feb 14, 2000 at 11:45:06PM +0000, Dominic Sweetman wrote:

> QED's RM7000 has an internal secondary cache which is more like (but
> not compatible with) an R4000.  As part of our Linux familiarisation
> we'll try to get that working.  It's 4-way set associative, 256Kbytes
> big, unified and write-back; so that should shake out some more bugs.

[...]

> I used to be an advocate of the MIPS position; but what this argument
> ignores is the difficulty of maintaining a portable software base,
> particulary an OS which (like Linux) has grown up with invisible x86
> caches.
> 
> To make sure that Linux/MIPS kernels are and remain robust we have to
> convince lots of people to take the trouble to learn about visible
> caches - even though the systems they're working on don't have them.
> And we have to hope that driver writers will do the right thing, even
> though they've never used a system which needs cache management code
> and have none at hand to test their drivers with...
> 
> This would be unlikely even if we all agreed what the word 'flush'
> meant (does it mean "invalidate"?  or "write-back"?  or perhaps "both,
> if necessary"? and can you build a robust OS without knowing the
> answer?)

Yes.

> It *could* happen.  MIPS are not the only family of CPUs with visible
> caches - though I think they probably have by far the most complicated
> ones, because of their high-end history.

Sparc.

> The meeting of Linux and MIPS is in this respect really good for Linux
> - great at finding portability problems.  But it's not particularly
> good for MIPS.  For now, Linux/MIPS kernels will only be reliable if
> maintained by people who understand this stuff, keep a safe distance
> from the x86 mainstream, and use only sanity-checked drivers.

No longer.  With Linux 2.3.41 Linux received a number of new software
interfaces which also could easily be backported to previous kernels.
As the side effect you even get scatter gather capabilities for every
driver.

Btw, please take a look at the new interfaces, they're documented in
Documentation/DMA-mapping.txt.  They're not yet cast into stone, so if
anybody has something to complain about these interfaces, better do it
soon.

> Kevin, I think you'd better tell your colleagues who design the chips
> that they'd better put some snooping in, and soon...

For I/O isn't not that bad to handle except a few cases like the
NCR 53c8xx driver.  And there is always the silver bullet solution of
using uncached accesses.

Things like mmap() and read/write right in the presence of virtual indexed
caches are the real vomit bag.  Linus & Co. so far refuse to accept any of
the optimal solutions.  And while I'd of course would like to such a
solution to get into the kernel I can well understand Linus' refusal.
From that point of view the RM7000 is the first MIPS CPU that got caches
right since the R6000 ...

  Ralf
