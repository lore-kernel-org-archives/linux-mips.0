content-class: urn:content-classes:message
Subject: RE: User-mode drivers and TLB
Date: Tue, 23 Sep 2003 09:41:24 -1000
Message-ID: <DC1BF43A8FAE654DA6B3FB7836DD3A56DEB753@iris.adtech-inc.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
From: "Finney, Steve" <Steve.Finney@SpirentCom.COM>
Return-Path: <Steve.Finney@SpirentCom.COM>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Dominic Sweetman <dom@mips.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20030923194124.35t0AnDYo-tMuMy82xmbWf-VHmw2aGasBPab1U_ktfM@z>

> 
> Most MIPS CPU hardware allows you to map large chunks of memory with a
> single TLB entry: often up to 16Mbytes at a time.  But I don't know
> how you'd persuade Linux how to do that.
> 
> --
> Dominic Sweetman
> MIPS Technologies.

Thanks: for what it's worth, the Broadcom/Sibyte apparently allows a TLB entry to map 128 MB (the max mapped size is 64 MB, but the TLB entries are paired). And supposedly the MIPS kernel tree was recently updated with some support for Linux to use wired TLB entries on the Broadcom, though I haven't tried this.

sf
