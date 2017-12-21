Received: from mail-lf0-x233.google.com ([IPv6:2a00:1450:4010:c07::233]:43995
        "EHLO mail-lf0-x233.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990424AbdLUMkoCqxaE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 21 Dec 2017 13:40:44 +0100
Received: by mail-lf0-x233.google.com with SMTP id o26so13514445lfc.10
        for <linux-mips@linux-mips.org>; Thu, 21 Dec 2017 04:40:44 -0800 (PST)
Received: from upc8.baikal.int (mail.baikalelectronics.com. [87.245.175.226])
        by smtp.gmail.com with ESMTPSA id u19sm4325777lfc.59.2017.12.21.04.40.37
        for <linux-mips@linux-mips.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Dec 2017 04:40:37 -0800 (PST)
Subject: Re: [P5600 && EVA memory caching question] PCI region
From: Yuri Frolov <crashing.kernel@gmail.com>
References: <6132c323-32a7-1d38-b77c-a191be22faa4@gmail.com>
 <20171206114611.GM5027@jhogan-linux.mipstec.com>
 <330a5200-531f-fcfa-674a-c81fb3144e92@gmail.com>
 <20171214152138.GV5027@jhogan-linux.mipstec.com>
 <ca9adcbc-9777-46a0-ce0b-15e83e01fc72@gmail.com>
 <20171215232821.GA5027@jhogan-linux.mipstec.com>
 <b8706fae-aea8-99b5-f91d-37690eff6949@gmail.com>
Message-ID: <0f3d62c8-ab8f-f652-8efc-a98e16dd64ca@gmail.com>
Date: Thu, 21 Dec 2017 15:40:36 +0300
MIME-Version: 1.0
In-Reply-To: <b8706fae-aea8-99b5-f91d-37690eff6949@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Return-Path: <crashing.kernel@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Cc: linux-mips@linux-mips.org
Message-ID: <20171221124036.XiFjG1AmOv6B5t6OhnyvKQnhl5t_bYL5HJywvfL2IYo@z>

 > I'm looking at arch/mips/include/asm//mach-malta/kernel-entry-init.h 
and there is a definition for
 > SegCtl2:

>
>         /* SegCtl2 */
>         li      t0, ((MIPS_SEGCFG_MUSUK << MIPS_SEGCFG_AM_SHIFT) |      \
>                 (6 << MIPS_SEGCFG_PA_SHIFT) |                           \
>                 (1 << MIPS_SEGCFG_EU_SHIFT)) |                          \
>                 (((MIPS_SEGCFG_MUSUK << MIPS_SEGCFG_AM_SHIFT) |         \
>                 (4 << MIPS_SEGCFG_PA_SHIFT) |                           \
>                 (1 << MIPS_SEGCFG_EU_SHIFT)) << 16)
>
> it defines, that kernel logical addresses from the range 0x00000000 - 
> 0x7fffffff are unmapped (no tlbs) and dictates, that in order to get a 
> physical address for any logical addresses from 0x00000000 - 
> 0x3fffffff range in kernel space, bits [31:29] of the logical address 
> must be changed to 100,
> and (again in kernel space) for any logical addresses from 0x40000000 
> - 0x7fffffff range, bits [31:29] of the logical address must be 
> changed to 110, right?
>
> What physical addresses will logical addresses 0x00000000 and 
> 0x20000000 be translated in kernel space?.. logical 0x00000000 --> 
> physical 0x80000000, and logical 0x20000000 --> .... 0x80000000 too?
> Since we must to change bits [31:29], we have to change bit 29 ('1') 
> in logical address 0x200000000 to '0' (since PA for this range is 100).
>
> So, what physical addresses will all logical addresses which have '1' 
> at 29 bit be translated, if we define PA as 100 and 110 in SegCtl2? It 
> looks like there's no flat translation of logical addresses to 
> physical addresses in kernel space, and this is obviously just not 
> correct, there is something simple I've been overlooking.
>
> Thank you,
> Yuri

The only way this scheme can work, is that 'these bits are used' phrase 
from Table 3.5 CFG (Segment Configuration) Field Description means not 
'these bits substitute bits [31:29] in virtual address', but 'these bits 
are 'OR'-ed with bits [31:29] in virtual address.
