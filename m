Received: from mailapp01.imgtec.com ([195.59.15.196]:57058 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990600AbdDFK3S7K0rE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 6 Apr 2017 12:29:18 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] MIPS: Remove dead define of ST_OFF
Date: Thu, 6 Apr 2017 11:29:06 +0100
Message-ID: <1491474546-4289-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, trivial@kernel.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170406102906.Spy_tOUqrX-qzJQu7Fl7LgHwgb7L-ONzujoDyUPfdtE@z>

Commit 1a3d59579b9f ("MIPS: Tidy up FPU context switching") removed the
last usage of the macro ST_OFF. Remove the dead code.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: trivial@kernel.org

---

 arch/mips/kernel/r4k_switch.S | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/mips/kernel/r4k_switch.S b/arch/mips/kernel/r4k_switch.S
index 758577861523..7b386d54fd65 100644
--- a/arch/mips/kernel/r4k_switch.S
+++ b/arch/mips/kernel/r4k_switch.S
@@ -25,12 +25,6 @@
 /* preprocessor replaces the fp in ".set fp=64" with $30 otherwise */
 #undef fp
 
-/*
- * Offset to the current process status flags, the first 32 bytes of the
- * stack are not used.
- */
-#define ST_OFF (_THREAD_SIZE - 32 - PT_SIZE + PT_STATUS)
-
 #ifndef USE_ALTERNATE_RESUME_IMPL
 /*
  * task_struct *resume(task_struct *prev, task_struct *next,
-- 
2.7.4
