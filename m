Received: from mail-bl2nam02on0059.outbound.protection.outlook.com ([104.47.38.59]:58480
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23990511AbcIBF5JlySU0 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 2 Sep 2016 07:57:09 +0200
Subject: Re: [Patch v4 01/12] microblaze: irqchip: Move intc driver to irqchip
References: <1472748665-47774-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <1472748665-47774-2-git-send-email-Zubair.Kakakhel@imgtec.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <33b0c20d-a939-0e26-4443-dc41ba06f250@xilinx.com>
Date: Fri, 2 Sep 2016 07:56:47 +0200
MIME-Version: 1.0
In-Reply-To: <1472748665-47774-2-git-send-email-Zubair.Kakakhel@imgtec.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <michals@xilinx.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, monstr@monstr.eu, ralf@linux-mips.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com
Cc: soren.brinkmann@xilinx.com, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, michal.simek@xilinx.com, netdev@vger.kernel.org
Message-ID: <20160902055647.aHEXaRvchYoWKx76gBpK1z4l3K4trc_QMYW-22WrM-Q@z>

On 1.9.2016 18:50, Zubair Lutfullah Kakakhel wrote:
> The Xilinx AXI Interrupt Controller IP block is used by the MIPS
> based xilfpga platform.
> 
> Move the interrupt controller code out of arch/microblaze so that
> it can be used by everyone

if this is just move that you should setup your git right that it won't
be remove on one side and add on other side.

It should look like this when git mv is used and git setup is right.

diff --git a/Makefile b/Makefile2
similarity index 100%
rename from Makefile
rename to Makefile2

Thanks,
Michal
