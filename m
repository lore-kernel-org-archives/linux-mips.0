Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:32920 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992866AbeBIOxJGp6KP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 9 Feb 2018 15:53:09 +0100
Subject: Re: [PATCH] lib: Rename compiler intrinsic selects to GENERIC_LIB_*
References: <mhng-f000d448-7ead-4cee-9e2f-5d58692c0922@palmer-si-x1c4>
 <1518182572-23376-1-git-send-email-matt.redfearn@mips.com>
 <CAHp75VeiAUg1NCK59wZjZNnLZqEXDF5dpi8pmtTcP1WhX2wvVA@mail.gmail.com>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <30b2cff6-ad18-617e-cc11-ad2188193c3a@mips.com>
Date: Fri, 9 Feb 2018 14:52:50 +0000
MIME-Version: 1.0
In-Reply-To: <CAHp75VeiAUg1NCK59wZjZNnLZqEXDF5dpi8pmtTcP1WhX2wvVA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Palmer Dabbelt <palmer@sifive.com>, antonynpavlov@gmail.com, Linux MIPS Mailing List <linux-mips@linux-mips.org>, jhogan@kernel.org, Ralf Baechle <ralf@linux-mips.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <20180209145250.IPO2roPls1bT0Y1Ymt_vRVv21tR3DNd5-O0O8sr8euU@z>

Hi Andy,

On 09/02/18 13:45, Andy Shevchenko wrote:
> On Fri, Feb 9, 2018 at 3:22 PM, Matt Redfearn <matt.redfearn@mips.com> wrote:
>> When these are included into arch Kconfig files, maintaining
>> alphabetical ordering of the selects means these get split up. To allow
>> for keeping things tidier and alphabetical, rename the selects to
>> GENERIC_LIB_*
>>
> 
> I don't remember who suggested that, if it wasn't you, please add
> Suggested-by tag with appropriate name.

It was me that suggested the rename, before we ack replacing MIPS' 
compiler intrinsics with these generic ones.

Thanks,
Matt


> 
>> Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
>> ---
>>   arch/riscv/Kconfig |  6 +++---
>>   lib/Kconfig        | 12 ++++++------
>>   lib/Makefile       | 12 ++++++------
>>   3 files changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 2c6adf12713a..5f1e2188d029 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -99,9 +99,9 @@ config ARCH_RV32I
>>          bool "RV32I"
>>          select CPU_SUPPORTS_32BIT_KERNEL
>>          select 32BIT
>> -       select GENERIC_ASHLDI3
>> -       select GENERIC_ASHRDI3
>> -       select GENERIC_LSHRDI3
>> +       select GENERIC_LIB_ASHLDI3
>> +       select GENERIC_LIB_ASHRDI3
>> +       select GENERIC_LIB_LSHRDI3
>>
>>   config ARCH_RV64I
>>          bool "RV64I"
>> diff --git a/lib/Kconfig b/lib/Kconfig
>> index c5e84fbcb30b..946d0890aad6 100644
>> --- a/lib/Kconfig
>> +++ b/lib/Kconfig
>> @@ -584,20 +584,20 @@ config STRING_SELFTEST
>>
>>   endmenu
>>
>> -config GENERIC_ASHLDI3
>> +config GENERIC_LIB_ASHLDI3
>>          bool
>>
>> -config GENERIC_ASHRDI3
>> +config GENERIC_LIB_ASHRDI3
>>          bool
>>
>> -config GENERIC_LSHRDI3
>> +config GENERIC_LIB_LSHRDI3
>>          bool
>>
>> -config GENERIC_MULDI3
>> +config GENERIC_LIB_MULDI3
>>          bool
>>
>> -config GENERIC_CMPDI2
>> +config GENERIC_LIB_CMPDI2
>>          bool
>>
>> -config GENERIC_UCMPDI2
>> +config GENERIC_LIB_UCMPDI2
>>          bool
>> diff --git a/lib/Makefile b/lib/Makefile
>> index d11c48ec8ffd..7e1ef77e86a3 100644
>> --- a/lib/Makefile
>> +++ b/lib/Makefile
>> @@ -252,9 +252,9 @@ obj-$(CONFIG_SBITMAP) += sbitmap.o
>>   obj-$(CONFIG_PARMAN) += parman.o
>>
>>   # GCC library routines
>> -obj-$(CONFIG_GENERIC_ASHLDI3) += ashldi3.o
>> -obj-$(CONFIG_GENERIC_ASHRDI3) += ashrdi3.o
>> -obj-$(CONFIG_GENERIC_LSHRDI3) += lshrdi3.o
>> -obj-$(CONFIG_GENERIC_MULDI3) += muldi3.o
>> -obj-$(CONFIG_GENERIC_CMPDI2) += cmpdi2.o
>> -obj-$(CONFIG_GENERIC_UCMPDI2) += ucmpdi2.o
>> +obj-$(CONFIG_GENERIC_LIB_ASHLDI3) += ashldi3.o
>> +obj-$(CONFIG_GENERIC_LIB_ASHRDI3) += ashrdi3.o
>> +obj-$(CONFIG_GENERIC_LIB_LSHRDI3) += lshrdi3.o
>> +obj-$(CONFIG_GENERIC_LIB_MULDI3) += muldi3.o
>> +obj-$(CONFIG_GENERIC_LIB_CMPDI2) += cmpdi2.o
>> +obj-$(CONFIG_GENERIC_LIB_UCMPDI2) += ucmpdi2.o
>> --
>> 2.7.4
>>
> 
> 
> 
