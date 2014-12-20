Received: from mail-bn1bon0070.outbound.protection.outlook.com ([157.56.111.70]:15872
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27009080AbaLTAzZEhVA2 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sat, 20 Dec 2014 01:55:25 +0100
Message-ID: <5494C8EF.8010500@caviumnetworks.com>
Date: Fri, 19 Dec 2014 16:55:11 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] Revert broken C0_Pagegrain[PG_IEC] support.
References: <1419035585-21671-1-git-send-email-ddaney.cavm@gmail.com> <5494C639.8050808@imgtec.com>
In-Reply-To: <5494C639.8050808@imgtec.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20141220005511.WqMFvDqYz2viSgP28X4kr3mHVC6nattAwwwhckppZVQ@z>

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

I have more confidence in going back to a working configuration.  My 
simple tests on OCTEON tell me that it is working again.

Somebody adding working support for C0_Pagegrain[PG_IEC] would want to 
do much more testing across many different CPUs to be able to assert 
that it was tested and working.

I would be happy to test any patches adding this support on a variety of 
different OCTEON CPU cores, but I don't have access to anything MIPS/img 
may have that supports this feature.

David Daney.
