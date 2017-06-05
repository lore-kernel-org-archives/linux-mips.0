Received: from mailapp01.imgtec.com ([195.59.15.196]:8564 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993459AbdFESXIilIvR (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 5 Jun 2017 20:23:08 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 4/5] MIPS: Remove unused ST_OFF from r2300_switch.S
Date: Mon, 5 Jun 2017 11:21:30 -0700
Message-ID: <20170605182131.16853-5-paul.burton@imgtec.com>
In-Reply-To: <20170605182131.16853-1-paul.burton@imgtec.com>
References: <20170605182131.16853-1-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170605182130.vzve-A5937bVZZMiTNMS-uVBwseyhC7u4l7sEhvvEMk@z>

Commit 1a3d59579b9f ("MIPS: Tidy up FPU context switching") removed
usage of ST_OFF, leaving it behind as dead code. Commit 828d1e4e9865
("MIPS: Remove dead define of ST_OFF") then removed the definition of
ST_OFF from r4k_switch.S as a cleanup. However the unused definition of
ST_OFF has been left behind in r2300_switch.S. Remove it.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/kernel/r2300_switch.S | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/mips/kernel/r2300_switch.S b/arch/mips/kernel/r2300_switch.S
index 887f836cfa5c..e57703b1de50 100644
--- a/arch/mips/kernel/r2300_switch.S
+++ b/arch/mips/kernel/r2300_switch.S
@@ -26,12 +26,6 @@
 	.align	5
 
 /*
- * Offset to the current process status flags, the first 32 bytes of the
- * stack are not used.
- */
-#define ST_OFF (_THREAD_SIZE - 32 - PT_SIZE + PT_STATUS)
-
-/*
  * task_struct *resume(task_struct *prev, task_struct *next,
  *		       struct thread_info *next_ti)
  */
-- 
2.13.0
