Received: from mail-wm0-x244.google.com ([IPv6:2a00:1450:400c:c09::244]:39355
        "EHLO mail-wm0-x244.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990425AbdL2Mz6hLCSp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 29 Dec 2017 13:55:58 +0100
Received: by mail-wm0-x244.google.com with SMTP id i11so47910879wmf.4
        for <linux-mips@linux-mips.org>; Fri, 29 Dec 2017 04:55:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171228135634.30000-7-paul@crapouillou.net>
References: <20170702163016.6714-2-paul@crapouillou.net> <20171228135634.30000-1-paul@crapouillou.net>
 <20171228135634.30000-7-paul@crapouillou.net>
From: Philippe Ombredanne <pombredanne@nexb.com>
Date: Fri, 29 Dec 2017 13:55:12 +0100
Message-ID: <CAOFm3uEbEx+HTsOANchqiReuDBa96O0Y-V-igLGWPF-OxQ2jtw@mail.gmail.com>
Subject: Re: [PATCH v4 06/15] clk: Add Ingenic jz4770 CGU driver
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
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Maarten ter Huurne <maarten@treewalker.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, linux-clk@vger.kernel.org
Message-ID: <20171229125512.liKsTb97omzty2f6AXgfekPURxf8A3Ug2RFNqE1n6Cc@z>

Dear Mr Crapouillou-Cercueil-Sir,

On Thu, Dec 28, 2017 at 2:56 PM, Paul Cercueil <paul@crapouillou.net> wrote:
> Add support for the clocks provided by the CGU in the Ingenic JZ4770
> SoC.

<snip>

> --- /dev/null
> +++ b/drivers/clk/ingenic/jz4770-cgu.c
> @@ -0,0 +1,487 @@
> +/*
> + * JZ4770 SoC CGU driver
> + *
> + * Copyright 2017, Paul Cercueil <paul@crapouillou.net>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 or later
> + * as published by the Free Software Foundation.
> + */

Do you mind using a simpler one-line SPDX identifier instead of this
fine but clearly crapouillish legalese boilerplate? Unless you are
trying to turn the kernel in a legal compendium, of course ;)

This is documented in Thomas doc patches. This would apply to your
entire patch set.
Thank you for your kind consideration!
-- 
Cordially
Philippe Ombredanne
