Received: from mailapp01.imgtec.com ([195.59.15.196]:21457 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009491AbbJEJxAZ-Zn5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 5 Oct 2015 11:53:00 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 04BA5448ACCED
        for <linux-mips@linux-mips.org>; Mon,  5 Oct 2015 10:52:53 +0100 (IST)
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [RFC PATCH 6/7] MIPS: Call relocate_kernel if CONFIG_RELOCATABLE=y
Date: Mon, 5 Oct 2015 10:52:30 +0100
Message-ID: <1444038751-25105-7-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1444038751-25105-1-git-send-email-matt.redfearn@imgtec.com>
References: <1444038751-25105-1-git-send-email-matt.redfearn@imgtec.com>
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
Message-ID: <20151005095230.jFG_yfM9YFmf70KKWaEkaY7PoHb3ApAv5TFKcOO_wkk@z>

If CONFIG_RELOCATABLE is enabled, jump to relocate_kernel.
This function will return the entry point of the
relocated kernel if copy/relocate is sucessful or the
original entry point if not.
The stack pointer must then be pointed into the new image.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---
 arch/mips/kernel/head.S | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index 4e4cc5b9a771..109d6a0aeab0 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -132,7 +132,25 @@ not_found:
 	set_saved_sp	sp, t0, t1
 	PTR_SUBU	sp, 4 * SZREG		# init stack pointer
 
+#ifdef CONFIG_RELOCATABLE
+	/* Copy kernel and apply the relocations */
+	jal		relocate_kernel
+
+	/* Repoint the sp into the new kernel image */
+	PTR_LI		sp, _THREAD_SIZE - 32 - PT_SIZE
+	PTR_ADDU	sp, $28
+	back_to_back_c0_hazard
+	set_saved_sp	sp, t0, t1
+	PTR_SUBU	sp, 4 * SZREG		# init stack pointer
+
+	/* relocate_kernel returns the entry point either
+	 * in the relocated kernel or the original if for
+	 * some reason relocation failed - jump there now
+	 */
+	jr		v0
+#else
 	j		start_kernel
+#endif
 	END(kernel_entry)
 
 #ifdef CONFIG_SMP
-- 
2.1.4
