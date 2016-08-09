Received: from mail-pa0-f68.google.com ([209.85.220.68]:36527 "EHLO
        mail-pa0-f68.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992776AbcHIBwkxATDy convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 9 Aug 2016 03:52:40 +0200
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 4/4] MIPS: BMIPS: Add support NAND device nodes
From: Jaedon Shin <jaedon.shin@gmail.com>
In-Reply-To: <b6df94ac-9e29-f52d-c44e-f096a8735901@gmail.com>
Date: Tue, 9 Aug 2016 10:52:30 +0900
Content-Transfer-Encoding: 8BIT
Message-Id: <E3ECFDC4-D1E8-4282-8151-D0289E198209@gmail.com>
References: <20160808021719.4680-1-jaedon.shin@gmail.com> <20160808021719.4680-5-jaedon.shin@gmail.com> <bbc4731f-7d67-435b-0249-c823b8d158bb@gmail.com> <b6df94ac-9e29-f52d-c44e-f096a8735901@gmail.com>
Return-Path: <jaedon.shin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Kevin Cernekee <cernekee@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mips@linux-mips.org

Hi Florian,

On Aug 9, 2016, at 7:40 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
> On 08/08/2016 03:35 PM, Florian Fainelli wrote:
>> On 08/07/2016 07:17 PM, Jaedon Shin wrote:
>>> Adds NAND device nodes to BCM7xxx MIPS based SoCs.
>>> 
>>> Signed-off-by: Jaedon Shin <jaedon.shin@gmail.com>
>>> ---
>>> arch/mips/boot/dts/brcm/bcm7125.dtsi               | 20 ++++++++++++++++++
>>> arch/mips/boot/dts/brcm/bcm7346.dtsi               | 20 ++++++++++++++++++
>>> arch/mips/boot/dts/brcm/bcm7358.dtsi               | 20 ++++++++++++++++++
>>> arch/mips/boot/dts/brcm/bcm7360.dtsi               | 20 ++++++++++++++++++
>>> arch/mips/boot/dts/brcm/bcm7362.dtsi               | 20 ++++++++++++++++++
>>> arch/mips/boot/dts/brcm/bcm7420.dtsi               | 20 ++++++++++++++++++
>>> arch/mips/boot/dts/brcm/bcm7425.dtsi               | 20 ++++++++++++++++++
>>> arch/mips/boot/dts/brcm/bcm7435.dtsi               | 20 ++++++++++++++++++
>>> arch/mips/boot/dts/brcm/bcm7xxx-nand-cs1-bch8.dtsi | 24 ++++++++++++++++++++++
>>> arch/mips/boot/dts/brcm/bcm97125cbmb.dts           |  5 +++++
>>> arch/mips/boot/dts/brcm/bcm97346dbsmb.dts          |  5 +++++
>>> arch/mips/boot/dts/brcm/bcm97358svmb.dts           |  5 +++++
>>> arch/mips/boot/dts/brcm/bcm97360svmb.dts           |  5 +++++
>>> arch/mips/boot/dts/brcm/bcm97362svmb.dts           |  5 +++++
>>> arch/mips/boot/dts/brcm/bcm97420c.dts              |  5 +++++
>>> arch/mips/boot/dts/brcm/bcm97425svmb.dts           |  5 +++++
>>> arch/mips/boot/dts/brcm/bcm97435svmb.dts           |  5 +++++
>>> 17 files changed, 224 insertions(+)
>>> create mode 100644 arch/mips/boot/dts/brcm/bcm7xxx-nand-cs1-bch8.dtsi
>>> 
>>> diff --git a/arch/mips/boot/dts/brcm/bcm7125.dtsi b/arch/mips/boot/dts/brcm/bcm7125.dtsi
>>> index 746ed06c85de..8642631a8451 100644
>>> --- a/arch/mips/boot/dts/brcm/bcm7125.dtsi
>>> +++ b/arch/mips/boot/dts/brcm/bcm7125.dtsi
>>> @@ -226,5 +226,25 @@
>>> 			interrupts = <61>;
>>> 			status = "disabled";
>>> 		};
>>> +
>>> +		hif_l2_intc: hif_l2_intc@411000 {
>>> +			compatible = "brcm,l2-intc";
>>> +			reg = <0x411000 0x30>;
>>> +			interrupt-controller;
>>> +			#interrupt-cells = <1>;
>>> +			interrupt-parent = <&periph_intc>;
>>> +			interrupts = <0>;
>>> +		};
>>> +
>>> +		nand: nand@412800 {
>>> +			compatible = "brcm,brcmnand-v5.0", "brcm,brcmnand";
>>> +			#address-cells = <1>;
>>> +			#size-cells = <0>;
>>> +			reg-names = "nand";
>>> +			reg = <0x412800 0x400>;
>>> +			interrupt-parent = <&hif_l2_intc>;
>>> +			interrupts = <24>;
>>> +			status = "disabled";
>>> +		};
>> 
>> This is a NAND v3.3 controller here not a v5.0 and it uses the EDU
>> registers for DMA transfers which is not supported in the mainline
>> driver, so with that dropped, the series looks fine. At any rate this
>> would require additional brcmnand changes to be supported.
> 
> The same applies to the 7420 DTS, it's also a v3.3 NAND controller
> -- 
> Florian

The NAND device nodes of v3.3 NAND controller will be removed in v2.

Thanks,
Jaedon
