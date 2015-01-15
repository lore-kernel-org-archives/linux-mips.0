Received: from bes.se.axis.com ([195.60.68.10]:45082 "EHLO bes.se.axis.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S27014592AbbAOPl53MXES (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 15 Jan 2015 16:41:57 +0100
From: Niklas Cassel <niklas.cassel@axis.com>
Subject: [PATCH] MIPS: smp-cps: cpu_set FPU mask if FPU present
Date: Thu, 15 Jan 2015 16:41:13 +0100
Message-ID: <1421336473-5627-1-git-send-email-niklass@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <niklas.cassel@axis.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org
Cc: paul.burton@imgtec.com, linux-mips@linux-mips.org, Niklas Cassel <niklass@axis.com>
Message-ID: <20150115154113.A4L9C3IibLOh9LrR-2ab6Hd-IrXVNgWnxatjXgqCuH4@z>

If we have an FPU, enroll ourselves in the FPU-full mask.
Matching the MT_SMP and CMP implementations of smp_setup.

Signed-off-by: Niklas Cassel <niklass@axis.com>
---
 arch/mips/kernel/smp-cps.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index bed7590..d5589be 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -88,6 +88,12 @@ static void __init cps_smp_setup(void)
 
 	/* Make core 0 coherent with everything */
 	write_gcr_cl_coherence(0xff);
+
+#ifdef CONFIG_MIPS_MT_FPAFF
+	/* If we have an FPU, enroll ourselves in the FPU-full mask */
+	if (cpu_has_fpu)
+		cpu_set(0, mt_fpu_cpumask);
+#endif /* CONFIG_MIPS_MT_FPAFF */
 }
 
 static void __init cps_prepare_cpus(unsigned int max_cpus)
-- 
2.1.4
