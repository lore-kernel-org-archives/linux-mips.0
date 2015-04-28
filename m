Received: from mailapp01.imgtec.com ([195.59.15.196]:42749 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026226AbbD1VhfrLVOU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Apr 2015 23:37:35 +0200
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: [PATCH] MIPS: Fix up obsolete cpu_set usage
Date: Tue, 28 Apr 2015 18:34:23 -0300
Message-ID: <1430256863-811-1-git-send-email-ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Ezequiel.Garcia@imgtec.com>
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
Cc: niklass@axis.com, Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Message-ID: <20150428213423.TF3fLHV3Fn-yZeRIle27nKm89N7oMZqrRZBH9EcYynE@z>

cpu_set was removed (along with a bunch of cpumask helpers) by
commit 2f0f267ea072 ("cpumask: remove deprecated functions.").

Fix this by replacing cpu_set with cpumask_set_cpu. Without this
fix the following error is triggered when CONFIG_MIPS_MT_FPAFF=y.

  arch/mips/kernel/smp-cps.c: In function 'cps_smp_setup':
  arch/mips/kernel/smp-cps.c:95:3: error: implicit declaration of function 'cpu_set' [-Werror=implicit-function-declaration]

Fixes: 90db024f140d ("MIPS: smp-cps: cpu_set FPU mask if FPU present")
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
---
This is a fix for v4.1.

 arch/mips/kernel/smp-cps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 7e011f9..4251d39 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -92,7 +92,7 @@ static void __init cps_smp_setup(void)
 #ifdef CONFIG_MIPS_MT_FPAFF
 	/* If we have an FPU, enroll ourselves in the FPU-full mask */
 	if (cpu_has_fpu)
-		cpu_set(0, mt_fpu_cpumask);
+		cpumask_set_cpu(0, &mt_fpu_cpumask);
 #endif /* CONFIG_MIPS_MT_FPAFF */
 }
 
-- 
2.3.3
