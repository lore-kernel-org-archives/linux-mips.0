Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0yIMgk-000aNgC@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: MIPS 2.1.89 now in CVS
Date: Fri, 27 Mar 1998 00:08:00 +0000 (GMT)
In-Reply-To: <19980327004757.19715@alpha.franken.de> from "Thomas Bogendoerfer" at Mar 27, 98 00:47:57 am
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: alan@lxorguk.ukuu.org.uk, ralf@uni-koblenz.de, linux@cthulhu.engr.sgi.com, willmore@cig.mot.com
Message-ID: <19980327000800.avsbtQ1P83OjKJw3KqdK20QyzSKCNjvwLp3PtymubNg@z>

> the 53c9x mips support is a "port" of the sparc esp driver, which I did
> based on work from the m68k people (fastlane, blizzard, etc.). And I also
> verified that the changed esp still runs on a Sparc (at least on my SS2).

Thats the same path the Mac people are taking

> So I should put fixing it higher on my todo list:-) ? It still has problems
> with real network traffic. I know the reason, but didn't have time to fix
> it, yet.

Not instantly but the later macs use the sonic (the nubus plugin cards are
all NE2000's in disguise)
