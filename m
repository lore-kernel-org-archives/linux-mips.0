Message-ID: <sea8ec0e.043@quicklogic.com>
Date: Fri, 25 Apr 2003 08:04:07 -0700
From: "Dan Aizenstros" <daizenstros@quicklogic.com>
Subject: Re: NCD900 port?
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Return-Path: <daizenstros@quicklogic.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: coldwell@frank.harvard.edu
Cc: linux-mips@linux-mips.org
Message-ID: <20030425150407.aaYuPp9YPuGoHJyYcoqHXxLuFwiI_NpOfiiAN9O8lUo@z>

Hello Chip,

The V320USC has a boot EEPROM that is used to configure
it. If it is socketed on the board than I would suggest
you remove it and put it in a device programmer and dump
its contents. From the EEPROM contents you can find out
some of the memory map of the system.

You would be able to find out the base address of the
V320USC registers which do not have a fixed address and
could be located anywhere in the KSEG1 region.

You would be able to find out the base address of the
chips selects for the local bus.

Without a memory map from NCD you will probably have
to probe around to find the addresses of the devices
attached to the local bus.

You may have to write drivers for the devices attached
to the local bus.

Devices attached to the PCI bus will be easy to probe
using configuration cycles.

As for the bootloader, if it downloads binary images
than you need to know what start address is expects
so that you can compile linux to run from that address.
If it can download ELF or S3 records than it will
probably use the start address in the kernel image.
Do you get a bootloader prompt on startup? Or does
it just launch straight into X.

-- Dan A.

>>> Chip Coldwell <coldwell@frank.harvard.edu> 04/25/03 07:21 AM >>>
On Fri, 25 Apr 2003, Dan Aizenstros wrote:
> 
> The V320USC is fully documented and manuals are
> available if you want them. The QuickLogic web site
> is a bit out of date with respect to the Linux support.
> I am tracking the linux-mips CVS tree and I can send
> you a patch sometime next week. However, the patch will
> be for our Hurricane board and so you will have to make
> changes to support the NCD device.

I found the documentation on line; it looks very thorough. I also
found the (little-endian) toolchain on your website, which is very
convenient.

The first big stumbling block will be to guess the base address where
the bridge is located.  I see in your Hurricane board it's found at
0xBC000000; is there any reason to hope that NCD would locate it in
the same place or is this pretty much an arbitrary decision?

> Can you provide any information about the bootloader?
> Does it support loading of ELF images?

I really don't know.  If it doesn't, I suppose could give it a
compressed kernel image.  Or would this require some monkeying around
with head.S?

> Also, do you know what endian the machine is using.
> The Linux port is mostly tested little endian and
> may need some work to get big endian going.

That I don't know.  If I had to guess I would say big-endian just
because of the cultural background that NCD comes from.

I'm going to do some experiments over the weekend and try to come up
with some answers to these questions.

Chip

-- 
Charles  M. "Chip" Coldwell
"Turn on, log in, tune out"
