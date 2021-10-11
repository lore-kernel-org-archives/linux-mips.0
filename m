Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C736C433EF
	for <linux-mips@archiver.kernel.org>; Mon, 11 Oct 2021 14:37:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61F7660EB1
	for <linux-mips@archiver.kernel.org>; Mon, 11 Oct 2021 14:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242286AbhJKOjt (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 11 Oct 2021 10:39:49 -0400
Received: from aposti.net ([89.234.176.197]:46614 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242172AbhJKOjV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 11 Oct 2021 10:39:21 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     list@opendingux.net, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/5] dt-bindings: dma: ingenic: Support #dma-cells = <3>
Date:   Mon, 11 Oct 2021 16:36:49 +0200
Message-Id: <20211011143652.51976-3-paul@crapouillou.net>
In-Reply-To: <20211011143652.51976-1-paul@crapouillou.net>
References: <20211011143652.51976-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Extend the binding to support specifying a different request type for
each direction.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 Documentation/devicetree/bindings/dma/ingenic,dma.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/ingenic,dma.yaml b/Documentation/devicetree/bindings/dma/ingenic,dma.yaml
index f45fd5235879..51b41e4795a2 100644
--- a/Documentation/devicetree/bindings/dma/ingenic,dma.yaml
+++ b/Documentation/devicetree/bindings/dma/ingenic,dma.yaml
@@ -44,13 +44,17 @@ properties:
     maxItems: 1
 
   "#dma-cells":
-    const: 2
+    enum: [2, 3]
     description: >
       DMA clients must use the format described in dma.txt, giving a phandle
-      to the DMA controller plus the following 2 integer cells:
+      to the DMA controller plus the following integer cells:
 
       - Request type: The DMA request type for transfers to/from the
         device on the allocated channel, as defined in the SoC documentation.
+        If "#dma-cells" is 2, the request type is a single cell. If
+        "#dma-cells" is 3, the request type has two cells; the first one
+        corresponds to the host to device direction, the second one corresponds
+        to the device to host direction.
 
       - Channel: If set to 0xffffffff, any available channel will be allocated
         for the client. Otherwise, the exact channel specified will be used.
-- 
2.33.0

