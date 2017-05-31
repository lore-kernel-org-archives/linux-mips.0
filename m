Received: from mailapp01.imgtec.com ([195.59.15.196]:24460 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993179AbdEaPUH5iqpT (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 31 May 2017 17:20:07 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 2/4] MIPS: Save static registers before sysmips
Date: Wed, 31 May 2017 16:19:48 +0100
Message-ID: <28c2c48b282b4441ba3ec6160bc8c1e48427a6bd.1496240182.git-series.james.hogan@imgtec.com>
In-Reply-To: <cover.5633df325dbcbc41dbf9cc60df22b38f7812e73a.1496240182.git-series.james.hogan@imgtec.com>
References: <cover.5633df325dbcbc41dbf9cc60df22b38f7812e73a.1496240182.git-series.james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20170531151948.fTN2NQp0lpBTKN-Zn5K4on-L4xA0YUwtu8zSjPU7YLM@z>

The MIPS sysmips system call handler may return directly from the
MIPS_ATOMIC_SET case (mips_atomic_set()) to syscall_exit. This path
restores the static (callee saved) registers, however they won't have
been saved on entry to the system call.

Use the save_static_function() macro to create a __sys_sysmips wrapper
function which saves the static registers before calling sys_sysmips, so
that the correct static register state is restored by syscall_exit.

Fixes: f1e39a4a616c ("MIPS: Rewrite sysmips(MIPS_ATOMIC_SET, ...) in C with inline assembler")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: stable@vger.kernel.org
---
 arch/mips/kernel/scall32-o32.S | 2 +-
 arch/mips/kernel/scall64-64.S  | 2 +-
 arch/mips/kernel/scall64-n32.S | 2 +-
 arch/mips/kernel/scall64-o32.S | 2 +-
 arch/mips/kernel/syscall.c     | 6 ++++++
 5 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/scall32-o32.S b/arch/mips/kernel/scall32-o32.S
index 80ed68b2c95e..27c2f90eeb21 100644
--- a/arch/mips/kernel/scall32-o32.S
+++ b/arch/mips/kernel/scall32-o32.S
@@ -371,7 +371,7 @@ EXPORT(sys_call_table)
 	PTR	sys_writev
 	PTR	sys_cacheflush
 	PTR	sys_cachectl
-	PTR	sys_sysmips
+	PTR	__sys_sysmips
 	PTR	sys_ni_syscall			/* 4150 */
 	PTR	sys_getsid
 	PTR	sys_fdatasync
diff --git a/arch/mips/kernel/scall64-64.S b/arch/mips/kernel/scall64-64.S
index 49765b44aa9b..65d5aeeb9bdb 100644
--- a/arch/mips/kernel/scall64-64.S
+++ b/arch/mips/kernel/scall64-64.S
@@ -311,7 +311,7 @@ EXPORT(sys_call_table)
 	PTR	sys_sched_getaffinity
 	PTR	sys_cacheflush
 	PTR	sys_cachectl
-	PTR	sys_sysmips
+	PTR	__sys_sysmips
 	PTR	sys_io_setup			/* 5200 */
 	PTR	sys_io_destroy
 	PTR	sys_io_getevents
diff --git a/arch/mips/kernel/scall64-n32.S b/arch/mips/kernel/scall64-n32.S
index 90bad2d1b2d3..cbf190ef9e8a 100644
--- a/arch/mips/kernel/scall64-n32.S
+++ b/arch/mips/kernel/scall64-n32.S
@@ -302,7 +302,7 @@ EXPORT(sysn32_call_table)
 	PTR	compat_sys_sched_getaffinity
 	PTR	sys_cacheflush
 	PTR	sys_cachectl
-	PTR	sys_sysmips
+	PTR	__sys_sysmips
 	PTR	compat_sys_io_setup			/* 6200 */
 	PTR	sys_io_destroy
 	PTR	compat_sys_io_getevents
diff --git a/arch/mips/kernel/scall64-o32.S b/arch/mips/kernel/scall64-o32.S
index 2dd70bd104e1..c30bc520885f 100644
--- a/arch/mips/kernel/scall64-o32.S
+++ b/arch/mips/kernel/scall64-o32.S
@@ -371,7 +371,7 @@ EXPORT(sys32_call_table)
 	PTR	compat_sys_writev
 	PTR	sys_cacheflush
 	PTR	sys_cachectl
-	PTR	sys_sysmips
+	PTR	__sys_sysmips
 	PTR	sys_ni_syscall			/* 4150 */
 	PTR	sys_getsid
 	PTR	sys_fdatasync
diff --git a/arch/mips/kernel/syscall.c b/arch/mips/kernel/syscall.c
index 9dd0788fc56d..3971220ea925 100644
--- a/arch/mips/kernel/syscall.c
+++ b/arch/mips/kernel/syscall.c
@@ -192,6 +192,12 @@ static inline int mips_atomic_set(unsigned long addr, unsigned long new)
 	unreachable();
 }
 
+/*
+ * mips_atomic_set() normally returns directly via syscall_exit potentially
+ * clobbering static registers, so be sure to preserve them.
+ */
+save_static_function(sys_sysmips);
+
 SYSCALL_DEFINE3(sysmips, long, cmd, long, arg1, long, arg2)
 {
 	switch (cmd) {
-- 
git-series 0.8.10
