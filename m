Received: from mail-oi0-x243.google.com ([IPv6:2607:f8b0:4003:c06::243]:41781
        "EHLO mail-oi0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992956AbeARPJevussT convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 18 Jan 2018 16:09:34 +0100
Date: Thu, 18 Jan 2018 07:09:23 -0800
In-Reply-To: <20180118073123.GA15766@lst.de>
References: <1516058925-46522-1-git-send-email-jim2101024@gmail.com> <1516058925-46522-5-git-send-email-jim2101024@gmail.com> <CAL_JsqKpWNJXNpKS5qC99N0+H_P37DcRE-rN9HFwT5tVmRFCNw@mail.gmail.com> <20180118073123.GA15766@lst.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: Re: [PATCH v4 4/8] PCI: brcmstb: Add dma-range mapping for inbound     traffic
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <EDAEFB0F-BB7C-444A-B282-F178F5ADFCBF@gmail.com>
Return-Path: <f.fainelli@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Christoph Hellwig <hch@lst.de>, Rob Herring <robh+dt@kernel.org>
Cc: Jim Quinlan <jim2101024@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Brian Norris <computersforpeace@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, Robin Murphy <robin.murphy@arm.com>, Jonas Gorski <jonas.gorski@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, linux-pci@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, bcm-kernel-feedback-list@broadcom.com, Gregory Fong <gregory.0xf0@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20180118150923.-Vco6qwhNtp6fT3KhZmsuLpwrZvb5k_yuXFln_pIlqg@z>

On January 17, 2018 11:31:23 PM PST, Christoph Hellwig <hch@lst.de> wrote:
>On Wed, Jan 17, 2018 at 08:15:33PM -0600, Rob Herring wrote:
>> > (a) overriding/redefining the dma_to_phys() and phys_to_dma() calls
>> > that are used by the dma_ops routines.  This is the approach of
>> >
>> >         arch/mips/cavium-octeon/dma-octeon.c
>> 
>> MIPS is rarely an example to follow. :)
>
>But in this case it actually is the example to follow as told
>previously.
>
>NAK again for these chained dma ops that only create problems.

Care to explain what should be done instead?

-- 
Florian
