Received: from wip-ec-wd.wipro.com (localhost.wipro.com [127.0.0.1])
	by localhost (Postfix) with ESMTP id 0ADC92055B
	for <linux-mips@linux-mips.org>; Thu, 14 Oct 2004 14:14:19 +0530 (IST)
Received: from blr-ec-bh3.wipro.com (unknown [10.200.50.93])
	by wip-ec-wd.wipro.com (Postfix) with ESMTP id E503B2051E
	for <linux-mips@linux-mips.org>; Thu, 14 Oct 2004 14:14:18 +0530 (IST)
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Down_trylock kernel 2.4
Date: Thu, 14 Oct 2004 14:17:44 +0530
Message-ID: <6BF015B686198842A1C8F84F4B7E6D26012C484C@chn-snr-msg.wipro.com>
From: <priya.mani@wipro.com>
Return-Path: <priya.mani@wipro.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041014084744.pYRvmsapjSiEYKV1Tk7RfX9cmirlJVC3NjJe3CA1fck@z>

Hi,
************
Revision 1.4.2.8 / (download) - annotate - [select for diffs], Fri Nov
28 03:39:10 2003 UTC (10 months, 2 weeks ago) by ralf 
Branch: linux_2_4 
Changes since 1.4.2.7: +0 -7 lines
Diff to previous 1.4.2.7 (colored) to branchpoint 1.4 (colored) 

Remove waking_non_zero_trylock and it's caller __down_trylock.
Reimplement the non-ll/sc version of down_trylock
************

As per the above cvs version log __down_trylock has been removed from
semaphore.c. Has it been replaced by some other symbol/function like for
eg., __down_interruptible was renamed with __down_failed_interruptible.
Or has it become obsolete? If my driver has a call to this symbol what
should I do then? 

Thanks
Priya
