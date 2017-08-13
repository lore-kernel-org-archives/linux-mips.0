Received: from mailapp01.imgtec.com ([195.59.15.196]:20117 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992036AbdHMEi5qIfxd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 13 Aug 2017 06:38:57 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 05/38] MIPS: CPS: Read GIC_VL_IDENT directly, not via irqchip driver
Date: Sat, 12 Aug 2017 21:36:13 -0700
Message-ID: <20170813043646.25821-6-paul.burton@imgtec.com>
In-Reply-To: <20170813043646.25821-1-paul.burton@imgtec.com>
References: <20170813043646.25821-1-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170813043613.Mv9xH6VEeji5TAspvfOA0sIOFuwS44Uv-4SlZlpyKyM@z>

Rather than calling the gic_read_local_vp_id() function from the GIC
irqchip driver, call read_gic_vl_ident() to read the GIC_VL_IDENT
register directly. This will allow us to remove gic_read_local_vp_id()
from the irqchip driver in a further patch, since that driver doesn't
actually care about the register's value.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/kernel/smp-cps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 0d9cda6a77de..c316a0f9e6fb 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -368,7 +368,7 @@ static void cps_init_secondary(void)
 		dmt();
 
 	if (mips_cm_revision() >= CM_REV_CM3) {
-		unsigned ident = gic_read_local_vp_id();
+		unsigned int ident = read_gic_vl_ident();
 
 		/*
 		 * Ensure that our calculation of the VP ID matches up with
-- 
2.14.0
