Received: from mail-sn1nam01on0111.outbound.protection.outlook.com ([104.47.32.111]:45056
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23994843AbdHGToeTq3F2 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 7 Aug 2017 21:44:34 +0200
From: Hartley Sweeten <HartleyS@visionengravers.com>
Subject: RE: [PATCH] mtd: nand: Rename nand.h into rawnand.h
Date: Mon, 7 Aug 2017 19:44:22 +0000
Message-ID: <SN1PR0101MB1565E57B6E4B074BC235DCACD0B50@SN1PR0101MB1565.prod.exchangelabs.com>
References: <1501860550-16506-1-git-send-email-boris.brezillon@free-electrons.com>
 <1501860550-16506-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1501860550-16506-2-git-send-email-boris.brezillon@free-electrons.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Return-Path: <HartleyS@visionengravers.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Peter Pan <peterpandong@micron.com>, Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, Eric Miao <eric.y.miao@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>, Alexander Clouter <alex@digriz.org.uk>, Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Simtec Linux Team <linux@simtec.co.uk>, Steven Miao <realmz6@gmail.com>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Ralf Baechle <ralf@linux-mips.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Wan ZongShun <mcuos.com@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Maxim Levitsky <maximlevitsky@gmail.com>, Marc Gonzalez <marc_gonzalez@sigmadesigns.com>, Stefan Agner <stefan@agner.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "adi-buildroot-devel@lists.sourceforge.net" <adi-buildroot-devel@lists.sourceforge.net>, "linux-cris-kernel@axis.com" <linux-cris-kernel@axis.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-oxnas@lists.tuxfamily.org" <linux-oxnas@lists.tuxfamily.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>
Message-ID: <20170807194422.HYFBykXtUKKmEMtMN72LdYOc8XhQRgaptf84EvBPw_Q@z>

T24gRnJpZGF5LCBBdWd1c3QgMDQsIDIwMTcgODoyOSBBTSwgQm9yaXMgQnJlemlsbG9uIHdyb3Rl
Og0KPiBXZSBhcmUgcGxhbm5pbmcgdG8gc2hhcmUgbW9yZSBjb2RlIGJldHdlZW4gZGlmZmVyZW50
IE5BTkQgYmFzZWQNCj4gZGV2aWNlcyAoU1BJIE5BTkQsIE9uZU5BTkQgYW5kIHJhdyBOQU5Ecyks
IGJ1dCBiZWZvcmUgZG9pbmcgdGhhdA0KPiB3ZSBuZWVkIHRvIG1vdmUgdGhlIGV4aXN0aW5nIGlu
Y2x1ZGUvbGludXgvbXRkL25hbmQuaCBmaWxlIGludG8NCj4gaW5jbHVkZS9saW51eC9tdGQvcmF3
bmFuZC5oIHNvIHdlIGNhbiBsYXRlciBjcmVhdGUgYSBuYW5kLmggaGVhZGVyDQo+IGNvbnRhaW5p
bmcgYWxsIGNvbW1vbiBzdHJ1Y3R1cmUgYW5kIGZ1bmN0aW9uIHByb3RvdHlwZXMuDQoNCkZvciBl
cDkzeHgsDQoNCkFja2VkLWJ5OiBIIEhhcnRsZXkgU3dlZXRlbiA8aHN3ZWV0ZW5AdmlzaW9uZW5n
cmF2ZXJzLmNvbT4NCg==
