Received: from szxga03-in.huawei.com ([119.145.14.66]:50910 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010898AbaJ0BKTwGxCk (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 27 Oct 2014 02:10:19 +0100
Message-ID: <544D9A8E.6030607@huawei.com>
Date: Mon, 27 Oct 2014 09:06:22 +0800
From: Yijing Wang <wangyijing@huawei.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3 16/27] Mips/MSI: Save msi chip in pci sysdata
References: <1413342435-7876-1-git-send-email-wangyijing@huawei.com> <1413342435-7876-17-git-send-email-wangyijing@huawei.com> <20141025130428.GD16738@linux-mips.org>
In-Reply-To: <20141025130428.GD16738@linux-mips.org>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Xinwei Hu <huxinwei@huawei.com>, Wuyun <wuyun.wu@huawei.com>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, linux-arch@vger.kernel.org, arnab.basu@freescale.com, Bharat.Bhushan@freescale.com, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, xen-devel@lists.xenproject.org, Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org, linux-mips@linux-mips.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, Sebastian Ott <sebott@linux.vnet.ibm.com>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org, Chris Metcalf <cmetcalf@tilera.com>, Lucas Stach <l.stach@pengutronix.de>, David Vrabel <david.vrabel@citrix.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Michael Ellerman <mpe@ellerman.id.au>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Liviu Dudau <liviu@dudau.co.uk>
Message-ID: <20141027010622.RpBNL3dCMwCxnu4CZOTwugROLsoccUDU6m1tvDvK4cI@z>

On 2014/10/25 21:04, Ralf Baechle wrote:
> On Wed, Oct 15, 2014 at 11:07:04AM +0800, Yijing Wang wrote:
> 
>> +static inline struct msi_chip *pci_msi_chip(struct pci_bus *bus)
>> +{
>> +	struct pci_controller *control = (struct pci_controller *)bus->sysdata;
> 
> bus->sysdata is void * so this cast is unnecessary.

Yes, will update it, thanks!

> 
>   Ralf
> 
> .
> 


-- 
Thanks!
Yijing
