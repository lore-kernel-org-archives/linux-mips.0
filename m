Received: from wbmler1.mail.xerox.com ([13.13.138.216]:18375 "EHLO
	wbmler1.mail.xerox.com") by ftp.linux-mips.org with ESMTP
	id S3465587AbVJUODG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 21 Oct 2005 15:03:06 +0100
Received: from wbmlir2.mail.xerox.com (wbmlir2.mail.xerox.com [13.131.8.222])
	by wbmler1.mail.xerox.com (8.13.4/8.13.1) with ESMTP id j9LE33m3020807
	for <linux-mips@linux-mips.org>; Fri, 21 Oct 2005 10:03:03 -0400
Received: from wbmlir2.mail.xerox.com (localhost [127.0.0.1])
	by wbmlir2.mail.xerox.com (8.13.4/8.13.1) with ESMTP id j9LE2NjN027828
	for <linux-mips@linux-mips.org>; Fri, 21 Oct 2005 10:02:23 -0400
Received: from usa7061gw02.na.xerox.net (usa7061gw02.na.xerox.net [13.151.32.4])
	by wbmlir2.mail.xerox.com (8.13.4/8.13.1) with ESMTP id j9LE1sCs027456
	for <linux-mips@linux-mips.org>; Fri, 21 Oct 2005 10:02:23 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: au1x00 usb device status
Date: Fri, 21 Oct 2005 15:01:35 +0100
Message-ID: <DAF42D2FFC65A146BAB240719E4AD214C212F3@gbrwgceumf02.eu.xerox.net>
From: "Hamilton, Ian" <Ian.Hamilton@xerox.com>
Return-Path: <Ian.Hamilton@xerox.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Cc: linux-mips@linux-mips.org
Message-ID: <20051021140135.j9DsZpQ6D2jVb3H-spgdhR1ONNvTucsGdKvQ6sgl31c@z>

Hi Rodolfo.

> Are you implemented any Gadget support? Or are you just using the
> tty/raw emulation?

I'm a USB novice, so I'm not sure about this yet. The USB device port is
used
as a communication port to another board, so I guess a tty/raw emulation
would be appropriate, but I don't yet know how it was implemented on the
2.4
kernel. I'm still trying to understand the code.

I was hoping it would be a straight copy from 2.4 to 2.6, but clearly it
isn't :-(

Still, it is an opportunity to learn about USB :-)

Cheers,
Ian.
