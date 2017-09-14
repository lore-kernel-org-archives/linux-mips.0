Received: from mail-ua0-x241.google.com ([IPv6:2607:f8b0:400c:c08::241]:35681
        "EHLO mail-ua0-x241.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994231AbdINTSJtSti9 convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 14 Sep 2017 21:18:09 +0200
MIME-Version: 1.0
In-Reply-To: <20170914191119.y554znlpcnsershp@sasha-lappy>
References: <20170914155051.8289-1-alexander.levin@verizon.com>
 <20170914155051.8289-11-alexander.levin@verizon.com> <CA+7wUszvyofkuLPb6K+E5ngJ7=e0CiCh1s+WQUBX0cG_MfnU7w@mail.gmail.com>
 <20170914191119.y554znlpcnsershp@sasha-lappy>
From: Mathieu Malaterre <malat@debian.org>
Date: Thu, 14 Sep 2017 21:17:42 +0200
Message-ID: <CA+7wUsy7X_3ST0hgnyxWMiC45ZeM8A_oafzn9PuufETkcKN+Xw@mail.gmail.com>
Subject: Re: [PATCH for 4.9 11/59] MIPS: fix mem=X@Y commandline processing
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-Path: <mathieu.malaterre@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>

On Thu, Sep 14, 2017 at 9:11 PM, Levin, Alexander (Sasha Levin)
<alexander.levin@verizon.com> wrote:
> On Thu, Sep 14, 2017 at 08:59:05PM +0200, Mathieu Malaterre wrote:
>>On Thu, Sep 14, 2017 at 5:51 PM, Levin, Alexander (Sasha Levin)
>><alexander.levin@verizon.com> wrote:
>>> From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
>>>
>>> [ Upstream commit 73fbc1eba7ffa3bf0ad12486232a8a1edb4e4411 ]
>>>
>>> When a memory offset is specified through the commandline, add the
>>> memory in range PHYS_OFFSET:Y as reserved memory area.
>>> Otherwise the bootmem allocator is initialised with low page equal to
>>> min_low_pfn = PHYS_OFFSET, and in free_all_bootmem will process pages
>>> starting from min_low_pfn instead of PFN(Y).
>>>
>>> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
>>> Cc: linux-mips@linux-mips.org
>>> Patchwork: https://urldefense.proofpoint.com/v2/url?u=https-3A__patchwork.linux-2Dmips.org_patch_14613_&d=DwIBaQ&c=udBTRvFvXC5Dhqg7UHpJlPps3mZ3LRxpb6__0PomBTQ&r=bUtaaC9mlBij4OjEG_D-KPul_335azYzfC4Rjgomobo&m=6siOw0e29CYMhuJcboVwEeX-LcC1yJjtnGPVl_1tClQ&s=rP-QGn8HHjuow4b4qd6sfl_EEPoAKkxAffkh1zEq-kc&e=
>>> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
>>> Signed-off-by: Sasha Levin <alexander.levin@verizon.com>
>>> ---
>>>  arch/mips/kernel/setup.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
>>> index f66e5ce505b2..38697f25d168 100644
>>> --- a/arch/mips/kernel/setup.c
>>> +++ b/arch/mips/kernel/setup.c
>>> @@ -589,6 +589,10 @@ static int __init early_parse_mem(char *p)
>>>                 start = memparse(p + 1, &p);
>>>
>>>         add_memory_region(start, size, BOOT_MEM_RAM);
>>> +
>>> +       if (start && start > PHYS_OFFSET)
>>> +               add_memory_region(PHYS_OFFSET, start - PHYS_OFFSET,
>>> +                               BOOT_MEM_RESERVED);
>>>         return 0;
>>>  }
>>>  early_param("mem", early_parse_mem);
>>
>>Does not work on MIPS Creator CI20. See:
>
> Hm, so upstream is actually broken right now?

Yes, at least on Creator CI20. You need to clear out all your mem=X@Y
from your boot command line, or apply the new patch I mentionned
above, or revert 73fbc1eba7ffa3bf0ad12486232a8a1edb4e4411.
