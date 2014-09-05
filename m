Received: from mail-lb0-f170.google.com ([209.85.217.170]:33753 "EHLO
        mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27007043AbaIELlsLcnNf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 5 Sep 2014 13:41:48 +0200
Received: by mail-lb0-f170.google.com with SMTP id w7so13352372lbi.1
        for <linux-mips@linux-mips.org>; Fri, 05 Sep 2014 04:41:42 -0700 (PDT)
Message-ID: <5409A174.3050205@cogentembedded.com>
Date: Fri, 05 Sep 2014 15:41:40 +0400
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
MIME-Version: 1.0
Subject: Re: [PATCH v1 15/21] Powerpc/MSI: Use MSI chip framework to configure
 MSI/MSI-X irq
References: <1409911806-10519-1-git-send-email-wangyijing@huawei.com> <1409911806-10519-16-git-send-email-wangyijing@huawei.com> <540994D4.6040500@cogentembedded.com> <43412AE0-85BB-4B4B-A4EA-2C6D3B8B85D7@gmail.com>
In-Reply-To: <43412AE0-85BB-4B4B-A4EA-2C6D3B8B85D7@gmail.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <sergei.shtylyov@cogentembedded.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: wangyijing <wangyijing0307@gmail.com>
Cc: Yijing Wang <wangyijing@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, Xinwei Hu <huxinwei@huawei.com>, Wuyun <wuyun.wu@huawei.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <linux@arm.linux.org.uk>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "arnab.basu@freescale.com" <arnab.basu@freescale.com>, "Bharat.Bhushan@freescale.com" <Bharat.Bhushan@freescale.com>, "x86@kernel.org" <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Joerg Roedel <joro@8bytes.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Sebastian Ott <sebott@linux.vnet.ibm.com>, Tony Luck <tony.luck@intel.com>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Chris Metcalf <cmetcalf@tilera.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20140905114140.37FRAaNoLtnFQEphWNo8A7CSIUDugio2W14yUY3YzmI@z>

On 9/5/2014 3:33 PM, wangyijing wrote:

>>> Use MSI chip framework instead of arch MSI functions to configure
>>> MSI/MSI-X irq. So we can manage MSI/MSI-X irq in a unified framework.

>>> Signed-off-by: Yijing Wang <wangyijing@huawei.com>
>>> ---
>>>   arch/powerpc/kernel/msi.c |   14 ++++++++++++--
>>>   1 files changed, 12 insertions(+), 2 deletions(-)

>>> diff --git a/arch/powerpc/kernel/msi.c b/arch/powerpc/kernel/msi.c
>>> index 71bd161..01781a4 100644
>>> --- a/arch/powerpc/kernel/msi.c
>>> +++ b/arch/powerpc/kernel/msi.c
>> [...]
>>> @@ -27,7 +27,17 @@ int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
>>>       return ppc_md.setup_msi_irqs(dev, nvec, type);
>>>   }
>>>
>>> -void arch_teardown_msi_irqs(struct pci_dev *dev)
>>> +static void ppc_teardown_msi_irqs(struct pci_dev *dev)

>>    Shouldn't this function take IRQ # instead?

> This function need to teardown all msi irqs of the pci dev, we should pass the pci dev as argument .

    Ah, I've mixed up the teardown_irqs() method with teardown_irq()! Too 
similar. :-)

> Thanks!
> Yijing.

WBR, Sergei
