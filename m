Received: from jaguar.aricent.com ([180.151.2.24]:41163 "EHLO
        jaguar.aricent.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27014481AbbALHIIxbMQ3 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 12 Jan 2015 08:08:08 +0100
From: Abhishek Paliwal <abhishek.paliwal@aricent.com>
Subject: [PATCH 3/9] MIPS Add function get ebase cpunum
Date: Mon, 12 Jan 2015 12:36:19 +0530
Message-ID: <1421046385-2535-4-git-send-email-abhishek.paliwal@aricent.com>
In-Reply-To: <1421046385-2535-1-git-send-email-abhishek.paliwal@aricent.com>
References: <1421046385-2535-1-git-send-email-abhishek.paliwal@aricent.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8BIT
Return-Path: <abhishek.paliwal@aricent.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: kexin.hao@windriver.com, bo.liu@windriver.com
Cc: Chandrakala.Chavva@caviumnetworks.com, rakesh.garg@aricent.com, Abhishek Paliwal <abhishek.paliwal@aricent.com>, David Daney <david.daney@cavium.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, linux-mips@linux-mips.org, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150112070619.773FEehQJPthykZfVhHrz8t-NcH0XqPC95tUDVB0Feo@z>

commit  45b585c8dcdc469bb40b58cc2801acd7a2332525 upstream

This returns the CPUNum from the low order Ebase bits.

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Cc: linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>
Cc: kvm@vger.kernel.org
Patchwork: https://patchwork.linux-mips.org/patch/7012/
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Abhishek Paliwal <abhishek.paliwal@aricent.com>
---
 arch/mips/include/asm/mipsregs.h | 8 ++++++++
 arch/mips/kernel/cpu-probe.c     | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index bbc3dd4..327f989 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1894,6 +1894,14 @@ __BUILD_SET_C0(brcm_cmt_ctrl)
 __BUILD_SET_C0(brcm_config)
 __BUILD_SET_C0(brcm_mode)

+/*
+ * Return low 10 bits of ebase.
+ * Note that under KVM (MIPSVZ) this returns vcpu id.
+ */
+static inline unsigned int get_ebase_cpunum(void)
+{
+       return read_c0_ebase() & 0x3ff;
+}
 #endif /* !__ASSEMBLY__ */

 #endif /* _ASM_MIPSREGS_H */
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 530f832..19432da 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -399,7 +399,7 @@ static void decode_configs(struct cpuinfo_mips *c)
        mips_probe_watch_registers(c);

        if (cpu_has_mips_r2)
-               c->core = read_c0_ebase() & 0x3ff;
+               c->core = get_ebase_cpunum();
 }

 #define R4K_OPTS (MIPS_CPU_TLB | MIPS_CPU_4KEX | MIPS_CPU_4K_CACHE \
--
1.8.1.4



"DISCLAIMER: This message is proprietary to Aricent and is intended solely for the use of the individual to whom it is addressed. It may contain privileged or confidential information and should not be circulated or used for any purpose other than for what it is intended. If you have received this message in error, please notify the originator immediately. If you are not the intended recipient, you are notified that you are strictly prohibited from using, copying, altering, or disclosing the contents of this message. Aricent accepts no responsibility for loss or damage arising from the use of the information transmitted by this email including damage from virus."
