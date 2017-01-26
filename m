Received: from mail-ve1eur01on0097.outbound.protection.outlook.com ([104.47.1.97]:58080
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993893AbdAZOeobuL07 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 26 Jan 2017 15:34:44 +0100
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Subject: [PATCH] mips: vdso: Explicitly use -fno-asynchronous-unwind-tables
Date: Thu, 26 Jan 2017 15:34:08 +0100
Message-ID: <20170126143408.2456-1-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <alexander.sverdlin@nokia.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Cc: Alexander Sverdlin <alexander.sverdlin@nokia.com>, Robert Schiele <rschiele@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, "Maciej W. Rozycki" <macro@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20170126143408.mgBirYaVK5Ek35mkyZNF2wdlAR82MbiyfHjvW1i5jls@z>

From: Robert Schiele <rschiele@gmail.com>

Not every toolchain has -fno-asynchronous-unwind-tables per default on MIPS.
This patch specifies the necessary option explicitly for VDSO library build.

This prevents the following build failure:
GENVDSO arch/mips/vdso/vdso-image.c
arch/mips/vdso/genvdso: 'arch/mips/vdso/vdso.so.dbg' contains relocation sections
.../arch/mips/vdso/Makefile:84: recipe for target 'arch/mips/vdso/vdso-image.c' failed

Signed-off-by: Robert Schiele <rschiele@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>
Cc: "Maciej W. Rozycki" <macro@imgtec.com>
Cc: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index c3dc12a8b7d9..0512f56685c2 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -10,7 +10,7 @@ ccflags-vdso := \
 cflags-vdso := $(ccflags-vdso) \
 	$(filter -W%,$(filter-out -Wa$(comma)%,$(KBUILD_CFLAGS))) \
 	-O2 -g -fPIC -fno-strict-aliasing -fno-common -fno-builtin -G 0 \
-	-DDISABLE_BRANCH_PROFILING \
+	-DDISABLE_BRANCH_PROFILING -fno-asynchronous-unwind-tables \
 	$(call cc-option, -fno-stack-protector)
 aflags-vdso := $(ccflags-vdso) \
 	-D__ASSEMBLY__ -Wa,-gdwarf-2
-- 
2.11.0
