Subject: Re: NFS root with cache on
Date: Mon, 5 Feb 2001 21:39:51 +0000 (GMT)
In-Reply-To: <20010205115026.C2487@bacchus.dhis.org> from "Ralf Baechle" at Feb 05, 2001 11:50:26 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E14PtMY-0004Ei-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: Jun Sun <jsun@mvista.com>, Quinn Jensen <jensenq@Lineo.COM>, linux-mips@oss.sgi.com
Message-ID: <20010205213951.5EPudzxFsRXeZh4kq4tcSC89YVw7ckeFZwDK1mBoEbI@z>

> On Mon, Feb 05, 2001 at 10:07:18AM -0800, Jun Sun wrote:
> 
> > Did you set rx_copybreak to 1518?  I sent patches long time ago to the driver
> > authors for MIPS, but I am not sure they are not there.
> 
> Copybreak is just an optimization.  So even with this unused or set to a
> wrong value the driver should work.

If you set it wrongly you can get network failures/stalls. The normal cases
are not a problem however. You need to copybreak small frames to avoid filling
the socket queue with empty spaces. Some platforms set it to 1518 to force
a copy thereby aligning the IP header on a 4 byte boundary, which most
PCI bus master drivers wont do if you are not copying
