Received: from mailapp02.imgtec.com ([217.156.133.132]:19860 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23990509AbcJHVrryTZj4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 8 Oct 2016 23:47:47 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: Enable hardened usercopy
Date: Sat, 8 Oct 2016 22:47:14 +0100
Message-ID: <20161008214714.5375-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Kees Cook <keescook@chromium.org>
Message-ID: <20161008214714._tTvxFOAM2Wflrh6wsdiFmvkzRazLTINKO92LmTG2k8@z>

Enable CONFIG_HARDENED_USERCOPY checks for MIPS, calling check_object
size in all of copy_{to,from}_user(), __copy_{to,from}_user() &
__copy_{to,from}_user_inatomic().

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Kees Cook <keescook@chromium.org>
---

 arch/mips/Kconfig               |  1 +
 arch/mips/include/asm/uaccess.h | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1a322c8..87d7a1f3 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -65,6 +65,7 @@ config MIPS
 	select HANDLE_DOMAIN_IRQ
 	select HAVE_EXIT_THREAD
 	select HAVE_REGS_AND_STACK_ACCESS_API
+	select HAVE_ARCH_HARDENED_USERCOPY
 
 menu "Machine selection"
 
diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
index 21a2aab..c65707d 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -858,7 +858,10 @@ extern size_t __copy_user(void *__to, const void *__from, size_t __n);
 	__cu_to = (to);							\
 	__cu_from = (from);						\
 	__cu_len = (n);							\
+									\
+	check_object_size(__cu_from, __cu_len, true);			\
 	might_fault();							\
+									\
 	if (eva_kernel_access())					\
 		__cu_len = __invoke_copy_to_kernel(__cu_to, __cu_from,	\
 						   __cu_len);		\
@@ -879,6 +882,9 @@ extern size_t __copy_user_inatomic(void *__to, const void *__from, size_t __n);
 	__cu_to = (to);							\
 	__cu_from = (from);						\
 	__cu_len = (n);							\
+									\
+	check_object_size(__cu_from, __cu_len, true);			\
+									\
 	if (eva_kernel_access())					\
 		__cu_len = __invoke_copy_to_kernel(__cu_to, __cu_from,	\
 						   __cu_len);		\
@@ -897,6 +903,9 @@ extern size_t __copy_user_inatomic(void *__to, const void *__from, size_t __n);
 	__cu_to = (to);							\
 	__cu_from = (from);						\
 	__cu_len = (n);							\
+									\
+	check_object_size(__cu_to, __cu_len, false);			\
+									\
 	if (eva_kernel_access())					\
 		__cu_len = __invoke_copy_from_kernel_inatomic(__cu_to,	\
 							      __cu_from,\
@@ -931,6 +940,9 @@ extern size_t __copy_user_inatomic(void *__to, const void *__from, size_t __n);
 	__cu_to = (to);							\
 	__cu_from = (from);						\
 	__cu_len = (n);							\
+									\
+	check_object_size(__cu_from, __cu_len, true);			\
+									\
 	if (eva_kernel_access()) {					\
 		__cu_len = __invoke_copy_to_kernel(__cu_to,		\
 						   __cu_from,		\
@@ -1123,6 +1135,9 @@ extern size_t __copy_in_user_eva(void *__to, const void *__from, size_t __n);
 	__cu_to = (to);							\
 	__cu_from = (from);						\
 	__cu_len = (n);							\
+									\
+	check_object_size(__cu_to, __cu_len, false);			\
+									\
 	if (eva_kernel_access()) {					\
 		__cu_len = __invoke_copy_from_kernel(__cu_to,		\
 						     __cu_from,		\
@@ -1161,6 +1176,9 @@ extern size_t __copy_in_user_eva(void *__to, const void *__from, size_t __n);
 	__cu_to = (to);							\
 	__cu_from = (from);						\
 	__cu_len = (n);							\
+									\
+	check_object_size(__cu_to, __cu_len, false);			\
+									\
 	if (eva_kernel_access()) {					\
 		__cu_len = __invoke_copy_from_kernel(__cu_to,		\
 						     __cu_from,		\
-- 
2.10.0
