Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0xd2Na-0005FtC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: Linux on the O2
Date: Wed, 3 Dec 1997 00:09:26 +0000 (GMT)
In-Reply-To: <Pine.LNX.3.95.971202161948.10955B-100000@vertigo.cs.indiana.edu> from "cypher" at Dec 2, 97 04:50:40 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: cypher <cypher@vertigo.cs.indiana.edu>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19971203000926.fm6KaVooNc9R0jEfZasi9pD3YAUroAxwd94xbGneqEA@z>

> I'm guessing that they're looking at this as if an Indy running Linux
> won't really be that competetive with the O2s runnning IRIX, which I can
> almost understand. 

Ah conspiracy theories abound. It could just be they didnt want anyone
cloning their hardware

> I realize that SGI has a vested interest in seeing IRIX succeed, and IRIX
> is probably (it hurts to say this) better than Linux when running 128 (or
> soon 4096) CPUs. Linux however, is great lightweight OS for workstations

Right now Linux scales to about 2-3 CPU's for generic stuff in 2.1.x maybe
4 if the hardware is sane (eg Ultrasparc). To go to 128-4096 CPU's really
involves changing the fundamental rules and building a sort of very tightly
interlinked multicomputer - AP1000+ on steroids as it were. There is some
interest in this from various people, notably in sticking 9 or 10 EBSA285
Digital strongarm boards in a PCI backplane and using PCI bus as the 
backbone network.

Alan
