Received: from dns0.mips.com ([12.201.5.70]:44978 "EHLO dns0.mips.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1903711Ab2DJTzK (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 10 Apr 2012 21:55:10 +0200
Message-ID: <4F849017.1020706@mips.com>
Date: Tue, 10 Apr 2012 12:55:03 -0700
From: Leonid Yegoshin <yegoshin@mips.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Add MIPS64R2 core support.
References: <1333987461-822-1-git-send-email-sjhill@mips.com> <4F841E48.7000104@mvista.com> <4F848576.6040204@mips.com> <4F848957.6000400@mvista.com>
In-Reply-To: <4F848957.6000400@mvista.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Sergei Shtylyov <sshtylyov@mvista.com>
Cc: "Steven J. Hill" <sjhill@mips.com>, linux-mips@linux-mips.org, ralf@linux-mips.org
Message-ID: <20120410195503.jGmQ5hPgKWxEw8ts9pfo3Gk3_MAY3S9obRsPPsipZJQ@z>

On 04/10/2012 12:26 PM, Sergei Shtylyov wrote:
> Hello.
>
> Leonid Yegoshin wrote:
>
>>>> +config 64BIT_PHYS_ADDR
>>>> +    bool "Kernel supports 64 bit physical addresses" if EXPERIMENTAL
>>>> +    depends on 64BIT
>
>>>    This option is selected on 32-bit CPUs like Alchemy, which has 
>>> 36-bit physical address. It will cause a warning about unmet
>
>> Just verified - selected Alchemy and DB1000 board and got
>
>> # CONFIG_64BIT is not set
>> CONFIG_64BIT_PHYS_ADDR=y
>> CONFIG_ARCH_PHYS_ADDR_T_64BIT=y
>> CONFIG_PHYS_ADDR_T_64BIT=y
>
>> ???
>
>    And you didn't get a warning on "select 64BIT_PHYS_ADDR"? Strange, 
> modern Kconfig should spit out one...
>

OK, you right, I missed it in bunch of another. It has sense to add a 
missed dependency.


- Leonid.
