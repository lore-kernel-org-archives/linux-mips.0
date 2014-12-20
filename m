Received: from mailapp01.imgtec.com ([195.59.15.196]:10140 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009080AbaLTBUCMhdVD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 20 Dec 2014 02:20:02 +0100
Message-ID: <5494CEB8.5000600@imgtec.com>
Date: Fri, 19 Dec 2014 17:19:52 -0800
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] Revert broken C0_Pagegrain[PG_IEC] support.
References: <1419035585-21671-1-git-send-email-ddaney.cavm@gmail.com> <5494C639.8050808@imgtec.com> <5494C798.60706@imgtec.com> <20141220005203.GA5104@linux-mips.org> <5494CC78.2010207@gmail.com>
In-Reply-To: <5494CC78.2010207@gmail.com>
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
To: David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20141220011952.-84fflOxblzigP-_GxwUCmltnTZ3fuGuWjniEthor2w@z>

On 12/19/2014 05:10 PM, David Daney wrote:
> On 12/19/2014 04:52 PM, Ralf Baechle wrote:
>> On Fri, Dec 19, 2014 at 04:49:28PM -0800, Leonid Yegoshin wrote:
>>> Date:   Fri, 19 Dec 2014 16:49:28 -0800
>>> From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
>>> To: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org,
>>>   ralf@linux-mips.org
>>> Subject: Re: [PATCH 0/2] Revert broken C0_Pagegrain[PG_IEC] support.
>>> Content-Type: text/plain; charset="windows-1252"; format=flowed
>>>
>>> On 12/19/2014 04:43 PM, Leonid Yegoshin wrote:
>>>> On 12/19/2014 04:33 PM, David Daney wrote:
>>>>> From: David Daney <david.daney@cavium.com>
>>>>>
>>>>> The two patches reverted here break eXecute-Inhibit (XI) memory
>>>>> protection support.  Before the patches we get SIGSEGV when 
>>>>> attempting
>>>>> to execute in non-executable memory, after the patches we loop 
>>>>> forever
>>>>> in handle_tlbl.
>>>>>
>>>>> It is probably possible to make C0_Pagegrain[PG_IEC] work, but I 
>>>>> think
>>>>> the most prudent thing is to revert these patches, and then only 
>>>>> reapply
>>>>> something that works after it has been well tested.
>>>>>
>>>>> David Daney (2):
>>>>>    Revert "MIPS: Use dedicated exception handler if CPU supports 
>>>>> RI/XI
>>>>>      exceptions"
>>>>>    Revert "MIPS: kernel: cpu-probe: Detect unique RI/XI exceptions"
>>>>>
>>>>>   arch/mips/include/asm/mipsregs.h | 1 -
>>>>>   arch/mips/kernel/cpu-probe.c     | 9 ---------
>>>>>   arch/mips/kernel/traps.c         | 7 -------
>>>>>   arch/mips/mm/tlbex.c             | 4 ++--
>>>>>   4 files changed, 2 insertions(+), 19 deletions(-)
>>>>>
>>>> Well, it may be have sense just to fix tlb_init() instead.
>>>
>>> diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
>>> index aa6e4b3b2fe2..ed18efd9374b 100644
>>> --- a/arch/mips/mm/tlb-r4k.c
>>> +++ b/arch/mips/mm/tlb-r4k.c
>>> @@ -602,7 +602,7 @@ void __cpuinit tlb_init(void)
>>>   #ifdef CONFIG_64BIT
>>>                  pg |= PG_ELPA;
>>>   #endif
>>> -               write_c0_pagegrain(pg);
>>> +               write_c0_pagegrain(pg | read_c0_pagegrain());
>>
>> Simpler:
>>           set_c0_pagegrain(pg);
>
> No.  That is exactly how it was broken before.
>
> It is possible that you would want:
>
>     if (cpu_has_rixiex)
>         pg |= PG_IEC;
>     set_c0_pagegrain(pg);
>
> But that wasn't really tested.  It seems to work though.
>
> I will send another patch.
>
> David Daney
Well, to honest, it is extensively tested on MIPS R6 because it have 
PG_IEC read-only == 1 (non-switchable OFF)
And on other cores which has no PG_IEC at all, of course.

As for your concern about set_c0_pagegrain(pg) - it sets 2 or 3 bits in 
pagegrain but doesn't clear the rest which was before with a single 
write_c0_pagegrain(pg) and any switchable bit comes down.
