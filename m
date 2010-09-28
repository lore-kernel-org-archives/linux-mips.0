Received: from eu1sys200aog109.obsmtp.com ([207.126.144.127]:51933 "EHLO
        eu1sys200aog109.obsmtp.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491958Ab0I1Ksx convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 28 Sep 2010 12:48:53 +0200
From: Arun MURTHY <arun.murthy@stericsson.com>
Date: Tue, 28 Sep 2010 12:48:12 +0200
Subject: RE: [PATCH 3/7] leds: pwm: add a new element 'name' to platform data
Message-ID: <F45880696056844FA6A73F415B568C69532DC2FC97@EXDCVYMBSTM006.EQ1STM.local>
References: <1285670134-18063-1-git-send-email-arun.murthy@stericsson.com>
 <1285670134-18063-4-git-send-email-arun.murthy@stericsson.com>
 <4CA1C6C4.20504@mvista.com>
In-Reply-To: <4CA1C6C4.20504@mvista.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Sergei Shtylyov <sshtylyov@mvista.com>
Cc: "lars@metafoo.de" <lars@metafoo.de>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "philipp.zabel@gmail.com" <philipp.zabel@gmail.com>, "robert.jarzmik@free.fr" <robert.jarzmik@free.fr>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "eric.y.miao@gmail.com" <eric.y.miao@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, STEricsson_nomadik_linux <STEricsson_nomadik_linux@list.st.com>
Message-ID: <20100928104812.2BU0zbs0VMI58CsCd8bmrKTNUe37gJZqjBtsVNLPlPY@z>

> > @@ -16,6 +16,7 @@ struct led_pwm {
> >   struct led_pwm_platform_data {
> >   	int			num_leds;
> >   	struct led_pwm	*leds;
> > +	char *name;
> >   };
> 
>     Shouldn't '*name'be aligned, at least with '*leds'?
Sure, will take care of this in the v2 patch.

Thanks and Regards,
Arun R Murthy
-------------
