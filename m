Subject: Re: ISA
Date: Fri, 21 Dec 2001 16:12:40 +0000 (GMT)
In-Reply-To: <Pine.GSO.4.21.0112191456410.28777-100000@vervain.sonytel.be> from "Geert Uytterhoeven" at Dec 19, 2001 03:06:32 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E16HSHp-0000ay-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, Jun Sun <jsun@mvista.com>, jim@jtan.com, Linux/MIPS Development <linux-mips@oss.sgi.com>
Message-ID: <20011221161240.x7zXMeyju6pr1AFw_u9AKMs8Rcip5LLHOAEjTbdcHvU@z>

> But what about request_mem_region() and friends? How can I distinguish between
> ISA memory and the first 16 MB of RAM (or ROM, or whatever my board has there)?
> 
> Or am I not supposed to let those things show up in /proc/iomem?

Interesting - I'd not considered that. Is ISA and non ISA space seperate on
MIPS or is it all rather ambiguous ?
