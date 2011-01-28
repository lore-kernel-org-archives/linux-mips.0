Received: from ixqw-mail-out.ixiacom.com ([66.77.12.12]:20606 "EHLO
        ixqw-mail-out.ixiacom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491081Ab1A1FAF (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 28 Jan 2011 06:00:05 +0100
Message-ID: <4D424D4B.5090002@ixiacom.com>
Date: Thu, 27 Jan 2011 20:59:55 -0800
From: Earl Chew <echew@ixiacom.com>
MIME-Version: 1.0
Subject: Publishing mips_hpt_frequency in /proc/cpuinfo
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <EChew@ixiacom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20110128045955.H8zTYxcowuvsVlU0ViJYTXyLDsK_OOcFl878W34AP40@z>

The CPU frequency is known to the Linux kernel. For example:

> CPU revision is: 00019374 (MIPS 24Kc)
> Atheros AR7161 rev 2, CPU:680.000 MHz, AHB:170.000 MHz, DDR:340.000 MHz
> ...
> Calibrating delay loop... 452.19 BogoMIPS (lpj=2260992)

Unfortunately that information is not available from userspace:

> cpu model               : MIPS 24Kc V7.4
> BogoMIPS                : 452.19

This makes it difficult to use CPU timers (rdhwr) from user space
applications.


Is there any reason not to publish mips_hpt_frequency in /proc/cpuinfo ?


Earl


--- proc.c      2011-01-17 14:05:16.397444347 -0800
+++ /tmp/proc.c 2011-01-27 20:56:18.807454356 -0800
@@ -43,6 +43,9 @@
        seq_printf(m, "BogoMIPS\t\t: %u.%02u\n",
                      cpu_data[n].udelay_val / (500000/HZ),
                      (cpu_data[n].udelay_val / (5000/HZ)) % 100);
+       seq_printf(m, "timer frequency\t: %u.%03u\n",
+                     mips_hpt_frequency / 1000000,
+                     mips_hpt_frequency % 1000000 / 1000);
        seq_printf(m, "wait instruction\t: %s\n", cpu_wait ? "yes" : "no");
        seq_printf(m, "microsecond timers\t: %s\n",
                      cpu_has_counter ? "yes" : "no");
