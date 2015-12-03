Received: from mailapp01.imgtec.com ([195.59.15.196]:55650 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012817AbbLCKIcleDUZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 3 Dec 2015 11:08:32 +0100
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
        by Websense Email Security Gateway with ESMTPS id 1AB392B2B341
        for <linux-mips@linux-mips.org>; Thu,  3 Dec 2015 10:08:25 +0000 (GMT)
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 6/9] MIPS: Call relocate_kernel if CONFIG_RELOCATABLE=y
Date: Thu, 3 Dec 2015 10:08:14 +0000
Message-ID: <1449137297-30464-7-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1449137297-30464-1-git-send-email-matt.redfearn@imgtec.com>
References: <1449137297-30464-1-git-send-email-matt.redfearn@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <20151203100814.zjcA3oFgooYyA6nKSQL_RuKeHhn4d6VNoFKyBX1gOUY@z>

If CONFIG_RELOCATABLE is enabled, jump to relocate_kernel.

This function will return the entry point of the relocated kernel if
copy/relocate is sucessful or the original entry point if not. The stack
pointer must then be pointed into the new image.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---
 arch/mips/kernel/head.S | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index 4e4cc5b9a771..7dc043349d66 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -132,7 +132,27 @@ not_found:
 	set_saved_sp	sp, t0, t1
 	PTR_SUBU	sp, 4 * SZREG		# init stack pointer
 
+#ifdef CONFIG_RELOCATABLE
+	/* Copy kernel and apply the relocations */
+	jal		relocate_kernel
+
+	/* Repoint the sp into the new kernel image */
+	PTR_LI		sp, _THREAD_SIZE - 32 - PT_SIZE
+	PTR_ADDU	sp, $28
+	set_saved_sp	sp, t0, t1
+	PTR_SUBU	sp, 4 * SZREG		# init stack pointer
+
+	/*
+	 * relocate_kernel returns the entry point either
+	 * in the relocated kernel or the original if for
+	 * some reason relocation failed - jump there now
+	 * with instruction hazard barrier because of the
+	 * newly sync'd icache.
+	 */
+	jr.hb		v0
+#else
 	j		start_kernel
+#endif
 	END(kernel_entry)
 
 #ifdef CONFIG_SMP
-- 
2.1.4
