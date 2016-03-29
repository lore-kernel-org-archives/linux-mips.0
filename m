Received: from localhost.localdomain ([127.0.0.1]:60524 "EHLO linux-mips.org"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27025135AbcCaIuGhlgxq (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 31 Mar 2016 10:50:06 +0200
Received: from scotty.linux-mips.net (localhost.localdomain [127.0.0.1])
        by scotty.linux-mips.net (8.15.2/8.14.8) with ESMTP id u2V8o21O029856
        for <linux-mips@linux-mips.org>; Thu, 31 Mar 2016 10:50:03 +0200
Received: (from ralf@localhost)
        by scotty.linux-mips.net (8.15.2/8.15.2/Submit) id u2V8o2AN029846
        for linux-mips@linux-mips.org; Thu, 31 Mar 2016 10:50:02 +0200
Resent-Message-ID: <20160331085002.GA5086@linux-mips.org>
Resent-To: linux-mips@linux-mips.org
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH v2 1/6] selftests/seccomp: add MIPS self-test support
Date: Tue, 29 Mar 2016 09:35:29 +0100
Message-ID: <1459240534-8658-2-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1459240534-8658-1-git-send-email-matt.redfearn@imgtec.com>
References: <1459240534-8658-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <ralf@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: IMG-MIPSLinuxKerneldevelopers@imgtec.com
Cc: Matt Redfearn <matt.redfearn@imgtec.com>, Andy Lutomirski <luto@amacapital.net>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>, linux-kselftest@vger.kernel.org, Will Drewry <wad@chromium.org>
Message-ID: <20160329083529.euQdQdPVLsnYB6F5p3HMox4bMktm_f4r6hVBP45_oUo@z>

This adds self-test support on MIPS, based on RFC patch from Kees Cook.
Modifications from the RFC:
- support the O32 syscall which passes the real syscall number in a0.
- Use PTRACE_{GET,SET}REGS
- Because SYSCALL_NUM and SYSCALL_RET are the same register, it is not
  possible to test modifying the syscall return value when skipping,
  since both would need to set the same register. Therefore modify that
  test case to just detect the skipped test.
Tested on MIPS32r2 / MIPS64r2 with O32, N32 and N64 userlands.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Acked-by: Kees Cook <keescook@chromium.org>
---

Changes in v2:
- Tested on additional platforms
- Replace __NR_syscall which isn't defined for N32 / N64 ABIs

 tools/testing/selftests/seccomp/seccomp_bpf.c | 30 +++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index b9453b838162..4c3e032d7224 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -5,6 +5,7 @@
  * Test code for seccomp bpf.
  */
 
+#include <sys/types.h>
 #include <asm/siginfo.h>
 #define __have_siginfo_t 1
 #define __have_sigval_t 1
@@ -14,7 +15,6 @@
 #include <linux/filter.h>
 #include <sys/prctl.h>
 #include <sys/ptrace.h>
-#include <sys/types.h>
 #include <sys/user.h>
 #include <linux/prctl.h>
 #include <linux/ptrace.h>
@@ -1242,6 +1242,12 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 # define ARCH_REGS     s390_regs
 # define SYSCALL_NUM   gprs[2]
 # define SYSCALL_RET   gprs[2]
+#elif defined(__mips__)
+# define ARCH_REGS	struct pt_regs
+# define SYSCALL_NUM	regs[2]
+# define SYSCALL_SYSCALL_NUM regs[4]
+# define SYSCALL_RET	regs[2]
+# define SYSCALL_NUM_RET_SHARE_REG
 #else
 # error "Do not know how to find your architecture's registers and syscalls"
 #endif
@@ -1249,7 +1255,7 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 /* Use PTRACE_GETREGS and PTRACE_SETREGS when available. This is useful for
  * architectures without HAVE_ARCH_TRACEHOOK (e.g. User-mode Linux).
  */
-#if defined(__x86_64__) || defined(__i386__)
+#if defined(__x86_64__) || defined(__i386__) || defined(__mips__)
 #define HAVE_GETREGS
 #endif
 
@@ -1273,6 +1279,10 @@ int get_syscall(struct __test_metadata *_metadata, pid_t tracee)
 	}
 #endif
 
+#if defined(__mips__)
+	if (regs.SYSCALL_NUM == __NR_O32_Linux)
+		return regs.SYSCALL_SYSCALL_NUM;
+#endif
 	return regs.SYSCALL_NUM;
 }
 
@@ -1297,6 +1307,13 @@ void change_syscall(struct __test_metadata *_metadata,
 	{
 		regs.SYSCALL_NUM = syscall;
 	}
+#elif defined(__mips__)
+	{
+		if (regs.SYSCALL_NUM == __NR_O32_Linux)
+			regs.SYSCALL_SYSCALL_NUM = syscall;
+		else
+			regs.SYSCALL_NUM = syscall;
+	}
 
 #elif defined(__arm__)
 # ifndef PTRACE_SET_SYSCALL
@@ -1327,7 +1344,11 @@ void change_syscall(struct __test_metadata *_metadata,
 
 	/* If syscall is skipped, change return value. */
 	if (syscall == -1)
+#ifdef SYSCALL_NUM_RET_SHARE_REG
+		TH_LOG("Can't modify syscall return on this architecture");
+#else
 		regs.SYSCALL_RET = 1;
+#endif
 
 #ifdef HAVE_GETREGS
 	ret = ptrace(PTRACE_SETREGS, tracee, 0, &regs);
@@ -1465,8 +1486,13 @@ TEST_F(TRACE_syscall, syscall_dropped)
 	ret = prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, &self->prog, 0, 0);
 	ASSERT_EQ(0, ret);
 
+#ifdef SYSCALL_NUM_RET_SHARE_REG
+	/* gettid has been skipped */
+	EXPECT_EQ(-1, syscall(__NR_gettid));
+#else
 	/* gettid has been skipped and an altered return value stored. */
 	EXPECT_EQ(1, syscall(__NR_gettid));
+#endif
 	EXPECT_NE(self->mytid, syscall(__NR_gettid));
 }
 
-- 
2.5.0
