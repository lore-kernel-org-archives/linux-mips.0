Received: from rv-out-0708.google.com ([209.85.198.244]:23388 "EHLO
	rv-out-0708.google.com" rhost-flags-OK-OK-OK-OK) by ftp.linux-mips.org
	with ESMTP id S20023389AbZEOWN6 (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 15 May 2009 23:13:58 +0100
Subject: [PATCH 15/30] loongson: enable serial port support
From: Wu Zhangjin <wuzhangjin@gmail.com>
Reply-To: wuzhangjin@gmail.com
Content-Type: text/plain
Date: Sat, 16 May 2009 06:13:47 +0800
Message-ID: <1242425627.10164.156.camel@falcon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <wuzhangjin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Arnaud Patard <apatard@mandriva.com>, loongson-dev@googlegroups.com, zhangfx@lemote.com, yanh@lemote.com, Philippe Vachon <philippe@cowpig.ca>, Zhang Le <r0bertz@gentoo.org>, Erwan Lerale <erwan@thiscow.com>
Message-ID: <20090515221347.w4Ah0MxA08xtgOSllNKvBaXH4bmuPZ7Omsz0G9mJ9uM@z>

From bf9563658acaff1b9de721841383eba655ccfd4d Mon Sep 17 00:00:00 2001
From: Wu Zhangjin <wuzhangjin@gmail.com>
Date: Sat, 16 May 2009 03:34:11 +0800
Subject: [PATCH 15/30] loongson: enable serial port support

this serial port support is portable to loongson-based machines, the old
serial port support in fuloong(2e) via HAVE_STD_PC_SERIAL_PORT is
replaced by this implementation.

before, only fuloong(2e) used HAVE_STD_PC_SERIAL_PORT kernel option, so,
we can remove arch/mips/kernel/8250-platform.c directly.
---
 arch/mips/include/asm/mach-loongson/machine.h |    4 ++
 arch/mips/loongson/common/Makefile            |    5 ++
 arch/mips/loongson/common/serial.c            |   64
+++++++++++++++++++++++++
 3 files changed, 73 insertions(+), 0 deletions(-)
 create mode 100644 arch/mips/loongson/common/serial.c

diff --git a/arch/mips/include/asm/mach-loongson/machine.h
b/arch/mips/include/asm/mach-loongson/machine.h
index 577b86c..cb48d9b 100644
--- a/arch/mips/include/asm/mach-loongson/machine.h
+++ b/arch/mips/include/asm/mach-loongson/machine.h
@@ -18,6 +18,8 @@
 #define MACH_NAME			"lemote-fuloong(2e)"
 
 #define LOONGSON_UART_BASE		0x1fd003f8
+#define LOONGSON_UART_BAUD		1843200	
+#define LOONGSON_UART_IOTYPE		UPIO_PORT
 
 #define LOONGSON_NORTH_BRIDGE_IRQ	(MIPS_CPU_IRQ_BASE + 2)
 #define LOONGSON_UART_IRQ		(MIPS_CPU_IRQ_BASE + 4)
@@ -30,6 +32,8 @@
 #define MACH_NAME			"lemote-fuloong(2f)"
 
 #define LOONGSON_UART_BASE		0x1fd002f8
+#define LOONGSON_UART_BAUD		1843200
+#define LOONGSON_UART_IOTYPE		UPIO_PORT
 
 #define LOONGSON_TIMER_IRQ		(MIPS_CPU_IRQ_BASE + 7)	/* cpu timer */
 #define LOONGSON_PERFCNT_IRQ		(MIPS_CPU_IRQ_BASE + 6)	/* cpu perf
counter */
diff --git a/arch/mips/loongson/common/Makefile
b/arch/mips/loongson/common/Makefile
index 869adb5..91ba177 100644
--- a/arch/mips/loongson/common/Makefile
+++ b/arch/mips/loongson/common/Makefile
@@ -23,4 +23,9 @@ obj-$(CONFIG_RTC_DRV_CMOS) += rtc.o
 #
 obj-$(CONFIG_CS5536) += cs5536_vsm.o
 
+#
+# Enable serial port
+#
+obj-$(CONFIG_SERIAL_8250) += serial.o
+
 EXTRA_CFLAGS += -Werror
diff --git a/arch/mips/loongson/common/serial.c
b/arch/mips/loongson/common/serial.c
new file mode 100644
index 0000000..683184a
--- /dev/null
+++ b/arch/mips/loongson/common/serial.c
@@ -0,0 +1,64 @@
+/*
+ * This file is subject to the terms and conditions of the GNU General
Public
+ * License.  See the file "COPYING" in the main directory of this
archive
+ * for more details.
+ *
+ * Copyright (C) 2007 Ralf Baechle (ralf@linux-mips.org)
+ *
+ * Copyright (C) 2009 Lemote, Inc. & Institute of Computing Technology
+ * Author: yanhua (yanhua@lemote.com)
+ * Author: Wu Zhangjin (wuzj@lemote.com)
+ */
+
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/serial_8250.h>
+
+#include <machine.h>
+
+#define PORT(int, base_baud, io_type)				\
+{								\
+	.irq		= int,					\
+	.uartclk	= base_baud,				\
+	.iotype		= io_type,				\
+	.flags		= UPF_BOOT_AUTOCONF | UPF_SKIP_TEST,	\
+	.regshift	= 0,					\
+}
+
+static struct plat_serial8250_port uart8250_data[] = {
+	PORT(LOONGSON_UART_IRQ, LOONGSON_UART_BAUD, LOONGSON_UART_IOTYPE),
+	{},
+};
+
+static struct platform_device uart8250_device = {
+	.name = "serial8250",
+	.id = PLAT8250_DEV_PLATFORM,
+	.dev = {
+		.platform_data = uart8250_data,
+		},
+};
+
+static inline void uart8250_init(void)
+{
+#if (LOONGSON_UART_IOTYPE == UPIO_MEM)
+		uart8250_data[0].membase =
+		    ioremap_nocache(LOONGSON_UART_BASE, 8);
+#elif (LOONGSON_UART_IOTYPE == UPIO_PORT)
+		uart8250_data[0].iobase = LOONGSON_UART_BASE & 0x3ff;
+		uart8250_data[0].irq -= MIPS_CPU_IRQ_BASE;
+#else		
+#warning currently, no such iotype of uart used in loongson-based
machines
+
+#endif
+}
+
+static int __init serial_init(void)
+{
+	uart8250_init();
+
+	platform_device_register(&uart8250_device);
+
+	return 0;
+}
+
+device_initcall(serial_init);
-- 
1.6.2.1
