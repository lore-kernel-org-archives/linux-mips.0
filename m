Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]:44067
        "EHLO co9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6834832Ab3FHAPuOJPBy (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 8 Jun 2013 02:15:50 +0200
Message-ID: <51B2779F.3030903@caviumnetworks.com>
Date: Fri, 7 Jun 2013 17:15:27 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 20/31] mips/kvm: Hook into TLB fault handlers.
References: <1370646215-6543-1-git-send-email-ddaney.cavm@gmail.com> <1370646215-6543-21-git-send-email-ddaney.cavm@gmail.com> <51B26E02.8070802@cogentembedded.com>
In-Reply-To: <51B26E02.8070802@cogentembedded.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
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
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, kvm@vger.kernel.org, Sanjay Lal <sanjayl@kymasys.com>, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20130608001527.YB9-C0JzjLEBNgaubXVl1K335-niZ1206HzFYpM_ZXc@z>

On 06/07/2013 04:34 PM, Sergei Shtylyov wrote:
> Hello.
>
> On 06/08/2013 03:03 AM, David Daney wrote:
>
>> From: David Daney <david.daney@cavium.com>
>>
>> If the CPU is operating in guest mode when a TLB related excpetion
>> occurs, give KVM a chance to do emulation.
>>
>> Signed-off-by: David Daney <david.daney@cavium.com>
>> ---
>>   arch/mips/mm/fault.c       | 8 ++++++++
>>   arch/mips/mm/tlbex-fault.S | 6 ++++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
>> index 0fead53..9391da49 100644
>> --- a/arch/mips/mm/fault.c
>> +++ b/arch/mips/mm/fault.c
> [...]
>> @@ -50,6 +51,13 @@ asmlinkage void __kprobes do_page_fault(struct
>> pt_regs *regs, unsigned long writ
>>              field, regs->cp0_epc);
>>   #endif
>> +#ifdef CONFIG_KVM_MIPSVZ
>> +    if (test_tsk_thread_flag(current, TIF_GUESTMODE)) {
>> +        if (mipsvz_page_fault(regs, write, address))
>
>     Any reason not to collapse these into single *if*?
>

It makes the conditional call to mipsvz_page_fault() less obvious.

Certainly the same semantics can be achieved several different ways.

David Daney


>> +            return;
>> +    }
>> +#endif
>> +
>>
>
>
