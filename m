Received: from mailapp01.imgtec.com ([195.59.15.196]:62235 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012083AbbLCOx6oPeuD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 3 Dec 2015 15:53:58 +0100
Subject: Re: [PATCH 6/9] MIPS: Call relocate_kernel if CONFIG_RELOCATABLE=y
References: <1449137297-30464-1-git-send-email-matt.redfearn@imgtec.com>
 <1449137297-30464-7-git-send-email-matt.redfearn@imgtec.com>
 <56605081.5050307@cogentembedded.com>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <5660577F.2020401@imgtec.com>
Date: Thu, 3 Dec 2015 14:53:51 +0000
MIME-Version: 1.0
In-Reply-To: <56605081.5050307@cogentembedded.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-mips@linux-mips.org
Message-ID: <20151203145351.Hr15lIscXiCFPGz02GJgQ29WEQrkQtKZ6GPQmsgy3nI@z>

Hi Sergei,

On 03/12/15 14:24, Sergei Shtylyov wrote:
> Hello.
>
> On 12/3/2015 1:08 PM, Matt Redfearn wrote:
>
>> If CONFIG_RELOCATABLE is enabled, jump to relocate_kernel.
>>
>> This function will return the entry point of the relocated kernel if
>> copy/relocate is sucessful or the original entry point if not. The stack
>> pointer must then be pointed into the new image.
>>
>> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
>> ---
>>   arch/mips/kernel/head.S | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
>> index 4e4cc5b9a771..7dc043349d66 100644
>> --- a/arch/mips/kernel/head.S
>> +++ b/arch/mips/kernel/head.S
>> @@ -132,7 +132,27 @@ not_found:
>>       set_saved_sp    sp, t0, t1
>>       PTR_SUBU    sp, 4 * SZREG        # init stack pointer
>>
>> +#ifdef CONFIG_RELOCATABLE
>> +    /* Copy kernel and apply the relocations */
>> +    jal        relocate_kernel
>> +
>> +    /* Repoint the sp into the new kernel image */
>> +    PTR_LI        sp, _THREAD_SIZE - 32 - PT_SIZE
>> +    PTR_ADDU    sp, $28
>
>    Can't you account for it in the previous PTR_LI?
During relocate_kernel, $28, pointer to the current thread, has been 
moved by an unknown (here) number of bytes to point to the 
init_thread_union within the new kernel. The stack pointer must now be 
pointed there too. Since we don't know the offset from the original 
kernel it's easier to simply recalculate it.

Thanks,
Matt
>
>> +    set_saved_sp    sp, t0, t1
>> +    PTR_SUBU    sp, 4 * SZREG        # init stack pointer
> [...]
>
> MBR, Sergei
>
