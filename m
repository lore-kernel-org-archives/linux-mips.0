Received: from mail.gnss.com ([209.47.22.10]:10256 "EHLO tormf01.gmi.domain")
	by ftp.linux-mips.org with ESMTP id S20021610AbXLNEVl convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 14 Dec 2007 04:21:41 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 8BIT
Subject: RE: Inter processor synchronization
Date: Fri, 14 Dec 2007 09:51:23 +0530
Message-ID: <9D98C51005D80D43A19A3DF329A61D690106A297@INDEXCH2003.gmi.domain>
In-Reply-To: <20071213125847.GA1352@linux-mips.org>
References: <9D98C51005D80D43A19A3DF329A61D690106A282@INDEXCH2003.gmi.domain> <20071213125847.GA1352@linux-mips.org>
From: "Nilanjan Roychowdhury" <Nilanjan.Roychowdhury@gnss.com>
Return-Path: <Nilanjan.Roychowdhury@gnss.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20071214042123.qf7bGojifio1_fIXQuLIIv2kLSrccfXjC_aNwDlLRb8@z>



on Thursday, December 13, 2007 6:29 PM:, Ralf Baechle wrote:
> On Thu, Dec 13, 2007 at 09:07:20AM +0530, Nilanjan Roychowdhury wrote:
> 
>> I have a scenario where two images of the same Linux kernel are
>> running on two MIPS cores. One is 24K and another is 4KEC. What is
>> the best way to achieve inter processor synchronization between them?
>> 
>> I guess the locks for LL/SC are local to a particular core and can
>> not be extended across a multi core system.

 
> 4K and 24K cores don't support cache coherency.  So SMP is out of
> question. 
> This is a _total_ showstopper for SMP, don't waste your time thinking
> on possible workarounds. 
> 
> The you could do is some sort of clusting, running two OS images, one
> on the 4K and one on the 24K which would communicate through a
> carefully cache managed or even uncached shared memory region.  

I guess I am left with only this option. Can you please throw some more
lights
On the IPC you are mentioning?



>> Will it be easier for me if both of them becomes same core ( like
>> both 24k) and I run the SMP version of Linux.
> 
> 
> Within limits Linux supports mixing different CPU types such as
> R4000MC / R4400MC and R10000 / R12000 / R14000 mixes because those
> processors are similar enough  
> 
>   Ralf

Thanks,
Nilanjan
