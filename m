Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:30646 "EHLO
        mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6843089AbaD2OcDBeXdV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 29 Apr 2014 16:32:03 +0200
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 11/17] MIPS: Netlogic: Fix XLP9XX pic entry
Date: Tue, 29 Apr 2014 20:07:50 +0530
Message-ID: <db9d6d674a9fadeb7bad499ade3d66cc715fb6dd.1398780013.git.jchandra@broadcom.com>
In-Reply-To: <cover.1398780013.git.jchandra@broadcom.com>
References: <cover.1398780013.git.jchandra@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <jchandra@broadcom.com>
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
Cc: Jayachandran C <jchandra@broadcom.com>, ralf@linux-mips.org
Message-ID: <20140429143750.0Bo84iJ6r1EMUNfwpSuUlnazaC5hv2UDUflZ8kRw3Ng@z>

Add the compatible property to the PIC entry. Also fix up the nodename
to use the correct address.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/netlogic/dts/xlp_gvp.dts |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/netlogic/dts/xlp_gvp.dts b/arch/mips/netlogic/dts/xlp_gvp.dts
index 047d27f..bb4ecd1 100644
--- a/arch/mips/netlogic/dts/xlp_gvp.dts
+++ b/arch/mips/netlogic/dts/xlp_gvp.dts
@@ -26,11 +26,12 @@
 			interrupt-parent = <&pic>;
 			interrupts = <17>;
 		};
-		pic: pic@4000 {
-			interrupt-controller;
+		pic: pic@110000 {
+			compatible = "netlogic,xlp-pic";
 			#address-cells = <0>;
 			#interrupt-cells = <1>;
 			reg = <0 0x110000 0x200>;
+			interrupt-controller;
 		};
 
 		nor_flash@1,0 {
-- 
1.7.9.5
