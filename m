Received: from mailapp01.imgtec.com ([195.59.15.196]:31495 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012663AbbCGScYlXVer (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 7 Mar 2015 19:32:24 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH v2 14/17] MIPS: csrc-sb1250: Extract hpt cycle acquisition from sb1250_hpt_read
Date: Sat, 7 Mar 2015 10:30:32 -0800
Message-ID: <1425753035-17087-15-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1425753035-17087-1-git-send-email-dengcheng.zhu@imgtec.com>
References: <1425753035-17087-1-git-send-email-dengcheng.zhu@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <DengCheng.Zhu@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: macro@linux-mips.org, Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Message-ID: <20150307183032.taIJm4iWVDevATUQvvpfm7MdNkGmnAOwBVWfKMT6iuc@z>

This is to prepare for the upcoming read_sched_clock implementation, which
will also need to get cycles from the high precision timer.

Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/kernel/csrc-sb1250.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/csrc-sb1250.c b/arch/mips/kernel/csrc-sb1250.c
index 6ecb77d..662ae7c 100644
--- a/arch/mips/kernel/csrc-sb1250.c
+++ b/arch/mips/kernel/csrc-sb1250.c
@@ -33,15 +33,22 @@
  * The HPT is free running from SB1250_HPT_VALUE down to 0 then starts over
  * again.
  */
-static cycle_t sb1250_hpt_read(struct clocksource *cs)
+static inline cycle_t sb1250_hpt_get_cycles(void)
 {
 	unsigned int count;
+	void __iomem *addr;
 
-	count = G_SCD_TIMER_CNT(__raw_readq(IOADDR(A_SCD_TIMER_REGISTER(SB1250_HPT_NUM, R_SCD_TIMER_CNT))));
+	addr = IOADDR(A_SCD_TIMER_REGISTER(SB1250_HPT_NUM, R_SCD_TIMER_CNT));
+	count = G_SCD_TIMER_CNT(__raw_readq(addr));
 
 	return SB1250_HPT_VALUE - count;
 }
 
+static cycle_t sb1250_hpt_read(struct clocksource *cs)
+{
+	return sb1250_hpt_get_cycles();
+}
+
 struct clocksource bcm1250_clocksource = {
 	.name	= "bcm1250-counter-3",
 	.rating = 200,
-- 
2.3.2
