Message-ID: <005901c091c3$ab3c9b60$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1010208115525.29177E-100000@delta.ds2.pg.gda.pl>
Subject: Re: NON FPU cpus - way to go
Date: Thu, 8 Feb 2001 12:38:23 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: Jun Sun <jsun@mvista.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Florian Lohoff <flo@rfc822.org>, linux-mips@oss.sgi.com, ralf@oss.sgi.com
Message-ID: <20010208113823.W8-Bb2HBeJWq3375zflACcuIMYuMU61LEh3bQsuMy5M@z>

> On Thu, 8 Feb 2001, Kevin D. Kissell wrote:
>
> > Do you have some numbers to support this?  A proper library
> > implementation does *not* trap to the kernel on each FPU
> > instruction, and as such is considerably faster (and considerably
> > larger - a factor for embedded apps!) than a kernel emulation.
>
>  Now you are writing of a compiler emulation and not a library one.

Well, in fact it ends up being both.  The compiler substitutes library
invocations for FP instructions, one-for-one.

> While
> such a solution is reasonable for firmware or other OS-less or even
> libc-less environment, its much too painful for normal use.  Either you
> lose for real FPU environments due to extra overhead to invoke FPU
> operations or you have two sets of incompatible binaries (one that invokes
> FPU diractly and the other one with emulator hooks).

Which was my whole point about it not being a good idea.

The notion of using libc emulation based on catching SIGFP,
on the other hand, is so silly that I didn't even understand that
that's what you were referring to!  It would be an amazing pig,
and there are corner cases, such as the emulation of the
instructions in the delay slot of branch-on-floating-condition,
that would be damned difficult to handle that way.

> > >  You never want to configure glibc with the --without-fp option.
> >
> > That's certainly what we had to do for OpenBSD without FP
> > emulation!  What is the alternative?
>
>  Write one. ;-)

I don't understand, the alternative to building a --without-fp
glibc (which Carsten and I did for OpenBSD once already)
is to write *what*?

            Regards,

            Kevin K.
