Received: from mailapp01.imgtec.com ([195.59.15.196]:59562 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007433AbbIXI1ESpRvt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 24 Sep 2015 10:27:04 +0200
Subject: Re: [PATCH 4/6] irq: add a new generic IPI handling code to irq core
References: <1443019758-20620-1-git-send-email-qais.yousef@imgtec.com>
 <1443019758-20620-5-git-send-email-qais.yousef@imgtec.com>
 <5602D863.4040503@linux.intel.com>
From: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <5603B3D1.3000405@imgtec.com>
Date: Thu, 24 Sep 2015 09:26:57 +0100
MIME-Version: 1.0
In-Reply-To: <5602D863.4040503@linux.intel.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Qais.Yousef@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Jiang Liu <jiang.liu@linux.intel.com>, linux-kernel@vger.kernel.org, tglx@linutronix.de
Cc: marc.zyngier@arm.com, jason@lakedaemon.net, linux-mips@linux-mips.org
Message-ID: <20150924082657.pVG_i_FP8QVPy6pR0k3tQkwzsdwwpOTN5tTpa5foHIw@z>

On 09/23/2015 05:50 PM, Jiang Liu wrote:
> On 2015/9/23 22:49, Qais Yousef wrote:
>>   
>> +/**
>> + * irq_reserve_ipi() - setup an IPI to destination cpumask
>> + * @domain: IPI domain
>> + * @dest: cpumask of cpus to receive the IPI
>> + * @devid: devid that requested the reservation
>> + *
>> + * Allocate a virq that can be used to send IPI to any CPU in dest mask.
>> + *
>> + * On success it'll return linux irq number and 0 on failure
>> + */
>> +unsigned int irq_reserve_ipi(struct irq_domain *domain,
>> +			     const struct cpumask *dest, void *devid)
> Hi Qais,
> 	I have caught the idea why we need "dest" here. Per my
> understanding, IPI could be sent to any active CPUs and the target
> CPUs are specified when calling send_ipi(). What's the benefit or
> usage to use "dest" to define a possible target scope here? And
> how cpu hotplug?
> Thanks!
> Gerry
>


The CPUs we want to send the IPI to are not Linux CPUs only. My use case 
is about sending IPI to audio coprocessor.
So "dest" doesn't have to be part of Linux online CPUs, hence we need to 
specify it so that the underlying controller will know how to map to 
that CPU. I should have put more info in the cover letter, not just the 
link to the discussion, apologies for that.

I'm not sure about cpu hotplug. We could call irq_destroy_ipi() when a 
cpu is hot unplugged, but the current behaviour is to statically reserve 
the IPI and keep them reserved. I think it makes sense to keep it this 
way for SMP IPIs or things will get complicated.

For a coprocessor, if we the 'module is unloaded', I'd expect the 
irq_destroy_ipi() to be called returning the reserved IPI to the pool.

Makes sense?

Thanks,
Qais
