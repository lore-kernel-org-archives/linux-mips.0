Received: from mail-ve1eur01on0116.outbound.protection.outlook.com ([104.47.1.116]:30160
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992896AbeAYR6pmJdLo (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 25 Jan 2018 18:58:45 +0100
Subject: Re: [PATCH 00/14] MIPS: memblock: Switch arch code to NO_BOOTMEM
References: <20180117222312.14763-1-fancer.lancer@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <f8626b9b-56b7-f1b0-6771-9cf573050bb4@nokia.com>
Date: Thu, 25 Jan 2018 18:58:07 +0100
MIME-Version: 1.0
In-Reply-To: <20180117222312.14763-1-fancer.lancer@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <alexander.sverdlin@nokia.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: ralf@linux-mips.org, miodrag.dinic@mips.com, jhogan@kernel.org, goran.ferenc@mips.com, david.daney@cavium.com, paul.gortmaker@windriver.com, paul.burton@mips.com, alex.belits@cavium.com, Steven.Hill@cavium.com, matt.redfearn@mips.com, kumba@gentoo.org, marcin.nowakowski@mips.com, James.hogan@mips.com, Peter.Wotton@mips.com, Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180125175807.-KIU04Cj7scT7bp_3JkI-NSQqGbYIDbt8FmuftPMAh0@z>

Hello Serge,

On 17/01/18 23:22, Serge Semin wrote:
> The patchset is applied on top of kernel 4.15-rc8 and can be found
> submitted at my repo:
> https://github.com/fancer/Linux-kernel-MIPS-memblock-project

I've tested the Linux from your repo on Octeon2 and it looks good to me.
I've only tested startup though. Therefore,

Tested-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

I've noticed one positive effect I cannot explain -- with almost the same
physical memory map I observe almost 2 megabytes more available memory
after startup:

without patches:

root@(none):~ >free
              total        used        free      shared  buff/cache   available
Mem:         955040       16264      839948       80068       98828      810068
Swap:             0           0           0

memory map:

memory: 0000000001090dc0 @ 0000000009000000 (usable after init)
memory: 0000000005400000 @ 0000000002b00000 (usable)
memory: 0000000000c00000 @ 0000000008200000 (usable)
memory: 0000000004800000 @ 000000000a100000 (usable)
memory: 000000001fc00000 @ 0000000020000000 (usable)
memory: 0000000010000000 @ 0000000040000000 (usable)
memory: 000000000190a9d0 @ 0000000001100000 (usable)

----------------------------------------

with patches:

root@(none):~ >free
              total        used        free      shared  buff/cache   available
Mem:         955028       14292      841884       80068       98852      811996
Swap:             0           0           0

memory map:

memory: 0000000001090e00 @ 0000000009000000 (usable after init)
memory: 0000000005400000 @ 0000000002b00000 (usable)
memory: 0000000000c00000 @ 0000000008200000 (usable)
memory: 0000000004800000 @ 000000000a100000 (usable)
memory: 000000001fc00000 @ 0000000020000000 (usable)
memory: 0000000010000000 @ 0000000040000000 (usable)
memory: 000000000190c9d0 @ 0000000001100000 (usable)


> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> 
> Serge Semin (14):
>   MIPS: memblock: Add RESERVED_NOMAP memory flag
>   MIPS: memblock: Surely map BSS kernel memory section
>   MIPS: memblock: Reserve initrd memory in memblock
>   MIPS: memblock: Discard bootmem initialization
>   MIPS: memblock: Add reserved memory regions to memblock
>   MIPS: memblock: Reserve kdump/crash regions in memblock
>   MIPS: memblock: Mark present sparsemem sections
>   MIPS: memblock: Simplify DMA contiguous reservation
>   MIPS: memblock: Allow memblock regions resize
>   MIPS: memblock: Perform early low memory test
>   MIPS: memblock: Print out kernel virtual mem layout
>   MIPS: memblock: Discard bootmem from Loongson3 code
>   MIPS: memblock: Discard bootmem from SGI IP27 code
>   MIPS: memblock: Deactivate bootmem allocator

-- 
Best regards,
Alexander Sverdlin.
