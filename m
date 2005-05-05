Subject: Re: pcmcia-cs package for linux-mips 2.6.10?
From: Pete Popov <ppopov@embeddedalley.com>
Reply-To: ppopov@embeddedalley.com
In-Reply-To: <9DFF23E1E33391449FDC324526D1F259024380C7@sjc1exm02.pmc_nt.nt.pmc-sierra.bc.ca>
References: <9DFF23E1E33391449FDC324526D1F259024380C7@sjc1exm02.pmc_nt.nt.pmc-sierra.bc.ca>
Content-Type: text/plain
Date: Thu, 05 May 2005 15:46:53 -0700
Message-ID: <1115333213.5820.104.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <ppopov@embeddedalley.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Kiran Thota <Kiran_Thota@pmc-sierra.com>
Cc: "'linux-mips@linux-mips.org'" <linux-mips@linux-mips.org>, "'linux-pcmcia@lists.infradead.org'" <linux-pcmcia@lists.infradead.org>
Message-ID: <20050505224653.x3ZaCf-vovz8VHtalkBLxu3w9EgTJxbKagtJE-yggYY@z>

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
