Received: from 20pmail.ess.barracuda.com ([64.235.150.246]:47138 "EHLO
        20pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991163AbdJSIOnSA7yD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 19 Oct 2017 10:14:43 +0200
Subject: Re: [PATCH 1/3] clocksource/mips-gic-timer: Fix rcu_sched timeouts
 from multithreading
References: <1507730474-8577-1-git-send-email-matt.redfearn@mips.com>
 <alpine.DEB.2.20.1710182226080.2477@nanos>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <dd1dcbdf-93bc-7807-df5c-2ec36550bd5a@mips.com>
Date: Thu, 19 Oct 2017 09:08:21 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1710182226080.2477@nanos>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thomas Gleixner <tglx@linutronix.de>, James Hogan <james.hogan@mips.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, "# v3 . 19 +" <stable@vger.kernel.org>, linux-kernel@vger.kernel.org
Message-ID: <20171019080821.EWuBlWsei31lMiDVOfwPDZdQxGdupjL4TTkYi4km3ho@z>


On 18/10/17 21:34, Thomas Gleixner wrote:
> On Wed, 11 Oct 2017, Matt Redfearn wrote:
>
>> When the MIPS GIC clockevent code was written, it appears to have
>> inherited the 0x300 cycle min delta from the MIPS CPU timer driver. This
>> is suboptimal for two reasons.
>>
>> Firstly, the CPU timer counts once every other cycle (i.e. half the
>> clock rate). The GIC counts once per clock. Assuming that the GIC and
>> CPU share the same clock this means the GIC is counting twice as fast,
>> and so the min delta should be (at least) doubled. Fix this by doubling
>> the min delta to 0x600.
>>
>> Secondly, the fixed min delta ignores the fact that with MIPS
>> multithreading active, execution resource within a core is shared
>> between the hardware threads within that core. An inconvenienly timed
>> switch of executing thread within gic_next_event, between the read and
>> write of updated count, can result in the CPU writing an event in the
>> past, and subsequently not receiving a tick interrupt until the counter
>> wraps. This stalls the CPU from the RCU scheduler. Other CPUs detect
>> this and print rcu_sched timeout messages in  the kernel log. It can
>> lead to other issues as well if the CPU is holding locks or other
>> resources at the point at which it stalls. Fix this by scaling the min
>> delta for the timer based on the number of threads in the core
>> (smp_num_siblings). This accounts for the greater average runtime of
>> CPUs within a multithreading core.
> I don't understand why this is not catched by the check at the end of the
> next_event() function:
>
>          res = ((int)(gic_read_count() - cnt) >= 0) ? -ETIME : 0;
>
> Btw, the local_irq_save() in this function is pointless as this function is
> always called with interrupts disabled from the core code.
>
> Thanks,
>
> 	tglx
>
>

Hi tglx,

This is an issue because in some cases (hrtimer_reprogram -> 
clockevents_program_event -> clockevents_program_min_delta, when 
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=n) there is no retry performed in 
the case of -ETIME. There has been a patch pending for some time 
https://patchwork.kernel.org/patch/8909491/ which ought to address this 
and retry in the case of an event in the past on this call path. But in 
the meantime this patch vastly improves the situation.

Thanks,
Matt
