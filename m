Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Wed, 18 Jun 1997 05:38:42 -0700
Message-ID: <199706181238.FAA27279@fir.engr.sgi.com>
From: "William J. Earl" <wje@fir.engr.sgi.com>
Subject: Re: Good news: no more begging for HW
In-Reply-To: <9706171700.ZM11546@blammo.engr.sgi.com>
References: <199706171710.MAA15321@athena.nuclecu.unam.mx>
	<9706171053.ZM9344@sgi.com>
	<9706171700.ZM11546@blammo.engr.sgi.com>
Sender: owner-linux@cthulhu.engr.sgi.com
To: John Wiederhirn <jwiede@blammo.engr.sgi.com>
Cc: linux@morgaine.engr.sgi.com
Message-ID: <19970618123842.Q8nRVPMJ6KFvUuEu0TQZ_5krI_VKGdV1Fz_KbVVmLsw@z>

John Wiederhirn writes:
 > On Jun 17, 10:53am, richard offer wrote:
 > > * $ from miguel@nuclecu.unam.mx at "17-Jun:12:10pm" | sed "1,$s/^/* /"
 > > *
 > > * 4. Would it be possible for a free software company to redistribute
 > > *    the SGI's X server?  In that case, we could concentrate on getting
 > > *    the IRIX emulation as good as possible and just use the SGI X
 > > *    server and let Red Hat/Debian/GNU ship the cd with that binary.
 > >
 > > This would be my preferred solution, but I've had many an argument on this
 > > subject that I felt very dubious about bringing it up again.
...
     I talked with David Miller about this area last year.  I suspect that
one can run any of the cards with the firmware loaded by the PROM, in "dumb"
mode.  One would basically render by hand, or with very limited acceleration
and just DMA the data into the frame buffer (since the frame buffer is generally
not memory-mapped).  The result would not be really fast, but it would be functional.
I am travelling today, but I will check tomorrow.
