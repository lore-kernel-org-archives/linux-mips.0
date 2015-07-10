Received: from mailapp01.imgtec.com ([195.59.15.196]:58929 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009964AbbGJPDQAasep (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Jul 2015 17:03:16 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 08/16] MIPS: remove unused {get,put}_sigset functions
Date: Fri, 10 Jul 2015 16:00:17 +0100
Message-ID: <1436540426-10021-9-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1436540426-10021-1-git-send-email-paul.burton@imgtec.com>
References: <1436540426-10021-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Matthew Fortune <matthew.fortune@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, James Hogan <james.hogan@imgtec.com>, Andy Lutomirski <luto@amacapital.net>, Ralf Baechle <ralf@linux-mips.org>, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20150710150017.V3vGGoAVOXNIdeGEMUkBwAqm1_fuIhkgof50pbjMGZ4@z>

These functions are never called & thus dead code. Remove them.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/signal32.c | 51 ---------------------------------------------
 1 file changed, 51 deletions(-)

diff --git a/arch/mips/kernel/signal32.c b/arch/mips/kernel/signal32.c
index 2a7c6dd..3059f36 100644
--- a/arch/mips/kernel/signal32.c
+++ b/arch/mips/kernel/signal32.c
@@ -131,57 +131,6 @@ static int restore_sigcontext32(struct pt_regs *regs,
 }
 
 /*
- *
- */
-extern void __put_sigset_unknown_nsig(void);
-extern void __get_sigset_unknown_nsig(void);
-
-static inline int put_sigset(const sigset_t *kbuf, compat_sigset_t __user *ubuf)
-{
-	int err = 0;
-
-	if (!access_ok(VERIFY_WRITE, ubuf, sizeof(*ubuf)))
-		return -EFAULT;
-
-	switch (_NSIG_WORDS) {
-	default:
-		__put_sigset_unknown_nsig();
-	case 2:
-		err |= __put_user(kbuf->sig[1] >> 32, &ubuf->sig[3]);
-		err |= __put_user(kbuf->sig[1] & 0xffffffff, &ubuf->sig[2]);
-	case 1:
-		err |= __put_user(kbuf->sig[0] >> 32, &ubuf->sig[1]);
-		err |= __put_user(kbuf->sig[0] & 0xffffffff, &ubuf->sig[0]);
-	}
-
-	return err;
-}
-
-static inline int get_sigset(sigset_t *kbuf, const compat_sigset_t __user *ubuf)
-{
-	int err = 0;
-	unsigned long sig[4];
-
-	if (!access_ok(VERIFY_READ, ubuf, sizeof(*ubuf)))
-		return -EFAULT;
-
-	switch (_NSIG_WORDS) {
-	default:
-		__get_sigset_unknown_nsig();
-	case 2:
-		err |= __get_user(sig[3], &ubuf->sig[3]);
-		err |= __get_user(sig[2], &ubuf->sig[2]);
-		kbuf->sig[1] = sig[2] | (sig[3] << 32);
-	case 1:
-		err |= __get_user(sig[1], &ubuf->sig[1]);
-		err |= __get_user(sig[0], &ubuf->sig[0]);
-		kbuf->sig[0] = sig[0] | (sig[1] << 32);
-	}
-
-	return err;
-}
-
-/*
  * Atomically swap in the new signal mask, and wait for a signal.
  */
 
-- 
2.4.4
