Received: from mailapp01.imgtec.com ([195.59.15.196]:51959 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009062AbbI3NeuqnP0K (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 30 Sep 2015 15:34:50 +0200
Subject: Re: [PATCH 0/6] Implement generic IPI support mechanism
References: <1443019758-20620-1-git-send-email-qais.yousef@imgtec.com>
 <5602D958.6000003@linux.intel.com> <5603B6CA.7050601@imgtec.com>
 <alpine.DEB.2.11.1509292101420.4500@nanos>
From: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <560BE4F3.7060607@imgtec.com>
Date: Wed, 30 Sep 2015 14:34:43 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.11.1509292101420.4500@nanos>
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
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Jiang Liu <jiang.liu@linux.intel.com>, linux-kernel@vger.kernel.org, marc.zyngier@arm.com, jason@lakedaemon.net, linux-mips@linux-mips.org
Message-ID: <20150930133443.3tNO1SsAARUEX4sZHODFIKlaDUKZzWsmdg-EKYpaH5o@z>

On 09/29/2015 09:48 PM, Thomas Gleixner wrote:
>
> 	 Now how these hwirqs are allocated is a domain/architecture
> 	 specific issue.
>
> 	 x86 will just find a vector which is available on all target
> 	 cpus and mark it as used. That's a single hw irq number.
>
> 	 mips and others, which implement IPIs as regular hw interrupt
> 	 numbers, will allocate a these (consecutive) hw interrupt
> 	 numbers either from a reserved region or just from the
> 	 regular space. That's a bunch of hw irq numbers and we need
> 	 to come up with a proper storage format in the irqdata for
> 	 that. That might be
>
> 	       struct ipi_mapping {
> 		      unsigned int	nr_hwirqs;
> 		      unsigned int	cpumap[NR_CPUS];
> 	       };

Can we use NR_CPUS here? If we run in UP configuration for instance, 
this will be one. The coprocessor could be outside the NR_CPUS range in 
general, no?

How about

                         struct ipi_mapping {
                                 unsigned int        nr_hwirqs;
                                 unsigned int        nr_cpus;
                                 unsigned int        *cpumap;
                         }

where cpumap is dynamically allocated by the controller which has better 
knowledge about the supported cpu range it can talk to?

This made me realise another problem. struct cpumask is dependent on 
NR_CPUS. I can use the generic BITMAP I suppose?

> 	 or some other appropriate storage format like:
>
> 	       struct ipi_mapping {
> 	       	      unsigned int	hwirq_base;
> 		      unsigned int	cpu_offset;
> 		      unsigned int	nr_hwirqs;
> 	       };
>
> 	 which is less space consuming, but restricted to consecutive
> 	 hwirqs which can be mapped to the cpu number linearly:
>
> 	 	hwirq = hwirq_base + cpu - cpu_offset;
> 	
>


This could work without worrying about NR_CPUS but it would be nice not 
to restrict the controller to consecutive hwirqs.

Thanks a lot for the comprehensive pointers!

Thanks,
Qais
