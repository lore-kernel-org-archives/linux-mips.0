Received: from mail-wr0-x244.google.com ([IPv6:2a00:1450:400c:c0c::244]:35777
        "EHLO mail-wr0-x244.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994850AbdGRKRykqzGd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 18 Jul 2017 12:17:54 +0200
From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH 8/9] MIPS: ralink: allow NULL clock for clk_get_rate
Date: Tue, 18 Jul 2017 12:17:29 +0200
Message-ID: <20170718101730.2541-9-jonas.gorski@gmail.com>
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
Cc: John Crispin <john@phrozen.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20170718101729.s-SIEZaw-KJ_zGJfBqdL4aSzagt5DeLp353bgGAZMnQ@z>

Make the behaviour of clk_get_rate consistent with common clk's
clk_get_rate by accepting NULL clocks as parameter. Some device
drivers rely on this, and will cause an OOPS otherwise.

Fixes: 3f0a06b0368d ("MIPS: ralink: adds clkdev code")
Cc: John Crispin <john@phrozen.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org
Reported-by: Mathias Kresin <dev@kresin.me>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 arch/mips/ralink/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/ralink/clk.c b/arch/mips/ralink/clk.c
index eb1c61917eb7..1b7df115eb60 100644
--- a/arch/mips/ralink/clk.c
+++ b/arch/mips/ralink/clk.c
@@ -53,6 +53,9 @@ EXPORT_SYMBOL_GPL(clk_disable);
 
 unsigned long clk_get_rate(struct clk *clk)
 {
+	if (!clk)
+		return 0;
+
 	return clk->rate;
 }
 EXPORT_SYMBOL_GPL(clk_get_rate);
-- 
2.11.0
