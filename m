Message-ID: <008901c415d0$3a94d5f0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <4068809F.8070103@murphy.dk> <4068864D.1020209@realitydiluted.com>
Subject: Re: BUG in pcnet32.c?
Date: Mon, 29 Mar 2004 22:55:52 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Steven J. Hill" <sjhill@realitydiluted.com>, Brian Murphy <brian@murphy.dk>
Cc: linux-mips@linux-mips.org
Message-ID: <20040329205552.9fsX-kxnzlaPOOdS1SbxGwt_kvmbOTrkO1lakwGV1zI@z>

> Excellent. So my new BUG code detected another bad network driver. Your network
> driver is broken and it needs fixed. I will refer you to these posts between
> Jeff Garzik and myself when I found a similar issue on the 'natsemi.c' driver.
> Mapping a PCI address with length zero is a BUG, period. You length should
> be the maximum RX buffer length + 2. You will see from the patches in the
> messages below that this is for IP header alignment. Good luck and please let
> use know how it turns out.

Which reminds me of something I've been meaning to mention for a while.
Back in the dark days of Linux 2.2 on MIPS, I discovered that a number
of network drivers were subtly broken for MIPS because they allocated
enough extra space for IP header alignment, but not for cache line alignment.
Particularly on CPUs with write-back caches, it can be a Bad Thing if a cache 
line straddles two packet buffers, as the flush of one can cause the other to be
clobbered.  I had to redefine the alignment constant for MIPS to be a function
of the line size to have 100% solid operation of the Tulip and pcnet32 drivers.

The whole network driver cache management paradigm was redone for 2.4,
and I've often wondered whether the same potential problem exists, but never
had the time to go in and check.

There, I've mentioned it.  My conscience is clear.  ;o)
