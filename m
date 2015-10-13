Received: from mailapp01.imgtec.com ([195.59.15.196]:7160 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006648AbbJMO0aDy646 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Oct 2015 16:26:30 +0200
Subject: Re: [RFC v2 PATCH 03/14] irq: add new struct ipi_mask
References: <1444731382-19313-1-git-send-email-qais.yousef@imgtec.com>
 <1444731382-19313-4-git-send-email-qais.yousef@imgtec.com>
 <alpine.DEB.2.11.1510131517080.25029@nanos>
From: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <561D148E.9020208@imgtec.com>
Date: Tue, 13 Oct 2015 15:26:22 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.11.1510131517080.25029@nanos>
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
Message-ID: <20151013142622.K6afWpwRwyrBBP_Njyz86DJHmYB3XImjKezM3tNn1uI@z>

On 10/13/2015 02:26 PM, Thomas Gleixner wrote:
> On Tue, 13 Oct 2015, Qais Yousef wrote:
>> cpumask is limited to NR_CPUS. introduce ipi_mask which allows us to address
>> cpu range that is higher than NR_CPUS which is required for drivers to send
>> IPIs for coprocessor that are outside Linux CPU range.
>>
>> Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
>> ---
>>   include/linux/irq.h | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/include/linux/irq.h b/include/linux/irq.h
>> index 11bf09288ddb..4b537e4d393b 100644
>> --- a/include/linux/irq.h
>> +++ b/include/linux/irq.h
>> @@ -125,6 +125,21 @@ enum {
>>   struct msi_desc;
>>   struct irq_domain;
>>   
>> + /**
>> + * struct ipi_mask - IPI mask information
>> + * @cpumask: bitmap of cpumasks
>> + * @nbits: number of bits in cpumask
>> + * @global: whether the mask is SMP IPI ie: subset of cpu_possible_mask or not
>> + *
>> + * ipi_mask is similar to cpumask, but it provides nbits that's configurable
>> + * rather than fixed to NR_CPUS.
>> + */
>> +struct ipi_mask {
>> +	unsigned long	*cpumask;
>> +	unsigned int	nbits;
>> +	bool		global;
>> +};
> Can you make that:
>
> struct ipi_mask {
> 	unsigned int	nbits;
> 	bool		global;
> 	unsigned long	cpu_bitmap[];
> };
>
> That allows you to allocate the data structure in one go. So the
> ipi_mask in irq_data_common becomes a pointer which is only filled in
> when ipi_mask is actually used.
>
> Note, I renamed cpumask to cpu_bitmap to avoid confusion with
> cpumasks.
>
> We also want a helper function
>
>     struct cpumask *irq_data_get_ipi_mask(struct irq_data *data);
>
> so we can use normal cpumask operations for the majority of cases.
>
>

Will do.

Thanks,
Qais
