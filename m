Received: from multi.imgtec.com ([194.200.65.239]:44847 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6870569AbaA0U2D3I0-A (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 21:28:03 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 57/58] MIPS: malta: Add support for SMP EVA
Date: Mon, 27 Jan 2014 20:19:44 +0000
Message-ID: <1390853985-14246-58-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
References: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140127201944.B8WRQaSiUudBrs9ZtUJfclfA0i2ddcCC6SoA_hkYYts@z>

Allow secondary cores to program their segment control registers
during smp bootstrap code. This enables EVA on Malta SMP
configurations

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/mach-malta/kernel-entry-init.h | 6 ++++++
 arch/mips/kernel/head.S                              | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mach-malta/kernel-entry-init.h b/arch/mips/include/asm/mach-malta/kernel-entry-init.h
index 9bace9c..7c5e17a 100644
--- a/arch/mips/include/asm/mach-malta/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-malta/kernel-entry-init.h
@@ -154,6 +154,12 @@ nonsc_processor:
  * Do SMP slave processor setup necessary before we can safely execute C code.
  */
 	.macro	smp_slave_setup
+#ifdef CONFIG_EVA
+	sync
+	ehb
+	mfc0    t1, CP0_CONFIG
+	eva_entry
+#endif
 	.endm
 
 #endif /* __ASM_MACH_MIPS_KERNEL_ENTRY_INIT_H */
diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index 7b6a5b3..e712dcf 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -175,8 +175,8 @@ NESTED(smp_bootstrap, 16, sp)
 	DMT	10	# dmt t2 /* t0, t1 are used by CLI and setup_c0_status() */
 	jal	mips_ihb
 #endif /* CONFIG_MIPS_MT_SMTC */
-	setup_c0_status_sec
 	smp_slave_setup
+	setup_c0_status_sec
 #ifdef CONFIG_MIPS_MT_SMTC
 	andi	t2, t2, VPECONTROL_TE
 	beqz	t2, 2f
-- 
1.8.5.3
