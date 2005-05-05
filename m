Message-ID: <9DFF23E1E33391449FDC324526D1F259024380C8@sjc1exm02.pmc_nt.nt.pmc-sierra.bc.ca>
From: Kiran Thota <Kiran_Thota@pmc-sierra.com>
Subject: RE: pcmcia-cs package for linux-mips 2.6.10?
Date: Thu, 5 May 2005 16:32:02 -0700 
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Kiran_Thota@pmc-sierra.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "'ppopov@embeddedalley.com'" <ppopov@embeddedalley.com>
Cc: "'linux-mips@linux-mips.org'" <linux-mips@linux-mips.org>, "'linux-pcmcia@lists.infradead.org'" <linux-pcmcia@lists.infradead.org>
Message-ID: <20050505233202.AHBKh5HWP4By13Gzk69Col7S9jTfPFL3ENh5Na-00FI@z>

I m trying to build memory_cs.o as a module.
It aint available in kernel. What do i do?

-----Original Message-----
From: Pete Popov [mailto:ppopov@embeddedalley.com]
Sent: Thursday, May 05, 2005 3:47 PM
To: Kiran Thota
Cc: 'linux-mips@linux-mips.org'; 'linux-pcmcia@lists.infradead.org'
Subject: Re: pcmcia-cs package for linux-mips 2.6.10?


On Thu, 2005-05-05 at 15:43 -0700, Kiran Thota wrote:
> 
> I have downloaded pcmcia-cs package v3.2.8 [David Hinds] from sourceforge.
> The  Configure file doesnt have anything for MIPS. I tweaked Configure
> and config.mk step-by-step and could get cardmgr/ to compile but wasnt
> successful with clients/
> 
> Is there any patch for MIPS? linux-mips 2.6.10 to be specific? Can you point
> me to its porting to MIPS?

Use the in-kernel client drivers instead. All you need from the pcmcia-
cs package is the userland utilities.

Pete
