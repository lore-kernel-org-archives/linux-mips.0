Received: from webmail.solarflare.com ([12.187.104.25]:58205 "EHLO
        webmail.solarflare.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6868699Ab3JCVxG5d-O4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 3 Oct 2013 23:53:06 +0200
Message-ID: <1380837174.3419.21.camel@bwh-desktop.uk.level5networks.com>
Subject: Re: [PATCH RFC 06/77] PCI/MSI: Factor out pci_get_msi_cap()
 interface
From: Ben Hutchings <bhutchings@solarflare.com>
Date: Thu, 3 Oct 2013 22:52:54 +0100
In-Reply-To: <9c282c4ab92731c719d161d2db6fc54ce33891d9.1380703262.git.agordeev@redhat.com>
References: <cover.1380703262.git.agordeev@redhat.com>
         <9c282c4ab92731c719d161d2db6fc54ce33891d9.1380703262.git.agordeev@redhat.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <bhutchings@solarflare.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alexander Gordeev <agordeev@redhat.com>
Cc: linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Ralf Baechle <ralf@linux-mips.org>, Michael Ellerman <michael@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Ingo Molnar <mingo@redhat.com>, Tejun Heo <tj@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Andy King <acking@vmware.com>, Jon Mason <jon.mason@intel.com>, Matt Porter <mporter@kernel.crashing.org>, linux-pci@vger.kernel.org, linux-mips@linux-mips.org, linuxppc-dev@lists.ozlabs.org, linux390@de.ibm.com, linux-s390@vger.kernel.org, x86@kernel.org, linux-ide@vger.kernel.org, iss_storagedev@hp.com, linux-nvme@lists.infradead.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, e1000-devel@lists.sourceforge.net, linux-driver@qlogic.com, Solarflare linux maintainers <linux-net-drivers@solarflare.com>, "VMware, Inc." <pv-drivers@vmware.com>, linux-scsi@vger.kernel.org
Message-ID: <20131003215254.sjstxEsMZXehv-6Gc5dRhcS01FZgUeeuLpRC_B3zPmU@z>

On Wed, 2013-10-02 at 12:48 +0200, Alexander Gordeev wrote:
[...]
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -812,6 +812,21 @@ static int pci_msi_check_device(struct pci_dev *dev, int nvec, int type)
>  	return 0;
>  }
>  
> +int pci_get_msi_cap(struct pci_dev *dev)
> +{
> +	int ret;
> +	u16 msgctl;
> +
> +	if (!dev->msi_cap)
> +		return -EINVAL;
[...]
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1144,6 +1144,11 @@ struct msix_entry {
>  
> 
>  #ifndef CONFIG_PCI_MSI
> +static inline int pci_get_msi_cap(struct pci_dev *dev)
> +{
> +	return -1;
[...]

Shouldn't this also return -EINVAL?

Ben.

-- 
Ben Hutchings, Staff Engineer, Solarflare
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
