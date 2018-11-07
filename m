Received: from mail-vk1-f196.google.com ([209.85.221.196]:43194 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990946AbeKGIjAHRI85 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Nov 2018 09:39:00 +0100
Received: by mail-vk1-f196.google.com with SMTP id o130so1047376vke.10
        for <linux-mips@linux-mips.org>; Wed, 07 Nov 2018 00:39:00 -0800 (PST)
MIME-Version: 1.0
References: <b06321ac25a1211e572e650a630e5e1aa9f8173f.1541504601.git.robin.murphy@arm.com>
In-Reply-To: <b06321ac25a1211e572e650a630e5e1aa9f8173f.1541504601.git.robin.murphy@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Nov 2018 09:38:47 +0100
Message-ID: <CAMuHMdW+=cVUBBzS7F990Wci4VKOzOqtYVeVOH9s3u0X7R95xw@mail.gmail.com>
Subject: Re: [PATCH] of/device: Really only set bus DMA mask when appropriate
Content-Type: text/plain; charset="UTF-8"
Return-Path: <geert.uytterhoeven@gmail.com>
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
Cc: Christoph Hellwig <hch@lst.de>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Linux IOMMU <iommu@lists.linux-foundation.org>, John Stultz <john.stultz@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Message-ID: <20181107083847.6H09_epn4ouWOXJCenGJg3Ws9r6aMMU4ctA8MRjVTG4@z>

Hi Robin,

On Tue, Nov 6, 2018 at 12:54 PM Robin Murphy <robin.murphy@arm.com> wrote:
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

Thanks, this fixes the problem I saw with IPMMU on Salvator-X(S).

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
