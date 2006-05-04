Received: from rtsoft2.corbina.net ([85.21.88.2]:32927 "HELO
	mail.dev.rtsoft.ru") by ftp.linux-mips.org with SMTP
	id S8133530AbWEDRR1 (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Thu, 4 May 2006 18:17:27 +0100
Message-ID: <445A36E3.4010809@ru.mvista.com>
Date: Thu, 04 May 2006 21:16:19 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
Subject: Re: Porting Au1x000 USB host controller on u-boot
References: <20060504095341.GB19913@gundam.enneenne.com> <445A347A.5050507@ru.mvista.com>
In-Reply-To: <445A347A.5050507@ru.mvista.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <sshtylyov@ru.mvista.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Cc: Rodolfo Giometti <giometti@linux.it>, Linux-MIPS <linux-mips@linux-mips.org>
Message-ID: <20060504171619.PwxiIpPkNOPMkbJQx5wFlNP8JXQrXs2VlJcrDp6HOkA@z>

Hello, I wrote:

>> I'm trying to implement support for USB host into u-boot. I
>> initialized the USB controller just as linux does, the EDs and the TDs
>> look like good in memory but the controller seems not well reading
>> them and on the bus I see random USB messages...

>> I think that there could be some problem on memory coherency... some
>> suggestion?

> try to disable USB controller's DMA coherency in the USB enable register 
> (there's a related errata in all Au1xx0 family) -- the Linux driver 
> doesn't do this though, and this shouldn't matter unless you're 
> modifying USB buffers on the fly. :-)

    AND make sure every buffer/TD/ED is written back / invalidated from cache 
before the OHCI accesses them since the cache coherency on Au1xx0 is b0rken!

WBR, Sergei
