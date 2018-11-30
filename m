Received: from mx2.suse.de ([195.135.220.15]:50270 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992919AbeK3VGehkWwk (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 30 Nov 2018 22:06:34 +0100
Subject: Re: [PATCH RFC 01/15] MIPS: replace **** with a hug
References: <20181130192737.15053-1-jarkko.sakkinen@linux.intel.com>
 <20181130192737.15053-2-jarkko.sakkinen@linux.intel.com>
 <20181130195758.GA20328@linux.intel.com>
From: Nikolay Borisov <nborisov@suse.com>
Message-ID: <9ba4d08d-10d1-c233-476a-c73051b8c9f5@suse.com>
Date: Fri, 30 Nov 2018 23:06:30 +0200
MIME-Version: 1.0
In-Reply-To: <20181130195758.GA20328@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Return-Path: <nborisov@suse.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Joshua Kinard <kumba@gentoo.org>, "open list:MIPS" <linux-mips@linux-mips.org>



On 30.11.18 г. 21:57 ч., Jarkko Sakkinen wrote:
> On Fri, Nov 30, 2018 at 11:27:10AM -0800, Jarkko Sakkinen wrote:
>> In order to comply with the CoC, replace **** with a hug.
>>
>> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> 
> Since v17 of the SGX patch set, my cover letters get cut for some
> reason. I receive them myself but they don't appear on kernel
> lists. I don't what the hug is going on :-/
> 
> Here's the cover letter for this patch set:
> 
> From 386420215a93d2eb5bbcb061e914cfb16f456de8 Mon Sep 17 00:00:00 2001
> From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Date: Fri, 30 Nov 2018 11:25:40 -0800
> Subject: [PATCH RFC 00/15] Zero ****s, hugload of hugs <3
> 
> In order to comply with the CoC, replace **** with a hug.

I find it quite ridiculous that grown up people are engaging at yet
another coc-related conversation and are on the way to blowing it out of
proportions. Let's focus on improving the ACTUAL code what's the point
to bikeshed on the word?

I've seen people before me comment that some comments are plainly out of
date and that warrants their removal but otherwise nitpicking things
like that. It seems common sense is very scant these days...



> 
> Jarkko Sakkinen (15):
>   MIPS: replace **** with a hug
>   Documentation: replace **** with a hug
>   drm/nouveau: replace **** with a hug
>   m68k: replace **** with a hug
>   parisc: replace **** with a hug
>   cpufreq: replace **** with a hug
>   ide: replace **** with a hug
>   media: replace **** with a hug
>   mtd: replace **** with a hug
>   net/sunhme: replace **** with a hug
>   scsi: replace **** with a hug
>   inotify: replace **** with a hug
>   irq: replace **** with a hug
>   lib: replace **** with a hug
>   net: replace **** with a hug
> 
>  Documentation/kernel-hacking/locking.rst      |  2 +-
>  arch/m68k/include/asm/sun3ints.h              |  2 +-
>  arch/mips/pci/ops-bridge.c                    | 24 +++++++++----------
>  arch/mips/sgi-ip22/ip22-setup.c               |  2 +-
>  arch/parisc/kernel/sys_parisc.c               |  2 +-
>  drivers/cpufreq/powernow-k7.c                 |  2 +-
>  .../gpu/drm/nouveau/nvkm/subdev/bios/init.c   |  2 +-
>  .../nouveau/nvkm/subdev/pmu/fuc/macros.fuc    |  2 +-
>  drivers/ide/cmd640.c                          |  2 +-
>  drivers/media/i2c/bt819.c                     |  8 ++++---
>  drivers/mtd/mtd_blkdevs.c                     |  2 +-
>  drivers/net/ethernet/sun/sunhme.c             |  4 ++--
>  drivers/scsi/qlogicpti.h                      |  2 +-
>  fs/notify/inotify/inotify_user.c              |  2 +-
>  kernel/irq/timings.c                          |  2 +-
>  lib/vsprintf.c                                |  2 +-
>  net/core/skbuff.c                             |  2 +-
>  17 files changed, 33 insertions(+), 31 deletions(-)
> 
