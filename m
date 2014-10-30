Received: from mailapp01.imgtec.com ([195.59.15.196]:38732 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012245AbaJ3JvtEkHt5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 30 Oct 2014 10:51:49 +0100
Message-ID: <54520A2D.5080304@imgtec.com>
Date: Thu, 30 Oct 2014 09:51:41 +0000
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: DMA: fix coherent alloc in non-coherent systems
References: <20141030014753.13189.48344.stgit@linux-yegoshin> <54520969.8030900@imgtec.com>
In-Reply-To: <54520969.8030900@imgtec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Markos Chandras <Markos.Chandras@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linux-mips@linux-mips.org, nbd@openwrt.org, yanh@lemote.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, alex.smith@imgtec.com, taohl@lemote.com, chenhc@lemote.com, blogic@openwrt.org
Message-ID: <20141030095141.T9TIkTGLoAD3llC6d6K64FNeT2oR1F5G1cYIWC2osjw@z>

Hi Markos,

On 30/10/14 09:48, Markos Chandras wrote:
>> diff --git a/arch/mips/include/asm/mach-cavium-octeon/dma-coherence.h b/arch/mips/include/asm/mach-cavium-octeon/dma-coherence.h
>> index f9f4486..fe0b465 100644
>> --- a/arch/mips/include/asm/mach-cavium-octeon/dma-coherence.h
>> +++ b/arch/mips/include/asm/mach-cavium-octeon/dma-coherence.h
>> @@ -52,7 +52,7 @@ static inline int plat_dma_supported(struct device *dev, u64 mask)
>>  	return 0;
>>  }
>>  
>> -static inline int plat_device_is_coherent(struct device *dev)
>> +static inline int plat_device_is_coherent(const struct device *dev)
> 
> Why adding const here?
> 

<snip>

> Is it just a matter of consistence with the rest of the interfaces? Do
> you need to move these into a separate patch since they don't quite fit
> here.

See the new new call to plat_device_is_coherent(), which passes dev,
which is const.

Cheers
James
