Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Mon, 10 Jun 1996 10:02:50 -0700
From: wje@fir.esd.sgi.com (William J. Earl)
Message-ID: <199606101702.KAA28690@fir.esd.sgi.com>
Subject: Re: Are you satisfied now Mr. McVoy? ;-)
In-Reply-To: <199606081822.LAA01539@yon.engr.sgi.com>
References: <199606081123.EAA07860@neteng.engr.sgi.com>
	<199606081822.LAA01539@yon.engr.sgi.com>
Sender: owner-linux@cthulhu.engr.sgi.com
To: ariel@cthulhu.engr.sgi.com
Cc: "David S. Miller" <dm@neteng.engr.sgi.com>, linux@cthulhu.engr.sgi.com
Message-ID: <19960610170250.l9X-sOALAdd-5RDxZ7x2Ps-G0IvCpdmpkjiTLneA5Bs@z>

Ariel Faigon writes:
 > >
 > >
 > >Calibrating delay loop.. ok - 91.96 BogoMIPS
 > >
 > Will a Triton CPU (R5000) make this better ? :-)

     An R5000 should scale with clock rate, relative to the 133 MHZ R4600
David is using.  The 180 MHZ R5000 would then be 124.46.

 > For those who are not familiar with bogomips, my Pentium-100
 > at home does 39.94 bogomips. And the best number I've seen
 > for a desktop is almost 300 bogomips for an  Alpha 21064
 > overclocked to 300MHz. The 91.96 number for a 150MHz Indy
 > sounds pretty good. 

     I think the 150 MHZ R4400 is in David's host machine, with the
133 MHZ R4600 in his target machine, so the 91.96 should be for the latter.
