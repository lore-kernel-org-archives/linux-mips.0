Message-ID: <00d201c0518e$87060b20$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20001118132233Z553804-494+838@oss.sgi.com> <XFMail.001118180639.Harald.Koerfgen@home.ivm.de> <20001118182114.A19710@bacchus.dhis.org>
Subject: Re: CVS Update@oss.sgi.com: linux
Date: Sat, 18 Nov 2000 19:36:41 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>, Harald Koerfgen <Harald.Koerfgen@home.ivm.de>
Cc: linux-cvs@oss.sgi.com, linux-mips@oss.sgi.com, linux-mips@fnet.fr
Message-ID: <20001118183641.V8teVuurtyb_s5zgq3gZmYKlgy6Q7vIN26xKrIrdXto@z>

> > > Log message:
> > >       New configuration option CONFIG_MIPS_UNCACHED.  Not yet
selectable due
> > >       to the manuals documenting ll/sc operation as undefined for
uncached
> > >       memory.
> >
> > Wouldn't it make sense then to disable CONFIG_CPU_HAS_LLSC as well?
>
> I'm waiting for authoritative answer from silicon guys before I deciede.
> In the past I ran kernel entirely uncached and they seemed to work even
> though the documentation made me assume the opposite.

We've been discussing this at MIPS, and it's a bit tricky.
LL/SC is almost guaranteed not to work uncached in a
multiprocessor configuration.  In the uniprocessor case,
it's not documented to work, but probably would in most
"natural" implementations.

The whole operation hinges on an invisible flip-flop which
is set by an LL and cleared by one of a set of events,
which include cache interventions by other CPUs,
memory ops by the same CPU, ERETs, etc.  So long
as the LL flop is set by the LL even uncached, and cleared
on ERET regardless of caching, the desired behaviour will
be obtained in an uncached uniprocessor.  But that's outside
the scope of the ISA spec and any MIPS ISA validation suites,
and a legal MIPS II/III/IV/V implementation could do otherwise.

            Regards,

            Kevin K.
