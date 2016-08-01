Received: from mail5.windriver.com ([192.103.53.11]:57028 "EHLO mail5.wrs.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23992870AbcHADgFovmEJ (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 1 Aug 2016 05:36:05 +0200
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] clocksource: mips-gic-timer: make gic_clocksource_of_init return int
Date: Sun, 31 Jul 2016 23:35:46 -0400
Message-ID: <20160801033546.26472-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Gortmaker@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-mips@linux-mips.org
Message-ID: <20160801033546.TbOpOfDaMKoIurqY86dPtYIToSJ1yvnkJb79xvJgoTM@z>

In commit d8152bf85d2c057fc39c3e20a4d623f524d9f09c:
  ("clocksource/drivers/mips-gic-timer: Convert init function to return error")

several return values were added to a void function resulting in:

 clocksource/mips-gic-timer.c: In function 'gic_clocksource_of_init':
 clocksource/mips-gic-timer.c:175:3: warning: 'return' with a value, in function returning void [enabled by default]
 clocksource/mips-gic-timer.c:183:4: warning: 'return' with a value, in function returning void [enabled by default]
 clocksource/mips-gic-timer.c:190:3: warning: 'return' with a value, in function returning void [enabled by default]
 clocksource/mips-gic-timer.c:195:3: warning: 'return' with a value, in function returning void [enabled by default]
 clocksource/mips-gic-timer.c:200:3: warning: 'return' with a value, in function returning void [enabled by default]
 clocksource/mips-gic-timer.c:211:2: warning: 'return' with a value, in function returning void [enabled by default]
 clocksource/mips-gic-timer.c: At top level:
 clocksource/mips-gic-timer.c:213:1: warning: comparison of distinct pointer types lacks a cast [enabled by default]
 clocksource/mips-gic-timer.c: In function 'gic_clocksource_of_init':
 clocksource/mips-gic-timer.c:183:18: warning: ignoring return value of 'PTR_ERR', declared with attribute warn_unused_result [-Wunused-result]

Given that the addition of the return values was intentional, it seems
that the conversion of the containing function from void to int was
simply overlooked.

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-mips@linux-mips.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/clocksource/mips-gic-timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index d91e8725917c..b4b3ab5a11ad 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -164,7 +164,7 @@ void __init gic_clocksource_init(unsigned int frequency)
 	gic_start_count();
 }
 
-static void __init gic_clocksource_of_init(struct device_node *node)
+static int __init gic_clocksource_of_init(struct device_node *node)
 {
 	struct clk *clk;
 	int ret;
-- 
2.8.4
