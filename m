Message-ID: <019701c11a8f$2561daa0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.LNX.4.10.10107311435110.28897-100000@transvirtual.com> <3B67F510.A0CFB4E7@patton.com>
Subject: Re: sys_mips problems
Date: Wed, 1 Aug 2001 15:37:32 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: paul@patton.com, James Simmons <jsimmons@transvirtual.com>
Cc: Jun Sun <jsun@mvista.com>, linux-mips@oss.sgi.com, linux-mips-kernel@lists.sourceforge.net
Message-ID: <20010801133732.AFKydLO571GoUt0-UEWcTzDOiENAiwpO6UPQJIJkRiY@z>

> > > > Since I was having problems with everything sefaulting due to the
sys_mips
> > > > bug I tried the patch floating around. It fixed the segfault problem
but
> > > > instead I get this error. Anyone knows why?
> > > >
> > > > : error while loading shared libraries: libc.so.6: cannot stat
shared
> > > > object: Error 14
> > >
> > > Which patch did you use?
> >
> > The fast_sysmips one.
> >
> > > Does your CPU have ll/sc instructions?
> >
> > I have a cobalt cube which has a MIPS Nevada chip which is a R52xx chip.
I
> > don't know if it does. By default I have ll/sc and lld/scd instructions
> > enabled.
>
> I don't know which R52xx chip you have, but my QED RM5261 has ll/sc but
> no mention of lld/scd instructions.

The RM52xx families are MIPS IV ISA devices, and lld/scd are
MIPS III (and therefore MIPS IV) instructions.  You've got 'em.
But you won't be able to use them in User mode unless the UX
bit of the CP0.Status register is set, which also turns on 64-bit
addressing, for which I rather doubt that your kernel is prepared.
User mode code should use only the 32-bit ll/sc's.  Not that it
sounds like that has anything to do with the problem reported
here, mind you...

            Kevin K.
