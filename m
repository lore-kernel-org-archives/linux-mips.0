Message-ID: <010701c07986$ac768180$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1010108151854.23234G-100000@delta.ds2.pg.gda.pl>
Subject: Re: User applications
Date: Mon, 8 Jan 2001 16:21:18 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: linux-mips@oss.sgi.com, Carsten Langgaard <carstenl@mips.com>, Michael Shmulevich <michaels@jungo.com>
Message-ID: <20010108152118.2zqdKEXYOQXfZdJgY8MX6IzVFDTXVGhXCecMhkDYDTk@z>


----- Original Message -----
From: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
To: "Kevin D. Kissell" <kevink@mips.com>
Cc: <linux-mips@oss.sgi.com>; "Carsten Langgaard" <carstenl@mips.com>;
"Michael Shmulevich" <michaels@jungo.com>
Sent: Monday, January 08, 2001 4:07 PM
Subject: Re: User applications


> On Mon, 8 Jan 2001, Kevin D. Kissell wrote:
>
> > Back in the Ancient Old Days of System V, every architecture
> > had an architecture-specific system call entry, the first parameter
> > of which expressed what needed to be done.  Do we have
> > such a thing in Linux?   That would be the logical place to
> > things like cache flush and the atomic operations that were
> > being discussed here a couple of weeks ago.
>
>  The only case caches need to be synchronized is modifying some code.

Which just happens to be the case under discussion here.

>The  ptrace syscall does it automatically for text writes -- it's needed
and
> used by gdb to set breakpoints, for example.  For other code there is
> cacheflush() which allows you to flush a cache range relevant to a given
> virtual address (I see it's not implemented very well at the moment).
>
>  Obviously, you don't want to allow unprivileged users to flush caches as
> a whole as it could lead to a DoS.

By that logic, we should not allow users to allocate more virtual
memory than there is physical memory in the system!  A pathological
swap program is arguably far a far worse denial of service attack
than flushing the caches - so long as by "flush" we mean invalidate
with writeback (on copyback caches), of course.
