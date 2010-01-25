Received: from bby1mta03.pmc-sierra.com ([216.241.235.118]:39900 "EHLO
        bby1mta03.pmc-sierra.bc.ca" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1493176Ab0AYRe6 convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 25 Jan 2010 18:34:58 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: 1 GB RAM with RM9000 SOC
Date: Mon, 25 Jan 2010 09:34:43 -0800
Message-ID: <A7DEA48C84FD0B48AAAE33F328C020140474B761@BBY1EXM11.pmc_nt.nt.pmc-sierra.bc.ca>
In-Reply-To: <4B5DD1A9.6020306@caviumnetworks.com>
References: <4B56475F.8070608@gmail.com> <20100124002352.GB3251@linux-mips.org> <A7DEA48C84FD0B48AAAE33F328C020140474B674@BBY1EXM11.pmc_nt.nt.pmc-sierra.bc.ca> <4B5DD1A9.6020306@caviumnetworks.com>
From: "Anoop P.A." <Anoop_P.A@pmc-sierra.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: David Daney <ddaney@caviumnetworks.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20100125173443.5OaJ1Oa_1O3chSiJxqRygHJcCy8D8fN4hPvJ6XWMpDU@z>

Hi David,

Thanks for the info. In which version of LMO kernel , I could find your
working source ?.

Thanks
Anoop

> -----Original Message-----
> From: David Daney [mailto:ddaney@caviumnetworks.com]
> Sent: Monday, January 25, 2010 10:45 PM
> To: Anoop P.A.
> Cc: linux-mips@linux-mips.org
> Subject: Re: 1 GB RAM with RM9000 SOC
> 
> Anoop P.A. wrote:
> > Hi list,
> >
> >
> >
> > Any of you successfully used >512MB ram with MIPS SOC's.
> 
> Does Cavium Octeon count as a MIPS SOC?  If so, then yes.
> 
> I have many boards with both 2GB and 4GB.  All of them Linux just fine
> when using all available RAM.
> 
> > I have a
> > requirement where I have to use 1 GB ram with RM9000 based SOC.
> >
> > I have enabled 64 Bit support and so far it is working with 512 MB
of
> > RAM. How ever if I increase memory beyond 512MB I am getting kernel
> > panic.
> >
> >
> >
> >  I am adding memory region from 0x00 add_memory_region(0 ,0x40000000
,
> > BOOT_MEM_RAM). (PMON maps RAM from 0x0 to 0x40000000)  Am I wrong
here?
> >
> >
> >
> > It will be great if you can give some suggestion /point me to a
working
> > implementation. I am using 2.6.18 kernel.
> >
> >
> >
> > Thanks
> >
> > Anoop
> >
> >
> >
> >
