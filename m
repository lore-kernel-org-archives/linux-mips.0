Received: from mailapp01.imgtec.com ([195.59.15.196]:7192 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007433AbbIXIMx2ct6F (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 24 Sep 2015 10:12:53 +0200
Subject: Re: [PATCH 2/6] irqdomain: add a new send_ipi() to irq_domain_ops
References: <1443019758-20620-1-git-send-email-qais.yousef@imgtec.com>
 <1443019758-20620-3-git-send-email-qais.yousef@imgtec.com>
 <5602D6F3.7030709@linux.intel.com>
From: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <5603B07D.3020001@imgtec.com>
Date: Thu, 24 Sep 2015 09:12:45 +0100
MIME-Version: 1.0
In-Reply-To: <5602D6F3.7030709@linux.intel.com>
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
Message-ID: <20150924081245.nm4oO8NaLVhXOYh-GZURym95MrzbMASmGhCBpk1Ge0k@z>

On 09/23/2015 05:44 PM, Jiang Liu wrote:
> On 2015/9/23 22:49, Qais Yousef wrote:
>> For generic ipi core to use. It takes hwirq as its sole argument.
>> Hopefully this is generic enough? Should we pass something more abstract?
>>
>> Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
>> ---
>>   include/linux/irqdomain.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
>> index 9b3dc6c2a3cc..cef9e6158be0 100644
>> --- a/include/linux/irqdomain.h
>> +++ b/include/linux/irqdomain.h
>> @@ -92,6 +92,7 @@ struct irq_domain_ops {
>>   	void (*activate)(struct irq_domain *d, struct irq_data *irq_data);
>>   	void (*deactivate)(struct irq_domain *d, struct irq_data *irq_data);
>>   #endif
>> +	void (*send_ipi)(irq_hw_number_t hwirq);
> Hi Qais,
> 	Instead of extending the irq_domain_ops, how about extending
> irq_chip instead? If we treat IPI as a sort of irq controller, and
> irq_chip is used to encapsulate all irq controller related operations,
> and irq_domain_ops is mainly used to allocated resources instead of
> operating corresponding hardware.
> Thanks!
> Gerry
>



Yes true. I was too focused on the reservation part so when it came to 
sending the IPI it just felt natural to add it to irqdomain as it was 
simple to implement like this!

Thanks,
Qais
