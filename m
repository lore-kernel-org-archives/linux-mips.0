Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0x77Rs-0005FjC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: [Q: Linux/SGI] IRIX executable memory map.
Date: Sat, 6 Sep 1997 00:05:56 +0100 (BST)
In-Reply-To: <199709052251.PAA20078@fir.engr.sgi.com> from "William J. Earl" at Sep 5, 97 03:51:00 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: "William J. Earl" <wje@fir.engr.sgi.com>
Cc: miguel@nuclecu.unam.mx, linux@fir.engr.sgi.com
Message-ID: <19970905230556.jI1dj3ua6P2_3zlR_qkVCHcShOI14xSF3BWYUJeHTDU@z>

>      Simply automatically create the page in the page fault handler
> when it is first referenced.  Treat as if it were an mmap() of /dev/zero
> for 1 page.

Better to map it first. page fault is a far more critical path to stick
conditionals into. Even better if possible is to stick it into the userspace
dynamic loader for irix binaries. That however means not using the irix one
or having a "preloader" before it

Alan
