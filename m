Received: from multi.imgtec.com ([194.200.65.239]:48294 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6824768Ab3GCP4l1luN0 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 3 Jul 2013 17:56:41 +0200
Message-ID: <51D449A8.6010207@imgtec.com>
Date: Wed, 3 Jul 2013 10:56:24 -0500
From: "Steven J. Hill" <Steven.Hill@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2] Revert "MIPS: make CAC_ADDR and UNCAC_ADDR account
 for PHYS_OFFSET"
References: <1371742590-10138-1-git-send-email-Steven.Hill@imgtec.com> <20130626145234.GB7171@linux-mips.org> <CAG2jQ8gf+0rmO-JynMGUUw7evAU2eG5JdWG7+rT58ATDfCFRVQ@mail.gmail.com>
In-Reply-To: <CAG2jQ8gf+0rmO-JynMGUUw7evAU2eG5JdWG7+rT58ATDfCFRVQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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
To: Markos Chandras <markos.chandras@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Florian Fainelli <florian@openwrt.org>
Message-ID: <20130703155624.zJ7YPK2t7qfSgnUHz3W-BdhH2rk99F18-dP3zIl1kg0@z>

On 07/03/2013 09:01 AM, Markos Chandras wrote:
>
> I am afraid this commit[1] broke the build in
> upstream-sfr/mips-for-linux-next with errors like this
>
> arch/mips/include/asm/mach-generic/spaces.h:29:0: warning:
> "UNCAC_BASE" redefined [enabled by default]
> In file included from arch/mips/include/asm/addrspace.h:13:0,
>                   from arch/mips/include/asm/barrier.h:11,
>                   from arch/mips/include/asm/bitops.h:18,
>                   from include/linux/bitops.h:22,
>                   from include/linux/kernel.h:10,
>                   from include/asm-generic/bug.h:13,
>                   from arch/mips/include/asm/bug.h:41,
>                   from include/linux/bug.h:4,
>                   from include/linux/page-flags.h:9,
>                   from kernel/bounds.c:9:
> arch/mips/include/asm/mach-ar7/spaces.h:20:0: note: this is the
> location of the previous definition
>
> [1]: http://git.linux-mips.org/?p=ralf/upstream-sfr.git;a=commit;h=ed3ce16c3d2ba7cac321d29ec0a7d21408ea8437
>
Let me rebase the patch and send another version.
