Received: from multi.imgtec.com ([194.200.65.239]:2580 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6823127AbaAUU65Yr0uj (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 21 Jan 2014 21:58:57 +0100
Message-ID: <52DEDF84.1000006@imgtec.com>
Date: Tue, 21 Jan 2014 14:58:44 -0600
From: "Steven J. Hill" <Steven.Hill@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: lib: Optimize partial checksum ops using prefetching.
References: <1390321122-25634-1-git-send-email-Steven.Hill@imgtec.com> <20140121204938.GW14169@linux-mips.org>
In-Reply-To: <20140121204938.GW14169@linux-mips.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20140121205844.Cndx8plbkUY-RP7mfzh241wv8KzFp4UMb0OEV_jMy8A@z>

On 01/21/2014 02:49 PM, Ralf Baechle wrote:
> On Tue, Jan 21, 2014 at 10:18:42AM -0600, Steven J. Hill wrote:
>
>> From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
>>
>> Use the PREF instruction to optimize partial checksum operations.
>
> Prefetch operations may cause obscure bus error exceptions on some systems
> such as Malta, for example, when prefetching beyond the end of memory.
> It may also mean memory regions that are just undergoing a DMA transfer
> are being brought back into cache.
>
> This pretty much means that pref is only safe to use on cache-coherent
> systems.
>
So, could we have:

    #ifdef CONFIG_DMA_NONCOHERENT
    #undef CONFIG_CPU_HAS_PREFETCH
    #endif
    #define PREFSIZE   (1 << MIPS_L1_CACHE_SHIFT)

and then use the PREFSIZE value instead of the hardcoded value of 32?

Steve
