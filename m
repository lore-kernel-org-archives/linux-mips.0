Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199706170057.CAA18692@informatik.uni-koblenz.de>
Subject: Re: A pointed question about endianness...
Date: Tue, 17 Jun 1997 02:57:04 +0200 (MET DST)
In-Reply-To: <199706170033.RAA10832@titian.engr.sgi.com> from "Mike McDonald" at Jun 16, 97 05:32:56 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike McDonald <mikemac@titian.engr.sgi.com>
Cc: ralf@mailhost.uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19970617005704.CU8gRoQYnXLGTKs0l5haIcBZF3513cr3zIgPlvPGt2c@z>

>   Is anyone working on the Algorithmics boards? We have 5 of them over
> here currently being used with VxWorks (which isn't officially
> supported on these boards). I could cause lots of trouble over here if
> Linux did work on them. :-)

Me, I've got a P4032 donated by Algorithmics here.  The port hasn't yet
reached a state where I'd be pround of it, but bascially it works
diskless.  Some guys from a Silicon Valley company are currently also
porting Linux to that port, supported but otherwise mostly independant
from me.  They're using similar board from Algorithmics which is based
on a R5000 derivate.

Ok, patch 2.1.43 just has been released.  **Input** ...

  Ralf
