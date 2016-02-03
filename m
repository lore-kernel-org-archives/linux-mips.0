Received: from mailapp01.imgtec.com ([195.59.15.196]:64126 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011289AbcBCDTsiocj0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Feb 2016 04:19:48 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 14/15] MIPS: smp-cps: Add nothreads kernel parameter
Date: Wed, 3 Feb 2016 03:15:34 +0000
Message-ID: <1454469335-14778-15-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1454469335-14778-1-git-send-email-paul.burton@imgtec.com>
References: <1454469335-14778-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Rusty Russell <rusty@rustcorp.com.au>, linux-kernel@vger.kernel.org, Niklas Cassel <niklas.cassel@axis.com>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20160203031534.1cS1HZGNMQ72Q3_NfdfkrGrO3zrMzrhKL3vjCrs2Ep8@z>

When debugging a new system or core it can be useful to disable the use
of multithreading. Introduce a "nothreads" kernel command line parameter
that can be set in order to do so.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/smp-cps.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 27f1c04..23c29fc 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -27,14 +27,25 @@
 #include <asm/time.h>
 #include <asm/uasm.h>
 
+static bool threads_disabled;
 static DECLARE_BITMAP(core_power, NR_CPUS);
 
 struct core_boot_config *mips_cps_core_bootcfg;
 
+static int __init setup_nothreads(char *s)
+{
+	threads_disabled = true;
+	return 0;
+}
+early_param("nothreads", setup_nothreads);
+
 static unsigned core_vpe_count(unsigned core)
 {
 	unsigned cfg;
 
+	if (threads_disabled)
+		return 1;
+
 	if ((!config_enabled(CONFIG_MIPS_MT_SMP) || !cpu_has_mipsmt)
 		&& (!config_enabled(CONFIG_CPU_MIPSR6) || !cpu_has_vp))
 		return 1;
-- 
2.7.0
