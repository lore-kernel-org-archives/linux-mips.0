Received: from mailapp01.imgtec.com ([195.59.15.196]:5645 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007562AbbCGSb55qd74 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 7 Mar 2015 19:31:57 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH v2 05/17] MIPS: Add sched_clock support
Date: Sat, 7 Mar 2015 10:30:23 -0800
Message-ID: <1425753035-17087-6-git-send-email-dengcheng.zhu@imgtec.com>
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
Message-ID: <20150307183023.VfPh9QnU1ByynAmmmDghkO-HQz3FE_926vLeP3Vdyos@z>

This will provide sched_clock interface to implement individual
read_sched_clock(). Not for CAVIUM_OCTEON_SOC as it defines its own
sched_clock() directly (not using the sched_clock_register interface).

Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 068592a..09405dc 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -43,6 +43,7 @@ config MIPS
 	select GENERIC_SMP_IDLE_THREAD
 	select BUILDTIME_EXTABLE_SORT
 	select GENERIC_CLOCKEVENTS
+	select GENERIC_SCHED_CLOCK if !CAVIUM_OCTEON_SOC
 	select GENERIC_CMOS_UPDATE
 	select HAVE_MOD_ARCH_SPECIFIC
 	select VIRT_TO_BUS
-- 
2.3.2
