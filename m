Received: from smtp102.biz.mail.re2.yahoo.com ([68.142.229.216]:40315 "HELO
	smtp102.biz.mail.re2.yahoo.com") by ftp.linux-mips.org with SMTP
	id S8133503AbVJUPar (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 21 Oct 2005 16:30:47 +0100
In-Reply-To: <DAF42D2FFC65A146BAB240719E4AD214C212BF@gbrwgceumf02.eu.xerox.net>
References: <DAF42D2FFC65A146BAB240719E4AD214C212BF@gbrwgceumf02.eu.xerox.net>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-ID: <b5be2c8d31c8718aca3d0ee3223abe7e@embeddedalley.com>
Content-Transfer-Encoding: 7bit
From: Dan Malek <dan@embeddedalley.com>
Subject: Re: au1x00 usb device status
Date: Fri, 21 Oct 2005 11:36:27 -0400
Return-Path: <dan@embeddedalley.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Hamilton, Ian" <Ian.Hamilton@xerox.com>
Cc: 'linux-mips@linux-mips.org'MIPSlinux-mips@linux-mips.org
Message-ID: <20051021153627.zlVLTXDRdlPWz09xuGYmuzX-0DIGYCbi32FgKezCga4@z>


On Oct 21, 2005, at 9:17 AM, Hamilton, Ian wrote:

> Is there a full description of the timing problem somewhere on the web?
> In particular, how quickly does the interrupt need to be serviced?

There are two major challenges (and many minor ones).
The major challenges are timing related.  First, the USB status
is not cumulative, if you can't service the interrupt within the
latency of the next status change, you lose. The second challenge
is the management of the data flow.  You need to turn around
DMA buffers very quickly, as the FIFO is small.  If you happen
to DMA a power of 2 size that matches what you just told the FIFOs,
you then have to also do a zero length DMA to properly terminate
the transfer on the USB.  To reduce the latency of DMA processing,
I was considering not using the general DMA functions, but
rather implementing custom versions of the DMA functions in
the USB driver.  This will reduce the latency window, but not
eliminate it.  Oh yeah, there is also an "old" and "new" version
of this peripheral in the Au1100.  The new one tried to address
some of the problems, and it helped a little.  If you code to
the "old" interface, I believe it will work on all silicon (with
challenges), but if you detect the new silicon it's a little easier
to meet the latency requirements.  However, I could always
find too many cases where the interrupt latency of Linux
just caused us to miss interrupts and lose the USB state.
The Gadget interface is really nice, but the additional
indirection of the software layers makes the problems
even more challenging.

Good Luck.  I've been there and don't care to visit again.


	-- Dan
