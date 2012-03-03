Received: from mail-yw0-f49.google.com ([209.85.213.49]:32778 "EHLO
        mail-yw0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1903626Ab2CCTfn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 3 Mar 2012 20:35:43 +0100
Message-ID: <4F527285.1020500@gmail.com>
Date: Sat, 03 Mar 2012 13:35:33 -0600
From: Rob Herring <robherring2@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH v6 4/5] MIPS: Octeon: Setup irq_domains for interrupts.
References: <1330563422-14078-1-git-send-email-ddaney.cavm@gmail.com> <1330563422-14078-5-git-send-email-ddaney.cavm@gmail.com> <4F50D7C2.7080204@gmail.com> <4F510B8E.3070201@cavium.com> <20120302190744.571E03E1C63@localhost> <4F511FB0.5070901@cavium.com>
In-Reply-To: <4F511FB0.5070901@cavium.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: David Daney <david.daney@cavium.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, David Daney <ddaney.cavm@gmail.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <20120303193533.gRw_WwehLKCXJiWSpoQ8TWZ4AFnagzFNll0rpyXtqx8@z>

On 03/02/2012 01:29 PM, David Daney wrote:
> On 03/02/2012 11:07 AM, Grant Likely wrote:
>> On Fri, 02 Mar 2012 10:03:58 -0800, David
>> Daney<david.daney@cavium.com>  wrote:
>>> On 03/02/2012 06:22 AM, Rob Herring wrote:
>>> [...]
>>>>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>>>>> index ce30e2f..01344ae 100644
>>>>> --- a/arch/mips/Kconfig
>>>>> +++ b/arch/mips/Kconfig
>>>>> @@ -1432,6 +1432,7 @@ config CPU_CAVIUM_OCTEON
>>>>>        select WEAK_ORDERING
>>>>>        select CPU_SUPPORTS_HIGHMEM
>>>>>        select CPU_SUPPORTS_HUGEPAGES
>>>>> +    select IRQ_DOMAIN
>>>>
>>>> IIRC, Grant has a patch cued up that enables IRQ_DOMAIN for all of
>>>> MIPS.
>>>>
>>>
>>> Indeed, I now see it in linux-next.  I will remove this one.
>>>
>>>>>        help
>>>>>          The Cavium Octeon processor is a highly integrated chip
>>>>> containing
>>>>>          many ethernet hardware widgets for networking tasks. The
>>>>> processor
>>>>> diff --git a/arch/mips/cavium-octeon/octeon-irq.c
>>>>> b/arch/mips/cavium-octeon/octeon-irq.c
>>>>> index bdcedd3..e9f2f6c 100644
>>>>> --- a/arch/mips/cavium-octeon/octeon-irq.c
>>>>> +++ b/arch/mips/cavium-octeon/octeon-irq.c
>>> [...]
>>>>> +static void __init octeon_irq_set_ciu_mapping(unsigned int irq,
>>>>> +                          unsigned int line,
>>>>> +                          unsigned int bit,
>>>>> +                          struct irq_domain *domain,
>>>>>                              struct irq_chip *chip,
>>>>>                              irq_flow_handler_t handler)
>>>>>    {
>>>>> +    struct irq_data *irqd;
>>>>>        union octeon_ciu_chip_data cd;
>>>>>
>>>>>        irq_set_chip_and_handler(irq, chip, handler);
>>>>> -
>>>>>        cd.l = 0;
>>>>>        cd.s.line = line;
>>>>>        cd.s.bit = bit;
>>>>>
>>>>>        irq_set_chip_data(irq, cd.p);
>>>>>        octeon_irq_ciu_to_irq[line][bit] = irq;
>>>>> +
>>>>> +    irqd = irq_get_irq_data(irq);
>>>>> +    irqd->hwirq = line<<   6 | bit;
>>>>> +    irqd->domain = domain;
>>>>
>>>> I think the domain code will set these.
>>>
>>> It is my understanding that the domain code only does this for:
>>>
>>> o irq_domain_add_legacy()
>>>
>>> o irq_create_direct_mapping()
>>>
>>> o irq_create_mapping()
>>>
>>> We use none of those.  So I do it here.
>>>
>>> If there is a better way, I am open to suggestions.
>>
>> irq_create_mapping is called by irq_create_of_mapping() which is
>> in turn called by irq_of_parse_and-map().  irq_domain always
>> manages the hwirq and domain values.  Driver code cannot manipulate
>> them manually.
>>
> 
> I really must be missing something.
> 
> Given:
> 
> 1) I must have a mapping between hwirq and irq that I control so that
> non-OF code using the OCTEON_IRQ_* constants continues to work.

Those defines are what you need to work to get rid of.

> 2) irq_create_mapping() will allocate a random irq value if none is
> already assigned to the hwirq.
> 
> Therefore: To avoid having random irq values assigned, I must manually
> assign them.
> 

So you should be using legacy domain if you need to maintain fixed hwirq
to linux irq numbers. "linear" is a bit confusing as it doesn't mean
linear 1:1 irq number assignment, but linear search.

Ultimately, for DT boot you should use of_irq_init to scan the dts, and
then create a linear domain for each interrupt controller node. You may
need to decide on linear vs. legacy at runtime based on having a DT node
pointer or not.

Rob
