Received: from mailapp01.imgtec.com ([195.59.15.196]:59380 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007054AbbEZWIzGoscp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 27 May 2015 00:08:55 +0200
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: [PATCH 1/3] clk: pistachio: Add a pll_lock() helper for clarity
Date: Tue, 26 May 2015 19:01:07 -0300
Message-ID: <1432677669-29581-2-git-send-email-ezequiel.garcia@imgtec.com>
In-Reply-To: <1432677669-29581-1-git-send-email-ezequiel.garcia@imgtec.com>
References: <1432677669-29581-1-git-send-email-ezequiel.garcia@imgtec.com>
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
Cc: Andrew Bresticker <abrestic@chromium.org>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, cernekee@chromium.org, Govindraj.Raja@imgtec.com, Damien.Horsley@imgtec.com, Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Message-ID: <20150526220107.TohM_9CJvwemlx1bnwCgELYgvs6jEgIk6rSG5xoP1NY@z>

This commit adds a pll_lock() helper making the code more readable.
Cosmetic change only, no functionality changes.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
---
 drivers/clk/pistachio/clk-pll.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/pistachio/clk-pll.c b/drivers/clk/pistachio/clk-pll.c
index de53756..9ce1be7 100644
--- a/drivers/clk/pistachio/clk-pll.c
+++ b/drivers/clk/pistachio/clk-pll.c
@@ -67,6 +67,12 @@ static inline void pll_writel(struct pistachio_clk_pll *pll, u32 val, u32 reg)
 	writel(val, pll->base + reg);
 }
 
+static inline void pll_lock(struct pistachio_clk_pll *pll)
+{
+	while (!(pll_readl(pll, PLL_STATUS) & PLL_STATUS_LOCK))
+		cpu_relax();
+}
+
 static inline u32 do_div_round_closest(u64 dividend, u32 divisor)
 {
 	dividend += divisor / 2;
@@ -178,8 +184,7 @@ static int pll_gf40lp_frac_set_rate(struct clk_hw *hw, unsigned long rate,
 		(params->postdiv2 << PLL_FRAC_CTRL2_POSTDIV2_SHIFT);
 	pll_writel(pll, val, PLL_CTRL2);
 
-	while (!(pll_readl(pll, PLL_STATUS) & PLL_STATUS_LOCK))
-		cpu_relax();
+	pll_lock(pll);
 
 	if (!was_enabled)
 		pll_gf40lp_frac_disable(hw);
@@ -288,8 +293,7 @@ static int pll_gf40lp_laint_set_rate(struct clk_hw *hw, unsigned long rate,
 		(params->postdiv2 << PLL_INT_CTRL1_POSTDIV2_SHIFT);
 	pll_writel(pll, val, PLL_CTRL1);
 
-	while (!(pll_readl(pll, PLL_STATUS) & PLL_STATUS_LOCK))
-		cpu_relax();
+	pll_lock(pll);
 
 	if (!was_enabled)
 		pll_gf40lp_laint_disable(hw);
-- 
2.3.3
