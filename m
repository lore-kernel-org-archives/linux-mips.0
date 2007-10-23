Received: from atlrel9.hp.com ([156.153.255.214]:25052 "EHLO atlrel9.hp.com")
	by ftp.linux-mips.org with ESMTP id S20031722AbXJWU4M (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 23 Oct 2007 21:56:12 +0100
Message-ID: <20071023205515.406778977@ldl.fc.hp.com>
References: <20071023204843.442608289@ldl.fc.hp.com>
Date: Tue, 23 Oct 2007 14:48:44 -0600
From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: [patch 1/2] rtc: release correct region in error path
Content-Disposition: inline; filename=rtc-factor
Return-Path: <helgaas@ldl.fc.hp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Alessandro Zummo <a.zummo@towertech.it>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20071023204844.UP0POjaAMa8epSIwbUQcsoUtG3_Ls1oJF02CRL7cVG4@z>

The misc_register() error path always released an I/O port region,
even if the region was memory-mapped (only mips uses memory-mapped RTC,
as far as I can see).

Signed-off-by: Bjorn Helgaas <bjorn.helgaas@hp.com>

Index: w/drivers/char/rtc.c
===================================================================
--- w.orig/drivers/char/rtc.c	2007-10-23 09:59:33.000000000 -0600
+++ w/drivers/char/rtc.c	2007-10-23 14:41:23.000000000 -0600
@@ -918,6 +918,14 @@
 };
 #endif
 
+static void rtc_release_region(void)
+{
+	if (RTC_IOMAPPED)
+		release_region(RTC_PORT(0), RTC_IO_EXTENT);
+	else
+		release_mem_region(RTC_PORT(0), RTC_IO_EXTENT);
+}
+
 static int __init rtc_init(void)
 {
 #ifdef CONFIG_PROC_FS
@@ -992,10 +1000,7 @@
 		/* Yeah right, seeing as irq 8 doesn't even hit the bus. */
 		rtc_has_irq = 0;
 		printk(KERN_ERR "rtc: IRQ %d is not free.\n", RTC_IRQ);
-		if (RTC_IOMAPPED)
-			release_region(RTC_PORT(0), RTC_IO_EXTENT);
-		else
-			release_mem_region(RTC_PORT(0), RTC_IO_EXTENT);
+		rtc_release_region();
 		return -EIO;
 	}
 	hpet_rtc_timer_init();
@@ -1009,7 +1014,7 @@
 		free_irq(RTC_IRQ, NULL);
 		rtc_has_irq = 0;
 #endif
-		release_region(RTC_PORT(0), RTC_IO_EXTENT);
+		rtc_release_region();
 		return -ENODEV;
 	}
 
@@ -1091,10 +1096,7 @@
 	if (rtc_has_irq)
 		free_irq (rtc_irq, &rtc_port);
 #else
-	if (RTC_IOMAPPED)
-		release_region(RTC_PORT(0), RTC_IO_EXTENT);
-	else
-		release_mem_region(RTC_PORT(0), RTC_IO_EXTENT);
+	rtc_release_region();
 #ifdef RTC_IRQ
 	if (rtc_has_irq)
 		free_irq (RTC_IRQ, NULL);

--
