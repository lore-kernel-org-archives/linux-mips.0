Message-ID: <001001bfb074$22311480$0957d3d4@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: VC exceptions
Date: Thu, 27 Apr 2000 20:12:14 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Florian Lohoff <flo@rfc822.org>, linux@cthulhu.engr.sgi.com
Message-ID: <20000427181214.pXkbLj7Oo-KFCk24u_ZerxWfxnY0RjzxysOsXQPopdE@z>

It's a thing that can happen whenever caches are
virtually indexed (for speed) but physically tagged
(for correctness), and caches get large enough for
the algorithm to be wrong once in a while.  They can
be avoided with a little thought and overhead in the
assignment of physical pages to virtual addresses.
Gimme a day or so to look at the code, and I'll propose
a fix for Linux...

            Kevin K.

-----Original Message-----
From: Florian Lohoff <flo@rfc822.org>
To: linux@cthulhu.engr.sgi.com <linux@cthulhu.engr.sgi.com>
Date: Thursday, April 27, 2000 5:39 PM
Subject: VC exceptions


>
>Hi,
>i had a conversation with Harald concerning a "strong" time drift
>on my R4000 Decstation. He than was astonished on the large
>number of VCE.
>
>I than searched all my Mips books for an definition of those
>exceptions. But i dont think i currently understand the
>cause of those exceptions.
>
>BTW:
>
>[flo@resume flo]$ uptime && cat /proc/cpuinfo
>  2:55pm  up 13 days, 20 min,  3 users,  load average: 1.15, 1.09, 1.01
>  cpu                     : MIPS
>  cpu model               : R4000SC V6.0
>  system type             : SGI Indy
>  BogoMIPS                : 124.93
>  byteorder               : big endian
>  unaligned accesses      : 90
>  wait instruction        : no
>  microsecond timers      : no
>  extra interrupt vector  : no
>  hardware watchpoint     : yes
>  VCED exceptions         : 130546469
>  VCEI exceptions         : 36073607
>
>On a medium loaded machine i see 40-50 VCEDs per second.
>
>Now i read in the "Mips R4000 Users`s Manual" page 133
>
>------
>Cause: A Virtual Coherency exception occurs when one of the
>       following conditions is true:
>
>       - a primary cache miss hits in the secondary cache
>       - bits 14:12 of the virtual address were not equal to
>         the corresponding bits of the PIdx field of the secondary
> cache tag.
>       - the cache algorithm for the page specifies that the page is
cached.
>------
>
>The "Mips Risc Architecture" says that ALL conditions are to be met which
>i trust more :)
>
>As a resume - The exception is taken when the index of the 1st and
>the 2nd level cache are not identical - Right ?
>So - why is there a mismatch ? Might it be due to some invalidation
>of the 1st (and not the 2nd) level cache ?
>
>As the exception is taken quiet often and the "Mips Risc Architecture"
states
>"Software can avoid the cost of this trap by using constistent virtual
>primary cache indexes to access the same physical data".
>
>Currently i dont think whats the exact cause of this exception and
>a probably optimization which brings this down.
>
>Flo
>--
>Florian Lohoff flo@rfc822.org       +49-subject-2-change
>"Technology is a constant battle between manufacturers producing bigger and
>more idiot-proof systems and nature producing bigger and better idiots."
>
