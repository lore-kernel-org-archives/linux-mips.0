Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:39756 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990401AbeFTDqW30FwM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 20 Jun 2018 05:46:22 +0200
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH v2] MIPS: Wire up io_pgetevents syscall
Date: Tue, 19 Jun 2018 20:46:15 -0700
Message-ID: <20180620034615.17579-1-paul.burton@mips.com>
In-Reply-To: <20180615083543.GA7603@jamesdev>
References: <20180615083543.GA7603@jamesdev>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@mips.com>
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
Cc: Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20180620034615.0gqFYuJTGeS6ZIXaPaWX9SfMB6LBdpCriROi0ps71zg@z>

Wire up the io_pgetevents syscall that was introduced by commit
7a074e96dee6 ("aio: implement io_pgetevents").

Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org

---
This will conflict with the rseq patches, but is trivial to fixup.

Changes in v2:
- Use compat_sys_io_pgetevents for o32 & n32 on MIPS64 kernels.

 arch/mips/include/uapi/asm/unistd.h | 15 +++++++++------
 arch/mips/kernel/scall32-o32.S      |  1 +
 arch/mips/kernel/scall64-64.S       |  1 +
 arch/mips/kernel/scall64-n32.S      |  1 +
 arch/mips/kernel/scall64-o32.S      |  1 +
 5 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/uapi/asm/unistd.h b/arch/mips/include/uapi/asm/unistd.h
index bb05e9916a5f..41a01e29c4ff 100644
--- a/arch/mips/include/uapi/asm/unistd.h
+++ b/arch/mips/include/uapi/asm/unistd.h
@@ -388,17 +388,18 @@
 #define __NR_pkey_alloc			(__NR_Linux + 364)
 #define __NR_pkey_free			(__NR_Linux + 365)
 #define __NR_statx			(__NR_Linux + 366)
+#define __NR_io_pgetevents		(__NR_Linux + 367)
 
 
 /*
  * Offset of the last Linux o32 flavoured syscall
  */
-#define __NR_Linux_syscalls		366
+#define __NR_Linux_syscalls		367
 
 #endif /* _MIPS_SIM == _MIPS_SIM_ABI32 */
 
 #define __NR_O32_Linux			4000
-#define __NR_O32_Linux_syscalls		366
+#define __NR_O32_Linux_syscalls		367
 
 #if _MIPS_SIM == _MIPS_SIM_ABI64
 
@@ -733,16 +734,17 @@
 #define __NR_pkey_alloc			(__NR_Linux + 324)
 #define __NR_pkey_free			(__NR_Linux + 325)
 #define __NR_statx			(__NR_Linux + 326)
+#define __NR_io_pgetevents		(__NR_Linux + 327)
 
 /*
  * Offset of the last Linux 64-bit flavoured syscall
  */
-#define __NR_Linux_syscalls		326
+#define __NR_Linux_syscalls		327
 
 #endif /* _MIPS_SIM == _MIPS_SIM_ABI64 */
 
 #define __NR_64_Linux			5000
-#define __NR_64_Linux_syscalls		326
+#define __NR_64_Linux_syscalls		327
 
 #if _MIPS_SIM == _MIPS_SIM_NABI32
 
@@ -1081,15 +1083,16 @@
 #define __NR_pkey_alloc			(__NR_Linux + 328)
 #define __NR_pkey_free			(__NR_Linux + 329)
 #define __NR_statx			(__NR_Linux + 330)
+#define __NR_io_pgetevents		(__NR_Linux + 331)
 
 /*
  * Offset of the last N32 flavoured syscall
  */
-#define __NR_Linux_syscalls		330
+#define __NR_Linux_syscalls		331
 
 #endif /* _MIPS_SIM == _MIPS_SIM_NABI32 */
 
 #define __NR_N32_Linux			6000
-#define __NR_N32_Linux_syscalls		330
+#define __NR_N32_Linux_syscalls		331
 
 #endif /* _UAPI_ASM_UNISTD_H */
diff --git a/arch/mips/kernel/scall32-o32.S b/arch/mips/kernel/scall32-o32.S
index a9a7d78803cd..7010fedee283 100644
--- a/arch/mips/kernel/scall32-o32.S
+++ b/arch/mips/kernel/scall32-o32.S
@@ -590,3 +590,4 @@ EXPORT(sys_call_table)
 	PTR	sys_pkey_alloc
 	PTR	sys_pkey_free			/* 4365 */
 	PTR	sys_statx
+	PTR	sys_io_pgetevents
diff --git a/arch/mips/kernel/scall64-64.S b/arch/mips/kernel/scall64-64.S
index 65d5aeeb9bdb..c6602079c46f 100644
--- a/arch/mips/kernel/scall64-64.S
+++ b/arch/mips/kernel/scall64-64.S
@@ -439,4 +439,5 @@ EXPORT(sys_call_table)
 	PTR	sys_pkey_alloc
 	PTR	sys_pkey_free			/* 5325 */
 	PTR	sys_statx
+	PTR	sys_io_pgetevents
 	.size	sys_call_table,.-sys_call_table
diff --git a/arch/mips/kernel/scall64-n32.S b/arch/mips/kernel/scall64-n32.S
index cbf190ef9e8a..4959b103f7a9 100644
--- a/arch/mips/kernel/scall64-n32.S
+++ b/arch/mips/kernel/scall64-n32.S
@@ -434,4 +434,5 @@ EXPORT(sysn32_call_table)
 	PTR	sys_pkey_alloc
 	PTR	sys_pkey_free
 	PTR	sys_statx			/* 6330 */
+	PTR	compat_sys_io_pgetevents
 	.size	sysn32_call_table,.-sysn32_call_table
diff --git a/arch/mips/kernel/scall64-o32.S b/arch/mips/kernel/scall64-o32.S
index 9ebe3e2403b1..433c7da31dbf 100644
--- a/arch/mips/kernel/scall64-o32.S
+++ b/arch/mips/kernel/scall64-o32.S
@@ -583,4 +583,5 @@ EXPORT(sys32_call_table)
 	PTR	sys_pkey_alloc
 	PTR	sys_pkey_free			/* 4365 */
 	PTR	sys_statx
+	PTR	compat_sys_io_pgetevents
 	.size	sys32_call_table,.-sys32_call_table
-- 
2.17.1
