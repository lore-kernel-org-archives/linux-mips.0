Received: from mailapp01.imgtec.com ([195.89.28.115]:59833 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6817664AbaDIQC2afc3W (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 9 Apr 2014 18:02:28 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 68581193E8BF7
        for <linux-mips@linux-mips.org>; Wed,  9 Apr 2014 17:02:18 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH v2 14/14] MIPS: Enable the BPF_JIT symbol for MIPS
Date: Wed, 9 Apr 2014 17:02:35 +0100
Message-ID: <1397059355-27559-1-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1396957635-27071-15-git-send-email-markos.chandras@imgtec.com>
References: <1396957635-27071-15-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140409160235.HZmbdCZEJaPSWVsY_wlsyoxjvF5-GHrxlU3K0zGkwm0@z>

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
Changes since v1:
- Drop the MIPS32/64R2 dependency
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 885cbf2..ca24cfc0 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -12,6 +12,7 @@ config MIPS
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
+	select HAVE_BPF_JIT if !CPU_MICROMIPS
 	select ARCH_HAVE_CUSTOM_GPIO_H
 	select HAVE_FUNCTION_TRACER
 	select HAVE_FUNCTION_TRACE_MCOUNT_TEST
-- 
1.9.1
