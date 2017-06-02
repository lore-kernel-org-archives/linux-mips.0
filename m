Received: from mailapp01.imgtec.com ([195.59.15.196]:24741 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993941AbdFBVuuKP6aF (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Jun 2017 23:50:50 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 5/7] MIPS: CPS: Prevent multi-core with dcache aliasing
Date: Fri, 2 Jun 2017 14:48:53 -0700
Message-ID: <20170602214856.4545-6-paul.burton@imgtec.com>
In-Reply-To: <20170602214856.4545-1-paul.burton@imgtec.com>
References: <20170602214856.4545-1-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170602214853.a2HQF3yOv8AIdiBsXY6a5eWdJmJUvDHoQgq0fE5OXqs@z>

Systems using the MIPS Coherence Manager (CM) cannot support multi-core
SMP with dcache aliasing. This is because CPU caches are VIPT, but
interventions in CM-based systems provide only the physical address to
remote caches. This means that interventions may behave incorrectly in
the presence of an aliasing dcache, since the physical address used
when handling an intervention may lead to operation on an aliased cache
line rather than the correct line.

Prevent us from running into this issue by refusing to boot secondary
cores in systems where dcache aliasing may occur.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/kernel/smp-cps.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 36954ddd0b9f..90ecd099c4b0 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -142,9 +142,11 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 
 	/* Warn the user if the CCA prevents multi-core */
 	ncores = mips_cm_numcores();
-	if (cca_unsuitable && ncores > 1) {
-		pr_warn("Using only one core due to unsuitable CCA 0x%x\n",
-			cca);
+	if ((cca_unsuitable || cpu_has_dc_aliases) && ncores > 1) {
+		pr_warn("Using only one core due to %s%s%s\n",
+			cca_unsuitable ? "unsuitable CCA" : "",
+			(cca_unsuitable && cpu_has_dc_aliases) ? " & " : "",
+			cpu_has_dc_aliases ? "dcache aliasing" : "");
 
 		for_each_present_cpu(c) {
 			if (cpu_data[c].core)
-- 
2.13.0
