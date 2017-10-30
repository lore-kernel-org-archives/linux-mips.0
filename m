Received: from mail-vk0-x241.google.com ([IPv6:2607:f8b0:400c:c05::241]:49855
        "EHLO mail-vk0-x241.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992215AbdJ3OIZd1ya5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 30 Oct 2017 15:08:25 +0100
MIME-Version: 1.0
In-Reply-To: <1508868949-16652-3-git-send-email-jim2101024@gmail.com>
References: <1508868949-16652-1-git-send-email-jim2101024@gmail.com> <1508868949-16652-3-git-send-email-jim2101024@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 30 Oct 2017 15:07:58 +0100
Message-ID: <CAOiHx=kYf0pOrSvRHuj6+cy6qzSuz23RfNbB8ADLy_dRwZhiAg@mail.gmail.com>
Subject: Re: [PATCH 2/8] PCI: host: brcmstb: add DT docs for Brcmstb PCIe device
Content-Type: text/plain; charset="UTF-8"
Return-Path: <jonas.gorski@gmail.com>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Brian Norris <computersforpeace@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, Florian Fainelli <f.fainelli@gmail.com>, linux-pci@vger.kernel.org, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Gregory Fong <gregory.0xf0@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, MIPS Mailing List <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20171030140758.JpKWs_9gm7K-DiNPth35lmyigLvZJk2IYd23BTm6Is4@z>

Hi,

On 24 October 2017 at 20:15, Jim Quinlan <jim2101024@gmail.com> wrote:
> The DT bindings description of the Brcmstb PCIe device is described.  This
> node can be used by almost all Broadcom settop box chips, using
> ARM, ARM64, or MIPS CPU architectures.
>
> Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
> ---
>  .../devicetree/bindings/pci/brcmstb-pci.txt        | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/brcmstb-pci.txt
>
> diff --git a/Documentation/devicetree/bindings/pci/brcmstb-pci.txt b/Documentation/devicetree/bindings/pci/brcmstb-pci.txt
> new file mode 100644
> index 0000000..49f9852
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/brcmstb-pci.txt
> @@ -0,0 +1,63 @@
> +Brcmstb PCIe Host Controller Device Tree Bindings
> +
> +Required Properties:
> +- compatible
> +  "brcm,bcm7425-pcie" -- for 7425 family MIPS-based SOCs.
> +  "brcm,bcm7435-pcie" -- for 7435 family MIPS-based SOCs.
> +  "brcm,bcm7445-pcie" -- for 7445 and later ARM based SOCs (not including
> +      the 7278).
> +  "brcm,bcm7278-pcie"  -- for 7278 family ARM-based SOCs.
> +

(snip)

> +
> +Example Node:
> +
> +pcie0: pcie@f0460000 {
> +               reg = <0x0 0xf0460000 0x0 0x9310>;
> +               interrupts = <0x0 0x0 0x4>;
> +               compatible = "brcm,pci-plat-dev";

This is not one of the valid compatibles mentioned above.


Regards
Jonas
