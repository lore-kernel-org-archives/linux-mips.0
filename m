Received: from mailapp01.imgtec.com ([195.59.15.196]:21148 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994847AbdHGXSaJciqI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Aug 2017 01:18:30 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: Prevent building MT support for microMIPS kernels
Date: Mon, 7 Aug 2017 16:18:04 -0700
Message-ID: <20170807231804.19920-1-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170807231804.ffJ5hMk5H3_gjkf5Kfy-4YTxuAPn0t50n9SMzAmn--c@z>

We don't currently support the MT ASE for microMIPS kernels, and there
are no CPUs currently in existence that use both. They can however both
be enabled in Kconfig, resulting in build failures such as:

  AS      arch/mips/kernel/cps-vec.o
arch/mips/kernel/cps-vec.S: Assembler messages:
arch/mips/kernel/cps-vec.S:242: Warning: the 32-bit microMIPS architecture does not support the `mt' extension
arch/mips/kernel/cps-vec.S:276: Error: unrecognized opcode `mttc0 $13,$2,2'
arch/mips/kernel/cps-vec.S:282: Error: unrecognized opcode `mttc0 $8,$1,2'
arch/mips/kernel/cps-vec.S:285: Error: unrecognized opcode `mttc0 $0,$2,1'
...

Fix this by preventing MT from being enabled when targeting microMIPS.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 12abdf4d3850..14ab86d7ea59 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2249,7 +2249,7 @@ config CPU_R4K_CACHE_TLB
 
 config MIPS_MT_SMP
 	bool "MIPS MT SMP support (1 TC on each available VPE)"
-	depends on SYS_SUPPORTS_MULTITHREADING && !CPU_MIPSR6
+	depends on SYS_SUPPORTS_MULTITHREADING && !CPU_MIPSR6 && !CPU_MICROMIPS
 	select CPU_MIPSR2_IRQ_VI
 	select CPU_MIPSR2_IRQ_EI
 	select SYNC_R4K
-- 
2.14.0
