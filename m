Message-ID: <000901c0b830$fed84060$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <NEBBLJGMNKKEEMNLHGAIKELLCAAA.mdharm@momenco.com> <01032316143609.00779@plugh.sibyte.com> <01b801c0b3fb$1770b740$0deca8c0@Ulysses> <3ABF9683.1D08617B@mvista.com>
Subject: Re: Multiple processor support?
Date: Thu, 29 Mar 2001 11:16:41 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>
Cc: carlson@sibyte.com, Matthew Dharm <mdharm@momenco.com>, linux-mips@oss.sgi.com
Message-ID: <20010329091641.6NGCl8NPI1DkrC8m2NPmFyGjYR4Sn6uEY3OCAOup1YY@z>

> > (Software cache coherency) It is possible,
> > but tricky, and at times unavoidably inefficient to build a
> > software-coherent SMP system.  I have not heard of anyone
> > doing so with MIPS/Linux.
> >
>
> How would it be possible?  Any reference to the previous implementations?

Lots of work on software coherent schemes was done in the
mid-late 1980s.  Check out the ASPLOS, and ISCA proceedings
from the period for references.  In essence, such schemes involve
the identification of critical regions at risk, the use of barriers around
such regions, and an explicit cache flush/purge protocol.  You can think
of the more common MP "TLB shootdown" protocols as being a variant
of a software cache coherence scheme.

> I imagine you would need at least some kind of atomic operation (like
ll/sc)
> working reliably (which itself may require cache coherency).

MIPS ll/sc, as defined and implemented, does require hardware
coherency support for correct multiprocessor operation.  But one
can, in principle, construct a software-coherent SMP system even
in the absence of such a primitive - many of the implementations
of software coherent SMPs used software coherence precisely
because they were based on simple switch/crossbar interconnects
where snooping was not possible.

> Also, any such
> scheme should not require massive change in the programming.

Whether progams need to change depends on the coherency
and consistency models assumed by the program.  Certainly
a naive multithreaded program that assumes an SGI-like model
could not be dropped onto a software-coherent MP system without
recompilation with specialized compilers at a minimum, and
more likely not without recoding.  On the other hand, if one's objective
is to run multiple, independent programs on different CPUs in
an SMP system, it should only be the OS that should need to
change to deal with the coherence issues for shared user pages
and shared kernel data structures, and to ensure that any
multithreaded application that is not explicitly set up to handle
software cache coherency has its threads bound to the same
CPU and caches (defeats some of the point of having a
multithreaded program, I know, but...).

            Regards,

            Kevin K.
