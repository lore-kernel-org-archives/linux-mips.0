Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:56937 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994634AbdLLKBLpLPgC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 12 Dec 2017 11:01:11 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [RFC PATCH 13/16] MIPS: Rename TASK_THREAD_INFO to TASK_STACK
Date: Tue, 12 Dec 2017 09:57:59 +0000
Message-ID: <1513072682-1371-14-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1513072682-1371-1-git-send-email-matt.redfearn@mips.com>
References: <1513072682-1371-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20171212095759.CV5sBVFIgKKPpXyXxGy5dLujadpDnOY0J76UZ1JUt-c@z>

There are no users of the TASK_THREAD_INFO offset provided by
asm_offsets, but it will be required to access the thread's stack in a
later patch. Since that is the member it actually refers to, rename it.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/kernel/asm-offsets.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/asm-offsets.c b/arch/mips/kernel/asm-offsets.c
index c1cd41456d42..b682a77a0072 100644
--- a/arch/mips/kernel/asm-offsets.c
+++ b/arch/mips/kernel/asm-offsets.c
@@ -79,7 +79,7 @@ void output_task_defines(void)
 {
 	COMMENT("MIPS task_struct offsets.");
 	OFFSET(TASK_STATE, task_struct, state);
-	OFFSET(TASK_THREAD_INFO, task_struct, stack);
+	OFFSET(TASK_STACK, task_struct, stack);
 	OFFSET(TASK_FLAGS, task_struct, flags);
 	OFFSET(TASK_MM, task_struct, mm);
 	OFFSET(TASK_PID, task_struct, pid);
-- 
2.7.4
