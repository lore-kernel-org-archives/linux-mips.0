Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: marker@daddyo.engr.sgi.com (Charles Marker)
Message-ID: <199801101804.KAA62540@daddyo.engr.sgi.com>
Subject: Re: SGI/Linux on a Challenge S series
Date: Sat, 10 Jan 1998 10:04:32 -0800 (PST)
In-Reply-To: <Pine.SOL.3.94.980110093122.2895A-100000@maelstrom.cerf.net> from "William Ellis" at Jan 10, 98 09:38:20 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: William Ellis <bellis@cerf.net>
Cc: linux@cthulhu.engr.sgi.com, Charles Marker <marker@daddyo.engr.sgi.com>
Message-ID: <19980110180432.0KXW_f_Y0fB8GvccA-Os2S0m6Huw0aDAJHnCHCo9y2M@z>

> 
> 
> 
> I just got hold of a spare Challenge S Series(R5000) I was
> going to attempt putting SGI/Linux on.  I know the porting is
> basicaly geared for the Indy's but I was going to muck with it
> a bunch. Then I just saw this post and was wondering if there 
> was any quick, good heads-up for these machines.  
> Thanks, Bill 

A Challenge S is just an Indy with the graphics, ISDN and some of the
digital media removed.  As long as the kernel is probing for those
devices and handling their non existance correctly, this should work
reasonably well.

					Charles

> >> I tried to compile the latest sources for an Indigo R4k .. with minimal
> [*snip*]
> > Did you modify the load address of the kernel?  Indy kernels are by
> > default linked for address 0x88002000 because the Indy has a 128mb
> > hole in it's address space there.  I assumes (wje???) that your box
> > has it's memory mapped from 0x80000000 upwards, so this would only
> > work if you actually have that more than 128mb ...
> >   Ralf
> 
