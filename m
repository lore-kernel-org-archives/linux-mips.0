Message-ID: <012801c13307$a05865e0$3501010a@ltc.com>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <20010901165842.B13357@tuxedo.skovlyporten.dk> <010401c132fe$610d0610$3501010a@ltc.com> <20010901181009.A13883@tuxedo.skovlyporten.dk>
Subject: Re: set_except_vector question
Date: Sat, 1 Sep 2001 13:00:37 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Lars Munch <lars@segv.dk>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010901170037._uzS2sQ1W6v6RRTbOL3lUYNtduVG5-qWsM1EbcuGvaM@z>

I haven't verified it, but it looks like it is making jump (j) instruction
that jumps to handler.  So the first instruction at the dedicated interrupt
vector becomes a jump to the handler.

Regards,
Brad

----- Original Message -----
From: "Lars Munch" <lars@segv.dk>
To: "Bradley D. LaRonde" <brad@ltc.com>
Cc: <linux-mips@oss.sgi.com>
Sent: Saturday, September 01, 2001 12:10 PM
Subject: Re: set_except_vector question


> What do you mean by "synthesizing a jump"?
>
> My CPU is a 5Kc and it has a DIVEC which is set to the mipsIRQ function in
> /arch/mips64/mips-boards/generic/mipsIRQ.S to handle interrupts. But I
still do
> not understand the address manipulation which is done before storing the
> function pointer (handler).
>
> Thanks
> Lars Munch
>
> On Sat, Sep 01, 2001 at 11:54:26AM -0400, Bradley D. LaRonde wrote:
> > Looks like it is synthesizing a jump (j) instruction to forward
interrupt
> > exceptions to the interrupt handler for cpus that have a dedicated
interrupt
> > vector (DIVEC).  arch/mips/kernel/setup.c sets the DIVEC option for
certain
> > cpus.
> >
> > Regards,
> > Brad
> >
> > ----- Original Message -----
> > From: "Lars Munch" <lars@segv.dk>
> > To: <linux-mips@oss.sgi.com>
> > Sent: Saturday, September 01, 2001 10:58 AM
> > Subject: set_except_vector question
> >
> >
> > > Hi
> > >
> > > I have been looking at the set_except_vector function in
> > > arch/mips[64]/kernel/traps.c and wondering why the handler
> > > address is changed/recalculated before it is stored:
> > >
> > > *(volatile u32 *)(KSEG0+0x200) = 0x08000000 | (0x03ffffff & (handler
>>
> > 2));
> > >
> > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >
> > > Could someone please enlighten me?
> > >
> > > Thanks
> > > Lars Munch
> > >
> >
>
