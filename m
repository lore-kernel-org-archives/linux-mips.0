Received: from mail-dm3nam03on0082.outbound.protection.outlook.com ([104.47.41.82]:54240
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992111AbcLIIgcmzSA2 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 9 Dec 2016 09:36:32 +0100
Subject: [PATCH] MIPS: Relocatable: Provide plat_post_relocation hook
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <8b0da9cb-62a4-f3f6-d1bf-761c4a7bfa15@cavium.com>
Date: Fri, 9 Dec 2016 02:36:22 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@cavium.com>
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
Cc: ralf@linux-mips.org
Message-ID: <20161209083622.547n6Jzf54uCepyBO_aYDpayIb82LFAc3BI3jXFwzdQ@z>

This hook provides the platform the chance to perform any required
setup before the boot processor switches to the relocated kernel.
The relocated kernel has been copied and fixed up ready for execution
at this point. Secondary CPUs may wish to switch to it early. There
is also the opportunity for the platform to abort jumping to the
relocated kernel if there is anything wrong with the chosen offset.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Signed-off-by: Steven J. Hill <Steven.Hill@cavium.com>
---
 arch/mips/kernel/relocate.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index 1958910..c822885 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -31,6 +31,17 @@
 extern long __start___ex_table;	/* Start exception table */
 extern long __stop___ex_table;	/* End exception table */

+/*
+ * This function may be defined for a platform to perform any post-relocation
+ * fixup necessary.
+ * Return non-zero to abort relocation
+ */
+int __weak plat_post_relocation(long offset)
+{
+	return 0;
+}
+
+
 static inline u32 __init get_synci_step(void)
 {
 	u32 res;
@@ -338,6 +349,15 @@ void *__init relocate_kernel(void)
 		 */
 		memcpy(RELOCATED(&__bss_start), &__bss_start, bss_length);

+		/*
+		 * Last chance for the platform to abort relocation.
+		 * This may also be used by the platform to perform any
+		 * initialisation required now that the new kernel is
+		 * resident in memory and ready to be executed.
+		 */
+		if (plat_post_relocation(offset))
+			goto out;
+
 		/* The current thread is now within the relocated image */
 		__current_thread_info = RELOCATED(&init_thread_union);

-- 
1.9.1
