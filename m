Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0x93di-0005FjC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: Linux/SGI: MAP_AUTOGROW, F_ALLOCSP
Date: Thu, 11 Sep 1997 08:26:10 +0100 (BST)
In-Reply-To: <199709110216.TAA26791@fir.engr.sgi.com> from "William J. Earl" at Sep 10, 97 07:16:48 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: "William J. Earl" <wje@fir.engr.sgi.com>
Cc: miguel@nuclecu.unam.mx, linux@fir.engr.sgi.com
Message-ID: <19970911072610.-qT4qQbPcfcLeHTumikL_oHPCUW3TU2SLba5iRJV0lc@z>

>      This seems reasonable enough.  This code supports the "shm" shared
> memory transport of Xsgi; other process mmap() the file to communicate
> with the server.  It is something of a hack (being not particularly secure).

So you use mmap() based XShm rather than the SYS5 ipc based shm Linux currently
uses. Makes some sense. As to secure well last time I looked nobody had yet
fixed the auth bug so X and security aren't related anyway
