Received: from webmail.solarflare.com ([12.187.104.25]:29049 "EHLO
        webmail.solarflare.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6816288Ab3JCWwFO9uad (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 4 Oct 2013 00:52:05 +0200
Message-ID: <1380840585.3419.50.camel@bwh-desktop.uk.level5networks.com>
Subject: Re: [PATCH RFC 00/77] Re-design MSI/MSI-X interrupts enablement
 pattern
From: Ben Hutchings <bhutchings@solarflare.com>
In-Reply-To: <cover.1380703262.git.agordeev@redhat.com>
References: <cover.1380703262.git.agordeev@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 3 Oct 2013 23:49:45 +0100
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
Message-ID: <20131003224945.IpPQs6yr6OBUORCWYb2FRuOd0flT8Nq3kJgSUoRvSVc@z>

On Wed, 2013-10-02 at 12:48 +0200, Alexander Gordeev wrote:
> This series is against "next" branch in Bjorn's repo:
> git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git
> 
> Currently pci_enable_msi_block() and pci_enable_msix() interfaces
> return a error code in case of failure, 0 in case of success and a
> positive value which indicates the number of MSI-X/MSI interrupts
> that could have been allocated. The latter value should be passed
> to a repeated call to the interfaces until a failure or success:
>
> 
> 	for (i = 0; i < FOO_DRIVER_MAXIMUM_NVEC; i++)
> 		adapter->msix_entries[i].entry = i;
> 
> 	while (nvec >= FOO_DRIVER_MINIMUM_NVEC) {
> 		rc = pci_enable_msix(adapter->pdev,
> 				     adapter->msix_entries, nvec);
> 		if (rc > 0)
> 			nvec = rc;
> 		else
> 			return rc;
> 	}
> 
> 	return -ENOSPC;
> 
> 
> This technique proved to be confusing and error-prone. Vast share
> of device drivers simply fail to follow the described guidelines.
> 
> This update converts pci_enable_msix() and pci_enable_msi_block()
> interfaces to canonical kernel functions and makes them return a
> error code in case of failure or 0 in case of success.
[...]

I think this is fundamentally flawed: pci_msix_table_size() and
pci_get_msi_cap() can only report the limits of the *device* (which the
driver usually already knows), whereas MSI allocation can also be
constrained due to *global* limits on the number of distinct IRQs.

Currently pci_enable_msix() will report a positive value if it fails due
to the global limit.  Your patch 7 removes that.  pci_enable_msi_block()
unfortunately doesn't appear to do this.

It seems to me that a more useful interface would take a minimum and
maximum number of vectors from the driver.  This wouldn't allow the
driver to specify that it could only accept, say, any even number within
a certain range, but you could still leave the current functions
available for any driver that needs that.

Ben.

-- 
Ben Hutchings, Staff Engineer, Solarflare
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
