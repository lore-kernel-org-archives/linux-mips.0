Received: from mail-bl2on0061.outbound.protection.outlook.com ([65.55.169.61]:50528
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27012212AbcBHWI2VS0Xh (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 8 Feb 2016 23:08:28 +0100
Message-ID: <56B911D1.2090402@caviumnetworks.com>
Date: Mon, 8 Feb 2016 14:08:17 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Always page align TASK_SIZE
References: <1454954723-24887-1-git-send-email-harvey.hunt@imgtec.com> <56B8DA56.9020108@caviumnetworks.com> <56B8DB2D.3070604@imgtec.com> <56B90A3E.7000507@gentoo.org> <56B90D30.5020904@imgtec.com>
In-Reply-To: <56B90D30.5020904@imgtec.com>
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
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: Joshua Kinard <kumba@gentoo.org>, linux-mips@linux-mips.org, ralf@linux-mips.org, David Daney <david.daney@cavium.com>, Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20160208220817.4lYBGM_JL_KzqjLSzSI97MVnad5u3PA-TrdRpPvwy0I@z>

On 02/08/2016 01:48 PM, Harvey Hunt wrote:
> Hi Joshua,
>
> On 02/08/2016 01:35 PM, Joshua Kinard wrote:
>> On 02/08/2016 13:15, Harvey Hunt wrote:
>>> Hi David,
>>>
>>> On 02/08/2016 10:11 AM, David Daney wrote:
>>>> On 02/08/2016 10:05 AM, Harvey Hunt wrote:
>>>>> STACK_TOP_MAX is aligned on a 32k boundary. When __bprm_mm_init()
>>>>> creates an
>>>>> initial stack for a process, it does so using STACK_TOP_MAX as the end
>>>>> of the
>>>>> vma. A process's arguments and environment information are placed on
>>>>> the stack
>>>>> and then the stack is relocated and aligned on a page boundary. When
>>>>> using a 32
>>>>> bit kernel with 64k pages, the relocated stack has the process's args
>>>>> erroneously stored in the middle of the stack. This means that
>>>>> processes
>>>>> receive no arguments or environment variables, preventing them from
>>>>> running
>>>>> correctly.
>>>>>
>>>>> Fix this by aligning TASK_SIZE on a page boundary.
>>>>>
>>>>> Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
>>>>> Cc: David Daney <david.daney@cavium.com>
>>>>> Cc: Paul Burton <paul.burton@imgtec.com>
>>>>> Cc: James Hogan <james.hogan@imgtec.com>
>>>>> Cc: linux-kernel@vger.kernel.org
>>>>> ---
>>>>>    arch/mips/include/asm/processor.h | 6 +++---
>>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/arch/mips/include/asm/processor.h
>>>>> b/arch/mips/include/asm/processor.h
>>>>> index 3f832c3..b618b40 100644
>>>>> --- a/arch/mips/include/asm/processor.h
>>>>> +++ b/arch/mips/include/asm/processor.h
>>>>> @@ -39,13 +39,13 @@ extern unsigned int vced_count, vcei_count;
>>>>>    #ifdef CONFIG_32BIT
>>>>>    #ifdef CONFIG_KVM_GUEST
>>>>>    /* User space process size is limited to 1GB in KVM Guest Mode */
>>>>> -#define TASK_SIZE    0x3fff8000UL
>>>>> +#define TASK_SIZE    (0x40000000UL - PAGE_SIZE)
>>>>>    #else
>>>>>    /*
>>>>>     * User space process size: 2GB. This is hardcoded into a few
>>>>> places,
>>>>>     * so don't change it unless you know what you are doing.
>>>>>     */
>>>>> -#define TASK_SIZE    0x7fff8000UL
>>>>> +#define TASK_SIZE    (0x7fff8000UL & PAGE_SIZE)
>>>>
>>>> Can you check your math here.  This doesn't seem correct.
>>>
>>> Thanks for spotting that - it should have been:
>>>
>>> (0x7fff8000UL & PAGE_MASK)
>>>
>>> I'll do a v2 now.
>>>
>>
>> FYI, TASK_SIZE was recently changed to 0x80000000UL in commit
>> 7f8ca9cb1ed3 on
>> the linux-mips.org tree.
>
> Thanks, I'll rebase.

You may find that in rebasing, suddenly you have a completely empty patch!


>
>>
>>
>>>>
>>>>>    #endif
>>>>>
>>>>>    #define STACK_TOP_MAX    TASK_SIZE
>>>>> @@ -62,7 +62,7 @@ extern unsigned int vced_count, vcei_count;
>>>>>     * support 16TB; the architectural reserve for future expansion is
>>>>>     * 8192EB ...
>>>>>     */
>>>>> -#define TASK_SIZE32    0x7fff8000UL
>>>>> +#define TASK_SIZE32    (0x7fff8000UL & PAGE_SIZE)
>>>>
>>>> Same here.
>>>
>>> As above.
>>>
>>>>
>>>>>    #define TASK_SIZE64    0x10000000000UL
>>>>>    #define TASK_SIZE (test_thread_flag(TIF_32BIT_ADDR) ? TASK_SIZE32 :
>>>>> TASK_SIZE64)
>>>>>    #define STACK_TOP_MAX    TASK_SIZE64
>>>>>
>>>>
>>>
>>> Thanks,
>>>
>>> Harvey
>>>
>>>
>>
>>
