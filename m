Received: from mailapp01.imgtec.com ([195.59.15.196]:10441 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011779AbbARWltb8XQi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 18 Jan 2015 23:41:49 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 27/36] MIPS: allow mach-provided serial.h
Date: Sun, 18 Jan 2015 14:41:35 -0800
Message-ID: <1421620895-25211-1-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com>
References: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <20150118224135.Y7-s2EzqiZLWpys7SyixCNkRbVPMBIOfgRzdJTfYHes@z>

Allow platforms to set BAUD_BASE, which is used by earlycon to calculate
the baud clock.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
---
 arch/mips/include/asm/Kbuild                |  1 -
 arch/mips/include/asm/mach-generic/serial.h | 25 +++++++++++++++++++++++++
 arch/mips/include/asm/serial.h              | 25 +++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/include/asm/mach-generic/serial.h
 create mode 100644 arch/mips/include/asm/serial.h

diff --git a/arch/mips/include/asm/Kbuild b/arch/mips/include/asm/Kbuild
index 200efea..3cd9114 100644
--- a/arch/mips/include/asm/Kbuild
+++ b/arch/mips/include/asm/Kbuild
@@ -13,7 +13,6 @@ generic-y += preempt.h
 generic-y += scatterlist.h
 generic-y += sections.h
 generic-y += segment.h
-generic-y += serial.h
 generic-y += trace_clock.h
 generic-y += ucontext.h
 generic-y += user.h
diff --git a/arch/mips/include/asm/mach-generic/serial.h b/arch/mips/include/asm/mach-generic/serial.h
new file mode 100644
index 0000000..ed82ec8
--- /dev/null
+++ b/arch/mips/include/asm/mach-generic/serial.h
@@ -0,0 +1,25 @@
+/*
+ * Copyright (c) 2015 Imagination Technologies
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+ * MA 02111-1307 USA
+ */
+
+#ifndef __MACH_GENERIC_SERIAL_H__
+#define __MACH_GENERIC_SERIAL_H__
+
+#include <asm-generic/serial.h>
+
+#endif /* __MACH_GENERIC_SERIAL_H__ */
diff --git a/arch/mips/include/asm/serial.h b/arch/mips/include/asm/serial.h
new file mode 100644
index 0000000..5b83f9b
--- /dev/null
+++ b/arch/mips/include/asm/serial.h
@@ -0,0 +1,25 @@
+/*
+ * Copyright (c) 2015 Imagination Technologies
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+ * MA 02111-1307 USA
+ */
+
+#ifndef __ASM_SERIAL_H__
+#define __ASM_SERIAL_H__
+
+#include_next <serial.h>
+
+#endif /* __ASM_SERIAL_H__ */
-- 
2.2.1
