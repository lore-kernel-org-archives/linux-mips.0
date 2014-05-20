Received: from mail-bl2lp0211.outbound.protection.outlook.com ([207.46.163.211]:27196
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6855086AbaETOtIiiqb2 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 20 May 2014 16:49:08 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH 07/15] MIPS: Add mips_cpunum() function.
Date: Tue, 20 May 2014 16:47:08 +0200
Message-ID: <1400597236-11352-8-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140520144708.V2nnUnY65EE0vd-83PQOaDTOv962B9sa5f6ijmg5Ks0@z>

From: David Daney <david.daney@cavium.com>

This returns the CPUNum from the low order Ebase bits.

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 arch/mips/include/asm/mipsregs.h |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 3e025b5..f110d48 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1916,6 +1916,11 @@ __BUILD_SET_C0(brcm_cmt_ctrl)
 __BUILD_SET_C0(brcm_config)
 __BUILD_SET_C0(brcm_mode)
 
+static inline unsigned int mips_cpunum(void)
+{
+	return read_c0_ebase() & 0x3ff; /* Low 10 bits of ebase. */
+}
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* _ASM_MIPSREGS_H */
-- 
1.7.9.5
