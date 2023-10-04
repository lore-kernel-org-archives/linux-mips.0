Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A30E7C4DA
	for <linux-mips@archiver.kernel.org>; Wed,  4 Oct 2023 16:11:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243297AbjJDQLQ (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 4 Oct 2023 12:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243265AbjJDQLD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Oct 2023 12:11:03 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B27FEA;
        Wed,  4 Oct 2023 09:10:58 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5C46E000B;
        Wed,  4 Oct 2023 16:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1696435857;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NbiHukxXHtfMlJb+CEN6liIu+XF9nH8/hmBYmzodN1k=;
        b=TBGgKq8PXQ8vlq4nuLeUcJcz+BtZfXNd/ki69O9VOavoe9dWDcAr2i7tqcF0qZm0TCAtpO
        I93ekBeHUg5qLqha6C4xmsX/YQZMsf7Kitea/5P1yFCSXQY8Nd6hZPXlrSRV/Co5eY4PZl
        QxXdchNXkrkw0UhgBYO4QCq++09ahwOcDCdmOdYGhQmz+67EtFK+Qa5pVhYu4WAvSSxfbg
        Ff+Zp+aQzF0nVC9ry7XxoHZbgCE+O/pX1hffOOM8VSR3/7afqwlZ+vPaJ4Gz2LdGzzgspv
        q99wYlTmYjb8yOMdpuMAuUsIilALVrayy46aVxPxKzK88UyKltmWVPK8e16D7Q==
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 07/11] dt-bindings: mfd: syscon: Document EyeQ5 OLB
Date:   Wed,  4 Oct 2023 18:10:34 +0200
Message-Id: <20231004161038.2818327-8-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004161038.2818327-1-gregory.clement@bootlin.com>
References: <20231004161038.2818327-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document Mobileye EyeQ5 compatibles for OLB registers that are
misceallanous SoC related registers.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 8103154bbb52..70bc6e8d15ba 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -53,6 +53,7 @@ properties:
               - mediatek,mt8135-pctl-a-syscfg
               - mediatek,mt8135-pctl-b-syscfg
               - mediatek,mt8365-syscfg
+              - mobileye,eyeq5-olb
               - microchip,lan966x-cpu-syscon
               - microchip,sparx5-cpu-syscon
               - mstar,msc313-pmsleep
-- 
2.40.1

