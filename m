Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0xdgRS-0005FsC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: A question about architecture and byte order with RPMs
Date: Thu, 4 Dec 1997 18:56:05 +0000 (GMT)
In-Reply-To: <9712040917.ZM8768@xtp.engr.sgi.com> from "Greg Chesson" at Dec 4, 97 09:17:39 am
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Greg Chesson <greg@xtp.engr.sgi.com>
Cc: adevries@engsoc.carleton.ca, ralf@uni-koblenz.de, linux@cthulhu.engr.sgi.com, rpm-list@redhat.com
Message-ID: <19971204185605.0oFIb5h093gU6-B_F-akUnluaI2H_Q8Sc4C5BlrRUoM@z>

> be added to type declarations.  The modifier would indicate whether the
> data object is stored in big-endian or little-endian format.
> The compiler would generate byte swizzles or not, depending on whether
> the native execution mode agrees with the indicated storage class.
> 
> Perhaps the GCC world, being somewhat more enlightened, could do something
> in this area (or perhaps already is thinking about it?).

Yeuch ;). Can't you get your guys to put that in the MMU so you can have
a little endian or big endian page ? I can see how you'd make lcc generate
such output but not offhand gcc
