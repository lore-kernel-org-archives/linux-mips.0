Received: from mailapp01.imgtec.com ([195.59.15.196]:18206 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992155AbdC3VQ7EijEH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 30 Mar 2017 23:16:59 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: MSP71xx: Fix missing asm/setup.h include
Date: Thu, 30 Mar 2017 14:16:32 -0700
Message-ID: <20170330211633.29731-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, trivial@kernel.org
Message-ID: <20170330211632.Y_G8NkBwEl8JtmCNkRSIv0I7fw0qXC2-XrLPs0hDEpo@z>

Building msp71xx_defconfig currently fails due to a missing inclusion of
asm/setup.h leading to:

  arch/mips/pmcs-msp71xx/msp_smp.c: In function ‘msp_vsmp_int_init’:
  arch/mips/pmcs-msp71xx/msp_smp.c:72:2: error: implicit declaration of
  function ‘set_vi_handler’ [-Werror=implicit-function-declaration]
    set_vi_handler(MIPS_CPU_IPI_RESCHED_IRQ, ipi_resched_dispatch);
    ^
  cc1: all warnings being treated as errors

Fix this by including asm/setup.h to obtain the declaration of
set_vi_handler().

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: trivial@kernel.org

---

 arch/mips/pmcs-msp71xx/msp_smp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/pmcs-msp71xx/msp_smp.c b/arch/mips/pmcs-msp71xx/msp_smp.c
index ffa0f7101a97..6441bd2514c5 100644
--- a/arch/mips/pmcs-msp71xx/msp_smp.c
+++ b/arch/mips/pmcs-msp71xx/msp_smp.c
@@ -21,6 +21,7 @@
  */
 #include <linux/smp.h>
 #include <linux/interrupt.h>
+#include <asm/setup.h>
 
 #ifdef CONFIG_MIPS_MT_SMP
 #define MIPS_CPU_IPI_RESCHED_IRQ 0	/* SW int 0 for resched */
-- 
2.12.1
