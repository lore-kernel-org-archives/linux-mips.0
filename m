Received: from wf-out-1314.google.com ([209.85.200.170]:24776 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by ftp.linux-mips.org
	with ESMTP id S20023334AbZEOWGy (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 15 May 2009 23:06:54 +0100
Subject: [PATCH 10/30] loongson: add loongson-specific
 cpu-feature-overrides.h
From: Wu Zhangjin <wuzhangjin@gmail.com>
Reply-To: wuzhangjin@gmail.com
Content-Type: text/plain
Date: Sat, 16 May 2009 06:06:46 +0800
Message-ID: <1242425206.10164.151.camel@falcon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <wuzhangjin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Arnaud Patard <apatard@mandriva.com>, loongson-dev@googlegroups.com, zhangfx@lemote.com, yanh@lemote.com, Philippe Vachon <philippe@cowpig.ca>, Zhang Le <r0bertz@gentoo.org>, Erwan Lerale <erwan@thiscow.com>
Message-ID: <20090515220646.W7zF7i5n_wp7ipx2Inq2XfL3FRQNoicTWSbnXvuVIAQ@z>

From b2176298282082f661f3dcea3659ddf780c0ec5f Mon Sep 17 00:00:00 2001
From: Wu Zhangjin <wuzhangjin@gmail.com>
Date: Sat, 16 May 2009 01:17:12 +0800
Subject: [PATCH 10/30] loongson: add loongson-specific
cpu-feature-overrides.h

---
 .../asm/mach-loongson/cpu-feature-overrides.h      |   58
++++++++++++++++++++
 1 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644
arch/mips/include/asm/mach-loongson/cpu-feature-overrides.h

diff --git a/arch/mips/include/asm/mach-loongson/cpu-feature-overrides.h
b/arch/mips/include/asm/mach-loongson/cpu-feature-overrides.h
new file mode 100644
index 0000000..daa2ee9
--- /dev/null
+++ b/arch/mips/include/asm/mach-loongson/cpu-feature-overrides.h
@@ -0,0 +1,58 @@
+/*
+ * This file is subject to the terms and conditions of the GNU General
Public
+ * License.  See the file "COPYING" in the main directory of this
archive
+ * for more details.
+ *
+ * Copyright (C) 2009 Wu Zhangjin <wuzj@lemote.com>
+ * Copyright (C) 2009 Philippe Vachon <philippe@cowpig.ca>
+ * Copyright (C) 2009 Zhang Le <r0bertz@gentoo.org>
+ *
+ * reference: /proc/cpuinfo,
+ * 	arch/mips/kernel/cpu-probe.c(cpu_probe_legacy),
+ * 	arch/mips/kernel/proc.c(show_cpuinfo),
+ *      loongson2f user manual.
+ */
+
+#ifndef __ASM_LOONGSON_CPU_FEATURE_OVERRIDES_H
+#define __ASM_LOONGSON_CPU_FEATURE_OVERRIDES_H
+
+#define cpu_dcache_line_size()	32
+#define cpu_icache_line_size()	32
+#define cpu_scache_line_size()	32
+
+#define cpu_has_32fpr		1
+#define cpu_has_3k_cache	0
+#define cpu_has_4k_cache	1
+#define cpu_has_4kex		1
+#define cpu_has_64bits		1
+#define cpu_has_cache_cdex_p	0
+#define cpu_has_cache_cdex_s	0
+#define cpu_has_counter		1
+#define cpu_has_dc_aliases	1
+#define cpu_has_divec		0
+#define cpu_has_dsp		0
+#define cpu_has_ejtag		0
+#define cpu_has_fpu		1
+#define cpu_has_ic_fills_f_dc	0
+#define cpu_has_inclusive_pcaches	1
+#define cpu_has_llsc 		1
+#define cpu_has_mcheck		0
+#define cpu_has_mdmx		0
+#define cpu_has_mips16		0
+#define cpu_has_mips32r1	0
+#define cpu_has_mips32r2	0
+#define cpu_has_mips3d		0
+#define cpu_has_mips64r1	0
+#define cpu_has_mips64r2	0
+#define cpu_has_mipsmt		0
+#define cpu_has_prefetch	0
+#define cpu_has_smartmips	0
+#define cpu_has_tlb		1
+#define cpu_has_tx39_cache	0
+#define cpu_has_userlocal	0
+#define cpu_has_vce		0
+#define cpu_has_vtag_icache	0
+#define cpu_has_watch		1
+#define cpu_icache_snoops_remote_store	1
+
+#endif				/* __ASM_LOONGSON_CPU_FEATURE_OVERRIDES_H */
-- 
1.6.2.1
