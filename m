Subject: Re: aic7xxx (O2 scsi) DMA coherency
Date: Thu, 3 Jan 2002 21:57:15 +0000 (GMT)
In-Reply-To: <Pine.LNX.4.21.0201032233400.8906-200000@melkor> from "Vivien Chappelier" at Jan 03, 2002 10:34:52 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E16MFrP-00018Z-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Vivien Chappelier <vivien.chappelier@enst-bretagne.fr>
Cc: Ralf Baechle <ralf@oss.sgi.com>, linux-mips@oss.sgi.com
Message-ID: <20020103215715.esrnukBxAZqkm6bg9Kq4fv5YIcU-O8rXlYSqzsPYpz8@z>

> 	This tells the aic7xxx to use DMA safe memory for I/O.

That seems totally inappropriate. The unchecked dma option is for
ancient ISA DMA controllers that didnt do the 16Mb check. If you
find you need it debug your pci remapper
