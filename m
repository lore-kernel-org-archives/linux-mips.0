Received: from mailapp01.imgtec.com ([195.89.28.115]:44918 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6822429AbaCXKUGWC5f1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 24 Mar 2014 11:20:06 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id E0DB5746D34B7
        for <linux-mips@linux-mips.org>; Mon, 24 Mar 2014 10:19:58 +0000 (GMT)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 01/12] MIPS: add cpu_vpe_id macro
Date: Mon, 24 Mar 2014 10:19:24 +0000
Message-ID: <1395656375-9300-2-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1395656375-9300-1-git-send-email-paul.burton@imgtec.com>
References: <1395656375-9300-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140324101924.hGW-NE6yT-K2DvxaD50m7lgsjP1x4qspyqTRxO7U32w@z>

The vpe_id field of struct cpuinfo_mips is only present when one of
CONFIG_MIPS_MT_{SMP,SMTC} is enabled. That means that any code accessing
which may compile without MT is currently forced to use an #ifdef.
Instead this patch provides an accessor macro, #ifdef'd appropriately
to prevent further #ifdef's elsewhere.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/include/asm/cpu-info.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/cpu-info.h
index 359cea1..49953f7 100644
--- a/arch/mips/include/asm/cpu-info.h
+++ b/arch/mips/include/asm/cpu-info.h
@@ -96,4 +96,10 @@ extern void cpu_report(void);
 extern const char *__cpu_name[];
 #define cpu_name_string()	__cpu_name[smp_processor_id()]
 
+#if defined(CONFIG_MIPS_MT_SMP) || defined(CONFIG_MIPS_MT_SMTC)
+# define cpu_vpe_id(cpuinfo)	((cpuinfo)->vpe_id)
+#else
+# define cpu_vpe_id(cpuinfo)	0
+#endif
+
 #endif /* __ASM_CPU_INFO_H */
-- 
1.8.5.3
