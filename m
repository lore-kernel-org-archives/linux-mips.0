Received: from mxout51.expurgate.net ([91.198.224.51]:44284 "EHLO
        mxout51.expurgate.net" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010957AbbKYKTqHJr3d convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 25 Nov 2015 11:19:46 +0100
From: Martin Schiller <mschiller@tdt.de>
Subject: [PATCH v2 3/4] pinctrl/lantiq: update devicetree binding in dts file
Date: Wed, 25 Nov 2015 11:18:58 +0100
Message-ID: <1448446739-5541-3-git-send-email-mschiller@tdt.de>
In-Reply-To: <1448446739-5541-1-git-send-email-mschiller@tdt.de>
References: <1448446739-5541-1-git-send-email-mschiller@tdt.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-Path: <mschiller@tdt.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, ralf@linux-mips.org, blogic@openwrt.org, hauke@hauke-m.de, jogo@openwrt.org, daniel.schwierzeck@gmail.com, Martin Schiller <mschiller@tdt.de>
Message-ID: <20151125101858.GyQ4uVo8_rVOGVwcu3W-PxccYTaTfR2UNd22PbTPDbs@z>

This patch updates the compatible string in the easy50712.dts file to the new
"lantiq,danube-pinctrl".

Signed-off-by: Martin Schiller <mschiller@tdt.de>
---
 arch/mips/boot/dts/lantiq/easy50712.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/lantiq/easy50712.dts b/arch/mips/boot/dts/lantiq/easy50712.dts
index 143b8a3..b599625 100644
--- a/arch/mips/boot/dts/lantiq/easy50712.dts
+++ b/arch/mips/boot/dts/lantiq/easy50712.dts
@@ -52,7 +52,7 @@
 		};
 
 		gpio: pinmux@E100B10 {
-			compatible = "lantiq,pinctrl-xway";
+			compatible = "lantiq,danube-pinctrl";
 			pinctrl-names = "default";
 			pinctrl-0 = <&state_default>;
 
-- 
2.1.4
