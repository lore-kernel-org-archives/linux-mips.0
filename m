Received: from wip-ec-wd.wipro.com ([203.91.193.32]:33995 "EHLO
	wip-ec-wd.wipro.com") by ftp.linux-mips.org with ESMTP
	id S8133435AbWGYKGx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 25 Jul 2006 11:06:53 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: Multiple page size support for AU1xxx
Date: Tue, 25 Jul 2006 15:36:33 +0530
Message-ID: <2156B1E923F1A147AABDF4D9FDEAB4CB09D6F3@blr-m2-msg.wipro.com>
In-Reply-To: <20060725034619.GA22617@linux-mips.org>
From: <hemanth.venkatesh@wipro.com>
Return-Path: <hemanth.venkatesh@wipro.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: ralf@linux-mips.org
Cc: linux-mips@linux-mips.org
Message-ID: <20060725100633.f20TIvakYawOVGDfDu3MD0wP8MyijnjA-kC2nhLeTqo@z>

Hi Ralf,

>>Currently only 16kB works and only for 64-bit kernels.  I'm planning
to
>> fix that rsn.

Thanks for the info, did u mean 16KB would be supported for 32 bit
kernel also. I also saw code changes in arch/mips/mm/tlb-r8k.c only, is
there a plan to port it to r4k TLB also.


Help on 2.6.14 and 2.6.17 kernels provide the below info. Does it mean
some changes are required at user level also.

config PAGE_SIZE_16KB
        help
          Note that you will need a suitable Linux distribution to
support 
          this.
          There are also issues with compatibility of user applications

Thanks
Hemanth

  
