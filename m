Received: from bby1mta03.pmc-sierra.com ([216.241.235.118]:57072 "EHLO
        bby1mta03.pmc-sierra.bc.ca" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492812Ab0AXR6e convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sun, 24 Jan 2010 18:58:34 +0100
Received: from bby1mta03.pmc-sierra.bc.ca (localhost.pmc-sierra.bc.ca [127.0.0.1])
        by localhost (Postfix) with SMTP id 5A6F21070072
        for <linux-mips@linux-mips.org>; Sun, 24 Jan 2010 09:58:23 -0800 (PST)
Received: from bby1exg02.pmc_nt.nt.pmc-sierra.bc.ca (BBY1EXG02.pmc-sierra.bc.ca [216.241.231.167])
        by bby1mta03.pmc-sierra.bc.ca (Postfix) with SMTP id 51D8D1070071
        for <linux-mips@linux-mips.org>; Sun, 24 Jan 2010 09:58:23 -0800 (PST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: 1 GB RAM with RM9000 SOC
Date: Sun, 24 Jan 2010 09:58:21 -0800
Message-ID: <A7DEA48C84FD0B48AAAE33F328C020140474B674@BBY1EXM11.pmc_nt.nt.pmc-sierra.bc.ca>
In-Reply-To: <20100124002352.GB3251@linux-mips.org>
References: <4B56475F.8070608@gmail.com> <20100124002352.GB3251@linux-mips.org>
From: "Anoop P.A." <Anoop_P.A@pmc-sierra.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org
Message-ID: <20100124175821.7XV7eI-kHdvoJ7b6N9F4Ih8wcBMN5tuxpJxGZJbxB00@z>

Hi list,

 

Any of you successfully used >512MB ram with MIPS SOC's.  I have a
requirement where I have to use 1 GB ram with RM9000 based SOC. 

I have enabled 64 Bit support and so far it is working with 512 MB of
RAM. How ever if I increase memory beyond 512MB I am getting kernel
panic.

 

 I am adding memory region from 0x00 add_memory_region(0 ,0x40000000 ,
BOOT_MEM_RAM). (PMON maps RAM from 0x0 to 0x40000000)  Am I wrong here?

 

It will be great if you can give some suggestion /point me to a working
implementation. I am using 2.6.18 kernel.

 

Thanks

Anoop
