Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F04C433DB
	for <linux-mips@archiver.kernel.org>; Sun,  3 Jan 2021 10:19:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDA17207FB
	for <linux-mips@archiver.kernel.org>; Sun,  3 Jan 2021 10:19:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbhACKTF (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 3 Jan 2021 05:19:05 -0500
Received: from mx4.wp.pl ([212.77.101.12]:36555 "EHLO mx4.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726480AbhACKTF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 3 Jan 2021 05:19:05 -0500
Received: (wp-smtpd smtp.wp.pl 20816 invoked from network); 3 Jan 2021 11:18:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1609669092; bh=Rd6FYkFxD81fQr8uSphtFE4PTdTG6n3VHenFLmzg2RI=;
          h=From:To:Subject;
          b=BKYglVqSZI8drINbi6lON3G1/JGNCagJeDW8SG2f9jItQcvQLdL7rpyh2zWMlcUBs
           CeHpEzgHYa9wdb692ZUmXMt1yBmVQQ44WGnLBJDwvWhdpcYB+n2q8/T8fmRxsXYK66
           nVaFB5xV65QK9aZviVngXM4Y1tay9v8l1LogSies=
Received: from riviera.nat.student.pw.edu.pl (HELO LAPTOP-OLEK.lan) (olek2@wp.pl@[194.29.137.1])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <tsbogend@alpha.franken.de>; 3 Jan 2021 11:18:12 +0100
From:   Aleksander Jan Bajkowski <olek2@wp.pl>
To:     tsbogend@alpha.franken.de, robh+dt@kernel.org, olek2@wp.pl,
        john@phrozen.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mips: lantiq: Document Lantiq Xway DMA bindings
Date:   Sun,  3 Jan 2021 11:18:03 +0100
Message-Id: <20210103101803.2123-1-olek2@wp.pl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: b853c3b78a605f6d542c35505a675489
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [0fNU]                               
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document the Lantiq Xway SoC DMA Controller DT bindings.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../bindings/mips/lantiq/lantiq,dma-xway.yaml | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,dma-xway.yaml

diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,dma-xway.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dma-xway.yaml
new file mode 100644
index 000000000000..40130fefa2b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dma-xway.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/lantiq/lantiq,dma-xway.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq Xway SoCs DMA Controller DT bindings
+
+maintainers:
+  - John Crispin <john@phrozen.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - lantiq,dma-xway
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    dma@e104100 {
+        compatible = "lantiq,dma-xway";
+        reg = <0xe104100 0x800>;
+    };
-- 
2.20.1

