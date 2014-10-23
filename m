Received: from szxga03-in.huawei.com ([119.145.14.66]:51968 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27011437AbaJWGlfNJVra (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 Oct 2014 08:41:35 +0200
Message-ID: <5448A2F2.7060001@huawei.com>
Date: Thu, 23 Oct 2014 14:40:50 +0800
From: Yijing Wang <wangyijing@huawei.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3 10/27] PCI/MSI: Remove useless bus->msi assignment
References: <1413342435-7876-1-git-send-email-wangyijing@huawei.com> <1413342435-7876-11-git-send-email-wangyijing@huawei.com> <20141023054121.GE11770@google.com>
In-Reply-To: <20141023054121.GE11770@google.com>
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
Message-ID: <20141023064050.LIVvChwixmfYTSR2DUkAv7IFuDg3hXuCAVd6yfAIptM@z>

On 2014/10/23 13:41, Bjorn Helgaas wrote:
> On Wed, Oct 15, 2014 at 11:06:58AM +0800, Yijing Wang wrote:
>> Now msi chip is saved in pci_sys_data in arm,
>> we could clean the bus->msi assignment in
>> pci core.
>>
>> Signed-off-by: Yijing Wang <wangyijing@huawei.com>
>> CC: Thierry Reding <thierry.reding@gmail.com>
>> CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
>>  drivers/pci/probe.c |    1 -
>>  1 files changed, 0 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
>> index efa48dc..98bf4c3 100644
>> --- a/drivers/pci/probe.c
>> +++ b/drivers/pci/probe.c
>> @@ -682,7 +682,6 @@ static struct pci_bus *pci_alloc_child_bus(struct pci_bus *parent,
>>  
>>  	child->parent = parent;
>>  	child->ops = parent->ops;
>> -	child->msi = parent->msi;
> 
> This needs an explanation of why ARM was the only arch to depend on this.

OK, will add explanation in next version.

> 
>>  	child->sysdata = parent->sysdata;
>>  	child->bus_flags = parent->bus_flags;
>>  
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
