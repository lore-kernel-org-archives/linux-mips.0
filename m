Received: from outils.crapouillou.net ([89.234.176.41]:41638 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990412AbdL2PCaBoZNc convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 29 Dec 2017 16:02:30 +0100
Date: Fri, 29 Dec 2017 16:02:24 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 06/15] clk: Add Ingenic jz4770 CGU driver
Message-ID: <1514559744.2198.1@smtp.crapouillou.net>
In-Reply-To: <CAOFm3uEbEx+HTsOANchqiReuDBa96O0Y-V-igLGWPF-OxQ2jtw@mail.gmail.com>
References: <20170702163016.6714-2-paul@crapouillou.net>
        <20171228135634.30000-1-paul@crapouillou.net>
        <20171228135634.30000-7-paul@crapouillou.net>
        <CAOFm3uEbEx+HTsOANchqiReuDBa96O0Y-V-igLGWPF-OxQ2jtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Return-Path: <paul@crapouillou.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Philippe Ombredanne <pombredanne@nexb.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Maarten ter Huurne <maarten@treewalker.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, linux-clk@vger.kernel.org
Message-ID: <20171229150224.G-uLm9MCl8C99YfdzEiJun68--xSnHRADWgJaptdfnQ@z>


Dear Mr. Ombredanne,

Le ven. 29 déc. 2017 à 13:55, Philippe Ombredanne 
<pombredanne@nexb.com> a écrit :
> Dear Mr Crapouillou-Cercueil-Sir,
> 
> On Thu, Dec 28, 2017 at 2:56 PM, Paul Cercueil <paul@crapouillou.net> 
> wrote:
>>  Add support for the clocks provided by the CGU in the Ingenic JZ4770
>>  SoC.
> 
> <snip>
> 
>>  --- /dev/null
>>  +++ b/drivers/clk/ingenic/jz4770-cgu.c
>>  @@ -0,0 +1,487 @@
>>  +/*
>>  + * JZ4770 SoC CGU driver
>>  + *
>>  + * Copyright 2017, Paul Cercueil <paul@crapouillou.net>
>>  + *
>>  + * This program is free software; you can redistribute it and/or 
>> modify
>>  + * it under the terms of the GNU General Public License version 2 
>> or later
>>  + * as published by the Free Software Foundation.
>>  + */
> 
> Do you mind using a simpler one-line SPDX identifier instead of this
> fine but clearly crapouillish legalese boilerplate? Unless you are
> trying to turn the kernel in a legal compendium, of course ;)
> 
> This is documented in Thomas doc patches. This would apply to your
> entire patch set.
> Thank you for your kind consideration!

Sure, I wasn't aware about that new SPDX identifier thing. I'll do it 
in V5.

Regards,
-Paul
