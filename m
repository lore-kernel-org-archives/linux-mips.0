Received: from mail-bn1bon0069.outbound.protection.outlook.com ([157.56.111.69]:34194
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27010170AbbJNQzB3VWjQ (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 14 Oct 2015 18:55:01 +0200
Date: Wed, 14 Oct 2015 09:54:50 -0700
From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 2/5] gpio/xilinx: enable for MIPS
Message-ID: <20151014165450.GS15287@xsjsorenbubuntu>
References: <1444827117-10939-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <1444827117-10939-3-git-send-email-Zubair.Kakakhel@imgtec.com>
 <20151014151813.GL15287@xsjsorenbubuntu>
 <561E7B65.3090704@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <561E7B65.3090704@metafoo.de>
Return-Path: <soren.brinkmann@xilinx.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, ralf@linux-mips.org, robh+dt@kernel.org, linus.walleij@linaro.org, linux-mips@linux-mips.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20151014165450.d59NC6SDstW2KWck0C_FEzV7P2lhA946f5iqDixKrE0@z>

On Wed, 2015-10-14 at 05:57PM +0200, Lars-Peter Clausen wrote:
> On 10/14/2015 05:18 PM, Sören Brinkmann wrote:
> > On Wed, 2015-10-14 at 01:51PM +0100, Zubair Lutfullah Kakakhel wrote:
> >> MIPSfpga uses the axi gpio controller. Enable the driver for MIPS.
> >>
> >> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> >> ---
> >>  drivers/gpio/Kconfig | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> >> index 8949b3f..58e9afd 100644
> >> --- a/drivers/gpio/Kconfig
> >> +++ b/drivers/gpio/Kconfig
> >> @@ -508,7 +508,7 @@ config GPIO_XGENE_SB
> >>  
> >>  config GPIO_XILINX
> >>  	tristate "Xilinx GPIO support"
> >> -	depends on OF_GPIO && (PPC || MICROBLAZE || ARCH_ZYNQ || X86)
> >> +	depends on OF_GPIO && (PPC || MICROBLAZE || ARCH_ZYNQ || X86 || MIPS)
> > 
> > Hmm, in general, this driver is hopefully generic enough that it doesn't
> > have any real architecture dependencies. And I suspect, we want to
> > enable this driver for ARM64 for ZynqMP soon too. Should we probably
> > drop these arch dependencies completely? It seems to become quite a long list.
> 
> I've been thinking about this a while ago. This is certainly not the only
> driver affected by this problem. But the thing is people always complain if
> new symbols become visable in Kconfig that don't apply to their platform.
> 
> Maybe we should introduce a HAS_REPROGRAMABLE_LOGIC (or similar) feature
> Kconfig symbol and let platforms which have a FPGA select it and let drivers
> for FPGA peripherals depend on it.

Sounds like a good idea to me. But, does that work for all use-cases.
E.g. if you plug some PCIe card with an FPGA into an x86(_64) machine.
That would allow you to use those drivers, but I'm not sure how that
could pull in the new config symbol.

	Sören
