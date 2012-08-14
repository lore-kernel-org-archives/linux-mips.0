Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]:26174
        "EHLO va3outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1903536Ab2HNQ0w (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Aug 2012 18:26:52 +0200
Message-ID: <502A7C3C.6080907@caviumnetworks.com>
Date: Tue, 14 Aug 2012 09:26:36 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH V5 09/18] MIPS: Loongson: Add swiotlb to support big memory
 (>4GB).
References: <1344677543-22591-1-git-send-email-chenhc@lemote.com>       <1344677543-22591-10-git-send-email-chenhc@lemote.com>  <20120813175447.GB26088@phenom.dumpdata.com> <CAAhV-H7mJUC9njF_wHda8ymUBkUom5AZ+u8OFXtA42uyA-hFxg@mail.gmail.com>
In-Reply-To: <CAAhV-H7mJUC9njF_wHda8ymUBkUom5AZ+u8OFXtA42uyA-hFxg@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Huacai Chen <chenhuacai@gmail.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, Hongliang Tao <taohl@lemote.com>, Hua Yan <yanh@lemote.com>
Message-ID: <20120814162636.G5GG2moLOQKxxH5DD5gVsp3moO1e2STCuV1Y8XTXlck@z>

On 08/13/2012 10:57 PM, Huacai Chen wrote:
> Hi, David,
>
> Seems like you are the original author of code in
> arch/mips/cavium-octeon/dma-octeon.c. Could you please tell me why we
> need mb() in alloc_coherent(), map_page(), map_sg()? It seems like
> because of cache coherency (CPU write some data, then map the page for
> a device, if without mb(), then device may read wrong data.) but I'm
> not sure.
>

That is essentially correct.

The DMA API requires certain memory barrier semantics.  These are 
achieved with the mb() in the OCTEON code.

> On Tue, Aug 14, 2012 at 1:54 AM, Konrad Rzeszutek Wilk
> <konrad.wilk@oracle.com>  wrote:
>>> +static void *loongson_dma_alloc_coherent(struct device *dev, size_t size,
>>> +                             dma_addr_t *dma_handle, gfp_t gfp, struct dma_attrs *attrs)

I know nothing about Loongson, so I cannot comment on what is required 
for it.

David Daney
