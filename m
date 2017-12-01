Received: from mail-wm0-x229.google.com ([IPv6:2a00:1450:400c:c09::229]:36550
        "EHLO mail-wm0-x229.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991100AbdLATuSiJXYY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 1 Dec 2017 20:50:18 +0100
Received: by mail-wm0-x229.google.com with SMTP id b76so5260045wmg.1
        for <linux-mips@linux-mips.org>; Fri, 01 Dec 2017 11:50:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <99dd185d-6e5d-f474-90aa-ebee63045c42@caviumnetworks.com>
References: <20171129005540.28829-1-david.daney@cavium.com>
 <20171129005540.28829-4-david.daney@cavium.com> <20171130225333.GI27409@jhogan-linux.mipstec.com>
 <CAOFm3uGhRTTrvygBd0dMdzWZQC5kFi8yXuWQsnhDvDLtW2z7aA@mail.gmail.com> <99dd185d-6e5d-f474-90aa-ebee63045c42@caviumnetworks.com>
From: Philippe Ombredanne <pombredanne@nexb.com>
Date: Fri, 1 Dec 2017 20:49:31 +0100
Message-ID: <CAOFm3uEy52yog4H_Hco0X+OHF5yiHUZYAHaGz4MefKcYQz3LUg@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] MIPS: Octeon: Add a global resource manager.
Content-Type: text/plain; charset="UTF-8"
Return-Path: <pombredanne@nexb.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney@caviumnetworks.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Carlos Munoz <cmunoz@cavium.com>, David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, "Steven J. Hill" <steven.hill@cavium.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, James Hogan <james.hogan@mips.com>
Message-ID: <20171201194931.KM-8knftdwUYE68DxH1jTdf8ZpKuSZ2HjV6Lww9V5Po@z>

David, Greg,

On Fri, Dec 1, 2017 at 6:42 PM, David Daney <ddaney@caviumnetworks.com> wrote:
> On 11/30/2017 11:53 PM, Philippe Ombredanne wrote:
[...]
>>>> --- /dev/null
>>>> +++ b/arch/mips/cavium-octeon/resource-mgr.c
>>>> @@ -0,0 +1,371 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Resource manager for Octeon.
>>>> + *
>>>> + * This file is subject to the terms and conditions of the GNU General
>>>> Public
>>>> + * License.  See the file "COPYING" in the main directory of this
>>>> archive
>>>> + * for more details.
>>>> + *
>>>> + * Copyright (C) 2017 Cavium, Inc.
>>>> + */
>>
>>
>> Since you nicely included an SPDX id, you would not need the
>> boilerplate anymore. e.g. these can go alright?
>
>
> They may not be strictly speaking necessary, but I don't think they hurt
> anything.  Unless there is a requirement to strip out the license text, we
> would stick with it as is.

I think the requirement is there and that would be much better for
everyone: keeping both is redundant and does not bring any value, does
it? Instead it kinda removes the benefits of having the SPDX id in the
first place IMHO.

Furthermore, as there have been already ~12K+ files cleaned up and
still over 60K files to go, it would really nice if new files could
adopt the new style: this way we will not have to revisit and repatch
them in the future.

-- 
Cordially
Philippe Ombredanne
