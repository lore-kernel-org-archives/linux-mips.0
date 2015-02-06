Received: from bes.se.axis.com ([195.60.68.10]:54406 "EHLO bes.se.axis.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S27012752AbbBFQSl7UbtM (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 6 Feb 2015 17:18:41 +0100
From: Niklas Cassel <niklas.cassel@axis.com>
Subject: [PATCH] MIPS: sead3: Corrected get_c0_perfcount_int
Date: Fri, 6 Feb 2015 17:18:29 +0100
Message-ID: <1423239509-1432-1-git-send-email-niklass@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <niklas.cassel@axis.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org
Cc: abrestic@chromium.org, linux-mips@linux-mips.org, Niklas Cassel <niklass@axis.com>
Message-ID: <20150206161829.HSU6FZd5K_VVRQ7Zx9xiz7mzqb5tTIYSX5oXatbVx70@z>

Commit e9de688dac65 ("irqchip: mips-gic: Support local interrupts")
updated several platforms. This is a copy paste error.

Signed-off-by: Niklas Cassel <niklass@axis.com>
---
 arch/mips/mti-sead3/sead3-time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mti-sead3/sead3-time.c b/arch/mips/mti-sead3/sead3-time.c
index ec1dd24..e1d6989 100644
--- a/arch/mips/mti-sead3/sead3-time.c
+++ b/arch/mips/mti-sead3/sead3-time.c
@@ -72,7 +72,7 @@ void read_persistent_clock(struct timespec *ts)
 int get_c0_perfcount_int(void)
 {
 	if (gic_present)
-		return gic_get_c0_compare_int();
+		return gic_get_c0_perfcount_int();
 	if (cp0_perfcount_irq >= 0)
 		return MIPS_CPU_IRQ_BASE + cp0_perfcount_irq;
 	return -1;
-- 
2.1.4
