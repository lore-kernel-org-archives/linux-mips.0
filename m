Received: from mailapp02.imgtec.com ([217.156.133.132]:11771 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23991759AbcJGJYJfdoAY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 7 Oct 2016 11:24:09 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: VDSO: Drop duplicated -I*/-E* aflags
Date: Fri, 7 Oct 2016 10:23:46 +0100
Message-ID: <21016db2fc628c73bc6efa1530ebeb866a30d6ae.1475832139.git-series.james.hogan@imgtec.com>
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
Cc: "Maciej W . Rozycki" <macro@imgtec.com>, James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20161007092346.SINQ35YEL2IbLY3H2yDFL0kcnyHc6gcPlt8-LiOQW0s@z>

The aflags-vdso is based on ccflags-vdso, which already contains the -I*
and -EL/-EB flags from KBUILD_CFLAGS, but those flags are needlessly
added again to aflags-vdso.

Drop the duplication.

Reported-by: Maciej W. Rozycki <macro@imgtec.com>
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/vdso/Makefile | 2 --
 1 file changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index de9e8836d248..c3dc12a8b7d9 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -13,8 +13,6 @@ cflags-vdso := $(ccflags-vdso) \
 	-DDISABLE_BRANCH_PROFILING \
 	$(call cc-option, -fno-stack-protector)
 aflags-vdso := $(ccflags-vdso) \
-	$(filter -I%,$(KBUILD_CFLAGS)) \
-	$(filter -E%,$(KBUILD_CFLAGS)) \
 	-D__ASSEMBLY__ -Wa,-gdwarf-2
 
 #
-- 
git-series 0.8.10
