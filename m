Subject: Re: indy scsi
Date: Wed, 8 May 2002 14:37:43 +0100 (BST)
In-Reply-To: <20020508144247.A2023@ugyvitelszolgaltato.hu> from "Szabo Attila" at May 08, 2002 02:42:47 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E175RdX-0001aT-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Szabo Attila <trial@ugyvitelszolgaltato.hu>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020508133743.eF4FpHEvu0z0StuxlAS4N6rYfwb0F6_D-dUBVYoMmv0@z>

> Yes, I know all of that, and I've expected only max 3-5 MB/sec but not
> 1.7.
> The scsi bandwith on indy is 10MB/s, the disk is above 10 MB/s.
> Maybe I expect too much

An old 2Gb 5400 RPM drive ought to deliver about 2Mbytes/second data rates.
The 1.7 sounds suprisingly low unless the driver code doesn't support 
disconnect and scsi2 tagged stuff. For an old NCR538x/9x device without
those it sounds all too believable.

Alan
