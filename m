Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0xUL0I-0005GQC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: Fix your bootloader
Date: Sun, 9 Nov 1997 00:13:26 +0000 (GMT)
In-Reply-To: <9711061005.ZM4557@netghost.engr.sgi.com> from "Michael Kaye" at Nov 6, 97 10:05:23 am
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Michael Kaye <michaelk@netghost.engr.sgi.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19971109001326.W-dY80KU5lWXqdQv0L7l1nYiHFlC77iHSQ96jqChJXI@z>

> I am installing linux on an indy for the first time. I was following the
> instructions on http://www.linux.sgi.com/faq.html when I noticed the
> instructions where not complete.  It talks about "Fixing your bootloader".  I
> assume it is talking about NVRAM and the PROM Monitor, but I can not find
> anything in the man pages.  I found bootfile, bootmode and boottune, but no
> bootloader.  Any ideas what to do at this point?

Turn the box on from cold, bang escape repeatedly as it boots until you get
a screen with about 6 icons and a mouse pointer. Click on the command line
one and do

boot /vmlinux options-go-here

Alan
