From: "Gilad Rom" <gilad@romat.com>
Subject: RE: CP0 EntryLo
Date: Tue, 30 Nov 2004 20:16:39 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <41ACB576.6000501@embeddedalley.com>
Message-ID: <20041130181638.D260DEB2B8@mail.romat.com>
Return-Path: <gilad@romat.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Pete Popov' <ppopov@embeddedalley.com>
Cc: "'Maciej W. Rozycki'" <macro@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20041130181639.PUMc-8ghyHKfa2BQ8Geupe5d5DSLt7KnvqfH9f9aTwE@z>

 

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org 
> [mailto:linux-mips-bounce@linux-mips.org] On Behalf Of Pete Popov
> Sent: Tuesday, November 30, 2004 8:01 PM
> To: Gilad Rom
> Cc: Maciej W. Rozycki; linux-mips@linux-mips.org
> Subject: Re: CP0 EntryLo
> 
> Maciej W. Rozycki wrote:
> > On Tue, 30 Nov 2004, Gilad Rom wrote:
> > 
> > 
> >>So, what I need to do, if I understand correctly, is to 
> create a fixed
> >>mapping
> >>>From a virtual address to a physical address on the tlb, 
> and use this
> >>Virtual address to change the values of EntryLo to 0xD in order to 
> >>Access the device on the address range I mapped Chip-select 1 to?
> >>
> >>(Excuse my poor phrasing, I've been googling all day...)
> >>
> >>Any idea on how I might accomplish that from a driver?
> >>I've found a function called add_wired_entry(...), is this
> >>What I should be using?
> > 
> > 
> >  ioremap()
> 
> Exactly. You program the CS with a physical address. Make sure that 
> address does not overlap with anything else. Then you call ioremap 
> from your driver and you get back a virtual address. You use that 
> virtual address to access the peripheral.

Okay. I've pretty much figured out that part. What I'm puzzled
About now is how do change the values of the CP0 EntryLo0/1
Registers, since I've changed the DTY bits to "1" on the MEM_STCFG1
Register (in order to set it to work in "I/O Device" mode) , 
I need to "change bits 29:26 of CoProcessor 0 to 0xD" (Au1500 Databook
quote)
since the Databook doesn't specify an offset
To these registers, I assume they're not like the other
Registers I've been dealing with (Chip Select and GPIO).

> 
> At this stage I would say that probably reading something like the 
> Linux Kernel book or Linux Device Drivers both by Oreilly will 
> really help you.

Thanks. Already been doing just that all day... ;)
