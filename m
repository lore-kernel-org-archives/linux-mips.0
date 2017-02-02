Received: from mailapp01.imgtec.com ([195.59.15.196]:17781 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993900AbdBBNWSgfEuS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 2 Feb 2017 14:22:18 +0100
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] MIPS: sync-r4k: Fix KERN_CONT fallout
Date: Thu, 2 Feb 2017 13:22:04 +0000
Message-ID: <1486041724-19524-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20170202132204.2Bhg5cBOalI24GWR_a8oMF1gedkHObxwfFMf8i2iD2M@z>

Since commit 4bcc595ccd80 ("printk: reinstate KERN_CONT for printing
continuation lines") the output of counter synchornisation has been
split across lines:
[ 0.665181] Synchronize counters for CPU 1:
[ 0.678578] done.

Fix this by using pr_cont, and replace printk with pr_info.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 arch/mips/kernel/sync-r4k.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/sync-r4k.c b/arch/mips/kernel/sync-r4k.c
index 4472a7f98577..1df1160b6a47 100644
--- a/arch/mips/kernel/sync-r4k.c
+++ b/arch/mips/kernel/sync-r4k.c
@@ -29,7 +29,7 @@ void synchronise_count_master(int cpu)
 	int i;
 	unsigned long flags;
 
-	printk(KERN_INFO "Synchronize counters for CPU %u: ", cpu);
+	pr_info("Synchronize counters for CPU %u: ", cpu);
 
 	local_irq_save(flags);
 
@@ -83,7 +83,7 @@ void synchronise_count_master(int cpu)
 	 * count registers were almost certainly out of sync
 	 * so no point in alarming people
 	 */
-	printk("done.\n");
+	pr_cont("done.\n");
 }
 
 void synchronise_count_slave(int cpu)
-- 
2.7.4
