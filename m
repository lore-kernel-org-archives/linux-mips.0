Received: from mail-pa0-f48.google.com ([209.85.220.48]:35114 "EHLO
        mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27008955AbbFRXG7tgoQD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 19 Jun 2015 01:06:59 +0200
Received: by pacyx8 with SMTP id yx8so70897337pac.2
        for <linux-mips@linux-mips.org>; Thu, 18 Jun 2015 16:06:53 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] irqchip: bcm7120-l2: use of_io_request_and_map() to claim iomem
Date: Thu, 18 Jun 2015 16:05:25 -0700
Message-ID: <1434668725-24058-1-git-send-email-computersforpeace@gmail.com>
Return-Path: <computersforpeace@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Cc: bcm-kernel-feedback-list@broadcom.com, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20150618230525.i-QGhwpGzL-ao7H2Xb39lfqigJa6PSdTsjij-OxrfGg@z>

This way, the IO resources will show up in /proc/iomem, and we can make
sure no other drivers are trying to claim these register regions.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/irqchip/irq-bcm7120-l2.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-bcm7120-l2.c b/drivers/irqchip/irq-bcm7120-l2.c
index 3ba5cc780fcb..299d4de2deb5 100644
--- a/drivers/irqchip/irq-bcm7120-l2.c
+++ b/drivers/irqchip/irq-bcm7120-l2.c
@@ -142,10 +142,10 @@ static int __init bcm7120_l2_intc_iomap_7120(struct device_node *dn,
 {
 	int ret;
 
-	data->map_base[0] = of_iomap(dn, 0);
-	if (!data->map_base[0]) {
+	data->map_base[0] = of_io_request_and_map(dn, 0, dn->full_name);
+	if (IS_ERR(data->map_base[0])) {
 		pr_err("unable to map registers\n");
-		return -ENOMEM;
+		return PTR_ERR(data->map_base[0]);
 	}
 
 	data->pair_base[0] = data->map_base[0];
@@ -178,16 +178,17 @@ static int __init bcm7120_l2_intc_iomap_3380(struct device_node *dn,
 
 	for (gc_idx = 0; gc_idx < MAX_WORDS; gc_idx++) {
 		unsigned int map_idx = gc_idx * 2;
-		void __iomem *en = of_iomap(dn, map_idx + 0);
-		void __iomem *stat = of_iomap(dn, map_idx + 1);
-		void __iomem *base = min(en, stat);
+		void __iomem *en, *stat, *base;
+
+		en = of_io_request_and_map(dn, map_idx + 0, "irq-en");
+		stat = of_io_request_and_map(dn, map_idx + 1, "irq-stat");
+		if (IS_ERR(en) || IS_ERR(stat))
+			break;
 
+		base = min(en, stat);
 		data->map_base[map_idx + 0] = en;
 		data->map_base[map_idx + 1] = stat;
 
-		if (!base)
-			break;
-
 		data->pair_base[gc_idx] = base;
 		data->en_offset[gc_idx] = en - base;
 		data->stat_offset[gc_idx] = stat - base;
-- 
1.9.1
