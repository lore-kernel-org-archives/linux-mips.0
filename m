Received: from mail-bn1lp0140.outbound.protection.outlook.com ([207.46.163.140]:18711
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6854789AbaE1WJhlWNa8 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 29 May 2014 00:09:37 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH v2 09/13] MIPS: Add functions for hypervisor call
Date: Wed, 28 May 2014 23:52:12 +0200
Message-ID: <1401313936-11867-10-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1401313936-11867-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1401313936-11867-1-git-send-email-andreas.herrmann@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140528215212.1zstzLdR1rcMtSrtX0RgHF3vql19oe9x-nemzfBm_Rg@z>

From: David Daney <david.daney@cavium.com>

Introduce kvm_hypercall[0-3].
Define three new hypercalls for MIPS: GET_CLOCK_FREQ, EXIT_VM, and
CONSOLE_OUTPUT.

[andreas.herrmann:
  * Properly define hypercalls and HC numbers for MIPS
    in kvm_para.h header files]

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 arch/mips/include/asm/kvm_para.h      |   91 +++++++++++++++++++++++++++++++++
 arch/mips/include/uapi/asm/kvm_para.h |    6 ++-
 include/uapi/linux/kvm_para.h         |    3 ++
 3 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/include/asm/kvm_para.h

diff --git a/arch/mips/include/asm/kvm_para.h b/arch/mips/include/asm/kvm_para.h
new file mode 100644
index 0000000..e559812
--- /dev/null
+++ b/arch/mips/include/asm/kvm_para.h
@@ -0,0 +1,91 @@
+#ifndef _ASM_MIPS_KVM_PARA_H
+#define _ASM_MIPS_KVM_PARA_H
+
+#include <uapi/asm/kvm_para.h>
+
+#define KVM_HYPERCALL ".word 0x42000028"
+
+/*
+ * Hypercalls for KVM.
+ *
+ * Hypercall number is passed in v0.
+ * Return value will be placed in v0.
+ * Up to 3 arguments are passed in a0, a1, and a2.
+ */
+static inline unsigned long kvm_hypercall0(unsigned long num)
+{
+	register unsigned long n asm("v0");
+	register unsigned long r asm("v0");
+
+	n = num;
+	__asm__ __volatile__(
+		KVM_HYPERCALL
+		: "=r" (r) : "r" (n) : "memory"
+		);
+
+	return r;
+}
+
+static inline unsigned long kvm_hypercall1(unsigned long num,
+					unsigned long arg0)
+{
+	register unsigned long n asm("v0");
+	register unsigned long r asm("v0");
+	register unsigned long a0 asm("a0");
+
+	n = num;
+	a0 = arg0;
+	__asm__ __volatile__(
+		KVM_HYPERCALL
+		: "=r" (r) : "r" (n), "r" (a0) : "memory"
+		);
+
+	return r;
+}
+
+static inline unsigned long kvm_hypercall2(unsigned long num,
+					unsigned long arg0, unsigned long arg1)
+{
+	register unsigned long n asm("v0");
+	register unsigned long r asm("v0");
+	register unsigned long a0 asm("a0");
+	register unsigned long a1 asm("a1");
+
+	n = num;
+	a0 = arg0;
+	a1 = arg1;
+	__asm__ __volatile__(
+		KVM_HYPERCALL
+		: "=r" (r) : "r" (n), "r" (a0), "r" (a1) : "memory"
+		);
+
+	return r;
+}
+
+static inline unsigned long kvm_hypercall3(unsigned long num,
+	unsigned long arg0, unsigned long arg1, unsigned long arg2)
+{
+	register unsigned long n asm("v0");
+	register unsigned long r asm("v0");
+	register unsigned long a0 asm("a0");
+	register unsigned long a1 asm("a1");
+	register unsigned long a2 asm("a2");
+
+	n = num;
+	a0 = arg0;
+	a1 = arg1;
+	a2 = arg2;
+	__asm__ __volatile__(
+		KVM_HYPERCALL
+		: "=r" (r) : "r" (n), "r" (a0), "r" (a1), "r" (a2) : "memory"
+		);
+
+	return r;
+}
+
+static inline unsigned int kvm_arch_para_features(void)
+{
+	return 0;
+}
+
+#endif /* _ASM_MIPS_KVM_PARA_H */
diff --git a/arch/mips/include/uapi/asm/kvm_para.h b/arch/mips/include/uapi/asm/kvm_para.h
index 14fab8f..7e16d7c 100644
--- a/arch/mips/include/uapi/asm/kvm_para.h
+++ b/arch/mips/include/uapi/asm/kvm_para.h
@@ -1 +1,5 @@
-#include <asm-generic/kvm_para.h>
+#ifndef _UAPI_ASM_MIPS_KVM_PARA_H
+#define _UAPI_ASM_MIPS_KVM_PARA_H
+
+
+#endif /* _UAPI_ASM_MIPS_KVM_PARA_H */
diff --git a/include/uapi/linux/kvm_para.h b/include/uapi/linux/kvm_para.h
index 2841f86..bf6cd7d 100644
--- a/include/uapi/linux/kvm_para.h
+++ b/include/uapi/linux/kvm_para.h
@@ -20,6 +20,9 @@
 #define KVM_HC_FEATURES			3
 #define KVM_HC_PPC_MAP_MAGIC_PAGE	4
 #define KVM_HC_KICK_CPU			5
+#define KVM_HC_MIPS_GET_CLOCK_FREQ	6
+#define KVM_HC_MIPS_EXIT_VM		7
+#define KVM_HC_MIPS_CONSOLE_OUTPUT	8
 
 /*
  * hypercalls use architecture specific
-- 
1.7.9.5
