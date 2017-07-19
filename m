Received: from mailapp01.imgtec.com ([195.59.15.196]:2055 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991359AbdGSK4LMKf7q (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 19 Jul 2017 12:56:11 +0200
Subject: Re: [PATCH 1/2] MIPS: ralink: Fix build error due to missing header
References: <1500384346-10527-1-git-send-email-harvey.hunt@imgtec.com>
 <20170718220126.GA22091@linux-mips.org>
From: Harvey Hunt <Harvey.Hunt@imgtec.com>
Message-ID: <4f14076f-07f7-accd-cdb3-3682d7206f0e@imgtec.com>
Date: Wed, 19 Jul 2017 11:55:59 +0100
MIME-Version: 1.0
In-Reply-To: <20170718220126.GA22091@linux-mips.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Return-Path: <Harvey.Hunt@imgtec.com>
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
Cc: "#4 . 11+" <stable@vger.kernel.org>, John Crispin <john@phrozen.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20170719105559._mVLYxBSmam6Z5PQFTzXOMqdsXLAxJdN0t0Hx3lH7kc@z>

Hi Ralf,

On 18/07/17 23:01, Ralf Baechle wrote:
> On Tue, Jul 18, 2017 at 02:25:45PM +0100, Harvey Hunt wrote:
> 
>> Previously, <linux/module.h> was included before ralink_regs.h in all
>> ralink files - leading to <linux/io.h> being implicitly included.
>>
>> After commit 26dd3e4ff9ac ("MIPS: Audit and remove any unnecessary
>> uses of module.h") removed the inclusion of module.h from multiple
>> places, some ralink platforms failed to build with the following error:
>>
>> In file included from arch/mips/ralink/mt7620.c:17:0:
>> ./arch/mips/include/asm/mach-ralink/ralink_regs.h: In function ‘rt_sysc_w32’:
>> ./arch/mips/include/asm/mach-ralink/ralink_regs.h:38:2: error: implicit declaration of function ‘__raw_writel’ [-Werror=implicit-function-declaration]
>>    __raw_writel(val, rt_sysc_membase + reg);
>>    ^
>> ./arch/mips/include/asm/mach-ralink/ralink_regs.h: In function ‘rt_sysc_r32’:
>> ./arch/mips/include/asm/mach-ralink/ralink_regs.h:43:2: error: implicit declaration of function ‘__raw_readl’ [-Werror=implicit-function-declaration]
>>    return __raw_readl(rt_sysc_membase + reg);
>>
>> Fix this by including <linux/io.h>.
> 
> Looks sensible, applied.  But I'm wondering why I don't see this in my
> test builds.

Thanks for merging them. There isn't currently a defconfig for this 
platform, but I am working on adding one.

> 
>    Ralf
> 

Thanks,

Harvey
