Message-ID: <011a01c30aab$b7748ce0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.LNX.4.44.0304241613190.18155-100000@frank.harvard.edu>
Subject: Re: NCD900 port?
Date: Thu, 24 Apr 2003 23:51:41 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Chip Coldwell <coldwell@frank.harvard.edu>, linux-mips@linux-mips.org
Message-ID: <20030424215141.cBdaqC_YWImF_Ow7reeial9m-xNitgufhiWrHtXmGto@z>

> I'm facing a ~$1K site license charge for NCD's NCBridge software for
> their NC948 X Terminals, and since my site consists of exactly three
> of these things that I bought for less than $250 each I'm balking a
> bit.
> 
> The NC948 consists of a 165 MHz QED RM5231, S3 Savage4 graphics
> controller, and an AMD PCnet NIC of some sort.  It doesn't seem like
> there's anything in that set that Linux or XFree86 wouldn't be happy
> to run.

What PCI bridge is being used?  Galileo?

> To be completely explicit what I'm proposing is to run Linux on the X
> Terminal (as opposed to the server that provides boot image, xdm,
> etc.).  My question is: has anybody done it or does anybody know a
> reason why it can't be done?

I think it's probably doable, but if you want two reasons 
why it might not be, I'd say they would be:
1) Undocumented/unsupported PCI or other interface
2) Not enough RAM
