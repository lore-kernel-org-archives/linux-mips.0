Received: from mailapp01.imgtec.com ([195.59.15.196]:25383 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992247AbcIAQawfa-22 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 1 Sep 2016 18:30:52 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 1/9] MIPS: traps: 64bit kernels should read CP0_EBase 64bit
Date: Thu, 1 Sep 2016 17:30:07 +0100
Message-ID: <e826225b15736539cd96a1b6b2a99e2bb2b4eb87.1472747205.git-series.james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Matt Redfearn <matt.redfearn@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160901163007.1FmA7OBj5B-fKCXR9393dxawHshLGQnP53Lf2Ntv9_g@z>

When reading the CP0_EBase register containing the WG (write gate) bit,
the ebase variable should be set to the full value of the register, i.e.
on a 64-bit kernel the full 64-bit width of the register via
read_cp0_ebase_64(), and on a 32-bit kernel the full 32-bit width
including bits 31:30 which may be writeable.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/kernel/traps.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 3de85be2486a..686903f62fa3 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2214,8 +2214,17 @@ void __init trap_init(void)
 	} else {
 		ebase = CAC_BASE;
 
-		if (cpu_has_mips_r2_r6)
-			ebase += (read_c0_ebase() & 0x3ffff000);
+		if (cpu_has_mips_r2_r6) {
+			if (cpu_has_ebase_wg) {
+#ifdef CONFIG_64BIT
+				ebase = (read_c0_ebase_64() & ~0xfff);
+#else
+				ebase = (read_c0_ebase() & ~0xfff);
+#endif
+			} else {
+				ebase += (read_c0_ebase() & 0x3ffff000);
+			}
+		}
 	}
 
 	if (cpu_has_mmips) {
-- 
git-series 0.8.10
