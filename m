Received: from www262.sakura.ne.jp ([202.181.97.72]:25652 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007509AbaITKmPvQrd6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 20 Sep 2014 12:42:15 +0200
Subject: [PATCH 3.17-rc5] Fix confusing PFA_NO_NEW_PRIVS constant.
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
References: <201409192053.IHJ35462.JLOMOSOFFVtQFH@I-love.SAKURA.ne.jp>
        <541D16EA.70407@huawei.com>
In-Reply-To: <541D16EA.70407@huawei.com>
Message-ID: <201409201940.AHG21834.LJOFFHSFQOtVMO@I-love.SAKURA.ne.jp>
Date: Sat, 20 Sep 2014 19:40:30 +0900
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-Path: <penguin-kernel@I-love.SAKURA.ne.jp>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: keescook@chromium.org, linux-kernel@vger.kernel.org
Cc: james.l.morris@oracle.com, oleg@redhat.com, luto@amacapital.net, drysdale@google.com, mtk.manpages@gmail.com, wad@chromium.org, jln@chromium.org, linux-api@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, linux-arch@vger.kernel.org, linux-security-module@vger.kernel.org
Message-ID: <20140920104030.A_zLHgxL82rjKHEP-_iTa1swmGyJYA98RijSxBVFD08@z>

Can you apply below patch before new PFA_* are defined?
Cgroups code might want to define PFA_SPREAD_PAGE as 1 and PFA_SPREAD_SLAB as 2.
----------------------------------------
From 8543e68adb210142fa347d8bc9d83df0bb2c5291 Mon Sep 17 00:00:00 2001
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Date: Sat, 20 Sep 2014 19:24:23 +0900
Subject: [PATCH 3.17-rc5] Fix confusing PFA_NO_NEW_PRIVS constant.

Commit 1d4457f99928 ("sched: move no_new_privs into new atomic flags")
defined PFA_NO_NEW_PRIVS as hexadecimal value, but it is confusing
because it is used as bit number. Redefine it as decimal bit number.

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 include/linux/sched.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 5c2c885..4557765 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1957,7 +1957,7 @@ static inline void memalloc_noio_restore(unsigned int flags)
 }
 
 /* Per-process atomic flags. */
-#define PFA_NO_NEW_PRIVS 0x00000001	/* May not gain new privileges. */
+#define PFA_NO_NEW_PRIVS 0	/* May not gain new privileges. */
 
 static inline bool task_no_new_privs(struct task_struct *p)
 {
-- 
1.7.1
