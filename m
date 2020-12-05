Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18550C1B0D8
	for <linux-mips@archiver.kernel.org>; Sat,  5 Dec 2020 18:37:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF3D72251D
	for <linux-mips@archiver.kernel.org>; Sat,  5 Dec 2020 18:37:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729478AbgLESTc (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 5 Dec 2020 13:19:32 -0500
Received: from ns2.baikalelectronics.ru ([94.125.187.42]:53268 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727185AbgLERkK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 5 Dec 2020 12:40:10 -0500
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-snps-arc@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 13/19] dt-bindings: usb: dwc3: Add Tx De-emphasis constraints
Date:   Sat, 5 Dec 2020 18:24:20 +0300
Message-ID: <20201205152427.29537-14-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In accordance with the driver comments the PIPE3 de-emphasis can be tuned
to be either -6dB, -2.5dB or disabled. Let's add the de-emphasis
property constraints so the DT schema would make sure the controller DT
node is equipped with correct value.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changelog v2:
- Grammar fix: "s/tunned/tuned"
- Grammar fix: remove redundant "or" conjunction.
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index b1890558affe..e39ad899c92e 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -156,6 +156,10 @@ properties:
       The value driven to the PHY is controlled by the LTSSM during USB3
       Compliance mode.
     $ref: /schemas/types.yaml#/definitions/uint8
+    enum:
+      - 0 # -6dB de-emphasis
+      - 1 # -3.5dB de-emphasis
+      - 2 # No de-emphasis
 
   snps,dis_u3_susphy_quirk:
     description: When set core will disable USB3 suspend phy
-- 
2.29.2

