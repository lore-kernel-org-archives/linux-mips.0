Received: from mail1.windriver.com ([147.11.146.13]:45513 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6854765AbaHHBkBE3XBQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 8 Aug 2014 03:40:01 +0200
Message-ID: <53E42A42.3000707@windriver.com>
Date: Fri, 8 Aug 2014 09:39:14 +0800
From: "Yang,Wei" <Wei.Yang@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH v1] MIPS:KDUMP: set a right value to kexec_indirection_page
 variable
References: <1406806949-27039-1-git-send-email-Wei.Yang@windriver.com> <53DF0204.6000904@windriver.com>
In-Reply-To: <53DF0204.6000904@windriver.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Wei.Yang@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Yang,Wei" <Wei.Yang@windriver.com>Wei.Yang@windriver.com, ralf@linux-mips.org
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20140808013914.HnhVkTK5RzB8MyY6NBdNoXpj1DIyYp3fhf0tSPh9m8s@z>

Ralf,

What do you think of this patch?

Thanks
Wei
On 08/04/2014 11:46 AM, Yang,Wei wrote:
> ping.
>
> BR,
> Wei
> On 07/31/2014 07:42 PM, Wei.Yang@windriver.com wrote:
>> From: Yang Wei <Wei.Yang@windriver.com>
>>
>> Since there is not indirection page in crash type, so the vaule of 
>> the head
>> field of kimage structure is not equal to the address of indirection 
>> page but
>> IND_DONE. so we have to set kexec_indirection_page variable to the 
>> address of
>> the head field of image structure.
>>
>> Signed-off-by: Yang Wei <Wei.Yang@windriver.com>
>>
>>            Hi Ralf,
>>
>>           Please help me take a look at this patch, I have already 
>> verified it on Cavium 6100EVB board.
>>
>>           Thanks
>>           Wei
>> ---
>>   arch/mips/kernel/machine_kexec.c |    9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/mips/kernel/machine_kexec.c 
>> b/arch/mips/kernel/machine_kexec.c
>> index 992e184..531b70d 100644
>> --- a/arch/mips/kernel/machine_kexec.c
>> +++ b/arch/mips/kernel/machine_kexec.c
>> @@ -71,8 +71,13 @@ machine_kexec(struct kimage *image)
>>       kexec_start_address =
>>           (unsigned long) phys_to_virt(image->start);
>>   -    kexec_indirection_page =
>> -        (unsigned long) phys_to_virt(image->head & PAGE_MASK);
>> +    if (image->type == KEXEC_TYPE_DEFAULT) {
>> +        kexec_indirection_page =
>> +            (unsigned long) phys_to_virt(image->head & PAGE_MASK);
>> +    } else {
>> +        kexec_indirection_page = (unsigned long)&image->head;
>> +    }
>> +
>>         memcpy((void*)reboot_code_buffer, relocate_new_kernel,
>>              relocate_new_kernel_size);
>
>
>
