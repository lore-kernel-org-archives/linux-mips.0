Received: from mailapp01.imgtec.com ([195.59.15.196]:16327 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008426AbbCIOzwXcPPB (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 9 Mar 2015 15:55:52 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH v2 4/4] MIPS: unaligned: Fix regular load/store instruction emulation for EVA
Date: Mon, 9 Mar 2015 14:54:52 +0000
Message-ID: <1425912892-23133-5-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1425912892-23133-1-git-send-email-markos.chandras@imgtec.com>
References: <1425912892-23133-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, stable@vger.kernel.org
Message-ID: <20150309145452.gXYNQlorl0Tjzd-PiFlZluMYDEYnzcIwb6j5vfA-Tus@z>

When emulating a regular lh/lw/lhu/sh/sw we need to use the appropriate
instruction if we are in EVA mode. This is necessary for userspace
applications which trigger alignment exceptions. In such case, the
userspace load/store instruction needs to be emulated with the correct
eva/non-eva instruction by the kernel emulator.

Fixes: c1771216ab48 ("MIPS: kernel: unaligned: Handle unaligned accesses for EVA")
Cc: <stable@vger.kernel.org> # v3.15+
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/unaligned.c | 52 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
index ab475903175f..7659da224fcd 100644
--- a/arch/mips/kernel/unaligned.c
+++ b/arch/mips/kernel/unaligned.c
@@ -1023,7 +1023,15 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 		if (!access_ok(VERIFY_READ, addr, 2))
 			goto sigbus;
 
-		LoadHW(addr, value, res);
+		if (config_enabled(CONFIG_EVA)) {
+			if (segment_eq(get_fs(), get_ds()))
+				LoadHW(addr, value, res);
+			else
+				LoadHWE(addr, value, res);
+		} else {
+			LoadHW(addr, value, res);
+		}
+
 		if (res)
 			goto fault;
 		compute_return_epc(regs);
@@ -1034,7 +1042,15 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 		if (!access_ok(VERIFY_READ, addr, 4))
 			goto sigbus;
 
-		LoadW(addr, value, res);
+		if (config_enabled(CONFIG_EVA)) {
+			if (segment_eq(get_fs(), get_ds()))
+				LoadW(addr, value, res);
+			else
+				LoadWE(addr, value, res);
+		} else {
+			LoadW(addr, value, res);
+		}
+
 		if (res)
 			goto fault;
 		compute_return_epc(regs);
@@ -1045,7 +1061,15 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 		if (!access_ok(VERIFY_READ, addr, 2))
 			goto sigbus;
 
-		LoadHWU(addr, value, res);
+		if (config_enabled(CONFIG_EVA)) {
+			if (segment_eq(get_fs(), get_ds()))
+				LoadHWU(addr, value, res);
+			else
+				LoadHWUE(addr, value, res);
+		} else {
+			LoadHWU(addr, value, res);
+		}
+
 		if (res)
 			goto fault;
 		compute_return_epc(regs);
@@ -1104,7 +1128,16 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 
 		compute_return_epc(regs);
 		value = regs->regs[insn.i_format.rt];
-		StoreHW(addr, value, res);
+
+		if (config_enabled(CONFIG_EVA)) {
+			if (segment_eq(get_fs(), get_ds()))
+				StoreHW(addr, value, res);
+			else
+				StoreHWE(addr, value, res);
+		} else {
+			StoreHW(addr, value, res);
+		}
+
 		if (res)
 			goto fault;
 		break;
@@ -1115,7 +1148,16 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 
 		compute_return_epc(regs);
 		value = regs->regs[insn.i_format.rt];
-		StoreW(addr, value, res);
+
+		if (config_enabled(CONFIG_EVA)) {
+			if (segment_eq(get_fs(), get_ds()))
+				StoreW(addr, value, res);
+			else
+				StoreWE(addr, value, res);
+		} else {
+			StoreW(addr, value, res);
+		}
+
 		if (res)
 			goto fault;
 		break;
-- 
2.3.1
