Subject: Re: Filesystem corruption
Date: Mon, 5 Feb 2001 13:01:33 +0000 (GMT)
In-Reply-To: <Pine.GSO.4.10.10102051356090.1124-100000@escobaria.sonytel.be> from "Geert Uytterhoeven" at Feb 05, 2001 01:56:53 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E14PlGy-0003IW-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Ralf Baechle <ralf@oss.sgi.com>, Carsten Langgaard <carstenl@mips.com>, linux-mips@oss.sgi.com
Message-ID: <20010205130133.TqDhp_d3S8votu__fIqHMeyV0QPrNMqgfhpsVBlt6DI@z>

> Is the zero page mapped on non-m68k architectures?

It can certainly be hit by DMA and kernel memory ops

> > I dont believe any 2.4 is currently 'safe'
> Ugh...

We'll get there, its doing pretty well for most folks
