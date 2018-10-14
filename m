Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23990509AbeJNXv1a00sR (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 15 Oct 2018 01:51:27 +0200
Date: Mon, 15 Oct 2018 00:51:27 +0100 (BST)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH] TC: Set DMA masks for devices
In-Reply-To: <20181006092156.GA6783@sx-9>
Message-ID: <alpine.LFD.2.21.1810061515200.7757@eddie.linux-mips.org>
References: <alpine.LFD.2.21.1810030109210.5483@eddie.linux-mips.org> <20181004165720.GA2361@sx-9> <alpine.LFD.2.21.1810041916420.12089@eddie.linux-mips.org> <20181005145612.GA2341@sx-9> <alpine.LFD.2.21.1810051602280.22125@eddie.linux-mips.org>
 <20181006092156.GA6783@sx-9>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-Path: <macro@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Fredrik Noring <noring@nocrew.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, =?UTF-8?Q?J=C3=BCrgen_Urban?= <JuergenUrban@gmx.de>
Message-ID: <20181014235127.rLJ6j9QHpQ-5ra3sZht6uXthV5lUmv3AsNWZTRkK6to@z>

Hi Fredrik,

> >  From the description I take it it is some MMIO memory rather than host 
> > memory.  I fail to see how it is supposed to work with these calls for 
> > non-system memory, which certainly any MMIO memory is, which surely is not 
> > under the supervision of the kernel memory allocator.
> 
> I agree, this is obscure to me too.

 I can't be bothered (sorry!) to study this code or the datasheet for the 
IC to figure out what the arrangement is, but I do encourage you to do so 
if you want to make any changes here.

> >  Mind that the DEFZA runs its own RTOS for initialization and management 
> > support, including in particular SMT (Station Management).  This is run on 
> > an MC68000 processor.  That processor is interfaced to a bus where board 
> > memory is attached as well as the RMC (Ring Memory Controller) chip, which 
> > acts as a DMA master on that bus, like does the host bus interface.  Also 
> > certain control register writes from the host raise interrupts to the 
> > MC68000 for special situations to handle.
> > 
> >  All the PDQ-based FDDI adapters also have an M68000 which runs an RTOS, 
> > however the presence of the PDQ ASIC makes their architecture slightly 
> > different as the FDDI chipset does host DMA via the PDQ ASIC, which acts 
> > as a master on the host bus (possibly through a bridge chip like the PFI, 
> > though TURBOchannel for example is interfaced directly).
> 
> How is its firmware handled? The Linux MIPS wiki entry for the DECstation
> firmware
> 
> https://www.linux-mips.org/wiki/DECstation#Firmware
> 
> is a TODO. :)

 I'm not sure who actually created that entry and what they had in mind.  
Likely the console firmware and any of its peculiarities related to Linux.

> The main reason I'm asking is that the IOP is a MIPS R3000
> (apparently in later product models replaced with a PowerPC 405GP and its
> DECKARD software emulator) that also needs firmware. The IOP most likely
> ought to handle multiple firmware files, in the IRX format, depending on
> its set of services.

 The firmware of these FDDI boards is stored in flash memory onboard, so 
you don't need to do anything to load it as it boots by itself.

 There is a documented way to flash a firmware image by fiddling with the 
control registers appropriately, downloading the new image to board RAM 
and then requesting the board to transfer the image to onboard flash.  
