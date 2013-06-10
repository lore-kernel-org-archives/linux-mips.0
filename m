Received: from multi.imgtec.com ([194.200.65.239]:11939 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6818702Ab3FJMwDkqKdX (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 10 Jun 2013 14:52:03 +0200
Message-ID: <51B5CBEF.7040202@imgtec.com>
Date: Mon, 10 Jun 2013 13:51:59 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: include: mmu_context.h: Replace VIRTUALIZATION
 with KVM
References: <1370864548-19647-1-git-send-email-markos.chandras@imgtec.com> <51B5BD5F.8090604@cogentembedded.com>
In-Reply-To: <51B5BD5F.8090604@cogentembedded.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-mips@linux-mips.org, "Steven J. Hill" <Steven.Hill@imgtec.com>
Message-ID: <20130610125159.1cVT05Pt0PMfKHqNcVg_IuUuSt9sjCW49RPqUH3iRaM@z>

On 06/10/13 12:49, Sergei Shtylyov wrote:
> hello.
>
> On 10-06-2013 15:42, Markos Chandras wrote:
>
>> The kvm_* symbols are only available if KVM is selected.
>
>> Fixes the following linking problem on a randconfig:
>
>> arch/mips/built-in.o: In function `local_flush_tlb_mm':
>> (.text+0x18a94): undefined reference to `kvm_local_flush_tlb_all'
>> arch/mips/built-in.o: In function `local_flush_tlb_range':
>> (.text+0x18d0c): undefined reference to `kvm_local_flush_tlb_all'
>> kernel/built-in.o: In function `__schedule':
>> core.c:(.sched.text+0x2a00): undefined reference to
>> `kvm_local_flush_tlb_all'
>> mm/built-in.o: In function `use_mm':
>> (.text+0x30214): undefined reference to `kvm_local_flush_tlb_all'
>> fs/built-in.o: In function `flush_old_exec':
>> (.text+0xf0a0): undefined reference to `kvm_local_flush_tlb_all'
>> make: *** [vmlinux] Error 1
>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>> Signed-off-by: Steven J. Hill <Steven.Hill@imgtec.com>
>> ---
>>   arch/mips/include/asm/mmu_context.h | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>
>> diff --git a/arch/mips/include/asm/mmu_context.h
>> b/arch/mips/include/asm/mmu_context.h
>> index 8201160..ee5a93b 100644
>> --- a/arch/mips/include/asm/mmu_context.h
>> +++ b/arch/mips/include/asm/mmu_context.h
>> @@ -111,13 +111,15 @@ static inline void enter_lazy_tlb(struct
>> mm_struct *mm, struct task_struct *tsk)
>>   static inline void
>>   get_new_mmu_context(struct mm_struct *mm, unsigned long cpu)
>>   {
>> +#ifdef CONFIG_KVM
>>       extern void kvm_local_flush_tlb_all(void);
>> +#endif
>
>     #ifdef should not be needed around declaration.
>
> WBR, Sergei
>
Hi Sergei,

You are right. I will send a new version of this patch.

-- 
markos
