Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Wed, 25 Nov 1998 14:25:24 -0800
Message-ID: <199811252225.OAA23152@fir.engr.sgi.com>
From: "William J. Earl" <wje@fir.engr.sgi.com>
Subject: Re: help offered
In-Reply-To: <199811252213.OAA07424@vostok.engr.sgi.com>
References: <Pine.LNX.4.04.9811251542540.3207-100000@elenuial.atlsci.com>
	<199811252213.OAA07424@vostok.engr.sgi.com>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex Kozlov <alexvk@vostok.engr.sgi.com>
Cc: pjlahaie@atlsci.com, ariel@cthulhu.engr.sgi.com, galibert@pobox.com, linux@cthulhu.engr.sgi.com
Message-ID: <19981125222524.8XZ6WCoj4UKOXqZqKgH26GQDuD4luYohB_JnsmEJZ9Y@z>

Alex Kozlov writes:
 > pjlahaie@atlsci.com wrote:
 > >
 > >     I was under the impression the O2k memory bandwidth was limited to
 > > ~800MB/s.  If so, even if you can read 4GB/s what are you foing to do with
 > > it?  It would have to go over the CrayLink "network" and that doesn't do
 > > 4GB/s.  The only way I can see 4GB/s disk throughput is multiple of the
 > > node accessing "local" drives and adding all the bandwidth together.
 > > 
 > 
 > I thought craylink is 6 GB/s:
 > 
 > cl0: flags=4041<UP,RUNNING,DRVRLOCK>
 >         inet 192.0.2.113 netmask 0xffffff00 
 >         speed 6.40 Gbit/s
 > 
 > Is it not true in practice?

     Yes, but I think the "4GB/s" was "4 gigabytes/second".  The link is
about 800 megabytes/second (6.4 gigabits/second).
