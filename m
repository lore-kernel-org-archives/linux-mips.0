Received: from mail-eopbgr20053.outbound.protection.outlook.com ([40.107.2.53]:31074
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992028AbcHTBzOITZJI (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sat, 20 Aug 2016 03:55:14 +0200
Subject: Re: [PATCH v8 1/4] nmi_backtrace: add more trigger_*_cpu_backtrace()
 methods
References: <1471377024-2244-1-git-send-email-cmetcalf@mellanox.com>
 <1471377024-2244-2-git-send-email-cmetcalf@mellanox.com>
 <20160818141242.GK26194@pathway.suse.cz>
From: Chris Metcalf <cmetcalf@mellanox.com>
Message-ID: <233b9270-2f35-b3c5-2520-bf513153f260@mellanox.com>
Date: Fri, 19 Aug 2016 21:54:31 -0400
MIME-Version: 1.0
In-Reply-To: <20160818141242.GK26194@pathway.suse.cz>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <cmetcalf@mellanox.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Petr Mladek <pmladek@suse.com>
Cc: Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Aaron Tomlin <atomlin@redhat.com>, Ingo Molnar <mingo@redhat.com>, Andrew Morton <akpm@osdl.org>, Daniel Thompson <daniel.thompson@linaro.org>, "Ralf Baechle ralf @ linux-mips . org David S. Miller" <davem@davemloft.net>, linux-mips@linux-mips.org, sparclinux@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <20160820015431.VwWjTEa3WGuy5TDDy3h2OsYCGS1FRSamEWAr7jBrq_g@z>

On 8/18/2016 10:12 AM, Petr Mladek wrote:
> On Tue 2016-08-16 15:50:21, Chris Metcalf wrote:
>> Currently you can only request a backtrace of either all cpus, or
>> all cpus but yourself.  It can also be helpful to request a remote
>> backtrace of a single cpu, and since we want that, the logical
>> extension is to support a cpumask as the underlying primitive.
>>
>> This change modifies the existing lib/nmi_backtrace.c code to take
>> a cpumask as its basic primitive, and modifies the linux/nmi.h code
>> to use the new "cpumask" method instead.
>>
>> The mips code ignored the "include_self" boolean but with this change
>> it will now also dump a local backtrace if requested.
>>
>> diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
>> index 7429ad09fbe3..fea1fa7726e3 100644
>> --- a/arch/mips/kernel/process.c
>> +++ b/arch/mips/kernel/process.c
>> @@ -569,9 +569,16 @@ static void arch_dump_stack(void *info)
>>   	dump_stack();
>>   }
>>   
>> -void arch_trigger_all_cpu_backtrace(bool include_self)
>> +void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
>>   {
>> -	smp_call_function(arch_dump_stack, NULL, 1);
>> +	long this_cpu = get_cpu();
>> +
>> +	if (cpumask_test_cpu(this_cpu, mask) && !exclude_self)
>> +		dump_stack();
> The bit is not cleared in the mask. Therefore arch_dump_stack
> will get called for this CPU as well.

Actually, and kind of confusingly, smp_call_function_many() never calls
the current cpu, even if it is in the mask.  So this code is OK as-is.

> Otherwise the patch patch looks good to me.

Great, thanks!  Should I add your Reviewed-by?

-- 
Chris Metcalf, Mellanox Technologies
http://www.mellanox.com
