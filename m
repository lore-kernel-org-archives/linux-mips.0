Received: from wip-ec-wd.wipro.com (localhost.wipro.com [127.0.0.1])
	by localhost (Postfix) with ESMTP id 225B120560
	for <linux-mips@linux-mips.org>; Wed,  6 Oct 2004 16:52:26 +0530 (IST)
Received: from blr-ec-bh1.wipro.com (unknown [10.200.50.91])
	by wip-ec-wd.wipro.com (Postfix) with ESMTP id 0266220551
	for <linux-mips@linux-mips.org>; Wed,  6 Oct 2004 16:52:26 +0530 (IST)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 8BIT
Subject: __up, __down_trylock & __down_interruptible for MIPS
Date: Wed, 6 Oct 2004 16:55:10 +0530
Message-ID: <6BF015B686198842A1C8F84F4B7E6D2601276A0F@chn-snr-msg.wipro.com>
From: <priya.mani@wipro.com>
Return-Path: <priya.mani@wipro.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041006112510.6pOHLoQIJDhlk190IlzbDgpAQFKVfovhvkwDElGhPxQ@z>

Hi 

I need to build a driver on the kernel version 2.4.22 on Mips
architecture ( I am using an AMD board). When I try to insmod the driver
it gives unresolved symbols for "__up, __down_trylock &
__down_interruptible". 

I checked in the semaphore.c file under kernel/arch/mips. The above
symbols are neither defined nor exported while they are done for the
semaphore files under other arch like sparc, sh, alpha etc.

If I try to use the functions from the latest CVS files in the mips-org
site it gives other compilation errors.

Please can you tell me how do I go about this problem. Have the above
functions been obsoleted? Is there any patch available for them? Or is
there any doc explaining this? I am using Kernel version 2.4.22.

Can anybody help me out with this please.

Rgds
Priya
