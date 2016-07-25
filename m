Received: from mail-dm3nam03on0041.outbound.protection.outlook.com ([104.47.41.41]:46240
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23991964AbcGYVJCMAXwo (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 25 Jul 2016 23:09:02 +0200
Message-ID: <57967FE4.4000405@caviumnetworks.com>
Date: Mon, 25 Jul 2016 14:08:52 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Octeon: Remove forced mappings of USB interrupts.
References: <57967A25.4080502@bethel-hill.org>
In-Reply-To: <57967A25.4080502@bethel-hill.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Steven J. Hill" <sjhill@bethel-hill.org>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>
Message-ID: <20160725210852.ArWV2ORSj9MvVuyIsDxLTojQiFP1D2qfonISpkA9F3Q@z>

On 07/25/2016 01:44 PM, Steven J. Hill wrote:
> Get rid of unnecessary forced interrupt mappings for
> the USB host controller on OCTEON II.
>

What makes the mappings unnecessary, is that the corresponding symbols 
are unused.  This is essentially an exercise in dead code removal.

David.

> Signed-off-by: Steven J. Hill <steven.hill@cavium.com>
> Acked-by: David Daney <david.daney@cavium.com>
> Signed-off-by: Steven J. Hill <Steven.Hill@cavium.com>
> ---
>   arch/mips/cavium-octeon/octeon-irq.c           | 12 ------------
>   arch/mips/include/asm/mach-cavium-octeon/irq.h |  2 --
>   2 files changed, 14 deletions(-)
>
[...]
