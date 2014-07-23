Received: from mail-wi0-f170.google.com ([209.85.212.170]:55583 "EHLO
        mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6831986AbaGWNmqVdb9- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Jul 2014 15:42:46 +0200
Received: by mail-wi0-f170.google.com with SMTP id f8so7605386wiw.3
        for <linux-mips@linux-mips.org>; Wed, 23 Jul 2014 06:42:41 -0700 (PDT)
From: Alex Smith <alex@alex-smith.me.uk>
Subject: [PATCH 01/11] MIPS: ptrace: Avoid smp_processor_id() when retrieving FPU IR
Date: Wed, 23 Jul 2014 14:40:06 +0100
Message-ID: <1406122816-2424-2-git-send-email-alex@alex-smith.me.uk>
In-Reply-To: <1406122816-2424-1-git-send-email-alex@alex-smith.me.uk>
References: <1406122816-2424-1-git-send-email-alex@alex-smith.me.uk>
Return-Path: <alex@alex-smith.me.uk>
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
Cc: Alex Smith <alex@alex-smith.me.uk>, stable@vger.kernel.org
Message-ID: <20140723134006.abpVS7T3bOmY5x86AyyjKyEjzYPmJC5gqLrDSxirY4Y@z>

Whenever ptrace attempts to retrieve the FPU implementation register it
accesses it through current_cpu_data, which calls smp_processor_id().
Since the code may execute with preemption enabled, this can trigger
a warning. Fix this by using boot_cpu_data to get the IR instead.

Signed-off-by: Alex Smith <alex@alex-smith.me.uk>
Cc: <stable@vger.kernel.org> # v3.15+
---
 arch/mips/kernel/ptrace.c   | 4 ++--
 arch/mips/kernel/ptrace32.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
index f639ccd..6063b11 100644
--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@ -129,7 +129,7 @@ int ptrace_getfpregs(struct task_struct *child, __u32 __user *data)
 	}
 
 	__put_user(child->thread.fpu.fcr31, data + 64);
-	__put_user(current_cpu_data.fpu_id, data + 65);
+	__put_user(boot_cpu_data.fpu_id, data + 65);
 
 	return 0;
 }
@@ -480,7 +480,7 @@ long arch_ptrace(struct task_struct *child, long request,
 			break;
 		case FPC_EIR:
 			/* implementation / version register */
-			tmp = current_cpu_data.fpu_id;
+			tmp = boot_cpu_data.fpu_id;
 			break;
 		case DSP_BASE ... DSP_BASE + 5: {
 			dspreg_t *dregs;
diff --git a/arch/mips/kernel/ptrace32.c b/arch/mips/kernel/ptrace32.c
index b40c3ca..a83fb73 100644
--- a/arch/mips/kernel/ptrace32.c
+++ b/arch/mips/kernel/ptrace32.c
@@ -129,7 +129,7 @@ long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 			break;
 		case FPC_EIR:
 			/* implementation / version register */
-			tmp = current_cpu_data.fpu_id;
+			tmp = boot_cpu_data.fpu_id;
 			break;
 		case DSP_BASE ... DSP_BASE + 5: {
 			dspreg_t *dregs;
-- 
1.9.1
