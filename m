Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: kyriazis@jibe.engr.sgi.com (George Kyriazis)
Message-ID: <199809242359.QAA76554@jibe.engr.sgi.com>
Subject: Re: VINO
In-Reply-To: <19980924011207.09418@alpha.franken.de> from Thomas Bogendoerfer at "Sep 24, 98 01:12:07 am"
Date: Thu, 24 Sep 1998 16:59:06 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980924235906.7eknO7NMjy5-7VPPaKRxpjEi2a3dw6p1WWnIDgtuXw8@z>


> Is it possible to do VINO DMA directly to the newport ?
> 
As far as I know, you have to do it through memory.

To elaborate:  I believe you can program the DMA controller to copy
from VINO to the REX3 (read: from a fixed address to a fixed address),
but I doubt the data formats are compatible.  Ie, you'll be dumping
garbage to the REX3 registers.

  --george
-- 
-----------------------------------------------------------------------------
George Kyriazis  | Silicon Graphics, Inc., 8U-590 |  kyriazis@sgi.com
                 | 2011 N. Shoreline Blvd.        |  650-933-2828
                 | Mt. View, CA 94043             | 
