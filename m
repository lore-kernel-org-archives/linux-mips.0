Received: from mailapp01.imgtec.com ([195.59.15.196]:33789 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013023AbbKWQzfNNi1T (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 23 Nov 2015 17:55:35 +0100
Subject: Re: [PATCH 10/14] irqchip/mips-gic: Add a IPI hierarchy domaind
References: <1446549181-31788-1-git-send-email-qais.yousef@imgtec.com>
 <1446549181-31788-11-git-send-email-qais.yousef@imgtec.com>
 <alpine.DEB.2.11.1511071323471.4032@nanos> <56407F3C.4060404@imgtec.com>
 <alpine.DEB.2.11.1511161610070.3761@nanos> <564EFA74.90606@imgtec.com>
 <alpine.DEB.2.11.1511202113010.3931@nanos>
From: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <565344FF.1090508@imgtec.com>
Date: Mon, 23 Nov 2015 16:55:27 +0000
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.11.1511202113010.3931@nanos>
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
Cc: linux-kernel@vger.kernel.org, jason@lakedaemon.net, marc.zyngier@arm.com, jiang.liu@linux.intel.com, ralf@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20151123165527.pWCh3EVKC8cj7Mu0wJUQE21dvDLimeb6uB31cdX-T4M@z>

On 11/20/2015 08:39 PM, Thomas Gleixner wrote:
>> Same applies when doing the reverse mapping.
>>
>> In other words, the ipi_mask won't always necessarily be linear to facilitate
>> the 1:1 mapping that this approach assumes.
>>
>> It is a solvable problem, but I think we're losing the elegance that promoted
>> going into this direction and I think sticking to using struct ipi_mapping
>> (with some enhancements to how it's exposed an integrated by/into generic
>> code) is a better approach.
> The only reason to use the ipi_mapping thing is if we need non
> consecutive masks, i.e. cpu 5 and 9.

That's the case I had in mind.

>
> I really don't want to have it mandatory as it does not make any sense
> for systems where the IPI is a single per_cpu interrupt. For the
> linear consecutive space it is just adding memory and cache footprint
> for no benefit. Think about machines with 4k and more cpus ....

OK. Although so far I think the ovehead is higher without the 
ipi_mapping because of all the extra checkings we have to do when 
sending an IPI. I'll leave this to code review when I have something 
ready though.

I'm debugging more problems and hopefully I'll send something this week.

Thanks,
Qais
