Subject: Re: ISA
Date: Wed, 19 Dec 2001 13:59:40 +0000 (GMT)
In-Reply-To: <Pine.GSO.4.21.0112191046380.28694-100000@vervain.sonytel.be> from "Geert Uytterhoeven" at Dec 19, 2001 10:52:47 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E16GhG0-0002zb-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, Jun Sun <jsun@mvista.com>, jim@jtan.com, Linux/MIPS Development <linux-mips@oss.sgi.com>
Message-ID: <20011219135940.eac6HsW7Z36dwpiz5dIBNS7z13ImGfS9dFQu_-eO5jg@z>

> You must _not_ use readb()/writeb() and friends with ISA memory space!
> You must use isa_readb()/isa_writeb() and friends!

Linus is saying the reverse. Drivers are moving away from isa_

> But for memory accesses, ISA memory space is not necessarily at `address 0'.

ioremap uses ookies, its up to yoyu what you hide in the cookie from an ISA
ioremap
