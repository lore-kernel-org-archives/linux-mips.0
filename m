Received: from mailapp01.imgtec.com ([195.59.15.196]:52309 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012250AbbCEA7zQPHRM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 5 Mar 2015 01:59:55 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH 15/15] MIPS: Add support for fine granularity task level IRQ time accounting
Date: Wed, 4 Mar 2015 16:58:57 -0800
Message-ID: <1425517137-26463-16-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1425517137-26463-1-git-send-email-dengcheng.zhu@imgtec.com>
References: <1425517137-26463-1-git-send-email-dengcheng.zhu@imgtec.com>
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
Cc: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Message-ID: <20150305005857.vTSIVs42OJCl5ZcKEDhyd8ZM9uINCj0bzn3nu0hc9fI@z>

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
1.8.5.3
