Received: from mailapp01.imgtec.com ([195.59.15.196]:25240 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007560AbbCGSbvw9vUY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 7 Mar 2015 19:31:51 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH v2 03/17] MIPS: Add support for full dynticks CPU time accounting
Date: Sat, 7 Mar 2015 10:30:21 -0800
Message-ID: <1425753035-17087-4-git-send-email-dengcheng.zhu@imgtec.com>
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
Message-ID: <20150307183021.eKePVnTxsFQ1I8juTawHYrJ86L30wXYVKcvoX93gmI4@z>

With the correct cmpxchg64 on 32-bit platforms, we can now add the config
HAVE_VIRT_CPU_ACCOUNTING_GEN into arch/mips/Kconfig.

Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 17f23ed..068592a 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -55,6 +55,7 @@ config MIPS
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_BINFMT_ELF_STATE
 	select SYSCTL_EXCEPTION_TRACE
+	select HAVE_VIRT_CPU_ACCOUNTING_GEN
 
 menu "Machine selection"
 
-- 
2.3.2
