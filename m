Received: from 19pmail.ess.barracuda.com ([64.235.154.230]:34218 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993070AbdKAXUcUVRke convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 2 Nov 2017 00:20:32 +0100
From: James Hogan <james.hogan@mips.com>
Subject: [PATCH] MIPS: smp-cmp: Fix vpe_id build error
Date: Wed, 1 Nov 2017 23:20:23 +0000
Message-ID: <20171101232023.19287-1-james.hogan@mips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-Path: <James.Hogan@mips.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Message-ID: <20171101232023.Mp5L9C4z33GXVematFgkavJIB4cyzuzEraynwD9sxlk@z>

From: James Hogan <jhogan@kernel.org>

The smp-cmp build has been (further) broken since commit 856fbcee6099
("MIPS: Store core & VP IDs in GlobalNumber-style variable") in
v4.14-rc1 like so:

arch/mips/kernel/smp-cmp.c: In function ‘cmp_init_secondary’:
arch/mips/kernel/smp-cmp.c:53:4: error: ‘struct cpuinfo_mips’ has no member named ‘vpe_id’
   c->vpe_id = (read_c0_tcbind() >> TCBIND_CURVPE_SHIFT) &
    ^

Fix by replacing vpe_id with cpu_set_vpe_id().

Fixes: 856fbcee6099 ("MIPS: Store core & VP IDs in GlobalNumber-style variable")
Signed-off-by: James Hogan <jhogan@kernel.org>
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/kernel/smp-cmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/smp-cmp.c b/arch/mips/kernel/smp-cmp.c
index 415e4d19f897..a2322009cac3 100644
--- a/arch/mips/kernel/smp-cmp.c
+++ b/arch/mips/kernel/smp-cmp.c
@@ -50,8 +50,8 @@ static void cmp_init_secondary(void)
 
 #ifdef CONFIG_MIPS_MT_SMP
 	if (cpu_has_mipsmt)
-		c->vpe_id = (read_c0_tcbind() >> TCBIND_CURVPE_SHIFT) &
-			TCBIND_CURVPE;
+		cpu_set_vpe_id(c, (read_c0_tcbind() >> TCBIND_CURVPE_SHIFT) &
+				  TCBIND_CURVPE);
 #endif
 }
 
-- 
2.14.1
