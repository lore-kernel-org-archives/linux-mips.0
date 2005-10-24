Received: from wvmler3.mail.xerox.com ([13.8.138.218]:18352 "EHLO
	wvmler3.mail.xerox.com") by ftp.linux-mips.org with ESMTP
	id S3465639AbVJXJmG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Mon, 24 Oct 2005 10:42:06 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: au1x00 usb device status
Date: Mon, 24 Oct 2005 10:40:37 +0100
Message-ID: <DAF42D2FFC65A146BAB240719E4AD214C21486@gbrwgceumf02.eu.xerox.net>
From: "Hamilton, Ian" <Ian.Hamilton@xerox.com>
Return-Path: <Ian.Hamilton@xerox.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Dan Malek <dan@embeddedalley.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20051024094037.nahON8pcF3T3BXaVFlvj07IWb_d2Dt_MLzJtdmzGTgU@z>

Thanks Dan, that's very helpful.

I haven't seen anything in the drivers/usb/gadget directory which
looks like an au1100 driver, so if you could send me any code you
have, I'd be grateful :-)

Cheers,
Ian.

-----Original Message-----
From: Dan Malek [mailto:dan@embeddedalley.com] 
Sent: 21 October 2005 16:36
To: Hamilton, Ian
Cc: 'linux-mips@linux-mips.org' MIPS
Subject: Re: au1x00 usb device status


On Oct 21, 2005, at 9:17 AM, Hamilton, Ian wrote:

> Is there a full description of the timing problem somewhere on the
web?
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
