Subject: Re: [2.4 PATCH] pcnet32.c - tx underflow error
Date: Thu, 11 Jul 2002 03:16:03 +0100 (BST)
In-Reply-To: <3D2CCC83.6090304@mvista.com> from "Jun Sun" at Jul 10, 2002 05:08:35 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E17STUx-0008LR-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-mips@oss.sgi.com, Ralf Baechle <ralf@oss.sgi.com>, marcelo@conectiva.com.br
Message-ID: <20020711021603.HhlQCKtx35dt7qDfxKwaNaukfCnnYcq9Gk-GWHakTJE@z>

> I even suspect this is the default setting on PCI cards on PC.  Can someone 
> verify?  If that is the case, that will explain why driver never sets this 
> bit.  Maybe we don't have any "real computers" after all. :-)

Most PC hardware can deliver that kind of DMA guarantee. UDMA100 doesn't
work very well otherwise.
