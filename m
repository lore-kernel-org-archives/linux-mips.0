Received: from mailapp01.imgtec.com ([195.59.15.196]:27378 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992087AbcIBOSzHtIc4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Sep 2016 16:18:55 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: netlogic: Fix assembler warning from smpboot.S
Date: Fri, 2 Sep 2016 15:18:21 +0100
Message-ID: <20160902141822.2350-1-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Jayachandran C <jchandra@broadcom.com>
Message-ID: <20160902141821.7ygmNttV42ls8a9PYJYKvXNf5Oy8nxXi6NalDDi2G00@z>

The netlogic platform can be built for either MIPS32 or MIPS64, and when
built for MIPS32 (as by nlm_xlr_defconfig) the use of the dla
pseudo-instruction leads to warnings such as the following from recent
versions of the GNU assembler:

  arch/mips/netlogic/common/smpboot.S: Assembler messages:
  arch/mips/netlogic/common/smpboot.S:62: Warning: dla used to load 32-bit register; recommend using la instead
  arch/mips/netlogic/common/smpboot.S:63: Warning: dla used to load 32-bit register; recommend using la instead

Avoid these warnings by using the PTR_LA macro to make use of the
appropriate la or dla pseudo-instruction for the build.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/netlogic/common/smpboot.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/netlogic/common/smpboot.S b/arch/mips/netlogic/common/smpboot.S
index f0cc4c9..509c1a7 100644
--- a/arch/mips/netlogic/common/smpboot.S
+++ b/arch/mips/netlogic/common/smpboot.S
@@ -59,8 +59,8 @@ NESTED(xlp_boot_core0_siblings, PT_SIZE, sp)
 	sync
 	/* find the location to which nlm_boot_siblings was relocated */
 	li	t0, CKSEG1ADDR(RESET_VEC_PHYS)
-	dla	t1, nlm_reset_entry
-	dla	t2, nlm_boot_siblings
+	PTR_LA	t1, nlm_reset_entry
+	PTR_LA	t2, nlm_boot_siblings
 	dsubu	t2, t1
 	daddu	t2, t0
 	/* call it */
-- 
2.9.3
