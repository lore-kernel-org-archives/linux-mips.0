Received: from multi.imgtec.com ([194.200.65.239]:4436 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6817294AbaA0PXvIU15H (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 16:23:51 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 04/15] mips: don't require FPU on sigcontext setup/restore
Date: Mon, 27 Jan 2014 15:23:03 +0000
Message-ID: <1390836194-26286-5-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1390836194-26286-1-git-send-email-paul.burton@imgtec.com>
References: <1390836194-26286-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140127152303.VbtimRGsGOyaTNIvSzYoQl8GF_zmZ2Z8bxPus286Y4Q@z>

When a task which has used the FPU at some point in its past takes a
signal the kernel would previously always require the task to take
ownership of the FPU whilst setting up or restoring from the sigcontext.
That means that if the task has not used the FPU within this timeslice
then the kernel would enable the FPU, restore the task's FP context into
FPU registers and then save them into the sigcontext. This seems
inefficient, and if the signal handler doesn't use FP then enabling the
FPU & the extra memory accesses are entirely wasted work.

This patch modifies the sigcontext setup & restore code to copy directly
between the tasks saved FP context & the sigcontext for any tasks which
have used FP in the past but are not currently the FPU owner (ie. have
not used FP in this timeslice).

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Reviewed-by: Qais Yousef <qais.yousef@imgtec.com>
---
 arch/mips/kernel/signal.c   | 22 ++++++++++++++--------
 arch/mips/kernel/signal32.c | 22 ++++++++++++++--------
 2 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index b7e4614..e0178e1 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -102,10 +102,13 @@ static int protected_save_fp_context(struct sigcontext __user *sc)
 	int err;
 	while (1) {
 		lock_fpu_owner();
-		err = own_fpu_inatomic(1);
-		if (!err)
-			err = save_fp_context(sc); /* this might fail */
-		unlock_fpu_owner();
+		if (is_fpu_owner()) {
+			err = save_fp_context(sc);
+			unlock_fpu_owner();
+		} else {
+			unlock_fpu_owner();
+			err = copy_fp_to_sigcontext(sc);
+		}
 		if (likely(!err))
 			break;
 		/* touch the sigcontext and try again */
@@ -123,10 +126,13 @@ static int protected_restore_fp_context(struct sigcontext __user *sc)
 	int err, tmp __maybe_unused;
 	while (1) {
 		lock_fpu_owner();
-		err = own_fpu_inatomic(0);
-		if (!err)
-			err = restore_fp_context(sc); /* this might fail */
-		unlock_fpu_owner();
+		if (is_fpu_owner()) {
+			err = restore_fp_context(sc);
+			unlock_fpu_owner();
+		} else {
+			unlock_fpu_owner();
+			err = copy_fp_from_sigcontext(sc);
+		}
 		if (likely(!err))
 			break;
 		/* touch the sigcontext and try again */
diff --git a/arch/mips/kernel/signal32.c b/arch/mips/kernel/signal32.c
index dc09206..aec5821 100644
--- a/arch/mips/kernel/signal32.c
+++ b/arch/mips/kernel/signal32.c
@@ -118,10 +118,13 @@ static int protected_save_fp_context32(struct sigcontext32 __user *sc)
 	int err;
 	while (1) {
 		lock_fpu_owner();
-		err = own_fpu_inatomic(1);
-		if (!err)
-			err = save_fp_context32(sc); /* this might fail */
-		unlock_fpu_owner();
+		if (is_fpu_owner()) {
+			err = save_fp_context32(sc);
+			unlock_fpu_owner();
+		} else {
+			unlock_fpu_owner();
+			err = copy_fp_to_sigcontext32(sc);
+		}
 		if (likely(!err))
 			break;
 		/* touch the sigcontext and try again */
@@ -139,10 +142,13 @@ static int protected_restore_fp_context32(struct sigcontext32 __user *sc)
 	int err, tmp __maybe_unused;
 	while (1) {
 		lock_fpu_owner();
-		err = own_fpu_inatomic(0);
-		if (!err)
-			err = restore_fp_context32(sc); /* this might fail */
-		unlock_fpu_owner();
+		if (is_fpu_owner()) {
+			err = restore_fp_context32(sc);
+			unlock_fpu_owner();
+		} else {
+			unlock_fpu_owner();
+			err = copy_fp_from_sigcontext32(sc);
+		}
 		if (likely(!err))
 			break;
 		/* touch the sigcontext and try again */
-- 
1.8.5.3
