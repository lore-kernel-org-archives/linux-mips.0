Received: from mailapp01.imgtec.com ([195.59.15.196]:46125 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992232AbcIEOoAR7Zvd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 5 Sep 2016 16:44:00 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] MIPS: paravirt: Fix undefined reference to smp_bootstrap
Date: Mon, 5 Sep 2016 15:43:40 +0100
Message-ID: <1473086620-21007-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: Matt Redfearn <matt.redfearn@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20160905144340.JRMF7328-wPSAX2htwjgmqj4ptw0iSdHZKF6Eg1rM7I@z>

If the paravirt machine is compiles without CONFIG_SMP, the following
linker error occurs

arch/mips/kernel/head.o: In function `kernel_entry':
(.ref.text+0x10): undefined reference to `smp_bootstrap'

due to the kernel entry macro always including SMP startup code.
Wrap this code in CONFIG_SMP to fix the error.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>

---

 arch/mips/include/asm/mach-paravirt/kernel-entry-init.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/mach-paravirt/kernel-entry-init.h b/arch/mips/include/asm/mach-paravirt/kernel-entry-init.h
index 2f82bfa3a773..c9f5769dfc8f 100644
--- a/arch/mips/include/asm/mach-paravirt/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-paravirt/kernel-entry-init.h
@@ -11,11 +11,13 @@
 #define CP0_EBASE $15, 1
 
 	.macro  kernel_entry_setup
+#ifdef CONFIG_SMP
 	mfc0	t0, CP0_EBASE
 	andi	t0, t0, 0x3ff		# CPUNum
 	beqz	t0, 1f
 	# CPUs other than zero goto smp_bootstrap
 	j	smp_bootstrap
+#endif /* CONFIG_SMP */
 
 1:
 	.endm
-- 
2.7.4
