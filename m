Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Mon, 16 Jun 1997 10:56:58 -0700
Message-ID: <199706161756.KAA14413@fir.engr.sgi.com>
From: "William J. Earl" <wje@fir.engr.sgi.com>
Subject: Re: A pointed question about endianness...
In-Reply-To: <9706161530.ZM15792@windy.wellington.sgi.com>
References: <199706160017.CAA23535@informatik.uni-koblenz.de>
	<ralf@mailhost.uni-koblenz.de>
	<9706161530.ZM15792@windy.wellington.sgi.com>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alistair Lambie <alambie@wellington.sgi.com>
Cc: Ralf Baechle <ralf@mailhost.uni-koblenz.de>, Alex deVries <adevries@engsoc.carleton.ca>, linux@cthulhu.engr.sgi.com, ralf@Julia.DE, shaver@engsoc.carleton.ca
Message-ID: <19970616175658.aSlX55gWPe6o4V-UPkKt9qiQ1i0zL6weM1QL4nYhG7E@z>

Alistair Lambie writes:
 > On Jun 16, 12:21pm, Ralf Baechle wrote:
 > > Btw, question to the SGI gurus - is the kernel byteorder of SGI machines
 > > be reconfigurable?
 > >
 > 
 > As the guys in the US won't be in for a while yet.....
 > 
 > My belief is that Indy's were designed to require a PROM change.  I have also
 > heard that there was a problem running NT that required some mods to the
 > boards.
 > These were never released to the field.
 > 
 > So the answer is yes, but in practice no!
...
     Indy never ran anything little-endian, although the memory controller
could in principle support it.  The rest of the system probably would not
work correctly.  As far as I know, only the MIPS Magnum systems really
work both ways.  (They actually work better little-endian, but most were shipped
big-endian.)
