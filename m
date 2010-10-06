Received: from mail-yw0-f49.google.com ([209.85.213.49]:56721 "EHLO
        mail-yw0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491083Ab0JFTpv (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 6 Oct 2010 21:45:51 +0200
Received: by ywh2 with SMTP id 2so2013301ywh.36
        for <linux-mips@linux-mips.org>; Wed, 06 Oct 2010 12:45:44 -0700 (PDT)
From: Kevin Hilman <khilman@deeprootsystems.com>
Subject: Re: [PATCHv2 1/7] pwm: Add pwm core driver
References: <1286280002-1636-1-git-send-email-arun.murthy@stericsson.com>
        <1286280002-1636-2-git-send-email-arun.murthy@stericsson.com>
        <20101005122225.6dda30ff.akpm@linux-foundation.org>
        <F45880696056844FA6A73F415B568C6953571D4F05@EXDCVYMBSTM006.EQ1STM.local>
Date: Wed, 06 Oct 2010 12:45:40 -0700
In-Reply-To: <F45880696056844FA6A73F415B568C6953571D4F05@EXDCVYMBSTM006.EQ1STM.local>
        (Arun MURTHY's message of "Wed, 6 Oct 2010 06:03:28 +0200")
Message-ID: <87ocb7jeaj.fsf@deeprootsystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-Path: <khilman@deeprootsystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Arun MURTHY <arun.murthy@stericsson.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "lars@metafoo.de" <lars@metafoo.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "philipp.zabel@gmail.com" <philipp.zabel@gmail.com>, "robert.jarzmik@free.fr" <robert.jarzmik@free.fr>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "eric.y.miao@gmail.com" <eric.y.miao@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, STEricsson_nomadik_linux <STEricsson_nomadik_linux@list.st.com>, "bgat@billgatliff.com" <bgat@billgatliff.com>
Message-ID: <20101006194540.Kit5QktD4AiOtXERsB3DKRaTwMvcZp5ug1FO869R30c@z>

Arun MURTHY <arun.murthy@stericsson.com> writes:

[...]

>> 
>> I suggest that you work on Kevin's comments before making any code
>> changes though.
>
> This pwm driver also supports the Davinci pwm driver as suggested by
> Kelvin.

My concern isn't whether it supports davinci or not.  Adapting existing
drivers is the easy part.

My concern is that there are now two proposals for a generic PWM
framework, and I would prefer to see that those projects are aligned
before anything merges.

Kevin
