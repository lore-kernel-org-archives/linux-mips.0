Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: olson@anchor.engr.sgi.com (Dave Olson)
Message-ID: <199812230544.VAA08158@anchor.engr.sgi.com>
Subject: Re: Status
In-Reply-To: <Pine.LNX.3.96.981222224859.1946C-100000@lager.engsoc.carleton.ca> from Alex deVries at "Dec 22, 98 10:50:33 pm"
Date: Tue, 22 Dec 1998 21:44:43 -0800 (PST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: greg@xtp.engr.sgi.com, ariel@cthulhu.engr.sgi.com, fredrov@hotmail.com, linux@cthulhu.engr.sgi.com
Message-ID: <19981223054443.oStYaYRqU5LtTD-H_nIxK5A4sFyUp9uXIaNQM6TmsRA@z>

Alex deVries wrote: 
|  On Mon, 21 Dec 1998, Greg Chesson wrote:
|  > I2 means Indigo2.
|  > Extreme means he has a high-end graphics board.
|  > The I2 is like the Indy, but has two built-in SCSI channels rather
|  > than one.  It tends to not have all the multi-media stuff on the motherboard
|  > that you find on the Indy.  I have an I2 because - unlike the Indy -
|  > I can put two XL graphics cards in it and run a two-head display.
|  > The I2 also allows for an Extreme card and an XL (but not 2 Extreme's).
|  > Also, can have more memory than an Indy.
|  
|  The Indigo2 sounds a lot like a Challenge S; is the internal architecture
|  similiar to the Indy/Challenge S as well?

Yes.  Indigo2 came first, then Indy was done as a derivitive of it.
Indy left out EISA, and changed to an integrated chip for the serial
ports and a couple of other things, as a cost reduction measure.
Indy also has only one scsi controller, while indigo2 has two.
Challenge S was then done as a derivitive of Indy, with the graphics
board replaced by a board with the wd95 scsi controllers, and two GIO
slots (only one of which could do DMA).
