Received: from mail-wr0-x244.google.com ([IPv6:2a00:1450:400c:c0c::244]:34042
        "EHLO mail-wr0-x244.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994847AbdGRKRv38Zld (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 18 Jul 2017 12:17:51 +0200
From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH 5/9] MIPS: AR7: allow NULL clock for clk_get_rate
Date: Tue, 18 Jul 2017 12:17:26 +0200
Message-ID: <20170718101730.2541-6-jonas.gorski@gmail.com>
In-Reply-To: <20170718101730.2541-1-jonas.gorski@gmail.com>
References: <20170718101730.2541-1-jonas.gorski@gmail.com>
Return-Path: <jonas.gorski@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20170718101726.4LL059aH34tIiSOYzs0WqXnKUEWlMUOapJVL3O9OrfQ@z>

Make the behaviour of clk_get_rate consistent with common clk's
clk_get_rate by accepting NULL clocks as parameter. Some device
drivers rely on this, and will cause an OOPS otherwise.

Fixes: 780019ddf02f ("MIPS: AR7: Implement clock API")
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org
Reported-by: Mathias Kresin <dev@kresin.me>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 arch/mips/ar7/clock.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/ar7/clock.c b/arch/mips/ar7/clock.c
index dda422a0f36c..0137656107a9 100644
--- a/arch/mips/ar7/clock.c
+++ b/arch/mips/ar7/clock.c
@@ -430,6 +430,9 @@ EXPORT_SYMBOL(clk_disable);
 
 unsigned long clk_get_rate(struct clk *clk)
 {
+	if (!clk)
+		return 0;
+
 	return clk->rate;
 }
 EXPORT_SYMBOL(clk_get_rate);
-- 
2.11.0
