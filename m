Received: from mailapp01.imgtec.com ([195.59.15.196]:59141 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012328AbaJ3SiYOXsLW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 30 Oct 2014 19:38:24 +0100
Message-ID: <54528595.8070009@imgtec.com>
Date: Thu, 30 Oct 2014 11:38:13 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: DMA: fix coherent alloc in non-coherent systems
References: <20141030014753.13189.48344.stgit@linux-yegoshin> <54520DE4.9090008@imgtec.com>
In-Reply-To: <54520DE4.9090008@imgtec.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org, nbd@openwrt.org, yanh@lemote.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, alex.smith@imgtec.com, taohl@lemote.com, chenhc@lemote.com, blogic@openwrt.org
Message-ID: <20141030183813.X77_uFtzmxdjXPHblAnJEE2ZIndmKoJk7M6xjVu2IR0@z>

On 10/30/2014 03:07 AM, James Hogan wrote:
> Hi Leonid,
>
> On 30/10/14 01:48, Leonid Yegoshin wrote:
>> A default dma_alloc_coherent() fails to alloc a coherent memory on non-coherent
>> systems in case of device->coherent_dma_mask covering the whole memory space.
>>
>> In case of non-coherent systems the coherent memory on MIPS is restricted by
>> size of un-cachable segment and should be located in ZONE_DMA.
> Has this pretty much always been broken?
>
>
Yes, but it can be seen on MIPS32 EVA-based CPUs.
