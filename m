Received: from mailapp01.imgtec.com ([195.59.15.196]:1980 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009454AbbJMOljBWo06 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Oct 2015 16:41:39 +0200
Subject: Re: [RFC v2 PATCH 08/14] irq: implement irq_send_ipi
References: <1444731382-19313-1-git-send-email-qais.yousef@imgtec.com>
 <1444731382-19313-9-git-send-email-qais.yousef@imgtec.com>
 <alpine.DEB.2.11.1510131539010.25029@nanos>
From: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <561D181C.8000801@imgtec.com>
Date: Tue, 13 Oct 2015 15:41:32 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.11.1510131539010.25029@nanos>
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
Message-ID: <20151013144132.q8a9f1roAwA-3BF04MCqwkCsrIojN6HZJiLExOpT-sc@z>

On 10/13/2015 02:40 PM, Thomas Gleixner wrote:
> On Tue, 13 Oct 2015, Qais Yousef wrote:
>
> Lacks kerneldoc
>
>> +int __irq_desc_send_ipi(struct irq_desc *desc, const struct ipi_mask *dest)
>> +{
>> +	struct irq_data *data = irq_desc_get_irq_data(desc);
>> +	struct irq_chip *chip = irq_data_get_irq_chip(data);
>> +
>> +	if (!chip || !chip->irq_send_ipi)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * Do not validate the mask for IPIs marked global. These are
>> +	 * regular IPIs so we can avoid the operation as their target
>> +	 * mask is the cpu_possible_mask.
>> +	 */
>> +	if (!dest->global) {
>> +		if (!bitmap_subset(dest->cpumask, data->ipi_mask.cpumask,
>> +				   dest->nbits))
>> +			return -EINVAL;
>> +	}
> This looks half thought out. You rely on the caller getting the global
> bit right. There should be a sanity check for this versus
> data->ipi_mask and also you need to validate nbits.

Yes I might have rushed this part as I did it last. I'll improve it.

>
>> +EXPORT_SYMBOL(irq_send_ipi);
> EXPORT_SYMBOL_GPL please
>
>

OK.

Thanks,
Qais
