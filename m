Received: from wbmler1.mail.xerox.com ([13.13.138.216]:64673 "EHLO
	wbmler1.mail.xerox.com") by ftp.linux-mips.org with ESMTP
	id S8133440AbVJUNTG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 21 Oct 2005 14:19:06 +0100
Received: from wbmlir1.mail.xerox.com (wbmlir1.mail.xerox.com [13.131.8.221])
	by wbmler1.mail.xerox.com (8.13.4/8.13.1) with ESMTP id j9LDJ40P019237
	for <linux-mips@linux-mips.org>; Fri, 21 Oct 2005 09:19:05 -0400
Received: from wbmlir1.mail.xerox.com (localhost [127.0.0.1])
	by wbmlir1.mail.xerox.com (8.13.4/8.13.1) with ESMTP id j9LDIEbt001565
	for <linux-mips@linux-mips.org>; Fri, 21 Oct 2005 09:18:14 -0400
Received: from usa7061gw02.na.xerox.net (usa7061gw02.na.xerox.net [13.151.32.4])
	by wbmlir1.mail.xerox.com (8.13.4/8.13.1) with ESMTP id j9LDHvuW001186
	for <linux-mips@linux-mips.org>; Fri, 21 Oct 2005 09:18:14 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: FW: Re: au1x00 usb device status
Date: Fri, 21 Oct 2005 14:17:08 +0100
Message-ID: <DAF42D2FFC65A146BAB240719E4AD214C212BF@gbrwgceumf02.eu.xerox.net>
From: "Hamilton, Ian" <Ian.Hamilton@xerox.com>
Return-Path: <Ian.Hamilton@xerox.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Cc: linux-mips@linux-mips.org
Message-ID: <20051021131708.HBeFCq8scX1HVQmIgQs1wRThbbFD_in-J6HUx2-eL0E@z>

Hi Pete and Rodolfo.

I also need to get the device USB port working on an au1100 board.

We have code running under a 2.4 kernel working on this board, and I'm
currently porting the code to a 2.6 kernel.

The USB device port seems to work OK for us with the 2.4 kernel.


Pete,

Is there a full description of the timing problem somewhere on the web?
In particular, how quickly does the interrupt need to be serviced?


Rodolfo,

Have you done any more work on this, or are you giving it up as a lost
cause?


Cheers,
Ian



On Thu, 2005-10-06 at 17:47 +0200, Rodolfo Giometti wrote:
> On Thu, Oct 06, 2005 at 08:32:52AM -0700, Pete Popov wrote:
> > USB Host should be working fine. USB Gadget on the
Au1000,1100,1500,1550
> > just won't happen due to hw limitations. USB host and gadget on the
1200
> 
> Thanks for your answer!
> 
> Can you please explain to me (in brief :) which hw limitations are you
> talking about? Do you mean that usb device support in Linux cannot be
> implemented, or just that this can be done but with some restriction?

Timing issues with the Au1x00 (not the au1200) make the Linux gadget
implementation extremely difficult to support. If you don't service the
usb interrupt within a certain amount of time, you lose the status and
the gadget loses its state.

Pete
