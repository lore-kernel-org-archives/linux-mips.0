Return-Path: <SRS0=HUKb=C7=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C59C4727E
	for <linux-mips@archiver.kernel.org>; Tue, 22 Sep 2020 01:25:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED5A02076E
	for <linux-mips@archiver.kernel.org>; Tue, 22 Sep 2020 01:25:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729703AbgIVBZY (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 21 Sep 2020 21:25:24 -0400
Received: from out28-2.mail.aliyun.com ([115.124.28.2]:55783 "EHLO
        out28-2.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729680AbgIVBZX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Sep 2020 21:25:23 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3273397|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00774534-0.000518599-0.991736;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03300;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=17;RT=17;SR=0;TI=SMTPD_---.IaRRVwp_1600737910;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IaRRVwp_1600737910)
          by smtp.aliyun-inc.com(10.147.41.138);
          Tue, 22 Sep 2020 09:25:18 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, robh+dt@kernel.org,
        paul@crapouillou.net, paulburton@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, jiaxun.yang@flygoat.com,
        Sergey.Semin@baikalelectronics.ru, akpm@linux-foundation.org,
        rppt@kernel.org, dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v3 1/3] dt-bindings: MIPS: Add X2000E based CU2000-Neo.
Date:   Tue, 22 Sep 2020 09:24:42 +0800
Message-Id: <20200922012444.44089-2-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200922012444.44089-1-zhouyanjie@wanyeetech.com>
References: <20200922012444.44089-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add bindings for Ingenic X2000E based board, prepare for later dts.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v3:
    New patch.

 Documentation/devicetree/bindings/mips/ingenic/devices.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
index 83c86cbe4716..dc21b4630c25 100644
--- a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
+++ b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
@@ -47,4 +47,9 @@ properties:
         items:
           - const: yna,cu1830-neo
           - const: ingenic,x1830
+
+      - description: YSH & ATIL General Board, CU2000 Module with Neo Backplane
+        items:
+          - const: yna,cu2000-neo
+          - const: ingenic,x2000e
 ...
-- 
2.11.0

