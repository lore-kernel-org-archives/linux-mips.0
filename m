Received: from 19pmail.ess.barracuda.com ([64.235.150.245]:53913 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990740AbdKCOPliL2jV convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 3 Nov 2017 15:15:41 +0100
From: Aleksandar Markovic <Aleksandar.Markovic@mips.com>
Subject: RE: [PATCH v7 2/5] irqchip/irq-goldfish-pic: Add Goldfish PIC driver
Date: Fri, 3 Nov 2017 14:10:13 +0000
Message-ID: <BD3A5F1946F2E540A31AF2CE969BAEEEC19BF3@MIPSMAIL01.mipstec.com>
References: <1509639716-4787-1-git-send-email-aleksandar.markovic@rt-rk.com>
         <1509639716-4787-3-git-send-email-aleksandar.markovic@rt-rk.com>,<1509640479.31043.80.camel@perches.com>
In-Reply-To: <1509640479.31043.80.camel@perches.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Aleksandar.Markovic@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Joe Perches <joe@perches.com>, Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Cc: Miodrag Dinic <Miodrag.Dinic@mips.com>, Goran Ferenc <Goran.Ferenc@mips.com>, "David S. Miller" <davem@davemloft.net>, Douglas Leung <Douglas.Leung@mips.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, James Hogan <James.Hogan@mips.com>, Jason Cooper <jason@lakedaemon.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Miodrag Dinic <miodrag.dinic@imgtec.com>, Paul Burton <Paul.Burton@mips.com>, Petar Jovanovic <Petar.Jovanovic@mips.com>, Raghu Gandham <Raghu.Gandham@mips.com>, Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20171103141013.61cSHN1aL_udCLY1enAJB1VGUS52KyIZw40bjc-6QZI@z>

> From: Joe Perches [joe@perches.com]
> ...
>On Thu, 2017-11-02 at 17:21 +0100, Aleksandar Markovic wrote:
> ...
>
> > Signed-off-by: Miodrag Dinic <miodrag.dinic@mips.com>
> > Signed-off-by: Goran Ferenc <goran.ferenc@mips.com>
> > Signed-off-by: Aleksandar Markovic <aleksandar.markovic@mips.com>
> > wq
> 
> vi much?
> 

:)

> > +/*
> > + * Driver for MIPS Goldfish Programmable Interrupt Controller.
> > + *
> > + * Author: Miodrag Dinic <miodrag.dinic@mips.com>
> > + *
> > + * This program is free software; you can redistribute       it and/or modify it
> > + * under  the terms of       the GNU General  Public License as published by the
> > + * Free Software Foundation;  either version 2 of the  License, or (at your
> > + * option) any later version.
> > + */
> 
> Odd mix of spaces and tabs
> 

Will be fixed in v8.

> It'd be good to add a #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> before any #include so the pr_<level> output is prefixed appropriately.

Error and info messages will be completely revised in v8.

Thanks for the review!

Aleksandar
