Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:47063 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993124AbeDCJXitnyBD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Apr 2018 11:23:38 +0200
Subject: Re: [PATCH v4 3/3] MIPS: use generic GCC library routines from lib/
References: <1522320083-27818-1-git-send-email-matt.redfearn@mips.com>
 <1522320083-27818-3-git-send-email-matt.redfearn@mips.com>
 <20180403085354.GC31222@saruman>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <b0eaccce-a316-0515-cab7-a026be1720b1@mips.com>
Date: Tue, 3 Apr 2018 10:23:10 +0100
MIME-Version: 1.0
In-Reply-To: <20180403085354.GC31222@saruman>
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
To: James Hogan <jhogan@kernel.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, Antony Pavlov <antonynpavlov@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Paul Burton <paul.burton@mips.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20180403092310.gp8_eFTfz6N-qy1zj07lsBsqRFnayzH3NZ_yE-6NqKk@z>



On 03/04/18 09:53, James Hogan wrote:
> On Thu, Mar 29, 2018 at 11:41:23AM +0100, Matt Redfearn wrote:
>> This commit removes several generic GCC library routines from
>> arch/mips/lib/ in favour of similar routines from lib/.
> 
>> diff --git a/arch/mips/lib/Makefile b/arch/mips/lib/Makefile
>> index e84e12655fa8..6537e022ef62 100644
>> --- a/arch/mips/lib/Makefile
>> +++ b/arch/mips/lib/Makefile
>> @@ -16,5 +16,4 @@ obj-$(CONFIG_CPU_R3000)		+= r3k_dump_tlb.o
>>   obj-$(CONFIG_CPU_TX39XX)	+= r3k_dump_tlb.o
>>   
>>   # libgcc-style stuff needed in the kernel
>> -obj-y += ashldi3.o ashrdi3.o bswapsi.o bswapdi.o cmpdi2.o lshrdi3.o multi3.o \
>> -	 ucmpdi2.o
>> +obj-y += bswapsi.o bswapdi.o multi3.o
> 
> Have you missed deleting the files?

Oops, got lost during the rebase :-/

Thanks,
Matt

> 
> Cheers
> James
> 
