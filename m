Received: from mail-by2nam03on0098.outbound.protection.outlook.com ([104.47.42.98]:7728
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992328AbeIZWHQfdd58 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 27 Sep 2018 00:07:16 +0200
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v5 06/12] MIPS: BMIPS: add dma remap for BrcmSTB PCIe
Date: Wed, 26 Sep 2018 22:07:04 +0000
Message-ID: <20180926220703.4ocppooccuot55i5@pburton-laptop>
References: <1537367527-20773-1-git-send-email-jim2101024@gmail.com>
 <1537367527-20773-7-git-send-email-jim2101024@gmail.com>
In-Reply-To: <1537367527-20773-7-git-send-email-jim2101024@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B19213CF76E74F4882C8D4312B6B4C6C@namprd08.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <pburton@wavecomp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Jim Quinlan <jim2101024@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Message-ID: <20180926220704.9oXoiqoUslv7WBXF7BsFR5QTPFIBMWHpOCua0P_I24E@z>

Hi Jim,

On Wed, Sep 19, 2018 at 10:32:01AM -0400, Jim Quinlan wrote:
> The design of the Broadcom PCIe RC controller requires us to remap its
> DMA addresses for inbound traffic.  We do this by modifying the
> definitions of __phys_to_dma() and __dma_to_phys().
> 
> In arch/mips/bmips/dma.c, these functions are already in use to remap
> DMA addresses for the 338x SOC chips.  We leave this code alone -- and
> give its mapping priority -- but if it is not in use, the PCIe DMA
> mapping is in effect.
> 
> One might think that the two DMA remapping systems of dma.c could be
> combined, but they cannot: one governs only DMA addresses for the PCIe
> controller of BrcmSTB ARM/ARM64/MIPs chips, while the other governs
> the PCIe controller *and* other peripherals for only MIPs 338x
> chips.
> 
> Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
> ---
>  arch/mips/bmips/dma.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Please copy me/linux-mips on the whole series next time - I seem to have
only received patches 6, 8 & 9 which means I have no idea whether they
have dependencies & if so whether those dependencies have been accepted
or rejected. I also have no clue whether these patches make sense to
take through the MIPS tree or if it would make more sense for someone
else to take them with acks.

> diff --git a/arch/mips/bmips/dma.c b/arch/mips/bmips/dma.c
> index 3d13c77..292994f 100644
> --- a/arch/mips/bmips/dma.c
> +++ b/arch/mips/bmips/dma.c
> @@ -18,6 +18,7 @@
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  #include <asm/bmips.h>
> +#include <soc/brcmstb/common.h>
>  
>  /*
>   * BCM338x has configurable address translation windows which allow the
> @@ -44,6 +45,10 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t pa)
>  {
>  	struct bmips_dma_range *r;
>  
> +#ifdef CONFIG_PCIE_BRCMSTB
> +	if (!bmips_dma_ranges)
> +		return brcm_phys_to_dma(dev, pa);
> +#endif
>  	for (r = bmips_dma_ranges; r && r->size; r++) {
>  		if (pa >= r->child_addr &&
>  		    pa < (r->child_addr + r->size))

I can't tell because I presume brcm_phys_to_dma() is added in one of
those patches I wasn't copied on, but perhaps you could avoid the #ifdef
by just returning brcm_phys_to_dma(dev, pa) after the loop?

> @@ -56,6 +61,10 @@ phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
>  {
>  	struct bmips_dma_range *r;
>  
> +#ifdef CONFIG_PCIE_BRCMSTB
> +	if (!bmips_dma_ranges)
> +		return (unsigned long)brcm_dma_to_phys(dev, dma_addr);
> +#endif
>  	for (r = bmips_dma_ranges; r && r->size; r++) {
>  		if (dma_addr >= r->parent_addr &&
>  		    dma_addr < (r->parent_addr + r->size))

And similar here.

Thanks,
    Paul
