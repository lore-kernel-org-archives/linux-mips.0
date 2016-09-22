Received: from mailapp01.imgtec.com ([195.59.15.196]:8376 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992100AbcIVLAIj8rTz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 22 Sep 2016 13:00:08 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] MIPS: smp-cps: Avoid BUG() when offlining pre-r6 CPUs
Date: Thu, 22 Sep 2016 11:59:47 +0100
Message-ID: <1474541987-26168-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, Qais Yousef <qais.yousef@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20160922105947.xt_ds-jYXIjzN6X7ZCtM1u_h2OEn_fOrY22PVUvFhb8@z>

Commit 0d2808f338c7 ("MIPS: smp-cps: Add support for CPU hotplug of
MIPSr6 processors") added a call to mips_cm_lock_other in order to lock
the CPC in CPUs containing a version 3 or higher Coherence Manager,
which use the general CM core other register, where previous CMs had a
dedicated core other register for the CPC.

A kernel BUG() is triggered, however, if mips_cm_lock_other is called
with a VP other than 0 on a CPU with CM < 3, a condition introduced by
0d2808f338c7.

Avoid the BUG() by always locking VP0 when locking the CPC, since the
required register, cpc_stat_conf, is shared by all vps in a core.

Fixes: 0d2808f338c7 ("MIPS: smp-cps: Add support for CPU hotplug...)

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

Ralf, it'd be great to get this into v4.8, if possible at this late
stage, to avoid the regression introduced in v4.8-rc1.

---
 arch/mips/kernel/smp-cps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index e9d9fc6c754c..6183ad84cc73 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -513,7 +513,7 @@ static void cps_cpu_die(unsigned int cpu)
 		 * in which case the CPC will refuse to power down the core.
 		 */
 		do {
-			mips_cm_lock_other(core, vpe_id);
+			mips_cm_lock_other(core, 0);
 			mips_cpc_lock_other(core);
 			stat = read_cpc_co_stat_conf();
 			stat &= CPC_Cx_STAT_CONF_SEQSTATE_MSK;
-- 
2.7.4
