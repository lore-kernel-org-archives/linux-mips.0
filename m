Received: from mailapp01.imgtec.com ([195.59.15.196]:12861 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007854AbbLIOcygCpt5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 9 Dec 2015 15:32:54 +0100
Subject: Re: [PATCH] MIPS: Fix DMA contiguous allocation
References: <1449569930-2118-1-git-send-email-qais.yousef@imgtec.com>
 <20151208141939.d0edbb72b3c15844c5ac25ea@linux-foundation.org>
 <20151209113635.GA15910@techsingularity.net>
From: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <56683B8E.2000600@imgtec.com>
Date: Wed, 9 Dec 2015 14:32:46 +0000
MIME-Version: 1.0
In-Reply-To: <20151209113635.GA15910@techsingularity.net>
Content-Type: text/plain; charset="iso-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Qais.Yousef@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Mel Gorman <mgorman@techsingularity.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mips@linux-mips.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org
Message-ID: <20151209143246.nnrffxMSUV6jX7avZY18PwBovKaRi-IorSd0YgwYbco@z>

On 12/09/2015 11:36 AM, Mel Gorman wrote:
> On Tue, Dec 08, 2015 at 02:19:39PM -0800, Andrew Morton wrote:
>> On Tue, 8 Dec 2015 10:18:50 +0000 Qais Yousef <qais.yousef@imgtec.com> wrote:
>>
>>> --- a/arch/mips/mm/dma-default.c
>>> +++ b/arch/mips/mm/dma-default.c
>>> @@ -145,7 +145,7 @@ static void *mips_dma_alloc_coherent(struct device *dev, size_t size,
>>>   
>>>   	gfp = massage_gfp_flags(dev, gfp);
>>>   
>>> -	if (IS_ENABLED(CONFIG_DMA_CMA) && !(gfp & GFP_ATOMIC))
>>> +	if (IS_ENABLED(CONFIG_DMA_CMA) && ((gfp & GFP_ATOMIC) != GFP_ATOMIC))
>>>   		page = dma_alloc_from_contiguous(dev,
>>>   					count, get_order(size));
>>>   	if (!page)
>> hm.  It seems that the code is asking "can I do a potentially-sleeping
>> memory allocation"?
>>
>> The way to do that under the new regime is
>>
>> 	if (IS_ENABLED(CONFIG_DMA_CMA) && gfpflags_allow_blocking(gfp))
>>
>> Mel, can you please confirm?
> Yes, this is the correct way it should be checked. The full flags cover
> watermark and kswapd treatment which potentially could be altered by
> the caller.
>

OK thanks both. I'll send a revised version with this change.

Thanks,
Qais
