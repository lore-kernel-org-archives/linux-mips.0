Received: from szxga01-in.huawei.com ([119.145.14.64]:52435 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27006668AbaIZCTiA4J96 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 26 Sep 2014 04:19:38 +0200
Message-ID: <5424CBD6.1010807@huawei.com>
Date: Fri, 26 Sep 2014 10:13:42 +0800
From: Yijing Wang <wangyijing@huawei.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 15/22] MIPS/Xlr/MSI: Use MSI chip framework to configure
 MSI/MSI-X irq
References: <1411614872-4009-1-git-send-email-wangyijing@huawei.com> <1411614872-4009-16-git-send-email-wangyijing@huawei.com> <20140925073700.GL12423@ulmo>
In-Reply-To: <20140925073700.GL12423@ulmo>
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
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Xinwei Hu <huxinwei@huawei.com>, Wuyun <wuyun.wu@huawei.com>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, linux-arch@vger.kernel.org, arnab.basu@freescale.com, Bharat.Bhushan@freescale.com, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, xen-devel@lists.xenproject.org, Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org, linux-mips@linux-mips.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, Sebastian Ott <sebott@linux.vnet.ibm.com>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org, Chris Metcalf <cmetcalf@tilera.com>, Ralf Baechle <ralf@linux-mips.org>, Lucas Stach <l.stach@pengutronix.de>, David Vrabel <david.vrabel@citrix.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Michael Ellerman <mpe@ellerman.id.au>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Message-ID: <20140926021342.jaSV7EGI4flnCzPoswYFP1JWnIdyGw5nvQyrUU0MTXk@z>

On 2014/9/25 15:37, Thierry Reding wrote:
> On Thu, Sep 25, 2014 at 11:14:25AM +0800, Yijing Wang wrote:
> [...]
>> diff --git a/arch/mips/pci/pci-xlr.c b/arch/mips/pci/pci-xlr.c
> [...]
>> @@ -214,11 +214,11 @@ static int get_irq_vector(const struct pci_dev *dev)
>>  }
>>  
>>  #ifdef CONFIG_PCI_MSI
>> -void arch_teardown_msi_irq(unsigned int irq)
>> +void xlr_teardown_msi_irq(unsigned int irq)
>>  {
>>  }
>>  
>> -int arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc)
>> +int xlr_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc)
> 
> Can both of these now be static?
Yes, Will update.

> 
> Thierry
> 


-- 
Thanks!
Yijing
