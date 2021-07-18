Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4361EC636CB
	for <linux-mips@archiver.kernel.org>; Sun, 18 Jul 2021 12:20:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2428C61181
	for <linux-mips@archiver.kernel.org>; Sun, 18 Jul 2021 12:20:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233504AbhGRMXb (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 18 Jul 2021 08:23:31 -0400
Received: from aposti.net ([89.234.176.197]:37100 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232851AbhGRMXa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 18 Jul 2021 08:23:30 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        list@opendingux.net, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/3] dt-bindings: dma: ingenic: Add compatible strings for MDMA
Date:   Sun, 18 Jul 2021 13:20:22 +0100
Message-Id: <20210718122024.204907-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The JZ4760 and JZ4760B SoCs have an additional DMA controller, dubbed
MDMA, that only supports memcpy operations.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 Documentation/devicetree/bindings/dma/ingenic,dma.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/ingenic,dma.yaml b/Documentation/devicetree/bindings/dma/ingenic,dma.yaml
index ac4d59494fc8..fe25af0dc0e7 100644
--- a/Documentation/devicetree/bindings/dma/ingenic,dma.yaml
+++ b/Documentation/devicetree/bindings/dma/ingenic,dma.yaml
@@ -18,7 +18,9 @@ properties:
       - ingenic,jz4740-dma
       - ingenic,jz4725b-dma
       - ingenic,jz4760-dma
+      - ingenic,jz4760-mdma
       - ingenic,jz4760b-dma
+      - ingenic,jz4760b-mdma
       - ingenic,jz4770-dma
       - ingenic,jz4780-dma
       - ingenic,x1000-dma
-- 
2.30.2

