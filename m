Received: from mail-wr0-x243.google.com ([IPv6:2a00:1450:400c:c0c::243]:35773
        "EHLO mail-wr0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994849AbdGRKRxp6rVd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 18 Jul 2017 12:17:53 +0200
From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH 7/9] MIPS: Loongson 2F: allow NULL clock for clk_get_rate
Date: Tue, 18 Jul 2017 12:17:28 +0200
Message-ID: <20170718101730.2541-8-jonas.gorski@gmail.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20170718101728.tDMimSZzD5KRYIMzPvEtiOwvrqtt7jWOsInjNYCWXZ4@z>

Make the behaviour of clk_get_rate consistent with common clk's
clk_get_rate by accepting NULL clocks as parameter, as some device
drivers rely on this.

Make the behaviour of clk_get_rate consistent with common clk's
clk_get_rate by accepting NULL clocks as parameter. Some device
drivers rely on this, and will cause an OOPS otherwise.

Fixes: f8ede0f700f5 ("MIPS: Loongson 2F: Add CPU frequency scaling support")
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org
Reported-by: Mathias Kresin <dev@kresin.me>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 arch/mips/loongson64/lemote-2f/clock.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/loongson64/lemote-2f/clock.c b/arch/mips/loongson64/lemote-2f/clock.c
index a78fb657068c..8281334df9c8 100644
--- a/arch/mips/loongson64/lemote-2f/clock.c
+++ b/arch/mips/loongson64/lemote-2f/clock.c
@@ -80,6 +80,9 @@ EXPORT_SYMBOL(clk_disable);
 
 unsigned long clk_get_rate(struct clk *clk)
 {
+	if (!clk)
+		return 0;
+
 	return (unsigned long)clk->rate;
 }
 EXPORT_SYMBOL(clk_get_rate);
-- 
2.11.0
