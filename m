Received: from mailapp01.imgtec.com ([195.59.15.196]:15594 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013038AbbKIKHXn-5zP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 9 Nov 2015 11:07:23 +0100
Subject: Re: [PATCH 07/14] genirq: Add a new generic IPI reservation code to
 irq core
References: <1446549181-31788-1-git-send-email-qais.yousef@imgtec.com>
 <1446549181-31788-8-git-send-email-qais.yousef@imgtec.com>
 <alpine.DEB.2.11.1511071427370.4032@nanos>
From: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <56407055.6080602@imgtec.com>
Date: Mon, 9 Nov 2015 10:07:17 +0000
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.11.1511071427370.4032@nanos>
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
Message-ID: <20151109100717.kPS6TLOv49GEXwUjz_2wDUcTQ8PAjVAQdyrMn3HVxGg@z>

On 11/07/2015 01:31 PM, Thomas Gleixner wrote:
> On Tue, 3 Nov 2015, Qais Yousef wrote:
>> +
>> +	/* always allocate a virq per cpu */
>> +	nr_irqs = ipi_mask_weight(dest);
> That's not really a good assumption. Not all architectures need
> seperate interrupt numbers / descriptors because they can allocate
> from a per cpu interrupt space. We really want to handle that here as
> well. So we need a flag in the IPI domain which tells us whether that
> allocation needs to be weight(desc) or 1.

OK. But is it bad to always allocate the weight? I thought allocating 
virqs is cheap, or maybe not?

Thanks,
Qais
