Received: from mailapp01.imgtec.com ([195.59.15.196]:51347 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026576AbbEVAEObAECU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 May 2015 02:04:14 +0200
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: [PATCH 9/9] clk: pistachio: Correct critical clock list
Date: Thu, 21 May 2015 20:57:43 -0300
Message-ID: <1432252663-31318-10-git-send-email-ezequiel.garcia@imgtec.com>
In-Reply-To: <1432252663-31318-1-git-send-email-ezequiel.garcia@imgtec.com>
References: <1432252663-31318-1-git-send-email-ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Ezequiel.Garcia@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, sboyd@codeaurora.org
Cc: Andrew Bresticker <abrestic@chromium.org>, James Hartley <james.hartley@imgtec.com>, Govindraj.Raja@imgtec.com, Damien.Horsley@imgtec.com, cernekee@chromium.org, James Hogan <james.hogan@imgtec.com>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Message-ID: <20150521235743.0_xmUwBzGhLAjPvKPee3QW60eQzsdnmyoPGZyekQfAo@z>

From: Damien Horsley <Damien.Horsley@imgtec.com>

Correct the critical clock list. The current one is wrong, and may
fail under some circumstances.

Signed-off-by: Damien Horsley <Damien.Horsley@imgtec.com>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
---
 drivers/clk/pistachio/clk-pistachio.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/pistachio/clk-pistachio.c b/drivers/clk/pistachio/clk-pistachio.c
index 0ac7429..5fc617b 100644
--- a/drivers/clk/pistachio/clk-pistachio.c
+++ b/drivers/clk/pistachio/clk-pistachio.c
@@ -171,9 +171,15 @@ PNAME(mux_debug) = { "mips_pll_mux", "rpu_v_pll_mux",
 		     "wifi_pll_mux", "bt_pll_mux" };
 static u32 mux_debug_idx[] = { 0x0, 0x1, 0x2, 0x4, 0x8, 0x10 };
 
-static unsigned int pistachio_critical_clks[] __initdata = {
+static unsigned int pistachio_critical_clks_core[] __initdata = {
 	CLK_MIPS,
-	CLK_PERIPH_SYS,
+};
+
+static unsigned int pistachio_critical_clks_sys[] __initdata = {
+	PERIPH_CLK_SYS,
+	PERIPH_CLK_SYS_BUS,
+	PERIPH_CLK_DDR,
+	PERIPH_CLK_ROM,
 };
 
 static void __init pistachio_clk_init(struct device_node *np)
@@ -205,8 +211,8 @@ static void __init pistachio_clk_init(struct device_node *np)
 
 	pistachio_clk_register_provider(p);
 
-	pistachio_clk_force_enable(p, pistachio_critical_clks,
-				   ARRAY_SIZE(pistachio_critical_clks));
+	pistachio_clk_force_enable(p, pistachio_critical_clks_core,
+				   ARRAY_SIZE(pistachio_critical_clks_core));
 }
 CLK_OF_DECLARE(pistachio_clk, "img,pistachio-clk", pistachio_clk_init);
 
@@ -273,6 +279,9 @@ static void __init pistachio_clk_periph_init(struct device_node *np)
 				    ARRAY_SIZE(pistachio_periph_gates));
 
 	pistachio_clk_register_provider(p);
+
+	pistachio_clk_force_enable(p, pistachio_critical_clks_sys,
+				   ARRAY_SIZE(pistachio_critical_clks_sys));
 }
 CLK_OF_DECLARE(pistachio_clk_periph, "img,pistachio-clk-periph",
 	       pistachio_clk_periph_init);
-- 
2.3.3
