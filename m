Received: from mailapp02.imgtec.com ([217.156.133.132]:23186 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23990451AbcJLGZft8Xfk (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 12 Oct 2016 08:25:35 +0200
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH] MIPS: Wire up new pkey_{mprotect,alloc,free} syscalls
Date: Wed, 12 Oct 2016 08:25:24 +0200
Message-ID: <1476253524-4571-1-git-send-email-marcin.nowakowski@imgtec.com>
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
Message-ID: <20161012062524.QzyZsB7mBLwB7-C8O5Y5yCNlMqpUaxktq96wKipJCqg@z>

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 arch/mips/include/uapi/asm/unistd.h | 22 ++++++++++++++++------
 arch/mips/kernel/scall32-o32.S      |  3 +++
 arch/mips/kernel/scall64-64.S       |  3 +++
 arch/mips/kernel/scall64-n32.S      |  3 +++
 arch/mips/kernel/scall64-o32.S      |  3 +++
 5 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/uapi/asm/unistd.h b/arch/mips/include/uapi/asm/unistd.h
index 24ad815..3e940db 100644
--- a/arch/mips/include/uapi/asm/unistd.h
+++ b/arch/mips/include/uapi/asm/unistd.h
@@ -383,16 +383,20 @@
 #define __NR_copy_file_range		(__NR_Linux + 360)
 #define __NR_preadv2			(__NR_Linux + 361)
 #define __NR_pwritev2			(__NR_Linux + 362)
+#define __NR_pkey_mprotect		(__NR_Linux + 363)
+#define __NR_pkey_alloc			(__NR_Linux + 364)
+#define __NR_pkey_free			(__NR_Linux + 365)
+
 
 /*
  * Offset of the last Linux o32 flavoured syscall
  */
-#define __NR_Linux_syscalls		362
+#define __NR_Linux_syscalls		365
 
 #endif /* _MIPS_SIM == _MIPS_SIM_ABI32 */
 
 #define __NR_O32_Linux			4000
-#define __NR_O32_Linux_syscalls		362
+#define __NR_O32_Linux_syscalls		365
 
 #if _MIPS_SIM == _MIPS_SIM_ABI64
 
@@ -723,16 +727,19 @@
 #define __NR_copy_file_range		(__NR_Linux + 320)
 #define __NR_preadv2			(__NR_Linux + 321)
 #define __NR_pwritev2			(__NR_Linux + 322)
+#define __NR_pkey_mprotect		(__NR_Linux + 323)
+#define __NR_pkey_alloc			(__NR_Linux + 324)
+#define __NR_pkey_free			(__NR_Linux + 325)
 
 /*
  * Offset of the last Linux 64-bit flavoured syscall
  */
-#define __NR_Linux_syscalls		322
+#define __NR_Linux_syscalls		325
 
 #endif /* _MIPS_SIM == _MIPS_SIM_ABI64 */
 
 #define __NR_64_Linux			5000
-#define __NR_64_Linux_syscalls		322
+#define __NR_64_Linux_syscalls		325
 
 #if _MIPS_SIM == _MIPS_SIM_NABI32
 
@@ -1067,15 +1074,18 @@
 #define __NR_copy_file_range		(__NR_Linux + 324)
 #define __NR_preadv2			(__NR_Linux + 325)
 #define __NR_pwritev2			(__NR_Linux + 326)
+#define __NR_pkey_mprotect		(__NR_Linux + 327)
+#define __NR_pkey_alloc			(__NR_Linux + 328)
+#define __NR_pkey_free			(__NR_Linux + 329)
 
 /*
  * Offset of the last N32 flavoured syscall
  */
-#define __NR_Linux_syscalls		326
+#define __NR_Linux_syscalls		329
 
 #endif /* _MIPS_SIM == _MIPS_SIM_NABI32 */
 
 #define __NR_N32_Linux			6000
-#define __NR_N32_Linux_syscalls		326
+#define __NR_N32_Linux_syscalls		329
 
 #endif /* _UAPI_ASM_UNISTD_H */
diff --git a/arch/mips/kernel/scall32-o32.S b/arch/mips/kernel/scall32-o32.S
index c8e43e0..c29d397 100644
--- a/arch/mips/kernel/scall32-o32.S
+++ b/arch/mips/kernel/scall32-o32.S
@@ -597,3 +597,6 @@ EXPORT(sys_call_table)
 	PTR	sys_copy_file_range		/* 4360 */
 	PTR	sys_preadv2
 	PTR	sys_pwritev2
+	PTR	sys_pkey_mprotect
+	PTR	sys_pkey_alloc
+	PTR	sys_pkey_free			/* 4365 */
diff --git a/arch/mips/kernel/scall64-64.S b/arch/mips/kernel/scall64-64.S
index e6ede12..0687f96 100644
--- a/arch/mips/kernel/scall64-64.S
+++ b/arch/mips/kernel/scall64-64.S
@@ -435,4 +435,7 @@ EXPORT(sys_call_table)
 	PTR	sys_copy_file_range		/* 5320 */
 	PTR	sys_preadv2
 	PTR	sys_pwritev2
+	PTR	sys_pkey_mprotect
+	PTR	sys_pkey_alloc
+	PTR	sys_pkey_free			/* 5325 */
 	.size	sys_call_table,.-sys_call_table
diff --git a/arch/mips/kernel/scall64-n32.S b/arch/mips/kernel/scall64-n32.S
index 51d3988..0331ba3 100644
--- a/arch/mips/kernel/scall64-n32.S
+++ b/arch/mips/kernel/scall64-n32.S
@@ -430,4 +430,7 @@ EXPORT(sysn32_call_table)
 	PTR	sys_copy_file_range
 	PTR	compat_sys_preadv2		/* 6325 */
 	PTR	compat_sys_pwritev2
+	PTR	sys_pkey_mprotect
+	PTR	sys_pkey_alloc
+	PTR	sys_pkey_free
 	.size	sysn32_call_table,.-sysn32_call_table
diff --git a/arch/mips/kernel/scall64-o32.S b/arch/mips/kernel/scall64-o32.S
index 6efa713..5a47042 100644
--- a/arch/mips/kernel/scall64-o32.S
+++ b/arch/mips/kernel/scall64-o32.S
@@ -585,4 +585,7 @@ EXPORT(sys32_call_table)
 	PTR	sys_copy_file_range		/* 4360 */
 	PTR	compat_sys_preadv2
 	PTR	compat_sys_pwritev2
+	PTR	sys_pkey_mprotect
+	PTR	sys_pkey_alloc
+	PTR	sys_pkey_free			/* 4365 */
 	.size	sys32_call_table,.-sys32_call_table
-- 
2.7.4
