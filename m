Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0yIMD7-000aNgC@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: MIPS 2.1.89 now in CVS
Date: Thu, 26 Mar 1998 23:37:25 +0000 (GMT)
In-Reply-To: <19980327000426.03461@alpha.franken.de> from "Thomas Bogendoerfer" at Mar 27, 98 00:04:26 am
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: ralf@uni-koblenz.de, linux@cthulhu.engr.sgi.com, willmore@cig.mot.com
Message-ID: <19980326233725.26DcXzOOrHRKE0_ZiNddad87QgQ9fxh7M1MWxJkJrI8@z>

> PC DMA controller it will be dead slow and a horror to implement (welcome
> to world of 64K segments). If the board has it's own DMA engine, you need
> documentation for it. And without DMA you will need a new driver.

Can anyone working on generic 53c9x support also talk to the Linux mac folks
who are also working on this right now. Incidentally we'll also be wanting
to abuse the mips sonic driver soon too 8)
