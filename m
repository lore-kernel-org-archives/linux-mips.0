Received: from [220.76.242.187] ([220.76.242.187]:57493 "EHLO
	localhost.localdomain") by ftp.linux-mips.org with ESMTP
	id S8133349AbWFCDjM (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Sat, 3 Jun 2006 05:39:12 +0200
Message-ID: <000701c686be$fc1ac980$9d0ba8c0@mrv>
From: "Roman Mashak" <mrv@corecom.co.kr>
Subject: Tg3 driver problem on 2.6.12-rc3 (Sequoia)
Date: Sat, 3 Jun 2006 12:37:02 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="koi8-r";
	reply-type=original
Content-Transfer-Encoding: 7bit
Return-Path: <mrv@corecom.co.kr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Cc: Raj Palani <Rajesh_Palani@pmc-sierra.com>
Message-ID: <20060603033702.k3mYNUzOz1KGBRSrkmdwiAQc6kYmugpUJ-atrOJRYQU@z>

Hello,

a few days ago I was asking about bcm5700 driver problems and I got 
recommendations to use tg3 driver shipped with kernel. I did it and faced 
serious issues. Here's the story.

1) took 2.6.12-rc_L002 patched by PMC-sierra and compiled in 32bit mode
2) compiled tg3 driver as module
3) booted Sequoia board with this kernel
4) set up bridge between one of on-board interface (Titan GE) and Broadcom 
external NIC, get mysterious warning:

bridge: can't decode speed from eth2: 0

eth2 is Broadcom interface

5) at this stage I connect Sequoia's GE interfaces to SmartBit gigabit 
interfaces, to measure throughput between two gigabit links in bridge mode. 
So, both interfaces are working well (I can ping SmartBit and vice versa). 
But I traffic's coming only in one direction and never through the bridge, 
so 'brctl showmacs br0' always show only one SmartBit MAC address learned.

I configured bridge accroding to documentation (I made sure bridge is 
enabled in kernel):
#brctl addbr br0
#brctl addif br0 eth1    #titan GE
#brctl addif br0 eth2    #broadcom
#ifconfig eth1 0.0.0.0 up
#ifconfig eth2 0.0.0.0 up
#ifconfig eth1 0.0.0.0 up
#ifconfig br0 0.0.0.0 up

Has anybody observed the same behavior?

Thanks for any help!

With best regards, Roman Mashak.  E-mail: mrv@corecom.co.kr 
