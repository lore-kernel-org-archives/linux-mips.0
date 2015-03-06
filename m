Received: from nivc-ms1.auriga.com ([80.240.102.146]:30099 "EHLO
        nivc-ms1.auriga.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007216AbbCFLEwvDjqm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 6 Mar 2015 12:04:52 +0100
From: Aleksey Makarov <aleksey.makarov@auriga.com>
Subject: [PATCH v2] MIPS: OCTEON: Use correct CSR to soft reset
Date: Fri, 6 Mar 2015 14:02:21 +0300
Message-ID: <1425639742-8774-1-git-send-email-aleksey.makarov@auriga.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <aleksey.makarov@auriga.com>
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
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Aleksey Makarov <aleksey.makarov@auriga.com>, Chandrakala Chavva <cchavva@caviumnetworks.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150306110221.2FpRUcuBAtYzE0PKgRmstsT8kmJbE1mKTFWiZfDfuT8@z>

From: Chandrakala Chavva <cchavva@caviumnetworks.com>

Also delete unused cvmx_reset_octeon()
This fixes reboot for Octeon III boards

Signed-off-by: Chandrakala Chavva <cchavva@caviumnetworks.com>
Signed-off-by: Aleksey Makarov <aleksey.makarov@auriga.com>
---
 arch/mips/cavium-octeon/setup.c     | 5 ++++-
 arch/mips/include/asm/octeon/cvmx.h | 8 --------
 2 files changed, 4 insertions(+), 9 deletions(-)

Changes in v2:
- cvmx_reset_octeon() is removed

v1:
https://lkml.kernel.org/g/<1425567974-31912-1-git-send-email-aleksey.makarov@auriga.com>


diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 01130e9..73348af 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -416,7 +416,10 @@ static void octeon_restart(char *command)
 
 	mb();
 	while (1)
-		cvmx_write_csr(CVMX_CIU_SOFT_RST, 1);
+		if (OCTEON_IS_OCTEON3())
+			cvmx_write_csr(CVMX_RST_SOFT_RST, 1);
+		else
+			cvmx_write_csr(CVMX_CIU_SOFT_RST, 1);
 }
 
 
diff --git a/arch/mips/include/asm/octeon/cvmx.h b/arch/mips/include/asm/octeon/cvmx.h
index 33db1c8..774bb45 100644
--- a/arch/mips/include/asm/octeon/cvmx.h
+++ b/arch/mips/include/asm/octeon/cvmx.h
@@ -436,14 +436,6 @@ static inline uint64_t cvmx_get_cycle_global(void)
 
 /***************************************************************************/
 
-static inline void cvmx_reset_octeon(void)
-{
-	union cvmx_ciu_soft_rst ciu_soft_rst;
-	ciu_soft_rst.u64 = 0;
-	ciu_soft_rst.s.soft_rst = 1;
-	cvmx_write_csr(CVMX_CIU_SOFT_RST, ciu_soft_rst.u64);
-}
-
 /* Return the number of cores available in the chip */
 static inline uint32_t cvmx_octeon_num_cores(void)
 {
-- 
2.3.0
