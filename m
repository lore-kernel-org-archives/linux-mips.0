Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199706162118.XAA08006@informatik.uni-koblenz.de>
Subject: Re: A pointed question about endianness...
Date: Mon, 16 Jun 1997 23:18:40 +0200 (MET DST)
In-Reply-To: <199706161754.KAA14400@fir.engr.sgi.com> from "William J. Earl" at Jun 16, 97 10:54:16 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "William J. Earl" <wje@fir.engr.sgi.com>
Cc: adevries@engsoc.carleton.ca, linux@cthulhu.engr.sgi.com, ralf@Julia.DE, shaver@engsoc.carleton.ca
Message-ID: <19970616211840.T222mFClA6ilqldsC_1ncbT7OFLoorH6BoiFt17itXM@z>

>      You probably can't agree on one, unless you can agree on one set
> of systems.  Most MIPS architecture systems, including all SGI
> systems, are big-endian, but all DEC systems and all MIPS Magnum 4000
> systems configured to run NT are little-endian.  (All other MIPS
> systems are big-endian.)

It's worse than that.  SNI RM series is configurable, Algorithmics eval
boards are configurable.  Acer PICA (derived from the Magnum) is le
only, Sony machines are fixed to be, Deskstation MIPS machines are fixed
to le ...

  Ralf
