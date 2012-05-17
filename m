Received: from mail3.caviumnetworks.com ([12.108.191.235]:19701 "EHLO
        mail3.caviumnetworks.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1903710Ab2EQVhq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 17 May 2012 23:37:46 +0200
Message-ID: <4FB56FA7.9070401@cavium.com>
Date: Thu, 17 May 2012 14:37:43 -0700
From: David Daney <david.daney@cavium.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] gpio/MIPS/OCTEON: Add a driver for OCTEON's on-chip
 GPIO pins.
References: <1334275820-7791-1-git-send-email-ddaney.cavm@gmail.com> <1334275820-7791-3-git-send-email-ddaney.cavm@gmail.com> <20120517205044.81B1C3E0621@localhost>
In-Reply-To: <20120517205044.81B1C3E0621@localhost>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Grant Likely <grant.likely@secretlab.ca>, "ralf@linux-mips.org" <ralf@linux-mips.org>
Cc: David Daney <ddaney.cavm@gmail.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Linus Walleij <linus.walleij@stericsson.com>, Rob Herring <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <20120517213743.IUby3_y75LGQwr5flO6wRtQDQMUZ7BIQkqWQaDGNUxA@z>

On 05/17/2012 01:50 PM, Grant Likely wrote:
> On Thu, 12 Apr 2012 17:10:20 -0700, David Daney<ddaney.cavm@gmail.com>  wrote:
>> From: David Daney<david.daney@cavium.com>
>>
>> The SOCs in the OCTEON family have 16 (or in some cases 20) on-chip
>> GPIO pins, this driver handles them all.  Configuring the pins as
>> interrupt sources is handled elsewhere (OCTEON's irq handling code).
>>
>> Signed-off-by: David Daney<david.daney@cavium.com>
>
> Aside from the bugs already pointed out;
>
> Acked-by: Grant Likely<grant.likely@secretlab.ca>
>
> Will you merge this series via the MIPS tree, or do I need to pick it
> up?

Thanks Grant.

I will make the fixes and resubmit.  I expect Ralf can merge these along 
with the rest of the pile of OCTEON patches.

David Daney

>
>> ---
>>   drivers/gpio/Kconfig       |    8 ++
>>   drivers/gpio/Makefile      |    1 +
>>   drivers/gpio/gpio-octeon.c |  166 ++++++++++++++++++++++++++++++++++++++++++++
