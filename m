Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: kck@mailbox.esd.sgi.com (Ken Klingman)
Message-ID: <199901200236.SAA12779@mailbox.esd.sgi.com>
Subject: Re: [Fwd: linus.linux.sgi.com]
Date: Tue, 19 Jan 1999 18:36:03 -0800 (PST)
In-Reply-To: <9901191828.ZM20761@morgaine.engr.sgi.com> from "Richard Offer" at Jan 19, 99 06:28:50 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Richard Offer <offer@morgaine.engr.sgi.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19990120023603.W_-f39VIDah__rCVXU61us9W4ewA-potGiLf87fel0U@z>


The VW 320 and 540 use 288-bit wide synchronous DRAM, clocked
at 100MHz.  288 bits means it's not your everyday PC SDRAM.
That's 256 bits for data and 32 for ECC.  256bits = 32 bytes
at 100MHz = 3.2GB/sec theoretically possible between the 
memory system and Cobalt, the memory controller/graphics
ASIC.

Ken
