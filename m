Date: Tue, 18 Dec 2001 13:45:36 -0500
From: Jim Paris <jim@jtan.com>
Subject: Re: [ppopov@mvista.com: Re: [Linux-mips-kernel]ioremap & ISA]
Message-ID: <20011218134536.A11726@neurosis.mit.edu>
Reply-To: jim@jtan.com
References: <20011217151515.A9188@neurosis.mit.edu> <20011217193432.A7115@dea.linux-mips.net> <20011218020344.A10509@neurosis.mit.edu> <3C1F868C.492E155B@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3C1F868C.492E155B@mvista.com>; from jsun@mvista.com on Tue, Dec 18, 2001 at 10:10:20AM -0800
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>
Cc: Ralf Baechle <ralf@oss.sgi.com>, linux-mips@oss.sgi.com
Message-ID: <20011218184536.doCDO3Ql2PH-vV3QC0ndaTnNR7I4iC6s9BjPRTWE3cE@z>

> It seems like i82365.c implies a PCI device.  If this is true, then things do
> make sense here.

No, the VG469 (and original i82365) is most definately an ISA device.
From the manual: "The VG-469 has built in a standard ISA interface ..."
My machine, as much as I hate it, _does_ have an ISA bus located at
isa_slot_offset.

> It has nothing to isa_slot_offset here.  I don't know about the
> history of isa_slot_offset, but it appears to be faint effort to
> allow the access to what is called "ISA memory" space on PC.  This
> region, if it ever exists, should never be a separate region on a
> MIPS machine.  It should just be the beginning part of PCI Memory

The complete memory map of my machine is:

1FC0 0000 - 1FFF FFFF   Boot ROM
1E00 0000 - 1EFF FFFF   Flash Mem Space
1400 0000 - 14FF FFFF   VG-469 I/O Space
1000 0000 - 10FF FFFF   VG-469 Mem
0C00 0000 - 0CFF FFFF   Processor internal IO Area 1
0A00 0000 - 0A1F FFFF   LCD Frame buffer
0A20 0000 - 0A3F FFFF   S-MOS Registers
0000 0000 - 01FF FFFF   DRAM Space

As I see it, the VG-469 Mem (ie. an ISA bus, since the VG-469 is ISA)
is a separate region.

> Ralf, we should just delete isa_slot_offset to avoid any further confusions.

But my PCMCIA contoller _is_ an ISA device, and we need _something_ to
indicate where its "ISA memory" is physically mapped.  If it's not
stuck into a variable, then it's just going to be hard-coded with an
#ifdef for each architecture that does this .. ??

> My understanding is that PCMCIA does it own IRQ re-mapping (somewhat similar
> to P2P bridge IRQ re-mapping).

It's a driver issue.  Again, the i82365 is on an ISA bus, and so has
physical interrupt pins IRQ3-15, and uses these values in its
configuration and status registers.  The driver expected that these
matched system interrupts, as they usually would on an ISA
architecture; but that of course is not the case, as they're all
wired to the same GPIO pin on my system.  I've fixed this in the
driver.

-jim
