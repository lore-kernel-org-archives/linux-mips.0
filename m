Received: from mail-wr0-x243.google.com ([IPv6:2a00:1450:400c:c0c::243]:44932
        "EHLO mail-wr0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992079AbeASTsL4GUW7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 19 Jan 2018 20:48:11 +0100
Received: by mail-wr0-x243.google.com with SMTP id w50so2541103wrc.11
        for <linux-mips@linux-mips.org>; Fri, 19 Jan 2018 11:48:11 -0800 (PST)
Subject: Re: [PATCH v4 4/8] PCI: brcmstb: Add dma-range mapping for inbound
 traffic
References: <1516058925-46522-1-git-send-email-jim2101024@gmail.com>
 <1516058925-46522-5-git-send-email-jim2101024@gmail.com>
 <CAL_JsqKpWNJXNpKS5qC99N0+H_P37DcRE-rN9HFwT5tVmRFCNw@mail.gmail.com>
 <20180118073123.GA15766@lst.de>
 <EDAEFB0F-BB7C-444A-B282-F178F5ADFCBF@gmail.com>
 <20180118152331.GA24461@lst.de>
From: Florian Fainelli <florian.fainelli@broadcom.com>
Message-ID: <d62226a2-a92c-cdcb-4a9b-e69ab677bc60@broadcom.com>
Date: Fri, 19 Jan 2018 11:47:54 -0800
MIME-Version: 1.0
In-Reply-To: <20180118152331.GA24461@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <florian.fainelli@broadcom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Christoph Hellwig <hch@lst.de>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jim Quinlan <jim2101024@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Brian Norris <computersforpeace@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, Robin Murphy <robin.murphy@arm.com>, Jonas Gorski <jonas.gorski@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, linux-pci@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, bcm-kernel-feedback-list@broadcom.com, Gregory Fong <gregory.0xf0@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20180119194754.Pn0uxmSZJCoq40MmOvyjY9fNiQUbbFD5AmrvnPBkqdU@z>

On 01/18/2018 07:23 AM, Christoph Hellwig wrote:
> On Thu, Jan 18, 2018 at 07:09:23AM -0800, Florian Fainelli wrote:
>>> But in this case it actually is the example to follow as told
>>> previously.
>>>
>>> NAK again for these chained dma ops that only create problems.
>>
>> Care to explain what should be done instead?
> 
> Override phys_to_dma and dma_to_phys as mips and x86 do for similar
> situations.

How can this work well in the context of a loadable module for instance?
For MIPS, this would mean that we have to override phys_to_dma() and
dma_to_phys() in the platform that is *susceptible* to use this PCIe
controller (arch/mips/bmips) which is fine, but there, we essentially
need to find a way to make this dynamic based on whether the PCIe
controller is loaded or not.

As you might have seen from this patch, what needs to be done is highly
dependent on the processor architecture and its memory controller
physical memory map, so I don't see how we are in any better situation
if we need to replicate 3 times across MIPS, ARM and ARM64 how the
addresses need to be mangled.

Are you suggesting we somehow decouple the memory mangling part into a
portion that can be built into the kernel image (so phys_to_dma() and
dma_to_phys() is resolved at vmlinux link time) and can be selected by
different architectures that need it? If so, yikes.

> 
> Bonous points of finding some generic way of doing it instead of
> hiding it in arch code.
> 

I can see value in having a generic mechanism, ala X86_DMA_REMAP
allowing architectures to have the ability to override phys_to_dma() and
dma_to_phys() but right now, especially if we look at
arch/x86/pci/sta2x11-fixup.c this really appears to be quite messy and
equally ugly than stacking operations...

What is the actual problem you want to avoid with the stacking of DMA
operations, is it because it becomes harder to audit, or are there are
other reasons?
-- 
Florian
