Message-ID: <00f001bf77a7$01e6cd10$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: ioremap() broken?
Date: Tue, 15 Feb 2000 12:22:49 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <20000215112249.2hZkzxwiQdw-JwKEom_NwHudddSdmDgH8T98FI0rMHk@z>

>> > 1. Is it really necessary to add anything to the addr in the readb() et al.
>> >    macros? ioremap() already takes care of that.
>> 
>> There is something of an "embarassment of riches" in the kernel
>> code in terms of mechanism for getting at I/O resources.  I don't
>> think it was ever intended that people use readb() on addresses
>> that had already been massaged with ioremap().  ioremap() is
>> used where the driver *expects* an memory-mapped I/O model,
>> and is applied to pointers that will be used to directly reference
>> the device.  readb/writeb et. al. are for drivers that think that expect
>> a more peek/poke like model.  I don't think it was ever intended that
>> someone apply both at once!
>
>Yes it is! Please read Documentation/IO-mapping.txt. To access PCI memory
>space, you have to use ioremap() and readb() and friends. If PCI drivers have
>to work across differen architectures, this has to be fixed.

OK, having looked at the documentation, I've seen the Holy Word of 
Linus in the topic, even if it seems to be honored mainly in the breach 
in real world drivers. It also seems to be somewhat confusing
in its treatment of ISA versus PCI, and insufficient to handle some
possible system configurations.  More on this later.
.
But for Geert's problem, the fix is simple - get rid of the offset added 
in the readb() macro and its friends.   Linus' definitions are a bit vague.
The "addresses" returned by ioremap() need not, according to his
description, be valid addresses at all, but must simply be tokens that
are unique within the system and usable by readb() et. al.  All VM
manipulation *could* be handled in the readb() code, but that would
in general be inefficient.  It seems clear enough that ioremap() should 
encapsulate all address transformation and VM resource management, 
and that readb() should encapsulate the mechanics of the data transfer.

It is a coincidence that ioremap() is so simple on most current MIPS 
platforms.  On some systems, and on MIPS systems with more than 
512M of combined memory and mapped I/O, it would be necessary
to invoke VM functions to create (and possibly wire) a kernel address
mapping, and on such systems ioremap() would have some real work
to do.

The readb/writeb/etc. macros thus are not expected to fix any mappings,
but rather to provide wrappers that would conceal the use of special
I/O access instructions, non-fatal bus error resolution, etc., depending
on the platform and the architecture.  On current MIPS systems, it maps 
directly to a load/store.

            Kevin K.
