Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Fri, 5 Dec 1997 15:54:59 -0800
Message-ID: <199712052354.PAA02883@fir.engr.sgi.com>
From: "William J. Earl" <wje@fir.engr.sgi.com>
Subject: Re: M$ 's strategy against Linux: nightmare scenario 
In-Reply-To: <199712052246.PAA12296@harmony.village.org>
References: <199712052220.OAA60317@oz.engr.sgi.com>
	<199712052246.PAA12296@harmony.village.org>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Warner Losh <imp@village.org>
Cc: Ariel Faigon <ariel@cthulhu.engr.sgi.com>, Mike Acar <mike@contract.kent.edu>, linux@cthulhu.engr.sgi.com
Message-ID: <19971205235459.4qzSycE1UpmW6RlkoT27N_wIFsJk2_CcAa-1SRrDQHY@z>

Warner Losh writes:
...
 > BTW, there are some folks around here getting rid of Indigo's with a
 > fair amount of disk/memory on them (2G disk, 64M memory) with
 > monitors.  They are currently up for bid.  How different are these
 > beasts than the Indy?  Would Linux run on them?  What would be a fair
 > price to bid on them?

      The Indigo R4000 is pretty close to the Indy in many respects,
although the I/O and graphics are earlier generation in the same family.
The Indigo (R3000) has similar graphics and I/O, but is of course an
R3000, and the memory controller is a different design.  Linux could
run on either, but more porting would be required.  Many of the drivers
could be shared, with some adjustments, but the graphics would definitely
require significant work.
