Date: Thu, 19 Jul 2001 03:30:08 -0700 (PDT)
From: Chris Vandomelen <chrisv@b0rked.dhs.org>
Subject: Re: Patches to support 48M IBM Workpad z50?
In-Reply-To: <20010719122113.A2422@bacchus.dhis.org>
Message-ID: <Pine.LNX.4.31.0107190328000.9246-100000@b0rked.dhs.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com, linux-mips-kernel@lists.sourceforge.net
Message-ID: <20010719103008.wyLLqKbMECcqtIP_YHFuwsE32QZb3vpTUiCWneq-noo@z>

> Now that hack took longer to implement than a proper solution ...

Yeah, that hack did take longer to implement than a proper solution. But
it was what I could come up with at the time, as I haven't gone digging
that far down into the kernel sources yet (and unfortunately, the prom.c
source wasn't very helpful either.

> > that would be useful to work past the memory hole?
>
> Put something like the following into your systems prom_meminit:
>
> 	add_memory_region(0UL       , 16UL << 20, BOOT_MEM_RAM);
> 	add_memory_region(16UL      , 16UL << 20, BOOT_MEM_RESERVED);
> 	add_memory_region(32UL << 20, 32UL << 20, BOOT_MEM_RAM);
>
> You may want to account for additional memory areas and do a proper detection
> etc., exclude area which are used by the firmware etc.

I'm pretty sure that 16M region in the 16-32M area is unused: it's
possible to solder another 2 8M dram chips on the board and increase the
memory to 64M..

Thanks for the help. :)

Chris
