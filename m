Subject: Re: aic7xxx (O2 scsi) DMA coherency
Date: Thu, 3 Jan 2002 22:34:55 +0000 (GMT)
In-Reply-To: <Pine.LNX.4.21.0201032247490.9064-100000@melkor> from "Vivien Chappelier" at Jan 03, 2002 10:51:51 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E16MGRs-0001If-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Vivien Chappelier <vivien.chappelier@enst-bretagne.fr>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Ralf Baechle <ralf@oss.sgi.com>, linux-mips@oss.sgi.com
Message-ID: <20020103223455.B6If7-tB9Y6d4A0E34l1eu_AZIV1dgllKTvRd4vxq5Y@z>

> scsi_result0[256]; in scan_scsis) instead of kmallocating it DMA safe as
> it should on non-coherent systems. Maybe this is the thing to change?

Please fix that - thats a real bug. Actually you may find the PPC64 people
(Anton and co) already have a patch you can use
