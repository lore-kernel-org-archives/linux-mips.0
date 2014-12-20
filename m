Received: from mailapp01.imgtec.com ([195.59.15.196]:13090 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009080AbaLTAth13LeN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 20 Dec 2014 01:49:37 +0100
Message-ID: <5494C798.60706@imgtec.com>
Date: Fri, 19 Dec 2014 16:49:28 -0800
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] Revert broken C0_Pagegrain[PG_IEC] support.
References: <1419035585-21671-1-git-send-email-ddaney.cavm@gmail.com> <5494C639.8050808@imgtec.com>
In-Reply-To: <5494C639.8050808@imgtec.com>
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
To: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org
Message-ID: <20141220004928.ZFzWCdGqmyd6z_To8tljNOQRQTaNDcMj8H6lbBpu190@z>

On 12/19/2014 04:43 PM, Leonid Yegoshin wrote:
> On 12/19/2014 04:33 PM, David Daney wrote:
>> From: David Daney <david.daney@cavium.com>
>>
>> The two patches reverted here break eXecute-Inhibit (XI) memory
>> protection support.  Before the patches we get SIGSEGV when attempting
>> to execute in non-executable memory, after the patches we loop forever
>> in handle_tlbl.
>>
>> It is probably possible to make C0_Pagegrain[PG_IEC] work, but I think
>> the most prudent thing is to revert these patches, and then only reapply
>> something that works after it has been well tested.
>>
>> David Daney (2):
>>    Revert "MIPS: Use dedicated exception handler if CPU supports RI/XI
>>      exceptions"
>>    Revert "MIPS: kernel: cpu-probe: Detect unique RI/XI exceptions"
>>
>>   arch/mips/include/asm/mipsregs.h | 1 -
>>   arch/mips/kernel/cpu-probe.c     | 9 ---------
>>   arch/mips/kernel/traps.c         | 7 -------
>>   arch/mips/mm/tlbex.c             | 4 ++--
>>   4 files changed, 2 insertions(+), 19 deletions(-)
>>
> Well, it may be have sense just to fix tlb_init() instead.

diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index aa6e4b3b2fe2..ed18efd9374b 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -602,7 +602,7 @@ void __cpuinit tlb_init(void)
  #ifdef CONFIG_64BIT
                 pg |= PG_ELPA;
  #endif
-               write_c0_pagegrain(pg);
+               write_c0_pagegrain(pg | read_c0_pagegrain());
         }
         mtc0_tlbw_hazard();
