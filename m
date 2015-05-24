Received: from mailapp01.imgtec.com ([195.59.15.196]:42668 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006775AbbEXPPnX0u37 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 24 May 2015 17:15:43 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v5 01/37] devicetree/bindings: add Ingenic Semiconductor vendor prefix
Date: Sun, 24 May 2015 16:11:11 +0100
Message-ID: <1432480307-23789-2-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20150524151111.INZAvZ6nX6E9gGeV0we0PxNKFAaTvbNhgaoChy6lXiY@z>

Define a vendor prefix for Ingenic Semiconductor, a vendor of MIPS-based
SoCs. Simply use 'ingenic'.

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
- Rebase

Changes in v2: None

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 8033919..b335a99 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -100,6 +100,7 @@ ibm	International Business Machines (IBM)
 idt	Integrated Device Technologies, Inc.
 iom	Iomega Corporation
 img	Imagination Technologies Ltd.
+ingenic	Ingenic Semiconductor
 innolux	Innolux Corporation
 intel	Intel Corporation
 intercontrol	Inter Control Group
-- 
2.4.1
