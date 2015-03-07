Received: from mailapp01.imgtec.com ([195.59.15.196]:34568 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012801AbbCGScfghWzc (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 7 Mar 2015 19:32:35 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH v2 17/17] MIPS: Add support for fine granularity task level IRQ time accounting
Date: Sat, 7 Mar 2015 10:30:35 -0800
Message-ID: <1425753035-17087-18-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1425753035-17087-1-git-send-email-dengcheng.zhu@imgtec.com>
References: <1425753035-17087-1-git-send-email-dengcheng.zhu@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <DengCheng.Zhu@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: macro@linux-mips.org, Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Message-ID: <20150307183035.QOOEyNNZ0r4s5PTP_DwDmpCXSHnrrylvzhGjSZJsogM@z>

With sched_clock being ready, it makes sense to add the option of IRQ time
accounting -- When we have a fast enough sched_clock, IRQ time accounting
will be enabled (see sched_clock_register).

Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 09405dc..4748b8f 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -57,6 +57,7 @@ config MIPS
 	select ARCH_BINFMT_ELF_STATE
 	select SYSCTL_EXCEPTION_TRACE
 	select HAVE_VIRT_CPU_ACCOUNTING_GEN
+	select HAVE_IRQ_TIME_ACCOUNTING
 
 menu "Machine selection"
 
-- 
2.3.2
