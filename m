Message-ID: <00d401c22337$7e731580$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20020702114045.A16197@lucon.org> <20020702220651.B9566@dea.linux-mips.net>
Subject: Re: PATCH: Always use ll/sc for mips
Date: Thu, 4 Jul 2002 10:47:41 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>, "H. J. Lu" <hjl@lucon.org>
Cc: linux-mips@oss.sgi.com, GNU C Library <libc-alpha@sources.redhat.com>
Message-ID: <20020704084741.gZx-cCbcWBmxUR6Lpx9CJP9N5wAsizkJ4RvWjpGORIE@z>

> On Tue, Jul 02, 2002 at 11:40:45AM -0700, H. J. Lu wrote:
> 
> > The ll/sc emulation is implemented in 2.4.0 and above. This patch makes
> > glibc always use ll/sc.
> 
> Which means the overhead of two syscalls instead of one sysmips() call
> for something that is assumed to be dirt cheap.  R3000, R5900 etc.
> users won't this patch you, which'll have significant impact on their
> glibc performance.

The R5900 kernel for the Playstation 2 does not use system
calls.  It uses a memory-mapped pseudo-device hack that
the guys at Sony came up with, which is much faster.  We
at MIPS came up with an even faster hack which uses 
the destruction of a "k" register value, but which requires 
the branch-likely instruction and thus only workson 
MIPS II CPUs and above (R39xxx, R4xxx, R5xxx,
but not the classic R3K).  See my message
"Re: patches for test-and-set without ll/sc" of January 22.

I consider it to be very important for MIPS/Linux
that the embedded/workstation kernel and libraries
merge with the Playstation 2 "consumer" Linux, and
I don't think that will happen if we try to push the
PS2 people to use something far less efficient than
what they already have. "Entia non sunt multiplicanda 
praeter necessitatem", as a wise old guy once said,
but could we not consider a MIPS/Linux universe
where R3000 binaries use system calls, non-LL/SC
MIPSII+ binaries use k-register destruction, real,
manly, MIPS binaries use LL/SC instructions, and
where the MIPS/Linux kernel (a) supports an appropriate
system call, (b) makes a contract with userland to 
destroy k-regs predictably, and (c) contains the
emulation logic for LL/SC?  That should give us
full cross-platform binary compatibility, with optimal
performance on each platform when an appropriately
configured set of libraries and tools is installed.

            Regards,

            Kevin K.
 
