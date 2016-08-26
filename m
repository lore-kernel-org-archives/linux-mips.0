Received: from mailapp01.imgtec.com ([195.59.15.196]:44901 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992437AbcHZNlfgjFCn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 26 Aug 2016 15:41:35 +0200
Subject: Re: [PATCH V2 00/10] microblaze/MIPS: xilfpga: intc and peripheral
References: <1471527804-26175-1-git-send-email-Zubair.Kakakhel@imgtec.com>
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Message-ID: <dfa01405-34da-89b7-0082-9f83a3c3fb18@imgtec.com>
Date: Fri, 26 Aug 2016 14:41:16 +0100
MIME-Version: 1.0
In-Reply-To: <1471527804-26175-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Zubair.Kakakhel@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: monstr@monstr.eu, ralf@linux-mips.org, tglx@linutronix.de
Cc: jason@lakedaemon.net, marc.zyngier@arm.com, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Message-ID: <20160826134116.feQO8RtkGnB-A8zlp2PxRwm7kbuN9bTQaaGHoB0Pfe4@z>

Hi,


On 08/18/2016 02:43 PM, Zubair Lutfullah Kakakhel wrote:
> Hi,
>
> The MIPS based Xilfpga platform uses the axi interrupt controller
> daisy chained to the MIPS microAptiv cpu interrupt controller.
> This patch series moves the axi interrupt controller driver out
> of arch/microblaze to drivers/irqchip. This makes it usable by
> MIPS. The rest of the series basically enables drivers and adds dt
> nodes.
>
> Would make sense for this to go via the MIPS tree.
> Hence, ACKs from microblaze. irqchip and net welcome.
>
> Compile tested on microblaze-el only!
> Based on v4.8-rc2

Ping. Would be nice to see this in for v4.9.

Thanks
ZubairLK

>
> Regards,
> ZubairLK
>
> V1 -> V2
> Resubmitting without truncating the diff output for file moves
> Removed accidental local mac address entry
> Individual logs have more detail
>
> Zubair Lutfullah Kakakhel (10):
>   microblaze: irqchip: Move intc driver to irqchip
>   irqchip: xilinx: Add support for parent intc
>   MIPS: xilfpga: Use irqchip_init instead of the legacy way
>   MIPS: xilfpga: Use Xilinx AXI Interrupt Controller
>   MIPS: xilfpga: Update DT node and specify uart irq
>   MIPS: Xilfpga: Add DT node for AXI I2C
>   net: ethernet: xilinx: Generate random mac if none found
>   net: ethernet: xilinx: Enable emaclite for MIPS
>   MIPS: xilfpga: Add DT node for AXI emaclite
>   MIPS: xilfpga: Update defconfig
>
>  arch/microblaze/Kconfig                       |   1 +
>  arch/microblaze/kernel/Makefile               |   2 +-
>  arch/microblaze/kernel/intc.c                 | 196 -----------------------
>  arch/mips/Kconfig                             |   1 +
>  arch/mips/boot/dts/xilfpga/nexys4ddr.dts      |  63 ++++++++
>  arch/mips/configs/xilfpga_defconfig           |  37 ++++-
>  arch/mips/xilfpga/intc.c                      |   7 +-
>  drivers/irqchip/Kconfig                       |   4 +
>  drivers/irqchip/Makefile                      |   1 +
>  drivers/irqchip/irq-axi-intc.c                | 222 ++++++++++++++++++++++++++
>  drivers/net/ethernet/xilinx/Kconfig           |   4 +-
>  drivers/net/ethernet/xilinx/xilinx_emaclite.c |   6 +-
>  12 files changed, 337 insertions(+), 207 deletions(-)
>  delete mode 100644 arch/microblaze/kernel/intc.c
>  create mode 100644 drivers/irqchip/irq-axi-intc.c
>
