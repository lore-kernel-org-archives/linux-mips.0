Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: "Greg Chesson" <greg@xtp.engr.sgi.com>
Message-ID: <9811251357.ZM24157@xtp.engr.sgi.com>
Date: Wed, 25 Nov 1998 13:57:05 -0800
In-Reply-To: <pjlahaie@atlsci.com>
        "Re: help offered" (Nov 25,  4:38pm)
References: <Pine.LNX.4.04.9811251631410.3207-100000@elenuial.atlsci.com>
Subject: Re: help offered
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-linux@cthulhu.engr.sgi.com
To: pjlahaie@atlsci.com
Cc: Ariel Faigon <ariel@cthulhu.engr.sgi.com>, Olivier Galibert <galibert@pobox.com>, linux@cthulhu.engr.sgi.com
Message-ID: <19981125215705.n94lasQ0sMbQb1kVOsWGrYY1h-BY00agAoS8ppD0eQ8@z>

On Nov 25,  4:38pm, <pjlahaie@atlsci.com> wrote:
> Subject: Re: help offered
> On Wed, 25 Nov 1998, Greg Chesson wrote:
>
> > But the memory subsystem is ccNUMA.  That means any channel in the system
> > can read/write any memory in the system.  With io buffers that comprise
> > multiple pages, and with the pages of the buffer located on several
different
> > memory controllers, multiple io channels can burst (in parallel) to the
> > "array" of pages that comprise the buffer.
>
>     Except some of this has to go through the CrayLink.  The memory you

there are 8 IO links in the example I gave plus numerous Craylinks  -
I think it's 16 for the example.  The bandwidth definitely does not go
down a single link.

> are "bursting" to is not on the same node.  Therefore, if you have a
> dual-threaded application that runs over the data, at most the max
> bandwidth is 1.6GB/s (seeing as it's advantagous to spread your code to

the application in the example is single-threaded.
Lot's of people just want a bigpipe and a single file descriptor.

> two nodes and split the memory between them).  If you application can make
> use of all processors on that box, then you get the full bandwidth.  The

a single-thread app can easily malloc pages from all the processor slots
on the box.  Can't do that in a cluster or a shared-nothing machine.
You can think of processor slots as just extra memory controllers.
For some applications we ship with "sparse" processor nodes for just
this purpose.

> most any single processor in that Origin can handle is 800MB/s and if it
> needs to get that data, eventually that data is shoveled through the
> CrayLink (and hopefully is gets migrated there).  Is there anything flawed
> with this reasoning?

The single processor limit is set by the memory controller bandwidth.
It can peak at over 600 MB/s, but 500 MB/s is a good number for sustained
random access ops.
>
>     I don't see why it cannot be done.  The page-cache/file system buffer
> cache are supposed to be merged.  If you mmap that data, you should just
> get a pte pointing to that area in the page cache.

ok.

>
>     But that bandwidth isn't single node bandwidth.  No single node can do
> 4GB/s.  All nodes need to use their local memory to achieve max bandwidth.
>

we do make systems where single node bandwidth is many gigabytes/sec.
They're called vector supercomputers.

The max amount of memory on a motherboard is 4 GBytes, I think.
In order to get a bigger memory, more processors must be added.
Do you want to criticize that, too?

The "beauty" of the ccNUMA memory architeture is that by using off-the-shelf
memory circuits, both bandwidth and capacity can be aggregated in a modular
way and still be mapped into a coherent virtual address space.

g



-- 
Greg Chesson
