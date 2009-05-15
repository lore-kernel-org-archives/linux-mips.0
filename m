Received: from mail-px0-f119.google.com ([209.85.216.119]:43899 "EHLO
	mail-px0-f119.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S20023409AbZEOW3C (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 15 May 2009 23:29:02 +0100
Subject: [PATCH 26/30] loongson: flush irq write operation
From: Wu Zhangjin <wuzhangjin@gmail.com>
Reply-To: wuzhangjin@gmail.com
Content-Type: text/plain
Date: Sat, 16 May 2009 06:28:47 +0800
Message-ID: <1242426527.10164.174.camel@falcon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <wuzhangjin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Arnaud Patard <apatard@mandriva.com>, loongson-dev@googlegroups.com, zhangfx@lemote.com, yanh@lemote.com, Philippe Vachon <philippe@cowpig.ca>, Zhang Le <r0bertz@gentoo.org>, Erwan Lerale <erwan@thiscow.com>
Message-ID: <20090515222847.fnpQcd5jRUc4mWYPlXrQgl1hAOu9G87dDNzHtoOszdA@z>

From d0431e4d83ec7f852d631f80aaca4b66586b4db2 Mon Sep 17 00:00:00 2001
From: Wu Zhangjin <wuzhangjin@gmail.com>
Date: Sat, 16 May 2009 04:54:27 +0800
Subject: [PATCH 26/30] loongson: flush irq write operation

read back after write, otherwise, there will be many spurious irqs from
it
---
 arch/mips/kernel/i8259.c               |    5 +++++
 arch/mips/loongson/common/bonito-irq.c |    4 ++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/mips/kernel/i8259.c b/arch/mips/kernel/i8259.c
index 413bd1d..f7c3a2b 100644
--- a/arch/mips/kernel/i8259.c
+++ b/arch/mips/kernel/i8259.c
@@ -175,12 +175,17 @@ handle_real_irq:
 	if (irq & 8) {
 		inb(PIC_SLAVE_IMR);	/* DUMMY - (do we need this?) */
 		outb(cached_slave_mask, PIC_SLAVE_IMR);
+		inb(PIC_SLAVE_IMR);
 		outb(0x60+(irq&7), PIC_SLAVE_CMD);/* 'Specific EOI' to slave */
+		inb(PIC_SLAVE_CMD);
 		outb(0x60+PIC_CASCADE_IR, PIC_MASTER_CMD); /* 'Specific EOI' to
master-IRQ2 */
+		inb(PIC_MASTER_CMD);
 	} else {
 		inb(PIC_MASTER_IMR);	/* DUMMY - (do we need this?) */
 		outb(cached_master_mask, PIC_MASTER_IMR);
+		inb(PIC_SLAVE_IMR);
 		outb(0x60+irq, PIC_MASTER_CMD);	/* 'Specific EOI to master */
+		inb(PIC_MASTER_CMD);
 	}
 	smtc_im_ack_irq(irq);
 	spin_unlock_irqrestore(&i8259A_lock, flags);
diff --git a/arch/mips/loongson/common/bonito-irq.c
b/arch/mips/loongson/common/bonito-irq.c
index d5a5ae8..cfbeaf5 100644
--- a/arch/mips/loongson/common/bonito-irq.c
+++ b/arch/mips/loongson/common/bonito-irq.c
@@ -36,12 +36,16 @@
 static inline void bonito_irq_enable(unsigned int irq)
 {
 	LOONGSON_INTENSET = (1 << (irq - LOONGSON_IRQ_BASE));
+	/* flush the write operation via a following read operation */
+	(void)LOONGSON_INTENSET;
 	mmiowb();
 }
 
 static inline void bonito_irq_disable(unsigned int irq)
 {
 	LOONGSON_INTENCLR = (1 << (irq - LOONGSON_IRQ_BASE));
+	/* flush the write operation via a following read operation */
+	(void)LOONGSON_INTENCLR;
 	mmiowb();
 }
 
-- 
1.6.2.1
