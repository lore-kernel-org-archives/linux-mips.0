Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:35298 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993497AbeFMVsVlbqT1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 13 Jun 2018 23:48:21 +0200
Date: Wed, 13 Jun 2018 14:48:11 -0700
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [vmlinuz.bin] Does u-boot support loading vmlinuz[.bin]?
Message-ID: <20180613214811.zvuyf5e6hajutv6j@pburton-laptop>
References: <90a06531-2663-3982-962d-ff8025ee4388@gmail.com>
 <20180613153510.GB31768@makrotopia.org>
 <2cfa098d-46f4-b4b2-10f9-e447b89c7fda@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2cfa098d-46f4-b4b2-10f9-e447b89c7fda@gmail.com>
Return-Path: <Paul.Burton@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Yuri Frolov <crashing.kernel@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>, linux-mips@linux-mips.org
Message-ID: <20180613214811.ITB64B8kvGJF5rIp_Dz0m8ydzXEYiNZcMKYdiUm8Mpw@z>

Hi Yuri,

On Wed, Jun 13, 2018 at 07:28:43PM +0300, Yuri Frolov wrote:
> On 06/13/2018 06:35 PM, Daniel Golle wrote:
> > On Wed, Jun 13, 2018 at 02:19:06PM +0300, Yuri Frolov wrote:
> > > do I understand correctly, that the native format for mips arch.
> > > u-boot uses is uImage?

Easy options are to use the legacy uImage or FIT as Daniel mentioned.

As an example, when running U-Boot the older MIPS Malta platform
generally uses a legacy uImage whilst the newer MIPS Boston platform
uses a FIT (.itb) image.

> > > Yocto's default for mips is vmlinuz.bin for some reason, here is
> > > the question.

Please note that, at least when targeting MIPS, vmlinuz.bin is not a
zImage - those are 2 different things. If you build vmlinuz.bin for MIPS
then what you get is a flat binary containing some decompression code
and a compressed version of vmlinux.bin. The file has no special header
as it appears the ARM zImage format does.

> > You got to enable U-Boot's CONFIG_CMD_BOOTZ and use the bootz command
> > in order to boot that. Or change that default to generate FIT or legacy
> > uImage instead.
> > 
> 
> bootz_setup is properly defined only for arm (arch/arm/lib/zimage.c);
> default bootz_setup returns an error.
>
> So, is bootz supposed to work for architectures other than arm?

So far as I can see it isn't - it's ARM specific.

But again that's not the same as a MIPS vmlinuz.bin, so I suspect with
that knowledge your question may change.

Thanks,
    Paul
