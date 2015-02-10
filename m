Received: from mailapp01.imgtec.com ([195.59.15.196]:43901 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012555AbbBJKDYhMcAH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 10 Feb 2015 11:03:24 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 1/2] MIPS: Export FP functions used by lose_fpu(1) for KVM
Date: Tue, 10 Feb 2015 10:02:59 +0000
Message-ID: <1423562580-23254-2-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1423562580-23254-1-git-send-email-james.hogan@imgtec.com>
References: <1423562580-23254-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paolo Bonzini <pbonzini@redhat.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20150210100259.dh2qvXLtNKR1cSsySio0vTpqQplUPRdyxFaFIiAdZuw@z>

Export the _save_fp asm function used by the lose_fpu(1) macro to GPL
modules so that KVM can make use of it when it is built as a module.

This fixes the following build error when CONFIG_KVM=m due to commit
f798217dfd03 ("KVM: MIPS: Don't leak FPU/DSP to guest"):

ERROR: "_save_fp" [arch/mips/kvm/kvm.ko] undefined!

Fixes: f798217dfd03 (KVM: MIPS: Don't leak FPU/DSP to guest)
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: kvm@vger.kernel.org
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org> # 3.10+
---
 arch/mips/kernel/mips_ksyms.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/kernel/mips_ksyms.c b/arch/mips/kernel/mips_ksyms.c
index 17eaf0cf760c..167ce3fae398 100644
--- a/arch/mips/kernel/mips_ksyms.c
+++ b/arch/mips/kernel/mips_ksyms.c
@@ -14,6 +14,7 @@
 #include <linux/mm.h>
 #include <asm/uaccess.h>
 #include <asm/ftrace.h>
+#include <asm/fpu.h>
 
 extern void *__bzero(void *__s, size_t __count);
 extern long __strncpy_from_kernel_nocheck_asm(char *__to,
@@ -32,6 +33,11 @@ extern long __strnlen_user_nocheck_asm(const char *s);
 extern long __strnlen_user_asm(const char *s);
 
 /*
+ * Core architecture code
+ */
+EXPORT_SYMBOL_GPL(_save_fp);
+
+/*
  * String functions
  */
 EXPORT_SYMBOL(memset);
-- 
2.0.5
