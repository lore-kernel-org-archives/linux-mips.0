Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0xdgUo-0005FsC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: Linux on the O2
Date: Thu, 4 Dec 1997 18:59:33 +0000 (GMT)
In-Reply-To: <199712041722.JAA26372@fir.engr.sgi.com> from "William J. Earl" at Dec 4, 97 09:22:12 am
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: "William J. Earl" <wje@fir.engr.sgi.com>
Cc: greg@xtp.engr.sgi.com, chatz@omen.melbourne.sgi.com, ligeh@carpediem.com, cwcarlson@home.com, linux@cthulhu.engr.sgi.com
Message-ID: <19971204185933.HDnDGvgizJZCl5szH_QNsEiJOI2MTUY34o5MYV08Oiw@z>

> linux, would be reasonably general purpose.  In particular, being able
> to allocate large pages (64 KB tiles on O2) at any time, no matter how

I assume you mean physical tiles. 64K tiles on Linux is actually quite tricky
- creating them and allocating them is ok its the fact theres no current
vm way to say move this and make me a tile.  (the kernel allocated objects
arent a problem as the kernel can allocate drawing from tiles itself)

>      In graphics, if linux winds up with an IRIX-compatible kernel
> graphics driver on some SGI boxes, the IRIX Xsgi, libgl.so, and
> libGL.so platform-specific binaries could run on linux.  Note that

This is certainly a very good starting basis but its not a "complete" 
answer. Also of course one day Indy + IRIX always together wont be an
automatic fact - I dont actually believe it is in the EEC right now anyway


Alan
