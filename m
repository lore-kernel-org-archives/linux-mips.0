Received: from blu139-omc1-s10.blu139.hotmail.com ([65.55.175.150]:38923 "EHLO
	blu139-omc1-s10.blu139.hotmail.com") by ftp.linux-mips.org with ESMTP
	id S20030868AbXLGABM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 7 Dec 2007 00:01:12 +0000
Message-ID: <BLU127-W9F2B1A00F26057FD989498A680@phx.gbl>
From: Nathan Eggan <nathan_eggan@live.com>
Subject: Re: Bug in Au1x00 UART or USB drivers for 2.6 kernels?
Date: Fri, 7 Dec 2007 00:00:44 +0000
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <nathan_eggan@live.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips mailing list <linux-mips@linux-mips.org>
Message-ID: <20071207000044.zSYhulio5iaYaBrDPOZNBtxcua6VWCGWcSzjKoCBXow@z>


A'ight... I just finished pulling down a copy of the Linux-mips kernel 2.6.23.9 and building it for my DBAu1500.  I was hoping this would fix the issue I'm experiencing with the serial ports and the USB bus.  (For those that didn't catch the previous emails, I'm suffering byte substitution in a very regular pattern on the Au1500's UARTs when I put activity on the USB bus.)

Unfortunately, the new kernel appears to have no effect.  :(  It performs the same as the previous.

For the record, my tested setup was:
- Linux 2.6.23 with the MIPS patches
- Busybox 1.7.3 (doubt this is relevant)
- compiled with uClibc-0.9.28 & gcc-3.4.5 (this probably isn't relevant either)

All the tests I've discussed to date were down with the test code previously included in this thread, and the serial port was set for 115,200bps 8-N-1.  (I've heard the 115k number can be taboo for some unknown reason, but we really need the speed on the UART.  :(  (It's already slow enough!)  So, I'm not sure too many folks would be happy if I halve it 56k to try to make it work.

A few other notes:
- As previously stated, a 2.4.26 kernel I tried worked fine; so this looks to be a 2.6 kernel issue.  (I've now tried 2.6.17, 2.6.21, and 2.6.23.9 and all have the same issue.)
- I also tried using an FTDI USB-to-serial dongle and experienced NO errors.  So, this is clearly an interplay issue between the UART and the USB bus.

Any other others?

Thanks again!
Nate
_________________________________________________________________
Put your friends on the big screen with Windows Vista® + Windows Live™.
http://www.microsoft.com/windows/shop/specialoffers.mspx?ocid=TXT_TAGLM_CPC_MediaCtr_bigscreen_102007
