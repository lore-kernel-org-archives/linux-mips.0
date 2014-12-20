Received: from mailapp01.imgtec.com ([195.59.15.196]:25276 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009080AbaLTBkACMSW- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 20 Dec 2014 02:40:00 +0100
Message-ID: <5494D366.6060400@imgtec.com>
Date: Fri, 19 Dec 2014 17:39:50 -0800
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Fix C0_Pagegrain[IEC] support.
References: <1419038123-30270-1-git-send-email-ddaney.cavm@gmail.com> <5494CF23.1080606@imgtec.com> <5494D04F.4030701@gmail.com>
In-Reply-To: <5494D04F.4030701@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20141220013950.sUEMQGVRhoVQxzvxFMKyE7MWpn37Ziv11QIvsTtElW0@z>

On 12/19/2014 05:26 PM, David Daney wrote:
> On 12/19/2014 05:21 PM, Leonid Yegoshin wrote:
>> On 12/19/2014 05:15 PM, David Daney wrote:
>>> From: David Daney <david.daney@cavium.com>
>>>
>>> If we are generating TLB exception expecting separate vectors, we must
>>> enable the feature.
>>>
>>> Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
>>> Signed-off-by: David Daney <david.daney@cavium.com>
>>> ---
>>>
>>> Very lightly tested, but it seems to make my XI and RI tests work on
>>> OCTEON II CPUs, which have the C0_Pagegrain[IEC] bit.
>>>
>>>   arch/mips/mm/tlb-r4k.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
>>> index e90b2e8..30639a6 100644
>>> --- a/arch/mips/mm/tlb-r4k.c
>>> +++ b/arch/mips/mm/tlb-r4k.c
>>> @@ -489,6 +489,8 @@ static void r4k_tlb_configure(void)
>>>   #ifdef CONFIG_64BIT
>>>           pg |= PG_ELPA;
>>>   #endif
>>> +        if (cpu_has_rixiex)
>>> +            pg |= PG_IEC;
>>>           write_c0_pagegrain(pg);
>>>       }
>> David, I think it is still better to use set_c0_pagegrain() because
>> PageGrain has a lot of RW bits now and clear all of them may be not 
>> good.
>
> IMHO all the code that sets PageGrain should be in this function. We 
> should calculate all the bits here that should be set, and set them.
>
> The whole reason that we have this mess, is that we were setting the 
> bits at different code sites, and clobbering them in others.
>
> If *all* the PageGrain logic is in one place, we won't have this problem.
>
> If you think this patch is incorrect, then we should revert the other 
> two and take our time to carefully do something that is correct.
>
> David Daney
>
No, I don't see this patch as incorrect. It is just about coding 
assumptions but I don't think it is serious, so you variant is OK.
