Message-ID: <00d801c0797d$5cc410c0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3A598AFC.83204F56@mips.com> <3A59C0FB.62E52EF0@jungo.com>
Subject: Re: User applications
Date: Mon, 8 Jan 2001 15:14:38 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: linux-mips@oss.sgi.com, Carsten Langgaard <carstenl@mips.com>, Michael Shmulevich <michaels@jungo.com>
Message-ID: <20010108141438.AhWMyYyl0bYFJ9-LF-MP4vC1Fz0vyLECtmcBsKAlSgk@z>

> > When a new user process is started will its user space be cleared by the
> > kernel or is there a potential leak from an older user process ?
>
> Usually it is defied by the loader. If the data section contents is set to
> LOAD, then the contents of the section will be loaded from disk (no leak),
> if not -- whatever values left i nmemory will be there, or exactly, the
> virtual page of some other proccess that was swapped out or ended.

Note that what you are describing here is the "exec()" behavior.
I believe Carsten was talking about what happens on a "fork()".

> > What about the registers values, are they cleared for each new user
> > application or will it simply contain the current value it got when the
> > user application is started ?
>
> It depends on the context switch algorithm of the processor, I think.

On a fork() (or presumably clone()) operation, the set of registers
is copied.  Loading a new program ("exec()") should set up the
registers that point to the base of the new stack, the environment,
etc.  Historically, it's up to the runtime startup code ("crt0" in old
Unix systems) to do any other register initialization.

> > How can you flush the data and instruction cashes from a user
> > application ?
> >
>
> As far as I understand, ASID must take care of it. It contains unique IDs
> per process virtual space, so that even
> though virtual addresses may be found in TLB, their ASID will be
different,
> causing TLB miss and probably page fault.

That won't necessarily affect the caches, though.  While it
would be possible to do so, I don't believe any existing
MIPS implementations include ASID in the cache tags.
Hits are determined by an address match, period.

Back in the Ancient Old Days of System V, every architecture
had an architecture-specific system call entry, the first parameter
of which expressed what needed to be done.  Do we have
such a thing in Linux?   That would be the logical place to
things like cache flush and the atomic operations that were
being discussed here a couple of weeks ago.

            Regards,

            Kevin K.
