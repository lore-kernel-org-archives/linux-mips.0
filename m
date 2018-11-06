Received: from mail-wr1-x42c.google.com ([IPv6:2a00:1450:4864:20::42c]:43116
        "EHLO mail-wr1-x42c.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991112AbeKFXQMsyy4F (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Nov 2018 00:16:12 +0100
Received: by mail-wr1-x42c.google.com with SMTP id y3-v6so15116799wrh.10
        for <linux-mips@linux-mips.org>; Tue, 06 Nov 2018 15:16:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <b06321ac25a1211e572e650a630e5e1aa9f8173f.1541504601.git.robin.murphy@arm.com>
References: <b06321ac25a1211e572e650a630e5e1aa9f8173f.1541504601.git.robin.murphy@arm.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 6 Nov 2018 15:16:11 -0800
Message-ID: <CALAqxLWif1wjRHx5X136sBqdg0KJ8itqXPk9G6NJ70Z_QFavzQ@mail.gmail.com>
Subject: Re: [PATCH] of/device: Really only set bus DMA mask when appropriate
Content-Type: text/plain; charset="UTF-8"
Return-Path: <john.stultz@linaro.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Robin Murphy <robin.murphy@arm.com>
Cc: hch@lst.de, Rob Herring <robh+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, aaro.koskinen@iki.fi, jean-philippe.brucker@arm.com, iommu@lists.linux-foundation.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-mips@linux-mips.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Message-ID: <20181106231611.z2BralJ3VndkNPIR5F81XBe_K8fJcFNaGfKZ51WyYjs@z>

On Tue, Nov 6, 2018 at 3:54 AM, Robin Murphy <robin.murphy@arm.com> wrote:
> of_dma_configure() was *supposed* to be following the same logic as
> acpi_dma_configure() and only setting bus_dma_mask if some range was
> specified by the firmware. However, it seems that subtlety got lost in
> the process of fitting it into the differently-shaped control flow, and
> as a result the force_dma==true case ends up always setting the bus mask
> to the 32-bit default, which is not what anyone wants.
>
> Make sure we only touch it if the DT actually said so.
>
> Fixes: 6c2fb2ea7636 ("of/device: Set bus DMA mask as appropriate")
> Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Reported-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>
> Sorry about that... I guess I only have test setups that either have
> dma-ranges or where a 32-bit bus mask goes unnoticed :(
>
> The Octeon and SMMU issues sound like they're purely down to this, and
> it's probably related to at least one of John's Hikey woes.

Yep! This does seem to resolve the mali bifrost dma address warn-ons I
was seeing, and makes the board seem to function more consistently, so
that's great!

Tested-by: John Stultz <john.stultz@linaro.org>

Though I still find I have to revert "swiotlb: use swiotlb_map_page in
swiotlb_map_sg_attrs" still to boot to UI successfully with AOSP.
Still not sure whats going on there (its sort of soft hangs where some
userland runs ok, but other bits seem to jam up, even console commands
sometimes hang - almost seems like io stalls).

Anyway, thanks so much again for this one!
-john
