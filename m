Received: from verein.lst.de ([213.95.11.211]:52600 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23992956AbeARPXeJdvm0 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 18 Jan 2018 16:23:34 +0100
Date: Thu, 18 Jan 2018 16:23:31 +0100
From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v4 4/8] PCI: brcmstb: Add dma-range mapping for inbound
        traffic
Message-ID: <20180118152331.GA24461@lst.de>
References: <1516058925-46522-1-git-send-email-jim2101024@gmail.com> <1516058925-46522-5-git-send-email-jim2101024@gmail.com> <CAL_JsqKpWNJXNpKS5qC99N0+H_P37DcRE-rN9HFwT5tVmRFCNw@mail.gmail.com> <20180118073123.GA15766@lst.de> <EDAEFB0F-BB7C-444A-B282-F178F5ADFCBF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EDAEFB0F-BB7C-444A-B282-F178F5ADFCBF@gmail.com>
Return-Path: <hch@lst.de>
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
Cc: Christoph Hellwig <hch@lst.de>, Rob Herring <robh+dt@kernel.org>, Jim Quinlan <jim2101024@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Brian Norris <computersforpeace@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, Robin Murphy <robin.murphy@arm.com>, Jonas Gorski <jonas.gorski@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, linux-pci@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, bcm-kernel-feedback-list@broadcom.com, Gregory Fong <gregory.0xf0@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20180118152331.mW0bk3bG4xJ0SMbm97HPydXt3rqKXap8HaWdasKX2is@z>

On Thu, Jan 18, 2018 at 07:09:23AM -0800, Florian Fainelli wrote:
> >But in this case it actually is the example to follow as told
> >previously.
> >
> >NAK again for these chained dma ops that only create problems.
> 
> Care to explain what should be done instead?

Override phys_to_dma and dma_to_phys as mips and x86 do for similar
situations.

Bonous points of finding some generic way of doing it instead of
hiding it in arch code.
