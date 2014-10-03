Received: from bh-25.webhostbox.net ([208.91.199.152]:56956 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010463AbaJCNMmZ2kz7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 3 Oct 2014 15:12:42 +0200
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
        (envelope-from <linux@roeck-us.net>)
        id 1Xa2ex-001AWG-Ml
        for linux-mips@linux-mips.org; Fri, 03 Oct 2014 13:12:35 +0000
Message-ID: <542EA0B7.5040007@roeck-us.net>
Date: Fri, 03 Oct 2014 06:12:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
MIME-Version: 1.0
Subject: Re: [RFC PATCH 05/16] arm64: support poweroff through poweroff handler
 call chain
References: <1412100056-15517-1-git-send-email-linux@roeck-us.net> <1412100056-15517-6-git-send-email-linux@roeck-us.net> <20141003103056.GB14110@localhost>
In-Reply-To: <20141003103056.GB14110@localhost>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <linux@roeck-us.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-c6x-dev@linux-c6x.org" <linux-c6x-dev@linux-c6x.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-metag@vger.kernel.org" <linux-metag@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Will Deacon <Will.Deacon@arm.com>
Message-ID: <20141003131223.KKucac00XaSKruaVyHb6n5tVxfYMNBPU2u8v9Fxw9aM@z>

On 10/03/2014 03:30 AM, Catalin Marinas wrote:
> On Tue, Sep 30, 2014 at 07:00:45PM +0100, Guenter Roeck wrote:
>> The kernel core now supports a poweroff handler call chain
>> to remove power from the system. Call it if pm_power_off
>> is set to NULL.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will.deacon@arm.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   arch/arm64/kernel/process.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
>> index 398ab05..cc0c63e 100644
>> --- a/arch/arm64/kernel/process.c
>> +++ b/arch/arm64/kernel/process.c
>> @@ -157,6 +157,8 @@ void machine_power_off(void)
>>   	smp_send_stop();
>>   	if (pm_power_off)
>>   		pm_power_off();
>> +	else
>> +		do_kernel_poweroff();
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
>
> As others already stated, I think we should eventually remove
> pm_power_off entirely.
>

Hi Catalin,
yes, already working on it. As suggested by others, I'll move pm_power_off
to a central location (no need to declare the same variable for each
architecture) and hide the call to it in do_kernel_poweroff() as a
first step. You'll see this in the next version of the series.
This will make it much easier to remove it later on.

Thanks,
Guenter
