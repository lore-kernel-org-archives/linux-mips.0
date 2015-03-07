Received: from mailapp01.imgtec.com ([195.59.15.196]:39756 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007461AbbCGSbpwfejz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 7 Mar 2015 19:31:45 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH v2 01/17] MIPS: Add SCHED_HRTICK support
Date: Sat, 7 Mar 2015 10:30:19 -0800
Message-ID: <1425753035-17087-2-git-send-email-dengcheng.zhu@imgtec.com>
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
Message-ID: <20150307183019.BL1z_MjH7CI04ksgSvQZ7fMBJbITNMthQcdBiFuW9FQ@z>

We have HIGH_RES_TIMERS to support SCHED_HRTICK. But SCHED_HRTICK is in
kernel/Kconfig.hz where HZ values unsuitable for MIPS are defined. So we
simply add this config in arch/mips/Kconfig as opposed to including the
whole kernel/Kconfig.hz.

Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 294f82e..17f23ed 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2500,6 +2500,9 @@ config HZ
 	default 1000 if HZ_1000
 	default 1024 if HZ_1024
 
+config SCHED_HRTICK
+	def_bool HIGH_RES_TIMERS
+
 source "kernel/Kconfig.preempt"
 
 config KEXEC
-- 
2.3.2
