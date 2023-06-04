Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6595C77B73
	for <linux-mips@archiver.kernel.org>; Sun,  4 Jun 2023 14:57:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232259AbjFDO5d (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 4 Jun 2023 10:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232419AbjFDO53 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 4 Jun 2023 10:57:29 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B5CE5B;
        Sun,  4 Jun 2023 07:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1685890613;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3W42Iugh4TAiPO2bdw35V8IEIqh0OS862BtDx0iobKk=;
        b=Sofx6Vb5UaCNOwpRNr+JjJpNtP+MI8al3NNmxo3Xs8O/Wi6bXmkfZH7wZMOO4YQsxk700Q
        DymLE5SdAG9zRUIUrJXGqwmeOWbejbvOADDxKS2z7fXm5xPbUxZqgFGysPULDoupIG31t6
        9wegeyQSoo5rD1/DVCjTS6ilJZefBmw=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     "H . Nikolaus Schaller" <hns@goldelico.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, list@opendingux.net,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/9] MIPS: DTS: CI20: Add parent supplies to ACT8600 regulators
Date:   Sun,  4 Jun 2023 16:56:36 +0200
Message-Id: <20230604145642.200577-4-paul@crapouillou.net>
In-Reply-To: <20230604145642.200577-1-paul@crapouillou.net>
References: <20230604145642.200577-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Provide parent regulators to the ACT8600 regulators that need one.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 5361606c5e13..662796acda41 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -242,16 +242,19 @@ regulators {
 			vddcore: DCDC1 {
 				regulator-min-microvolt = <1100000>;
 				regulator-max-microvolt = <1100000>;
+				vp1-supply = <&vcc_33v>;
 				regulator-always-on;
 			};
 			vddmem: DCDC2 {
 				regulator-min-microvolt = <1500000>;
 				regulator-max-microvolt = <1500000>;
+				vp2-supply = <&vcc_33v>;
 				regulator-always-on;
 			};
 			vcc_33: DCDC3 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
+				vp3-supply = <&vcc_33v>;
 				regulator-always-on;
 			};
 			vcc_50: SUDCDC_REG4 {
@@ -262,21 +265,25 @@ vcc_50: SUDCDC_REG4 {
 			vcc_25: LDO5 {
 				regulator-min-microvolt = <2500000>;
 				regulator-max-microvolt = <2500000>;
+				inl-supply = <&vcc_33v>;
 				regulator-always-on;
 			};
 			wifi_io: LDO6 {
 				regulator-min-microvolt = <2500000>;
 				regulator-max-microvolt = <2500000>;
+				inl-supply = <&vcc_33v>;
 				regulator-always-on;
 			};
 			cim_io_28: LDO7 {
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
+				inl-supply = <&vcc_33v>;
 				regulator-always-on;
 			};
 			cim_io_15: LDO8 {
 				regulator-min-microvolt = <1500000>;
 				regulator-max-microvolt = <1500000>;
+				inl-supply = <&vcc_33v>;
 				regulator-always-on;
 			};
 			vrtc_18: LDO_REG9 {
-- 
2.39.2

