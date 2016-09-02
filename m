Received: from mailapp01.imgtec.com ([195.59.15.196]:11338 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990522AbcIBJzSpOI0z (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Sep 2016 11:55:18 +0200
Subject: Re: [Patch v4 01/12] microblaze: irqchip: Move intc driver to irqchip
References: <1472748665-47774-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <1472748665-47774-2-git-send-email-Zubair.Kakakhel@imgtec.com>
 <33b0c20d-a939-0e26-4443-dc41ba06f250@xilinx.com>
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Message-ID: <025ed01a-9a56-78cc-02cc-39b8c42f8f63@imgtec.com>
Date: Fri, 2 Sep 2016 10:55:01 +0100
MIME-Version: 1.0
In-Reply-To: <33b0c20d-a939-0e26-4443-dc41ba06f250@xilinx.com>
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
To: Michal Simek <michal.simek@xilinx.com>, monstr@monstr.eu, ralf@linux-mips.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com
Cc: soren.brinkmann@xilinx.com, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, netdev@vger.kernel.org
Message-ID: <20160902095501.yTU1F1IIobEGJORdZLrmQf04a7NzGDf44vtYQEp1hr0@z>

Hi,

On 09/02/2016 06:56 AM, Michal Simek wrote:
> On 1.9.2016 18:50, Zubair Lutfullah Kakakhel wrote:
>> The Xilinx AXI Interrupt Controller IP block is used by the MIPS
>> based xilfpga platform.
>>
>> Move the interrupt controller code out of arch/microblaze so that
>> it can be used by everyone
>
> if this is just move that you should setup your git right that it won't
> be remove on one side and add on other side.
>
> It should look like this when git mv is used and git setup is right.

That was how I structured it in the first patch.
However irqchip maintainers requested to not do that and show the entire diff
for cleanup/review.

Regards,
ZubairLK

>
> diff --git a/Makefile b/Makefile2
> similarity index 100%
> rename from Makefile
> rename to Makefile2
>
> Thanks,
> Michal
>
