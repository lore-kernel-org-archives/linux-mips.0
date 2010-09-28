Received: from eu1sys200aog114.obsmtp.com ([207.126.144.137]:54418 "EHLO
        eu1sys200aog114.obsmtp.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491049Ab0I1Ijk (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Sep 2010 10:39:40 +0200
From: Arun MURTHY <arun.murthy@stericsson.com>
Date: Tue, 28 Sep 2010 10:36:29 +0200
Subject: RE: [PATCH 3/7] leds: pwm: add a new element 'name' to platform data
Message-ID: <F45880696056844FA6A73F415B568C69532DC2FA80@EXDCVYMBSTM006.EQ1STM.local>
References: <1285659648-21409-1-git-send-email-arun.murthy@stericsson.com>
 <1285659648-21409-4-git-send-email-arun.murthy@stericsson.com>
 <AANLkTi=0xKWPNn+b1kfPyMTs_mxsYqx+Cd+R1aTZiycg@mail.gmail.com>
In-Reply-To: <AANLkTi=0xKWPNn+b1kfPyMTs_mxsYqx+Cd+R1aTZiycg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Eric Miao <eric.y.miao@gmail.com>
Cc: "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "grinberg@compulab.co.il" <grinberg@compulab.co.il>, "mike@compulab.co.il" <mike@compulab.co.il>, "robert.jarzmik@free.fr" <robert.jarzmik@free.fr>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "drwyrm@gmail.com" <drwyrm@gmail.com>, "stefan@openezx.org" <stefan@openezx.org>, "laforge@openezx.org" <laforge@openezx.org>, "ospite@studenti.unina.it" <ospite@studenti.unina.it>, "philipp.zabel@gmail.com" <philipp.zabel@gmail.com>, "mad_soft@inbox.ru" <mad_soft@inbox.ru>, "maz@misterjones.org" <maz@misterjones.org>, "daniel@caiaq.de" <daniel@caiaq.de>, "haojian.zhuang@marvell.com" <haojian.zhuang@marvell.com>, "timur@freescale.com" <timur@freescale.com>, "ben-linux@fluff.org" <ben-linux@fluff.org>, "support@simtec.co.uk" <support@simtec.co.uk>, "arnaud.patard@rtp-net.org" <arnaud.patard@rtp-net.org>, "dgreenday@gmail.com" <dgreenday@gmail.com>, "anarsoul@gmail.com" <anarsoul@gmail.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "mcuelenaere@gmail.com" <mcuelenaere@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "andre.goddard@gmail.com" <andre.goddard@gmail.com>, "jkosina@suse.cz" <jkosina@suse.cz>, "tj@kernel.org" <tj@kernel.org>, "hsweeten@visionengravers.com" <hsweeten@visionengravers.com>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "lars@metafoo.de" <lars@metafoo.de>, "dilinger@collabora.co.uk" <dilinger@collabora.co.uk>, "mroth@nessie.de" <mroth@nessie.de>, "randy.dunlap@oracle.com" <randy.dunlap@oracle.com>, "lethal@linux-sh.org" <lethal@linux-sh.org>, "rusty@rustcorp.com.au" <rusty@rustcorp.com.au>, "damm@opensource.se" <damm@opensource.se>, "mst@redhat.com" <mst@redhat.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "sguinot@lacie.co" <sguinot@lacie.co>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "balajitk@ti.com" <balajitk@ti.com>, "rnayak@ti.com" <rnayak@ti.com>, "santosh.shilimkar@ti.com" <santosh.shilimkar@ti.com>, "hemanthv@ti.com" <hemanthv@ti.com>, "michael.hennerich@analog.com" <michael.hennerich@analog.com>, "vapier@gentoo.org" <vapier@gentoo.org>, "khali@linux-fr.org" <khali@linux-fr.org>, "jic23@cam.ac.uk" <jic23@cam.ac.uk>, "re.emese@gmail.com" <re.emese@gmail.com>, "linux@simtec.co.uk" <linux@simtec.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Linus WALLEIJ <linus.walleij@stericsson.com>, Mattias WALLIN <mattias.wallin@stericsson.com>
Message-ID: <20100928083629.nWr-wbmcNyGrFJE4xcEpObW1Wdv9ZYqwJW3Y9NTxOJQ@z>

PiBPbiBUdWUsIFNlcCAyOCwgMjAxMCBhdCAzOjQwIFBNLCBBcnVuIE11cnRoeQ0KPiA8YXJ1bi5t
dXJ0aHlAc3Rlcmljc3Nvbi5jb20+IHdyb3RlOg0KPiA+IEEgbmV3IGVsZW1lbnQgJ25hbWUnIGlz
IGFkZGVkIHRvIHB3bSBsZWQgcGxhdGZvcm0gZGF0YSBzdHJ1Y3R1cmUuDQo+ID4gVGhpcyBpcyBy
ZXF1aXJlZCB0byBpZGVudGlmeSB0aGUgcHdtIGRldmljZS4NCj4gDQo+IEkgY2Fubm90IHNlZSB3
aGF0IHRoaXMgbmFtZSBpcyB1c2VkIGZvcj8NCj4gDQpUaGlzIG5hbWUgaXMgcmVmZXJlbmNlZCBp
biBsZWRzLXB3bS5jIGFuZCBwd21fYmwuYy4gSXQgaXMgcGFzc2VkIGFzIGEgcGFyYW1ldGVyIGlu
IHB3bV9yZXF1ZXN0KCkgZnVuY3Rpb24uKHBsZWFzZSByZWZlciB0aGUgbmV4dCBwYXRjaCBpLmUg
UEFUSEMgNC83KQ0KSXQgaXMgdXNlZCB0byBpZGVudGlmeSB0aGUgcHdtIGRyaXZlciBieSBuYW1l
Lg0KDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpBcnVuIFIgTXVydGh5DQotLS0tLS0tLS0tLS0tDQo=
