Received: from mailapp01.imgtec.com ([195.59.15.196]:29606 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993935AbdHMEqwZzgBd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 13 Aug 2017 06:46:52 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 31/38] irqchip: mips-gic: Remove linux/irqchip/mips-gic.h
Date: Sat, 12 Aug 2017 21:36:39 -0700
Message-ID: <20170813043646.25821-32-paul.burton@imgtec.com>
In-Reply-To: <20170813043646.25821-1-paul.burton@imgtec.com>
References: <20170813043646.25821-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170813043639.jJn1HrLz-fNJVU401E6fuKBirt7VcydD39AMFcd4vKM@z>

The linux/irqchip/mips-gic.h header is no longer used. Remove it.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org
---

 include/linux/irqchip/mips-gic.h | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 include/linux/irqchip/mips-gic.h

diff --git a/include/linux/irqchip/mips-gic.h b/include/linux/irqchip/mips-gic.h
deleted file mode 100644
index 6e6c9adea049..000000000000
--- a/include/linux/irqchip/mips-gic.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2000, 07 MIPS Technologies, Inc.
- */
-#ifndef __LINUX_IRQCHIP_MIPS_GIC_H
-#define __LINUX_IRQCHIP_MIPS_GIC_H
-
-#include <linux/clocksource.h>
-#include <linux/ioport.h>
-
-#endif /* __LINUX_IRQCHIP_MIPS_GIC_H */
-- 
2.14.0
