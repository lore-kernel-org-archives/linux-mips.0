Received: from mailapp01.imgtec.com ([195.59.15.196]:42847 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006775AbbEXPVHxJVSD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 24 May 2015 17:21:07 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v5 02/37] devicetree/bindings: add Qi Hardware vendor prefix
Date: Sun, 24 May 2015 16:11:12 +0100
Message-ID: <1432480307-23789-3-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1432480307-23789-1-git-send-email-paul.burton@imgtec.com>
References: <1432480307-23789-1-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, Lars-Peter Clausen <lars@metafoo.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Hayato Suzuki <hytszk@gmail.com>, Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Arnaud Ebalard <arno@natisbad.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Antony Pavlov <antonynpavlov@gmail.com>
Message-ID: <20150524151112.9upMnjZ6bWKH88-T7WgEv3J4ITLnffenjxlDHe5ibS8@z>

Define a vendor prefix for Qi Hardware, creators of the Ben Nanonote
(qi_lb60) among other open devices.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Acked-by: Rob Herring <robh@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---

Changes in v5: None
Changes in v4: None
Changes in v3:
- New patch

Changes in v2: None

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index b335a99..c4ba705 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -155,6 +155,7 @@ powervr	PowerVR (deprecated, use img)
 qca	Qualcomm Atheros, Inc.
 qcom	Qualcomm Technologies, Inc
 qemu	QEMU, a generic and open source machine emulator and virtualizer
+qi	Qi Hardware
 qnap	QNAP Systems, Inc.
 radxa	Radxa
 raidsonic	RaidSonic Technology GmbH
-- 
2.4.1
