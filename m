Subject: Re: ISA
Date: Tue, 1 Jan 2002 20:13:16 +0000 (GMT)
In-Reply-To: <20020101112223.A14847@mvista.com> from "Jun Sun" at Jan 01, 2002 11:22:23 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E16LVHh-0001LU-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>
Cc: Jim Paris <jim@jtan.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, Linux/MIPS Development <linux-mips@oss.sgi.com>
Message-ID: <20020101201316.aABVaPmMdhWNMVueTeqNZp4dXWV04AMUR3td-BUYjW0@z>

> >     check_mem_region(virt_to_phys(ioremap(ISA_address)), ...)
> > 
> > which might be the best way for now? 
> 
> I agree with Geert and think isa_xxx_mem_region is a better approach.
> Unfortunately, this requires a change in both dirver and
> arch-specific part.

Its something that can be done progressively however as we fixup stuff.
It'll just "happen" to work on x86 either way.

Alan
