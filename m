Received: from 20pmail.ess.barracuda.com ([64.235.150.247]:50278 "EHLO
        20pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992348AbdJSJXNF6W5Z (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 19 Oct 2017 11:23:13 +0200
Subject: Re: [PATCH 1/3] clocksource/mips-gic-timer: Fix rcu_sched timeouts
 from multithreading
References: <1507730474-8577-1-git-send-email-matt.redfearn@mips.com>
 <935fff7a-674a-a9c5-904f-6ed4ec6366e2@linaro.org>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <c6496d5d-5581-c9fd-7b4f-755d2d456b2c@mips.com>
Date: Thu, 19 Oct 2017 10:21:50 +0100
MIME-Version: 1.0
In-Reply-To: <935fff7a-674a-a9c5-904f-6ed4ec6366e2@linaro.org>
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
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, "# v3 . 19 +" <stable@vger.kernel.org>, linux-kernel@vger.kernel.org
Message-ID: <20171019092150.cnqh1hPuYRUxG6BLI8CNeeb47xMLumHk5_mz4Kfyy7U@z>



On 19/10/17 10:09, Daniel Lezcano wrote:
> On 11/10/2017 16:01, Matt Redfearn wrote:
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
>>
>> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
>> Fixes: b695d8e6ad6f ("clocksource: mips-gic: Use clockevents_config_and_register")
>> Cc: <stable@vger.kernel.org> # v3.19 +
>>
>> Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
>> ---
> Matt,
>
> I'm dropping your series.
>
> The first patch fails to compile because of the smp_num_siblings
> variable undefined when compile testing on another arch (probably a
> header is missing).
>
> The issue the patch address could be fixed in the time framework as
> stated by Thomas.
>
> As spotted by Thomas also, the local_irq_save() is not needed in the
> set_next_event() function, so the second patch is pointless and a patch
> removing those local_irq_save()/restore() would make more sense.
>
> The third patch does not longer apply after removing the two above.
>
>   -- Daniel
>

Hi Daniel,

Yep, makes sense that's fine - thanks!

Matt
