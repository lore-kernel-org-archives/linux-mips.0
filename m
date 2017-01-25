Received: from mailapp01.imgtec.com ([195.59.15.196]:33223 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993882AbdAYRAhzgsnk (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Jan 2017 18:00:37 +0100
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] MIPS: IRQ Stack: Fix erroneous jal to plat_irq_dispatch
Date: Wed, 25 Jan 2017 17:00:25 +0000
Message-ID: <1485363625-10789-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170125170025.OBrhhDkRCjzw48d4dFjkW03I_KzY760Eepx2qkE8Xhg@z>

Commit dda45f701c9d ("MIPS: Switch to the irq_stack in interrupts")
changed both the normal and vectored interrupt handlers. Unfortunately
the vectored version, "except_vec_vi_handler", was incorrectly modified
to unconditionally jal to plat_irq_dispatch, rather than doing a jalr to
the vectored handler that has been set up. This is ok for many platforms
which set the vectored handler to plat_irq_dispatch anyway, but will
cause problems with platforms that use other handlers.

Fixes: dda45f701c9d ("MIPS: Switch to the irq_stack in interrupts")
Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

Ralf, if possible please could you squash this?

---
 arch/mips/kernel/genex.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index 0a7ba4b2f687..7ec9612cb007 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -329,7 +329,7 @@ NESTED(except_vec_vi_handler, 0, sp)
 	PTR_ADD sp, t0, t1
 
 2:
-	jal	plat_irq_dispatch
+	jalr	v0
 
 	/* Restore sp */
 	move	sp, s1
-- 
2.7.4
