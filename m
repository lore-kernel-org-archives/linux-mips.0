Received: from dns0.mips.com ([12.201.5.70]:47457 "EHLO dns0.mips.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1903711Ab2DJTJx (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 10 Apr 2012 21:09:53 +0200
Message-ID: <4F848576.6040204@mips.com>
Date: Tue, 10 Apr 2012 12:09:42 -0700
From: Leonid Yegoshin <yegoshin@mips.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Add MIPS64R2 core support.
References: <1333987461-822-1-git-send-email-sjhill@mips.com> <4F841E48.7000104@mvista.com>
In-Reply-To: <4F841E48.7000104@mvista.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Sergei Shtylyov <sshtylyov@mvista.com>
Cc: "Steven J. Hill" <sjhill@mips.com>, linux-mips@linux-mips.org, ralf@linux-mips.org
Message-ID: <20120410190942.-sHrn8lISUv5H9WFdk5em382FIrOaGdoIcfXqyMrTmY@z>

On 04/10/2012 04:49 AM, Sergei Shtylyov wrote:
> From: "Steven J. Hill"<sjhill@mips.com>
>
>>
>> +config 64BIT_PHYS_ADDR
>> +    bool "Kernel supports 64 bit physical addresses" if EXPERIMENTAL
>> +    depends on 64BIT
>
>    This option is selected on 32-bit CPUs like Alchemy, which has 
> 36-bit physical address. It will cause a warning about unmet

Just verified - selected Alchemy and DB1000 board and got

# CONFIG_64BIT is not set
CONFIG_64BIT_PHYS_ADDR=y
CONFIG_ARCH_PHYS_ADDR_T_64BIT=y
CONFIG_PHYS_ADDR_T_64BIT=y

???

I also want to say that NetLogic Microsystems web site indicates that 
some of Alchemy CPU has only 14 bit DDR/SDRAM address, for exam - Au1550 
(http://www.netlogicmicro.com/Products/Alchemy/Au1550.asp) but 
arch/mips/configs/db1550_defconfig (and pb1550) choses 64BIT_PHYS_ADDR 
too.  Seems like something wrong here.

- Leonid.
