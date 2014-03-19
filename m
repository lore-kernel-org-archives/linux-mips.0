Received: from mail-bn1lp0139.outbound.protection.outlook.com ([207.46.163.139]:10565
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6816543AbaCSSe4a2clV (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 19 Mar 2014 19:34:56 +0100
Message-ID: <5329E343.60309@caviumnetworks.com>
Date: Wed, 19 Mar 2014 11:34:43 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH V2] mips/octeon_3xxx: Fix a warning on octeon_3xxx
References: <1395118084-24018-1-git-send-email-Wei.Yang@windriver.com> <532968AD.4010402@windriver.com> <20140319162008.GA4368@alberich>
In-Reply-To: <20140319162008.GA4368@alberich>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Cc: "Yang,Wei" <Wei.Yang@windriver.com>, david.daney@cavium.com, ralf@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20140319183443.oERwEg5LB59T8loyvDBtt2WRNA1IFB9p9sqfPACYz5g@z>

On 03/19/2014 09:20 AM, Andreas Herrmann wrote:
> On Wed, Mar 19, 2014 at 05:51:41PM +0800, Yang,Wei wrote:
>> ping.
>
> I think, that the proper solution to avoid this warning is
> to fix the DTS information.
>

Just for the record:  The DTS is reflecting the actual routing of the 
signals within the SoC.  So I would argue that we shouldn't change it 
for these two reasons:

1) It accurately reflects reality.

2) There are deployed bootloaders that supply this to the kernel that 
are difficult to change.


> The warning started to trigger since commit
> 3da5278727a895d49a601f67fd49dffa0b80f9a5 (of/irq: Rework of_irq_count())
> was introduced.
>
> This changed of_irq_count() like this:
>
>   -       while (of_irq_to_resource(dev, nr, NULL))
>   +       while (of_irq_parse_one(dev, nr, &irq) == 0)
>
> Since then the code maps IRQs listed in the gpio-controller device
> node to its interrupt-parent, I think.
>
> Before this patch those interrupts weren't mapped at this point.
>
> I think both patches are fine to avoid the warning.  With the new
> version kind of a redundant mapping of GPIO interrupts happens (which
> will be overridden for an GPIO IRQ as soon as it is really used).
> This makes me think that the warning makes sense and the DTS needs to
> be fixed. (We should not use octeon_irq_ciu_xlat/octeon_irq_ciu_map
> for GPIO lines.)
>
> I might be wrong but maybe specifying an interrupt-parent for the
> gpio-controller (and thus listing the GPIO IRQs in the gpio-controller
> device node) was not a good choice.
>

Andreas has a slightly modified version of the V2 patch that we tested, 
and it seems to work.  I think we should go with that instead of the V2 
patch.

David Daney


>
>>
