Subject: Re: [patch] linux 2.4.17: An mb() rework
Date: Thu, 31 Jan 2002 23:38:54 +0000 (GMT)
In-Reply-To: <Pine.LNX.3.96.1020131110531.13418A-100000@wakko.deltatee.com> from "Jason Gunthorpe" at Jan 31, 2002 01:35:42 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E16WQn9-0003XW-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: jgg@debian.org
Cc: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, linux-mips@fnet.fr, linux-mips@oss.sgi.com
Message-ID: <20020131233854.8Pwn_ZaKK_sMJPxYAWxvXiFn5B_-pcXQwnUM1s8c1qc@z>

> A little more qualification would be that:
>     write(...,device);   // Disable int
>     wmb()
>     enable_ints();
> Is expected to have a potential spurious interrupt. But, perhaps this is
> OK:
>     outl(...,device);
>     wmb();
>     enable_ints();
> This is consistant with how the PCI spec discusses ordering/etc and
> barriers are frequently used in the PCI drivers. Looking at the i386 code
> this is what I would expect to see.
> 
> Anyone know for sure?

The x86 behaviour forced as I understand it is

	barrier()		-	compiler level store barrier
	rmb()			-	read barrier to bus/DMA level
					[no operation]
	wmb()			-	write barrier to bus/DMA level
					[synchronizing instruction sequence
					 of locked add of 0 to stack top]

	(mb and wmb as names come from Alpha so I guess its definitive 8))

It does not enforce PCI posting. Also your spurious interrupt case is
wrong for other horrible reasons. Interrupt delivery must never be 
assumed to be synchronous in a portable driver. (In fact you'll see async
irq delivery on an X86)
