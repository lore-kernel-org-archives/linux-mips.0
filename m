Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE6CC77B73
	for <linux-mips@archiver.kernel.org>; Sun,  4 Jun 2023 14:58:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbjFDO6D (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 4 Jun 2023 10:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232390AbjFDO6D (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 4 Jun 2023 10:58:03 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE49D19A;
        Sun,  4 Jun 2023 07:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1685890615;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5dcl1shcrAojKzd131V73MzqhBaxqhbqibIw8HMNAPE=;
        b=UltWcevn+WWtJ/4rTe2B+ZKReRzfBIZgSQL7eJyrzY3zMQReebbCKDsByDC2BaUfLmhLZQ
        op2iyF6BUPJHrU/AF+2pq/K13SX2LAGFfexmkONEpsDEkBLIfg6VIhNZhoP1uN1+rdVg6j
        OpOEhGGgVHCfmNqnaq2NHDrUaTJtK98=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     "H . Nikolaus Schaller" <hns@goldelico.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, list@opendingux.net,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 5/9] MIPS: DTS: CI20: Misc. cleanups
Date:   Sun,  4 Jun 2023 16:56:38 +0200
Message-Id: <20230604145642.200577-6-paul@crapouillou.net>
In-Reply-To: <20230604145642.200577-1-paul@crapouillou.net>
References: <20230604145642.200577-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

- Use the standard "ecc-engine" property instead of the custom
"ingenic,bch-controller" to get a handle to the BCH controller.

- Respect cell sizes in the Ethernet controller node.

- Use proper macro for interrupt type instead of hardcoding magic
  values.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 7f6e7a4e3915..b7dbafa1f85d 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -356,7 +356,7 @@ nandc: nand-controller@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		ingenic,bch-controller = <&bch>;
+		ecc-engine = <&bch>;
 
 		ingenic,nemc-tAS = <10>;
 		ingenic,nemc-tAH = <5>;
@@ -422,8 +422,8 @@ dm9000@6 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pins_nemc_cs6>;
 
-		reg = <6 0 1   /* addr */
-		       6 2 1>; /* data */
+		reg = <6 0 1>, /* addr */
+		      <6 2 1>; /* data */
 
 		ingenic,nemc-tAS = <15>;
 		ingenic,nemc-tAH = <10>;
@@ -435,7 +435,7 @@ dm9000@6 {
 		vcc-supply = <&eth0_power>;
 
 		interrupt-parent = <&gpe>;
-		interrupts = <19 4>;
+		interrupts = <19 IRQ_TYPE_EDGE_RISING>;
 
 		nvmem-cells = <&eth0_addr>;
 		nvmem-cell-names = "mac-address";
-- 
2.39.2

