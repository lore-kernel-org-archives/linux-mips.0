Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0wrT66-0005FxC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: SGI 68k machines?
Date: Thu, 24 Jul 1997 19:58:46 +0100 (BST)
In-Reply-To: <199707241300.PAA12689@informatik.uni-koblenz.de> from "Ralf Baechle" at Jul 24, 97 03:00:21 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Cc: knobi@munich.sgi.com, linux@cthulhu.engr.sgi.com
Message-ID: <19970724185846.40zTJD64MPbn6_Uhapk2xVbTizsN4H_9wTuDpAv_Gu8@z>

> >  Build from 83/84 until probably 88. Not a bad system for
> > that time.
> 
> I wonder if there is still documentation for these beasts around such
> that some dino freak can hack Linux for them?

Linux 68K current has an absolute need for an FPU. Thats one of the big
macintrash problems we are facing as the 68LC040 not only has no FPU but
for many motorola broke the exception handling so you can't even emulate it

Alan
