Received: from mailapp02.imgtec.com ([217.156.133.132]:33437 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23991948AbcI3Jd74jxZe (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 30 Sep 2016 11:33:59 +0200
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH 1/2] MIPS: tracing: move insn_has_delay_slot to a shared header
Date: Fri, 30 Sep 2016 11:33:45 +0200
Message-ID: <1475228026-25831-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
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
Cc: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <20160930093345.TBrA3RFrCAc9O82UIS7nm-5DwaRpxalEWPO8vgS9Vw4@z>

Currently both kprobes and uprobes code have definitions of the
insn_has_delay_slot method. Move it to a separate header as an inline
method that each probe-specific method can later use.
No functional change intended, although the methods slightly varied in
the constraints they set for the methods - the uprobes one was chosen as
it is slightly more specific when filtering opcode fields.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 arch/mips/kernel/kprobes.c       | 61 ++----------------------------
 arch/mips/kernel/probes-common.h | 81 ++++++++++++++++++++++++++++++++++++++++
 arch/mips/kernel/uprobes.c       | 65 ++------------------------------
 3 files changed, 87 insertions(+), 120 deletions(-)
 create mode 100644 arch/mips/kernel/probes-common.h

diff --git a/arch/mips/kernel/kprobes.c b/arch/mips/kernel/kprobes.c
index 212f46f..747e3bf 100644
--- a/arch/mips/kernel/kprobes.c
+++ b/arch/mips/kernel/kprobes.c
@@ -32,7 +32,8 @@
 #include <asm/ptrace.h>
 #include <asm/branch.h>
 #include <asm/break.h>
-#include <asm/inst.h>
+
+#include "probes-common.h"
 
 static const union mips_instruction breakpoint_insn = {
 	.b_format = {
@@ -55,63 +56,7 @@ DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
 
 static int __kprobes insn_has_delayslot(union mips_instruction insn)
 {
-	switch (insn.i_format.opcode) {
-
-		/*
-		 * This group contains:
-		 * jr and jalr are in r_format format.
-		 */
-	case spec_op:
-		switch (insn.r_format.func) {
-		case jr_op:
-		case jalr_op:
-			break;
-		default:
-			goto insn_ok;
-		}
-
-		/*
-		 * This group contains:
-		 * bltz_op, bgez_op, bltzl_op, bgezl_op,
-		 * bltzal_op, bgezal_op, bltzall_op, bgezall_op.
-		 */
-	case bcond_op:
-
-		/*
-		 * These are unconditional and in j_format.
-		 */
-	case jal_op:
-	case j_op:
-
-		/*
-		 * These are conditional and in i_format.
-		 */
-	case beq_op:
-	case beql_op:
-	case bne_op:
-	case bnel_op:
-	case blez_op:
-	case blezl_op:
-	case bgtz_op:
-	case bgtzl_op:
-
-		/*
-		 * These are the FPA/cp1 branch instructions.
-		 */
-	case cop1_op:
-
-#ifdef CONFIG_CPU_CAVIUM_OCTEON
-	case lwc2_op: /* This is bbit0 on Octeon */
-	case ldc2_op: /* This is bbit032 on Octeon */
-	case swc2_op: /* This is bbit1 on Octeon */
-	case sdc2_op: /* This is bbit132 on Octeon */
-#endif
-		return 1;
-	default:
-		break;
-	}
-insn_ok:
-	return 0;
+	return __insn_has_delay_slot(insn);
 }
 
 /*
diff --git a/arch/mips/kernel/probes-common.h b/arch/mips/kernel/probes-common.h
new file mode 100644
index 0000000..c979c37
--- /dev/null
+++ b/arch/mips/kernel/probes-common.h
@@ -0,0 +1,81 @@
+/*
+ * Copyright (C) 2016 Imagination Technologies
+ * Author: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or (at your
+ * option) any later version.
+ */
+
+#ifndef __PROBES_COMMON_H
+#define __PROBES_COMMON_H
+
+#include <asm/inst.h>
+
+static inline int __insn_has_delay_slot(const union mips_instruction insn)
+{
+	switch (insn.i_format.opcode) {
+	/*
+	 * jr and jalr are in r_format format.
+	 */
+	case spec_op:
+		switch (insn.r_format.func) {
+		case jalr_op:
+		case jr_op:
+			return 1;
+		}
+		break;
+
+	/*
+	 * This group contains:
+	 * bltz_op, bgez_op, bltzl_op, bgezl_op,
+	 * bltzal_op, bgezal_op, bltzall_op, bgezall_op.
+	 */
+	case bcond_op:
+		switch (insn.i_format.rt) {
+		case bltz_op:
+		case bltzl_op:
+		case bgez_op:
+		case bgezl_op:
+		case bltzal_op:
+		case bltzall_op:
+		case bgezal_op:
+		case bgezall_op:
+		case bposge32_op:
+			return 1;
+		}
+		break;
+
+	/*
+	 * These are unconditional and in j_format.
+	 */
+	case jal_op:
+	case j_op:
+	case beq_op:
+	case beql_op:
+	case bne_op:
+	case bnel_op:
+	case blez_op: /* not really i_format */
+	case blezl_op:
+	case bgtz_op:
+	case bgtzl_op:
+		return 1;
+
+	/*
+	 * And now the FPA/cp1 branch instructions.
+	 */
+	case cop1_op:
+#ifdef CONFIG_CPU_CAVIUM_OCTEON
+	case lwc2_op: /* This is bbit0 on Octeon */
+	case ldc2_op: /* This is bbit032 on Octeon */
+	case swc2_op: /* This is bbit1 on Octeon */
+	case sdc2_op: /* This is bbit132 on Octeon */
+#endif
+		return 1;
+	}
+
+	return 0;
+}
+
+#endif  /* __PROBES_COMMON_H */
diff --git a/arch/mips/kernel/uprobes.c b/arch/mips/kernel/uprobes.c
index 4c7c155..a30ca7b 100644
--- a/arch/mips/kernel/uprobes.c
+++ b/arch/mips/kernel/uprobes.c
@@ -8,71 +8,12 @@
 #include <asm/branch.h>
 #include <asm/cpu-features.h>
 #include <asm/ptrace.h>
-#include <asm/inst.h>
+
+#include "probes-common.h"
 
 static inline int insn_has_delay_slot(const union mips_instruction insn)
 {
-	switch (insn.i_format.opcode) {
-	/*
-	 * jr and jalr are in r_format format.
-	 */
-	case spec_op:
-		switch (insn.r_format.func) {
-		case jalr_op:
-		case jr_op:
-			return 1;
-		}
-		break;
-
-	/*
-	 * This group contains:
-	 * bltz_op, bgez_op, bltzl_op, bgezl_op,
-	 * bltzal_op, bgezal_op, bltzall_op, bgezall_op.
-	 */
-	case bcond_op:
-		switch (insn.i_format.rt) {
-		case bltz_op:
-		case bltzl_op:
-		case bgez_op:
-		case bgezl_op:
-		case bltzal_op:
-		case bltzall_op:
-		case bgezal_op:
-		case bgezall_op:
-		case bposge32_op:
-			return 1;
-		}
-		break;
-
-	/*
-	 * These are unconditional and in j_format.
-	 */
-	case jal_op:
-	case j_op:
-	case beq_op:
-	case beql_op:
-	case bne_op:
-	case bnel_op:
-	case blez_op: /* not really i_format */
-	case blezl_op:
-	case bgtz_op:
-	case bgtzl_op:
-		return 1;
-
-	/*
-	 * And now the FPA/cp1 branch instructions.
-	 */
-	case cop1_op:
-#ifdef CONFIG_CPU_CAVIUM_OCTEON
-	case lwc2_op: /* This is bbit0 on Octeon */
-	case ldc2_op: /* This is bbit032 on Octeon */
-	case swc2_op: /* This is bbit1 on Octeon */
-	case sdc2_op: /* This is bbit132 on Octeon */
-#endif
-		return 1;
-	}
-
-	return 0;
+	return __insn_has_delay_slot(insn);
 }
 
 /**
-- 
2.7.4
