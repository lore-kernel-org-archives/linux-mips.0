Received: from mail-wg0-f52.google.com ([74.125.82.52]:45632 "EHLO
        mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010488AbaJCPumo8MDD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 3 Oct 2014 17:50:42 +0200
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] MIPS: Alchemy: Remove direct access to prepare_count field of struct clk
Date: Fri,  3 Oct 2014 17:50:00 +0200
Message-ID: <1412351404-28818-1-git-send-email-tomeu.vizoso@collabora.com>
Return-Path: <tomeu.vizoso@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Cc: Mike Turquette <mturquette@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Ralf Baechle <ralf@linux-mips.org>, Manuel Lauss <manuel.lauss@gmail.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20141003155000.00C8rKvUA6HNSY3rjqb5WhY4q437jZPe-BJPNHS9ssw@z>

Replacing it with a call to __clk_is_prepared(), which isn't entirely
equivalent but in practice shouldn't matter.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 arch/mips/alchemy/common/clock.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/mips/alchemy/common/clock.c b/arch/mips/alchemy/common/clock.c
index d7557cd..203e440 100644
--- a/arch/mips/alchemy/common/clock.c
+++ b/arch/mips/alchemy/common/clock.c
@@ -37,7 +37,6 @@
 #include <linux/io.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
-#include <linux/clk-private.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
@@ -397,10 +396,10 @@ static long alchemy_clk_fgcs_detr(struct clk_hw *hw, unsigned long rate,
 			break;
 
 		/* if this parent is currently unused, remember it.
-		 * XXX: I know it's a layering violation, but it works
-		 * so well.. (if (!clk_has_active_children(pc)) )
+		 * XXX: we would actually want clk_has_active_children()
+		 * but this is a good-enough approximation for now.
 		 */
-		if (pc->prepare_count == 0) {
+		if (!__clk_is_prepared(pc)) {
 			if (!free)
 				free = pc;
 		}
-- 
1.9.3
