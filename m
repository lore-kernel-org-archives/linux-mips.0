Received: from foss-mx-na.foss.arm.com ([217.140.108.86]:49787 "EHLO
        foss-mx-na.foss.arm.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27011153AbbATKyEhe1PZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 Jan 2015 11:54:04 +0100
Date: Tue, 20 Jan 2015 10:53:35 +0000
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] mmc: OCTEON: Add host driver for OCTEON MMC controller
Message-ID: <20150120105335.GA15924@leverpostej>
References: <1421675198-30213-1-git-send-email-aleksey.makarov@auriga.com>
 <20150119142805.GE21553@leverpostej>
 <54BD549F.1060309@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54BD549F.1060309@gmail.com>
Content-Language: en-US
Return-Path: <mark.rutland@arm.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>
Cc: Aleksey Makarov <aleksey.makarov@auriga.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Daney <david.daney@cavium.com>, Leonid Rosenboim <lrosenboim@caviumnetworks.com>, Aaron Williams <aaron.williams@cavium.com>, Chandrakala Chavva <cchavva@caviumnetworks.com>, Peter Swain <pswain@cavium.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Chris Ball <chris@printf.net>, Ulf Hansson <ulf.hansson@linaro.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Message-ID: <20150120105335.zEVxz2Iy9kC8MkXG34roaEufoaph2gh0sPLjEjgL_hA@z>

On Mon, Jan 19, 2015 at 07:01:51PM +0000, David Daney wrote:
> On 01/19/2015 06:28 AM, Mark Rutland wrote:
> > Hi,
> >
> > On Mon, Jan 19, 2015 at 01:46:36PM +0000, Aleksey Makarov wrote:
> >> The OCTEON MMC controller is currently found on cn61XX and cnf71XX
> >> devices.  Device parameters are configured from device tree data.
> >>
> >> Currenly supported are eMMC, MMC and SD devices.
> >
> > Does that mean there are other devices that this could support in
> > future, or that this supports everything it possibly can already?
>
> It is software, so obviously there are some changes that could be made
> to support other devices.  However, the bus host hardware is designed
> such that it can run only certain fixed sequences of the MMC and SD
> protocols.  Therefore it is probable that support for some types of
> devices would be impossible...

Above you state "Currenly supported are eMMC, MMC and SD devices", which
implies there are some devices not supported, but your reply makes it
sound like the block isn't designed to support anything else.

Perhaps I'm just overly sensitive to phrasing.

> >> diff --git a/Documentation/devicetree/bindings/mmc/octeon-mmc.txt b/Documentation/devicetree/bindings/mmc/octeon-mmc.txt
> >> new file mode 100644
> >> index 0000000..ce373cf
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mmc/octeon-mmc.txt
> >> @@ -0,0 +1,51 @@
> >> +* OCTEON SD/MMC Host Controller
> >> +
> >> +This controller is present on some members of the Cavium OCTEON SoC
> >> +family, provide an interface for eMMC, MMC and SD devices.  There is a
> >> +single controller that may have several "slots" connected.  These
> >> +slots appear as children of the main controller node.
> >> +
> >> +Required properties:
> >> +- compatible : Should be "cavium,octeon-6130-mmc" or "cavium,octeon-7890-mmc"
> >> +- reg : Two entries:
> >> +       1) The base address of the MMC controller register bank.
> >> +       2) The base address of the MMC DMA engine register bank.
> >> +- interrupts : Two entries:
> >> +       1) The MMC controller interrupt line.
> >> +       2) The MMC DMA engine interrupt line.
> >
> > Is the DMA engine part of the MMC controller block, or is it a
> > separate/generic component that happens to be used in combination with
> > the MMC controller?
>
> The DMA engine is an integral part of the MMC bus controller block.

Ok.

> >> +- #address-cells : Must be <1>
> >> +- #size-cells : Must be <0>
> >> +
> >> +Required properties of child nodes:
> >> +- compatible : Should be "cavium,octeon-6130-mmc-slot".
> >> +- reg : The slot number.
> >> +- cavium,bus-max-width : The number of data lines present in the slot.
> >> +- spi-max-frequency : The maximum operating frequency of the slot.
> >> +
> >> +Optional properties of child nodes:
> >> +- cd-gpios : Specify GPIOs for card detection
> >> +- wp-gpios : Specify GPIOs for write protection
> >> +- power-gpios : Specify GPIOs for power control
> >
> > No clocks in the DT?
>
> No.  The reference clock rates can be probed at runtime, so they are not
> specified in the DT.
