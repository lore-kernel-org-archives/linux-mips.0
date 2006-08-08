Received: from wip-ec-wd.wipro.com ([203.91.193.32]:7354 "EHLO
	wip-ec-wd.wipro.com") by ftp.linux-mips.org with ESMTP
	id S20041109AbWHHMYh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 8 Aug 2006 13:24:37 +0100
Received: from wip-ec-wd.wipro.com (localhost.wipro.com [127.0.0.1])
	by localhost (Postfix) with ESMTP id 0EF1F205E1
	for <linux-mips@linux-mips.org>; Tue,  8 Aug 2006 17:51:02 +0530 (IST)
Received: from blr-ec-bh02.wipro.com (blr-ec-bh02.wipro.com [10.201.50.92])
	by wip-ec-wd.wipro.com (Postfix) with ESMTP id EFD67205DB
	for <linux-mips@linux-mips.org>; Tue,  8 Aug 2006 17:51:01 +0530 (IST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: FB Driver for DbAu1100
Date: Tue, 8 Aug 2006 17:53:37 +0530
Message-ID: <2156B1E923F1A147AABDF4D9FDEAB4CB0E0B79@blr-m2-msg.wipro.com>
In-Reply-To: <9C151BA9-326D-4B57-81AA-4A8CEEF45945@willmert.com>
From: <hemanth.venkatesh@wipro.com>
Return-Path: <hemanth.venkatesh@wipro.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: craigslist@willmert.com, linux-mips@linux-mips.org
Message-ID: <20060808122337.t3EURLhOHnnVQL_tNVbO_OyziKQYUBVlWIsCVDGXygk@z>

We have been able to test FB driver on a custom board based on AU1100,
we used 2.6.14 and 2.6.17 kernels.

Hemanth

-----Original Message-----
From: linux-mips-bounce@linux-mips.org
[mailto:linux-mips-bounce@linux-mips.org] On Behalf Of craigslist
Sent: Tuesday, August 08, 2006 5:45 PM
To: linux-mips@linux-mips.org
Subject: FB Driver for DbAu1100

Has anyone done any work on the framebuffer driver for the DbAu1100  
board? I'm on 2.6.10 and it appears that the code was written for a  
2.4 kernel and never updated, therefore, it does not compile. Some  
data structures were apparently removed that were being used by the  
au1100 fb driver.

Thanks

Stefan Willmert
