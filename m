Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: olson@anchor.engr.sgi.com (Dave Olson)
Message-ID: <199812101644.IAA85119@anchor.engr.sgi.com>
Subject: Re: Linux on an SGI Challenge L
In-Reply-To: <Pine.LNX.3.96.981210112344.26579J-100000@lager.engsoc.carleton.ca> from Alex deVries at "Dec 10, 98 11:24:10 am"
Date: Thu, 10 Dec 1998 08:44:08 -0800 (PST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: ralf@uni-koblenz.de, andrewb@uab.edu, linux-smp@vger.rutgers.edu, linux@cthulhu.engr.sgi.com
Message-ID: <19981210164408.qNUL7QLO-iB3m5HDmaA2PuA2-BCetCQ_XBBVi4QzTOk@z>

Alex deVries wrote: 
|  
|  What's in a Challenge L exactly, in terms of devices and busses?

same cpu bus, but used differently
hidden gio bus within some cards (not quite the same as indy)
vme
wd95 scsi, not wd93
different ethernet
different serial
different memory/io interface chip, with layered and "interesting"
	buses(plural) to various kinds of i/o
interrupts (of course) are quite different, with some interesting
issues in the implementation.

There may still be some old white papers on www.sgi.com


Dave Olson, Silicon Graphics
http://reality.sgi.com/olson   olson@sgi.com
