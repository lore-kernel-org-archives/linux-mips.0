Received: from mailapp01.imgtec.com ([195.59.15.196]:18018 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992255AbcHaKpH0BBTD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 31 Aug 2016 12:45:07 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 09/10] MIPS: SMP: Wrap call to mips_cpc_lock_other in mips_cm_lock_other
Date: Wed, 31 Aug 2016 11:44:38 +0100
Message-ID: <1472640279-26593-10-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1472640279-26593-1-git-send-email-matt.redfearn@imgtec.com>
References: <1472640279-26593-1-git-send-email-matt.redfearn@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, James Hogan <james.hogan@imgtec.com>, Qais Yousef <qsyousef@gmail.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20160831104438.pGhicpbw9Q-xtdiHX4RVltNUgfIRCvoF9kg8vYer5Hk@z>

All calls to mips_cpc_lock_other should be wrapped in
mips_cm_lock_other. This only matters if the system has CM3 and is using
cpu idle, since otherwise a) the CPC lock is sufficent for CM < 3 and b)
any systems with CM > 3 have not been able to use cpu idle until now.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index f95f094f36e4..78ccd5388654 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -192,9 +192,11 @@ void mips_smp_send_ipi_mask(const struct cpumask *mask, unsigned int action)
 				continue;
 
 			while (!cpumask_test_cpu(cpu, &cpu_coherent_mask)) {
+				mips_cm_lock_other(core, 0);
 				mips_cpc_lock_other(core);
 				write_cpc_co_cmd(CPC_Cx_CMD_PWRUP);
 				mips_cpc_unlock_other();
+				mips_cm_unlock_other();
 			}
 		}
 	}
-- 
2.7.4
