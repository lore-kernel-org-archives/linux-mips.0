Received: from mailapp01.imgtec.com ([195.59.15.196]:21174 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010072AbbAPKwwiEdiH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:52:52 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 01160E2DD4FB8
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:52:45 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 29/70] MIPS: kernel: entry.S: Add MIPS R6 related definitions
Date: Fri, 16 Jan 2015 10:49:08 +0000
Message-ID: <1421405389-15512-30-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150116104908.wnQzADDKcZ7bFO6yGLcekO0NiptHZVBm424s6A4sFCg@z>

The instruction hazard barrier in the form of:

jr.hb	ra
nop

is valid on MIPS R6 as well.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/entry.S | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/entry.S b/arch/mips/kernel/entry.S
index 4353d323f017..d5ab21c3fd12 100644
--- a/arch/mips/kernel/entry.S
+++ b/arch/mips/kernel/entry.S
@@ -158,7 +158,8 @@ syscall_exit_work:
 	jal	syscall_trace_leave
 	b	resume_userspace
 
-#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_MIPS_MT)
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6) || \
+    defined(CONFIG_MIPS_MT)
 
 /*
  * MIPS32R2 Instruction Hazard Barrier - must be called
@@ -171,4 +172,4 @@ LEAF(mips_ihb)
 	nop
 	END(mips_ihb)
 
-#endif /* CONFIG_CPU_MIPSR2 or CONFIG_MIPS_MT */
+#endif /* CONFIG_CPU_MIPSR2 or CONFIG_CPU_MIPSR6 or CONFIG_MIPS_MT */
-- 
2.2.1
