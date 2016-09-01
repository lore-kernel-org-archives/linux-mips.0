Received: from mailapp01.imgtec.com ([195.59.15.196]:33644 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992257AbcIAQbAuj7K2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 1 Sep 2016 18:31:00 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 3/9] MIPS: traps: Ensure full EBase is written
Date: Thu, 1 Sep 2016 17:30:09 +0100
Message-ID: <c4de81b497c4a02a2bec5abc5234b7d84b75c5ec.1472747205.git-series.james.hogan@imgtec.com>
In-Reply-To: <cover.d93e43428f3c573bdd18d7c874830705b39c3a8a.1472747205.git-series.james.hogan@imgtec.com>
References: <cover.d93e43428f3c573bdd18d7c874830705b39c3a8a.1472747205.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Leonid Yegoshin <leonid.yegoshin@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160901163009.LwjRHR_-pbe2-tPjUcdmTUPvEsu0LL3XZQCHX9kcc8c@z>

From: Matt Redfearn <matt.redfearn@imgtec.com>

On CPUs which support the EBase WG (write gate) flag, the most
significant bits of the exception base can be changed. Firmware running
on a VP(E) using MIPS rproc may change EBase to point into the user
segment where the firmware is located such that it can service
interrupts. When control is transferred back to the kernel the EBase
must be switched back into the kernel segment, such that the kernel's
exception vectors are used.

Similarly when vectored interrupts (vint) or vectored external interrupt
controllers (veic) are enabled an exception vector is allocated from
bootmem, and written to the EBase register. Due to the WG flag being
clear, only bits 29:12 will be written. Asside from the rproc case above
this is normally fine (as it will usually be a low allocation within the
KSeg0 range, however when Enhanced Virtual Addressing (EVA) is enabled
the allocation may be outside of the traditional KSeg0/KSeg1 address
range, resulting in the wrong EBase being written.

Correct both cases (configure_exception_vector() for the boot CPU, and
per_cpu_trap_init() for secondary CPUs) to write EBase with the WG flag
first if supported.

On the Malta EVA configuration, KSeg0 is mapped to physical address 0,
and memory is allocated from the KUSeg segment which is mapped to
physical address 0x80000000, which physically aliases the RAM at 0. This
only worked due to the exception base address aliasing the same
underlying RAM that was written to & cache flushed, and due to
flush_icache_range() going beyond the call of duty and flushing from the
L2 cache too (due to the differing physical addresses).

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Leonid Yegoshin <leonid.yegoshin@imgtec.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/kernel/traps.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index cb2419dc4651..4900e590d86e 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2091,6 +2091,14 @@ static void configure_exception_vector(void)
 {
 	if (cpu_has_veic || cpu_has_vint) {
 		unsigned long sr = set_c0_status(ST0_BEV);
+		/* If available, use WG to set top bits of EBASE */
+		if (cpu_has_ebase_wg) {
+#ifdef CONFIG_64BIT
+			write_c0_ebase_64(ebase | MIPS_EBASE_WG);
+#else
+			write_c0_ebase(ebase | MIPS_EBASE_WG);
+#endif
+		}
 		write_c0_ebase(ebase);
 		write_c0_status(sr);
 		/* Setting vector spacing enables EI/VI mode  */
@@ -2127,8 +2135,17 @@ void per_cpu_trap_init(bool is_boot_cpu)
 		 * We shouldn't trust a secondary core has a sane EBASE register
 		 * so use the one calculated by the boot CPU.
 		 */
-		if (!is_boot_cpu)
+		if (!is_boot_cpu) {
+			/* If available, use WG to set top bits of EBASE */
+			if (cpu_has_ebase_wg) {
+#ifdef CONFIG_64BIT
+				write_c0_ebase_64(ebase | MIPS_EBASE_WG);
+#else
+				write_c0_ebase(ebase | MIPS_EBASE_WG);
+#endif
+			}
 			write_c0_ebase(ebase);
+		}
 
 		cp0_compare_irq_shift = CAUSEB_TI - CAUSEB_IP;
 		cp0_compare_irq = (read_c0_intctl() >> INTCTLB_IPTI) & 7;
-- 
git-series 0.8.10
