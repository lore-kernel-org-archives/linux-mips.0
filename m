Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Wed, 11 Mar 1998 09:55:38 -0800
Message-ID: <199803111755.JAA14604@fir.engr.sgi.com>
From: "William J. Earl" <wje@fir.engr.sgi.com>
Subject: Re: CVS Update@linus.linux.sgi.com: linux
In-Reply-To: <199803111521.HAA27172@linus.linux.sgi.com>
References: <199803111521.HAA27172@linus.linux.sgi.com>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ralf Baechle <ralf@linus.linux.sgi.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980311175538.Yp9gbduLenafDNbvY4jtFpesu2YHP_Rg2FqDWzvaDLs@z>

Ralf Baechle writes:
...
 > 	o The calculated values for r4k_offset are still off by ~480 from the
 > 	theoretical values.  That means we're going to loose about 46 s per
 > 	day.  Are the crystals that bad or is there still a bug hidden
 > 	somewhere?  Maybe an option to set r4k_offset to a user supplied
 > 	value might help?
...

      The crystals may well be off from exactly 100 MHZ.  Since the
frequency is high, a small percentage error adds up over a long
period.  I believe that the crystals for the CPU clock are chosen for
stability, not for highly accurate specific frequency (unlike, say,
the crystal in a watch).  You pretty much have to calibrate the CPU
clock using the Dallas calendar clock.  The intent in IRIX, although
sometimes broken, is to use the Dallas clock to correct drift in the
CPU clock, if an external time base (via NTP or the like) is not
being used.  
