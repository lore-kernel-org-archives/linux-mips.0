Received: from mail-bn1bon0063.outbound.protection.outlook.com ([157.56.111.63]:39609
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27008926AbbCRQLVEa-Gw (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 18 Mar 2015 17:11:21 +0100
Message-ID: <5509A39C.6010707@caviumnetworks.com>
Date: Wed, 18 Mar 2015 09:11:08 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] pci: octeon: Remove udelay() causing huge IRQ latency
References: <55097811.8050003@nokia.com>
In-Reply-To: <55097811.8050003@nokia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, David Daney <ddaney@cavium.com>, ddaney.cavm@gmail.com, "ext Daney, David" <David.Daney@caviumnetworks.com>, Rob Herring <robh@kernel.org>, Jiri Kosina <jkosina@suse.cz>, Randy Dunlap <rdunlap@infradead.org>, Masanari Iida <standby24x7@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, "Rulf, Mathias (Nokia - DE/Ulm)" <mathias.rulf@nokia.com>
Message-ID: <20150318161108.MtjISLq06KHBwK-PCAl9PxNu2L4vy2lpUc6scM0Wp2I@z>

On 03/18/2015 06:05 AM, Alexander Sverdlin wrote:
> udelay() in PCI/PCIe read/write callbacks cause 30ms IRQ latency on Octeon
> platforms because these operations are called from PCI_OP_READ() and
> PCI_OP_WRITE() under raw_spin_lock_irqsave().
>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Can you say how it was tested.  In principle I have no objections, but 
it would be nice to know how it was validated.

Thanks,
David Daney


> ---
>   arch/mips/include/asm/octeon/pci-octeon.h |    3 ---
>   arch/mips/pci/pci-octeon.c                |    6 ------
>   arch/mips/pci/pcie-octeon.c               |    8 --------
>   3 files changed, 0 insertions(+), 17 deletions(-)
>
> diff --git a/arch/mips/include/asm/octeon/pci-octeon.h b/arch/mips/include/asm/octeon/pci-octeon.h
> index 64ba56a..1884609 100644
> --- a/arch/mips/include/asm/octeon/pci-octeon.h
> +++ b/arch/mips/include/asm/octeon/pci-octeon.h
> @@ -11,9 +11,6 @@
>
>   #include <linux/pci.h>
>
> -/* Some PCI cards require delays when accessing config space. */
> -#define PCI_CONFIG_SPACE_DELAY 10000
> -
>   /*
>    * The physical memory base mapped by BAR1.  256MB at the end of the
>    * first 4GB.
> diff --git a/arch/mips/pci/pci-octeon.c b/arch/mips/pci/pci-octeon.c
> index a04af55..01c604a 100644
> --- a/arch/mips/pci/pci-octeon.c
> +++ b/arch/mips/pci/pci-octeon.c
> @@ -271,9 +271,6 @@ static int octeon_read_config(struct pci_bus *bus, unsigned int devfn,
>   	pci_addr.s.func = devfn & 0x7;
>   	pci_addr.s.reg = reg;
>
> -#if PCI_CONFIG_SPACE_DELAY
> -	udelay(PCI_CONFIG_SPACE_DELAY);
> -#endif
>   	switch (size) {
>   	case 4:
>   		*val = le32_to_cpu(cvmx_read64_uint32(pci_addr.u64));
> @@ -308,9 +305,6 @@ static int octeon_write_config(struct pci_bus *bus, unsigned int devfn,
>   	pci_addr.s.func = devfn & 0x7;
>   	pci_addr.s.reg = reg;
>
> -#if PCI_CONFIG_SPACE_DELAY
> -	udelay(PCI_CONFIG_SPACE_DELAY);
> -#endif
>   	switch (size) {
>   	case 4:
>   		cvmx_write64_uint32(pci_addr.u64, cpu_to_le32(val));
> diff --git a/arch/mips/pci/pcie-octeon.c b/arch/mips/pci/pcie-octeon.c
> index 1bb0b2b..99f3db4 100644
> --- a/arch/mips/pci/pcie-octeon.c
> +++ b/arch/mips/pci/pcie-octeon.c
> @@ -1762,14 +1762,6 @@ static int octeon_pcie_write_config(unsigned int pcie_port, struct pci_bus *bus,
>   	default:
>   		return PCIBIOS_FUNC_NOT_SUPPORTED;
>   	}
> -#if PCI_CONFIG_SPACE_DELAY
> -	/*
> -	 * Delay on writes so that devices have time to come up. Some
> -	 * bridges need this to allow time for the secondary busses to
> -	 * work
> -	 */
> -	udelay(PCI_CONFIG_SPACE_DELAY);
> -#endif
>   	return PCIBIOS_SUCCESSFUL;
>   }
>
>
