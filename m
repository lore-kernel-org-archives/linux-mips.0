Received: from mail-bw0-f49.google.com ([209.85.214.49]:52191 "EHLO
        mail-bw0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491049Ab0I1Isv (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Sep 2010 10:48:51 +0200
From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 1/7] pwm: Add pwm core driver
Date: Tue, 28 Sep 2010 11:47:20 +0300
References: <1285659648-21409-1-git-send-email-arun.murthy@stericsson.com> <201009281114.31223.anarsoul@gmail.com> <F45880696056844FA6A73F415B568C69532DC2FA8F@EXDCVYMBSTM006.EQ1STM.local>
In-Reply-To: <F45880696056844FA6A73F415B568C69532DC2FA8F@EXDCVYMBSTM006.EQ1STM.local>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-ID: <201009281147.20871.anarsoul@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Arun MURTHY <arun.murthy@stericsson.com>
Cc: "eric.y.miao@gmail.com" <eric.y.miao@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "grinberg@compulab.co.il" <grinberg@compulab.co.il>, "mike@compulab.co.il" <mike@compulab.co.il>, "robert.jarzmik@free.fr" <robert.jarzmik@free.fr>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "drwyrm@gmail.com" <drwyrm@gmail.com>, "stefan@openezx.org" <stefan@openezx.org>, "laforge@openezx.org" <laforge@openezx.org>, "ospite@studenti.unina.it" <ospite@studenti.unina.it>, "philipp.zabel@gmail.com" <philipp.zabel@gmail.com>, "mad_soft@inbox.ru" <mad_soft@inbox.ru>, "maz@misterjones.org" <maz@misterjones.org>, "daniel@caiaq.de" <daniel@caiaq.de>, "haojian.zhuang@marvell.com" <haojian.zhuang@marvell.com>, "timur@freescale.com" <timur@freescale.com>, "ben-linux@fluff.org" <ben-linux@fluff.org>, "support@simtec.co.uk" <support@simtec.co.uk>, "arnaud.patard@rtp-net.org" <arnaud.patard@rtp-net.org>, "dgreenday@gmail.com" <dgreenday@gmail.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "mcuelenaere@gmail.com" <mcuelenaere@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "andre.goddard@gmail.com" <andre.goddard@gmail.com>, "jkosina@suse.cz" <jkosina@suse.cz>, "tj@kernel.org" <tj@kernel.org>, "hsweeten@visionengravers.com" <hsweeten@visionengravers.com>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "lars@metafoo.de" <lars@metafoo.de>, "dilinger@collabora.co.uk" <dilinger@collabora.co.uk>, "mroth@nessie.de" <mroth@nessie.de>, "randy.dunlap@oracle.com" <randy.dunlap@oracle.com>, "lethal@linux-sh.org" <lethal@linux-sh.org>, "rusty@rustcorp.com.au" <rusty@rustcorp.com.au>, "damm@opensource.se" <damm@opensource.se>, "mst@redhat.com" <mst@redhat.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "sguinot@lacie.co" <sguinot@lacie.co>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "balajitk@ti.com" <balajitk@ti.com>, "rnayak@ti.com" <rnayak@ti.com>, "santosh.shilimkar@ti.com" <santosh.shilimkar@ti.com>, "hemanthv@ti.com" <hemanthv@ti.com>, "michael.hennerich@analog.com" <michael.hennerich@analog.com>, "vapier@gentoo.org" <vapier@gentoo.org>, "khali@linux-fr.org" <khali@linux-fr.org>, "jic23@cam.ac.uk" <jic23@cam.ac.uk>, "re.emese@gmail.com" <re.emese@gmail.com>, "linux@simtec.co.uk" <linux@simtec.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Linus WALLEIJ <linus.walleij@stericsson.com>, Mattias WALLIN <mattias.wallin@stericsson.com>
Message-ID: <20100928084720.Dgh0rnp7NexisnbvBAG5Cqa7F6W-arEnM9JzbjsikD4@z>

On 28 of September 2010 11:38:26 Arun MURTHY wrote:

> > 
> > Why pwm_free is marked __deprecated? What is its successor?
> 
> This function is to be removed.

What should be used as replacement?

Regards
Vasily
