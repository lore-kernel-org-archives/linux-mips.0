Received: from mail-bl2nam02on0089.outbound.protection.outlook.com ([104.47.38.89]:22665
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23990754AbdLARnDG6PRL (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 1 Dec 2017 18:43:03 +0100
Subject: Re: [PATCH v4 3/8] MIPS: Octeon: Add a global resource manager.
References: <20171129005540.28829-1-david.daney@cavium.com>
 <20171129005540.28829-4-david.daney@cavium.com>
 <20171130225333.GI27409@jhogan-linux.mipstec.com>
 <CAOFm3uGhRTTrvygBd0dMdzWZQC5kFi8yXuWQsnhDvDLtW2z7aA@mail.gmail.com>
From: David Daney <ddaney@caviumnetworks.com>
Message-ID: <99dd185d-6e5d-f474-90aa-ebee63045c42@caviumnetworks.com>
Date: Fri, 1 Dec 2017 09:42:47 -0800
MIME-Version: 1.0
In-Reply-To: <CAOFm3uGhRTTrvygBd0dMdzWZQC5kFi8yXuWQsnhDvDLtW2z7aA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
To: Philippe Ombredanne <pombredanne@nexb.com>, Carlos Munoz <cmunoz@cavium.com>
Cc: David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, "Steven J. Hill" <steven.hill@cavium.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, James Hogan <james.hogan@mips.com>
Message-ID: <20171201174247.XbVvrUUQg-plXrE5ueHzAeSIEEWsSts63SDj_QQGBxg@z>

On 11/30/2017 11:53 PM, Philippe Ombredanne wrote:
> Carlos,
> 
> On Thu, Nov 30, 2017 at 11:53 PM, James Hogan <james.hogan@mips.com> wrote:
>> On Tue, Nov 28, 2017 at 04:55:35PM -0800, David Daney wrote:
>>> From: Carlos Munoz <cmunoz@cavium.com>
>>>
>>> Add a global resource manager to manage tagged pointers within
>>> bootmem allocated memory. This is used by various functional
>>> blocks in the Octeon core like the FPA, Ethernet nexus, etc.
>>>
>>> Signed-off-by: Carlos Munoz <cmunoz@cavium.com>
>>> Signed-off-by: Steven J. Hill <Steven.Hill@cavium.com>
>>> Signed-off-by: David Daney <david.daney@cavium.com>
>>> ---
>>>   arch/mips/cavium-octeon/Makefile       |   3 +-
>>>   arch/mips/cavium-octeon/resource-mgr.c | 371 +++++++++++++++++++++++++++++++++
>>>   arch/mips/include/asm/octeon/octeon.h  |  18 ++
>>>   3 files changed, 391 insertions(+), 1 deletion(-)
>>>   create mode 100644 arch/mips/cavium-octeon/resource-mgr.c
>>>
>>> diff --git a/arch/mips/cavium-octeon/Makefile b/arch/mips/cavium-octeon/Makefile
>>> index 7c02e542959a..0a299ab8719f 100644
>>> --- a/arch/mips/cavium-octeon/Makefile
>>> +++ b/arch/mips/cavium-octeon/Makefile
>>> @@ -9,7 +9,8 @@
>>>   # Copyright (C) 2005-2009 Cavium Networks
>>>   #
>>>
>>> -obj-y := cpu.o setup.o octeon-platform.o octeon-irq.o csrc-octeon.o
>>> +obj-y := cpu.o setup.o octeon-platform.o octeon-irq.o csrc-octeon.o \
>>> +      resource-mgr.o
>>
>> Maybe put that on a separate line like below.
>>
>>>   obj-y += dma-octeon.o
>>>   obj-y += octeon-memcpy.o
>>>   obj-y += executive/
>>> diff --git a/arch/mips/cavium-octeon/resource-mgr.c b/arch/mips/cavium-octeon/resource-mgr.c
>>> new file mode 100644
>>> index 000000000000..ca25fa953402
>>> --- /dev/null
>>> +++ b/arch/mips/cavium-octeon/resource-mgr.c
>>> @@ -0,0 +1,371 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Resource manager for Octeon.
>>> + *
>>> + * This file is subject to the terms and conditions of the GNU General Public
>>> + * License.  See the file "COPYING" in the main directory of this archive
>>> + * for more details.
>>> + *
>>> + * Copyright (C) 2017 Cavium, Inc.
>>> + */
> 
> Since you nicely included an SPDX id, you would not need the
> boilerplate anymore. e.g. these can go alright?

They may not be strictly speaking necessary, but I don't think they hurt 
anything.  Unless there is a requirement to strip out the license text, 
we would stick with it as is.

> 
>>> + * This file is subject to the terms and conditions of the GNU General Public
>>> + * License.  See the file "COPYING" in the main directory of this archive
>>> + * for more details.
> 
