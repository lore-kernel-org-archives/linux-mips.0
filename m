Received: from bby1mta03.pmc-sierra.com ([216.241.235.118]:45383 "EHLO
        bby1mta03.pmc-sierra.bc.ca" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491112Ab0FBIKb convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 2 Jun 2010 10:10:31 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="US-ASCII"
Content-Transfer-Encoding: 8BIT
Subject: RE: TITAN GE driver
Date: Wed, 2 Jun 2010 01:10:17 -0700
Message-ID: <A7DEA48C84FD0B48AAAE33F328C0201404E2DC94@BBY1EXM11.pmc_nt.nt.pmc-sierra.bc.ca>
In-Reply-To: <20100528162722.GB7148@linux-mips.org>
References: <A7DEA48C84FD0B48AAAE33F328C0201404E2D834@BBY1EXM11.pmc_nt.nt.pmc-sierra.bc.ca> <20100528162722.GB7148@linux-mips.org>
From: "Anoop P.A." <Anoop_P.A@pmc-sierra.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips <linux-mips@linux-mips.org>
Message-ID: <20100602081017.Scslj1eROEnXLrzoWVrGmwJ0-_XvOJ9Un7hapBp5ZrM@z>

Hi,

From the datasheets and design discussion it looks like prefix has been
designed to be static i.e they are expecting all buffers to get
allocated with same prefix. In another words all the buffers should be
below < 0x1fff_ffff ( physical address) or between 0x2000_0000 and
0x3fff_ffff like that.

Is there any way to force kmalloc to allocate memory in certain region
or below some region?

Thanks
Anoop

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org
[mailto:linux-mips-bounce@linux-
> mips.org] On Behalf Of Ralf Baechle
> Sent: Friday, May 28, 2010 9:57 PM
> To: Anoop P.A.
> Cc: linux-mips
> Subject: Re: TITAN GE driver
> 
> On Thu, May 27, 2010 at 10:51:47PM -0700, Anoop P.A. wrote:
> 
> > Any body used titan GE device with more than 512MB physical memory?
> >
> >
> >
> > If buffer is getting allocated above physical address 0x1fff_ffff (
ie.
> > 30 bit buffer address) we may have to consider setting
XDMA_BUFFADDRPRE
> > (0x5018 ) .This is not taken care in original driver.  Any body had
luck
> > in enabling this prefix. I have tried enabling it and I could do
flood
> > ping with out packet loss. However when I do mass data transfer
kernel
> > getting panic. Further investigation showed kenel panics because DMA
> > copies data to wrong address (which is being used).
> 
> The driver has not been used in ages so it's generally in a sad shape,
> doesn't even compile.  I think nobody touched this driver seriously in
> 5 years, probably longer.  So it's sort of expected to eat your cat or
> do other nasty stuff.
> 
>   Ralf
