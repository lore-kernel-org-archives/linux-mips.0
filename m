Received: from eu1sys200aog101.obsmtp.com ([207.126.144.111]:61000 "EHLO
        eu1sys200aog101.obsmtp.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491049Ab0I1I7B convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 28 Sep 2010 10:59:01 +0200
From: Arun MURTHY <arun.murthy@stericsson.com>
Date: Tue, 28 Sep 2010 10:57:15 +0200
Subject: RE: [PATCH 1/7] pwm: Add pwm core driver
Message-ID: <F45880696056844FA6A73F415B568C69532DC2FAF7@EXDCVYMBSTM006.EQ1STM.local>
References: <1285659648-21409-1-git-send-email-arun.murthy@stericsson.com>
 <201009281114.31223.anarsoul@gmail.com>
 <F45880696056844FA6A73F415B568C69532DC2FA8F@EXDCVYMBSTM006.EQ1STM.local>
 <201009281147.20871.anarsoul@gmail.com>
In-Reply-To: <201009281147.20871.anarsoul@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: "eric.y.miao@gmail.com" <eric.y.miao@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "grinberg@compulab.co.il" <grinberg@compulab.co.il>, "mike@compulab.co.il" <mike@compulab.co.il>, "robert.jarzmik@free.fr" <robert.jarzmik@free.fr>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "drwyrm@gmail.com" <drwyrm@gmail.com>, "stefan@openezx.org" <stefan@openezx.org>, "laforge@openezx.org" <laforge@openezx.org>, "ospite@studenti.unina.it" <ospite@studenti.unina.it>, "philipp.zabel@gmail.com" <philipp.zabel@gmail.com>, "mad_soft@inbox.ru" <mad_soft@inbox.ru>, "maz@misterjones.org" <maz@misterjones.org>, "daniel@caiaq.de" <daniel@caiaq.de>, "haojian.zhuang@marvell.com" <haojian.zhuang@marvell.com>, "timur@freescale.com" <timur@freescale.com>, "ben-linux@fluff.org" <ben-linux@fluff.org>, "support@simtec.co.uk" <support@simtec.co.uk>, "arnaud.patard@rtp-net.org" <arnaud.patard@rtp-net.org>, "dgreenday@gmail.com" <dgreenday@gmail.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "mcuelenaere@gmail.com" <mcuelenaere@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "andre.goddard@gmail.com" <andre.goddard@gmail.com>, "jkosina@suse.cz" <jkosina@suse.cz>, "tj@kernel.org" <tj@kernel.org>, "hsweeten@visionengravers.com" <hsweeten@visionengravers.com>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "lars@metafoo.de" <lars@metafoo.de>, "dilinger@collabora.co.uk" <dilinger@collabora.co.uk>, "mroth@nessie.de" <mroth@nessie.de>, "randy.dunlap@oracle.com" <randy.dunlap@oracle.com>, "lethal@linux-sh.org" <lethal@linux-sh.org>, "rusty@rustcorp.com.au" <rusty@rustcorp.com.au>, "damm@opensource.se" <damm@opensource.se>, "mst@redhat.com" <mst@redhat.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "sguinot@lacie.co" <sguinot@lacie.co>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "balajitk@ti.com" <balajitk@ti.com>, "rnayak@ti.com" <rnayak@ti.com>, "santosh.shilimkar@ti.com" <santosh.shilimkar@ti.com>, "hemanthv@ti.com" <hemanthv@ti.com>, "michael.hennerich@analog.com" <michael.hennerich@analog.com>, "vapier@gentoo.org" <vapier@gentoo.org>, "khali@linux-fr.org" <khali@linux-fr.org>, "jic23@cam.ac.uk" <jic23@cam.ac.uk>, "re.emese@gmail.com" <re.emese@gmail.com>, "linux@simtec.co.uk" <linux@simtec.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Linus WALLEIJ <linus.walleij@stericsson.com>, Mattias WALLIN <mattias.wallin@stericsson.com>
Message-ID: <20100928085715.GId5Pyf2NSbc3tRPVZYHW4Fie8EVDJWb73c_MNfUKJU@z>


> On 28 of September 2010 11:38:26 Arun MURTHY wrote:
> 
> > >
> > > Why pwm_free is marked __deprecated? What is its successor?
> >
> > This function is to be removed.
> 
> What should be used as replacement?
> 
No replacement, this function is not required.
In the existing scenario, pwm_request will add to the list and pwm_free will remove the driver from list. Not all the pwm drivers register with the pwm core driver and hence pwm core driver maintains a list, wherein it keeps adding the registered pwm drivers to the list. This is removed from the list by unregistering with the core driver.
Hence pwm_free is not required.

Thanks and Regards,
Arun R Murthy
-------------
