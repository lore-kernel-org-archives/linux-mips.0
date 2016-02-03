Received: from mailapp01.imgtec.com ([195.59.15.196]:13278 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009237AbcBCDQxHC580 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Feb 2016 04:16:53 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 02/15] MIPS: traps: Make sure secondary cores have a sane ebase register
Date: Wed, 3 Feb 2016 03:15:22 +0000
Message-ID: <1454469335-14778-3-git-send-email-paul.burton@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Petri Gynther <pgynther@google.com>
Message-ID: <20160203031522.XR8WhUY-dSamPokkhs0gBmUw1aT4QP1rld3NNDXBDtQ@z>

From: Markos Chandras <markos.chandras@imgtec.com>

We shouldn't trust that the secondary cores will have a sane ebase register
(either from the bootloader or during the hardware design phase) so use the
ebase address as calculated by the boot CPU.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/traps.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index bafcb7a..1fb5f8a 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2125,6 +2125,13 @@ void per_cpu_trap_init(bool is_boot_cpu)
 	 *  o read IntCtl.IPFDC to determine the fast debug channel interrupt
 	 */
 	if (cpu_has_mips_r2_r6) {
+		/*
+		 * We shouldn't trust a secondary core has a sane EBASE register
+		 * so use the one calculated by the boot CPU.
+		 */
+		if (!is_boot_cpu)
+			write_c0_ebase(ebase);
+
 		cp0_compare_irq_shift = CAUSEB_TI - CAUSEB_IP;
 		cp0_compare_irq = (read_c0_intctl() >> INTCTLB_IPTI) & 7;
 		cp0_perfcount_irq = (read_c0_intctl() >> INTCTLB_IPPCI) & 7;
-- 
2.7.0
