Received: from mailapp01.imgtec.com ([195.59.15.196]:33901 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006570AbaILIfALMOId (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 12 Sep 2014 10:35:00 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH v2] MIPS: mcount: Adjust stack pointer for static trace in MIPS32
Date: Fri, 12 Sep 2014 09:34:43 +0100
Message-ID: <1410510883-7257-1-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1410184736-27208-1-git-send-email-markos.chandras@imgtec.com>
References: <1410184736-27208-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, stable@vger.kernel.org
Message-ID: <20140912083443.CenhJewGh8I_GhwGri1szeUtvdeMUJaJDtWXjotxjNU@z>

Every mcount() call in the MIPS 32-bit kernel is done as follows:

[...]
move at, ra
jal _mcount
addiu sp, sp, -8
[...]

but upon returning from the mcount() function, the stack pointer
is not adjusted properly. This is explained in details in 58b69401c797
(MIPS: Function tracer: Fix broken function tracing).

Commit ad8c396936e3 ("MIPS: Unbreak function tracer for 64-bit kernel.)
fixed the stack manipulation for 64-bit but it didn't fix it completely
for MIPS32.

Cc: <stable@vger.kernel.org>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
Changes since v1:
- Also fix the case where the tracer is actually enabled

With this patch, all ftrace selftests pass when dynamic trace is
disabled
---
 arch/mips/kernel/mcount.S | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/kernel/mcount.S b/arch/mips/kernel/mcount.S
index 5d25462de8a6..a51693eca4cf 100644
--- a/arch/mips/kernel/mcount.S
+++ b/arch/mips/kernel/mcount.S
@@ -129,7 +129,11 @@ NESTED(_mcount, PT_SIZE, ra)
 	 nop
 #endif
 	b	ftrace_stub
+#ifdef CONFIG_32BIT
+	 addiu sp, sp, 8
+#else
 	 nop
+#endif
 
 static_trace:
 	MCOUNT_SAVE_REGS
@@ -139,6 +143,10 @@ static_trace:
 	 move	a1, AT		/* arg2: parent's return address */
 
 	MCOUNT_RESTORE_REGS
+#ifdef CONFIG_32BIT
+	addiu sp, sp, 8
+#endif
+
 	.globl ftrace_stub
 ftrace_stub:
 	RETURN_BACK
-- 
2.1.0
