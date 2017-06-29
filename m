Received: from mail-wm0-x241.google.com ([IPv6:2a00:1450:400c:c09::241]:34883
        "EHLO mail-wm0-x241.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991965AbdF2FqUfc0KI convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 29 Jun 2017 07:46:20 +0200
Received: by mail-wm0-x241.google.com with SMTP id u23so424230wma.2
        for <linux-mips@linux-mips.org>; Wed, 28 Jun 2017 22:46:20 -0700 (PDT)
Date: Thu, 29 Jun 2017 06:46:13 +0100
In-Reply-To: <CAAhV-H7+0v0TE=V29DVYtEhxN2fUjVhh9MP9gNV96jzkq_1yrg@mail.gmail.com>
References: <1498144016-9111-1-git-send-email-chenhc@lemote.com> <1498144016-9111-3-git-send-email-chenhc@lemote.com> <20170628143005.GJ31455@jhogan-linux.le.imgtec.org> <CAAhV-H7+0v0TE=V29DVYtEhxN2fUjVhh9MP9gNV96jzkq_1yrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: Re: [PATCH V7 2/9] MIPS: c-r4k: Add r4k_blast_scache_node for Loongson-3
From: James Hogan <james.hogan@imgtec.com>
Message-ID: <64E99F82-4E2B-4D53-8750-FCE90F84A29B@imgtec.com>
Return-Path: <james@albanarts.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, Huacai Chen <chenhc@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, John Crispin <john@phrozen.org>, "Steven J . Hill" <Steven.Hill@cavium.com>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, stable <stable@vger.kernel.org>
Message-ID: <20170629054613.0Q29R_hBZpWQxeAkWD1r6PkX9hdn8Pzex9uLuRdlTHI@z>

On 29 June 2017 02:33:28 BST, Huacai Chen <chenhc@lemote.com> wrote:
>Hi, James,
>
>Is it suitable to add this line in arch/mips/include/asm/mmzone.h?
>#define pa_to_nid(addr) 0

It was basically malta_defconfig.

OTOH when i tried including asm/mmzone.h, that tries including <mmzone.h> which it can't find.

Cheers
Jamee

>
>Huacai
>
>On Wed, Jun 28, 2017 at 10:30 PM, James Hogan <james.hogan@imgtec.com>
>wrote:
>> Hi Huacai,
>>
>> On Thu, Jun 22, 2017 at 11:06:49PM +0800, Huacai Chen wrote:
>>> @@ -839,9 +860,12 @@ static void r4k_dma_cache_wback_inv(unsigned
>long addr, unsigned long size)
>>>
>>>       preempt_disable();
>>>       if (cpu_has_inclusive_pcaches) {
>>> -             if (size >= scache_size)
>>> -                     r4k_blast_scache();
>>> -             else
>>> +             if (size >= scache_size) {
>>> +                     if (current_cpu_type() != CPU_LOONGSON3)
>>> +                             r4k_blast_scache();
>>> +                     else
>>> +                            
>r4k_blast_scache_node(pa_to_nid(addr));
>>> +             } else
>>>                       blast_scache_range(addr, addr + size);
>>>               preempt_enable();
>>>               __sync();
>>> @@ -872,9 +896,12 @@ static void r4k_dma_cache_inv(unsigned long
>addr, unsigned long size)
>>>
>>>       preempt_disable();
>>>       if (cpu_has_inclusive_pcaches) {
>>> -             if (size >= scache_size)
>>> -                     r4k_blast_scache();
>>> -             else {
>>> +             if (size >= scache_size) {
>>> +                     if (current_cpu_type() != CPU_LOONGSON3)
>>> +                             r4k_blast_scache();
>>> +                     else
>>> +                            
>r4k_blast_scache_node(pa_to_nid(addr));
>>
>> malta_defconfig now fails to build:
>>
>> arch/mips/mm/c-r4k.c: In function ‘r4k_dma_cache_wback_inv’:
>> arch/mips/mm/c-r4k.c:867:5: error: implicit declaration of function
>‘pa_to_nid’ [-Werror=implicit-function-declaration]
>>      r4k_blast_scache_node(pa_to_nid(addr));
>>      ^
>>
>> Cheers
>> James


--
James Hogan
