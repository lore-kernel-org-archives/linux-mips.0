Received: from mail-bl2lp0204.outbound.protection.outlook.com ([207.46.163.204]:24324
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6854789AbaE1WLCNNBdJ (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 29 May 2014 00:11:02 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH v2 07/13] MIPS: Add function get_ebase_cpunum
Date: Wed, 28 May 2014 23:52:10 +0200
Message-ID: <1401313936-11867-8-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1401313936-11867-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1401313936-11867-1-git-send-email-andreas.herrmann@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140528215210.ZRiw3iZin962eum3MJGDqC_BVT6cr-O_tfNJcW66y04@z>

From: David Daney <david.daney@cavium.com>

This returns the CPUNum from the low order Ebase bits.

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 arch/mips/include/asm/mipsregs.h |    9 +++++++++
 arch/mips/kernel/cpu-probe.c     |    2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

[andreas.herrmann:
  * Renamed function from mips_cpunum
  * Make use of function in cpu-probe.c]

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index fb2d174..98e9754 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1792,6 +1792,15 @@ __BUILD_SET_C0(brcm_cmt_ctrl)
 __BUILD_SET_C0(brcm_config)
 __BUILD_SET_C0(brcm_mode)
 
+/*
+ * Return low 10 bits of ebase.
+ * Note that under KVM (MIPSVZ) this returns vcpu id.
+ */
+static inline unsigned int get_ebase_cpunum(void)
+{
+	return read_c0_ebase() & 0x3ff;
+}
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* _ASM_MIPSREGS_H */
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index e8638c5..dfc6f62 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -423,7 +423,7 @@ static void decode_configs(struct cpuinfo_mips *c)
 
 #ifndef CONFIG_MIPS_CPS
 	if (cpu_has_mips_r2) {
-		c->core = read_c0_ebase() & 0x3ff;
+		c->core = get_ebase_cpunum();
 		if (cpu_has_mipsmt)
 			c->core >>= fls(core_nvpes()) - 1;
 	}
-- 
1.7.9.5
