Message-ID: <XFMail.000215181433.Harald.Koerfgen@home.ivm.de>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
In-Reply-To: <00f001bf77a7$01e6cd10$0ceca8c0@satanas.mips.com>
Date: Tue, 15 Feb 2000 18:14:33 +0100 (MET)
Reply-To: "Harald Koerfgen" <Harald.Koerfgen@home.ivm.de>
From: Harald Koerfgen <Harald.Koerfgen@home.ivm.de>
Subject: Re: ioremap() broken?
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: "Kevin D. Kissell" <kevink@mips.com>
Cc: linux@cthulhu.engr.sgi.comlinux@cthulhu.engr.sgi.com, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Message-ID: <20000215171433.jYkYZvODuPsFgjVQqCxq4tBwgxtIqI1PePYSaXsWjAU@z>


On 15-Feb-00 Kevin D. Kissell wrote:
>>> > 1. Is it really necessary to add anything to the addr in the readb() et
>>> > al.
>>> >    macros? ioremap() already takes care of that.
>>> 
>>> There is something of an "embarassment of riches" in the kernel
>>> code in terms of mechanism for getting at I/O resources.  I don't
>>> think it was ever intended that people use readb() on addresses
>>> that had already been massaged with ioremap().  ioremap() is
>>> used where the driver *expects* an memory-mapped I/O model,
>>> and is applied to pointers that will be used to directly reference
>>> the device.  readb/writeb et. al. are for drivers that think that expect
>>> a more peek/poke like model.  I don't think it was ever intended that
>>> someone apply both at once!
>>
>>Yes it is! Please read Documentation/IO-mapping.txt. To access PCI memory
>>space, you have to use ioremap() and readb() and friends. If PCI drivers have
>>to work across differen architectures, this has to be fixed.
> 
> It is a coincidence that ioremap() is so simple on most current MIPS 
> platforms.  On some systems, and on MIPS systems with more than 
> 512M of combined memory and mapped I/O, it would be necessary
> to invoke VM functions to create (and possibly wire) a kernel address
> mapping, and on such systems ioremap() would have some real work
> to do.

Yes, indeed. The Philips PR31700/Toshiba TMPR3912 is such a beast and I could
imagine that other MIPS based embedded CPUs tend to be similar.

On this particular CPU PCMCIA memory is accessed through *physical* addresses
0x64000000-0x6bffffff, and thus unreachable through KSEG0 or KSEG1. To make
things even more delicate, this CPU is based on a R3000 core and supports 4kB
pages only, so even ye olde "let's create a wired TLB entry with 16 MB page
size"-trick will not work. 

Before you're beginning to ask, yes, I *do* have Linux/MIPS running on a Sharp
Mobilon HC-4500 :-), and, no, PCMCIA is not working yet :-(

What I am trying to say is that sooner or later we may have to deal with this
case as well.

---
Regards,
Harald
