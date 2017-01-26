Received: from mail-ve1eur01on0128.outbound.protection.outlook.com ([104.47.1.128]:3584
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993890AbdAZPBH4KY77 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 26 Jan 2017 16:01:07 +0100
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Subject: [PATCH v2] mips: vdso: Explicitly use -fno-asynchronous-unwind-tables
Date: Thu, 26 Jan 2017 16:00:05 +0100
Message-ID: <20170126150005.2621-1-alexander.sverdlin@nokia.com>
In-Reply-To: <alpine.DEB.2.00.1701261445520.13564@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1701261445520.13564@tp.orcam.me.uk>
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
Message-ID: <20170126150005.X4-yXvK0u3Fx0vj5X78gFuEhQngIHajKTnUhL3ZIpK4@z>

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
 arch/mips/vdso/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index c3dc12a8b7d9..c08077e43e73 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -11,6 +11,7 @@ cflags-vdso := $(ccflags-vdso) \
 	$(filter -W%,$(filter-out -Wa$(comma)%,$(KBUILD_CFLAGS))) \
 	-O2 -g -fPIC -fno-strict-aliasing -fno-common -fno-builtin -G 0 \
 	-DDISABLE_BRANCH_PROFILING \
+	$(call cc-option, -fno-asynchronous-unwind-tables) \
 	$(call cc-option, -fno-stack-protector)
 aflags-vdso := $(ccflags-vdso) \
 	-D__ASSEMBLY__ -Wa,-gdwarf-2
-- 
2.11.0
