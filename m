Received: from mail-it0-x243.google.com ([IPv6:2607:f8b0:4001:c0b::243]:33744
        "EHLO mail-it0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991948AbdFIMUtuT3BT (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 9 Jun 2017 14:20:49 +0200
Received: by mail-it0-x243.google.com with SMTP id l6so5888632iti.0
        for <linux-mips@linux-mips.org>; Fri, 09 Jun 2017 05:20:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170608132609.32662-34-hch@lst.de>
References: <20170608132609.32662-1-hch@lst.de> <20170608132609.32662-34-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jun 2017 14:20:42 +0200
Message-ID: <CAMuHMdUPeFJJtz8eJkQEAR-2w9oHt-fXeGHvvKFLfU2A4YyviQ@mail.gmail.com>
Subject: Re: [PATCH 33/44] openrisc: remove arch-specific dma_supported implementation
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
To: Christoph Hellwig <hch@lst.de>
Cc: the arch/x86 maintainers <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, xen-devel@lists.xenproject.org, linux-c6x-dev@linux-c6x.org, "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, openrisc@lists.librecores.org, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, linux-s390 <linux-s390@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, iommu@lists.linux-foundation.org, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <20170609122042.VtKQbQxJITWcJBCxgft91AqaX2gPcCszyr7BtRL_fxI@z>

Hi Christoph,

On Thu, Jun 8, 2017 at 3:25 PM, Christoph Hellwig <hch@lst.de> wrote:
> This implementation is simply bogus - hexagon only has a simple

openrisc?

> direct mapped DMA implementation and thus doesn't care about the
> address.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/openrisc/include/asm/dma-mapping.h | 7 -------

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
