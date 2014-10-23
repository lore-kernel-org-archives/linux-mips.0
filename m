Received: from szxga02-in.huawei.com ([119.145.14.65]:10447 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27011440AbaJWGkKNqJVD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 Oct 2014 08:40:10 +0200
Message-ID: <5448A2A7.9090407@huawei.com>
Date: Thu, 23 Oct 2014 14:39:35 +0800
From: Yijing Wang <wangyijing@huawei.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3 09/27] arm/PCI: Clean unused pcibios_add_bus() and
 pcibios_remove_bus()
References: <1413342435-7876-1-git-send-email-wangyijing@huawei.com> <1413342435-7876-10-git-send-email-wangyijing@huawei.com> <20141023053858.GD11770@google.com>
In-Reply-To: <20141023053858.GD11770@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <wangyijing@huawei.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Xinwei Hu <huxinwei@huawei.com>, Wuyun <wuyun.wu@huawei.com>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, linux-arch@vger.kernel.org, arnab.basu@freescale.com, Bharat.Bhushan@freescale.com, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, xen-devel@lists.xenproject.org, Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org, linux-mips@linux-mips.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, Sebastian Ott <sebott@linux.vnet.ibm.com>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org, Chris Metcalf <cmetcalf@tilera.com>, Ralf Baechle <ralf@linux-mips.org>, Lucas Stach <l.stach@pengutronix.de>, David Vrabel <david.vrabel@citrix.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Michael Ellerman <mpe@ellerman.id.au>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Liviu Dudau <liviu@dudau.co.uk>
Message-ID: <20141023063935.O9ZZOyZkR7BxGbqEhysaYaRrILMvlvwbN8iN1-yOrBo@z>

>>  /*
>>   * Swizzle the device pin each time we cross a bridge.  If a platform does
>>   * not provide a swizzle function, we perform the standard PCI swizzling.
>> @@ -478,8 +464,6 @@ static void pcibios_init_hw(struct device *parent, struct hw_pci *hw,
>>  		sys->swizzle = hw->swizzle;
>>  		sys->map_irq = hw->map_irq;
>>  		sys->align_resource = hw->align_resource;
>> -		sys->add_bus = hw->add_bus;
>> -		sys->remove_bus = hw->remove_bus;
>>  		INIT_LIST_HEAD(&sys->resources);
>>  
>>  		if (hw->private_data)
> 
> What do the core changes below have to do with the ARM changes above?
> They should be a separate patch unless they can't be separated.

Hm, it's not the thing have to do, because the changes below is only used by arm arch, so I put it here
together. It's ok to split the core changes out to another one.

> 
>> diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
>> index f11108c..56e54ad 100644
>> --- a/drivers/pci/msi.c
>> +++ b/drivers/pci/msi.c
>> @@ -32,12 +32,10 @@ int pci_msi_ignore_mask;
>>  
>>  int __weak arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc)
>>  {
>> -	struct msi_chip *chip = dev->bus->msi;
>> +	struct msi_chip *chip;
>>  	int err;
>>  
>> -	if (!chip)
>> -		chip = pci_msi_chip(dev->bus);
>> -
>> +	chip = pci_msi_chip(dev->bus);
>>  	if (!chip || !chip->setup_irq)
>>  		return -EINVAL;
>>  
>> @@ -51,10 +49,7 @@ int __weak arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc)
>>  void __weak arch_teardown_msi_irq(unsigned int irq)
>>  {
>>  	struct msi_desc *entry = irq_get_msi_desc(irq);
>> -	struct msi_chip *chip = entry->dev->bus->msi;
>> -
>> -	if (!chip)
>> -		chip = pci_msi_chip(entry->dev->bus);
>> +	struct msi_chip *chip = pci_msi_chip(entry->dev->bus);
>>  
>>  	if (!chip || !chip->teardown_irq)
>>  		return;
>> -- 
>> 1.7.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> .
> 


-- 
Thanks!
Yijing
