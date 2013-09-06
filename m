Received: from multi.imgtec.com ([194.200.65.239]:14241 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6815989Ab3IFJswLU11G (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 6 Sep 2013 11:48:52 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: Kconfig: CMP support needs to select SMP as well
Date: Fri, 6 Sep 2013 10:47:26 +0100
Message-ID: <1378460846-961-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20130906094726.lfpVIwQvtnaDzbF4KfQATa_D_bA4OkVmKYcHoG_Vai4@z>

The CMP code is only designed to work with SMP configurations.
Fixes multiple build problems on certain randconfigs:

In file included from arch/mips/kernel/smp-cmp.c:34:0:
arch/mips/include/asm/smp.h:28:0:
error: "raw_smp_processor_id" redefined [-Werror]

In file included from include/linux/sched.h:30:0,
from arch/mips/kernel/smp-cmp.c:22:
include/linux/smp.h:135:0: note: this is the location of the
previous definition

In file included from arch/mips/kernel/smp-cmp.c:34:0:
arch/mips/include/asm/smp.h:57:20:
error: redefinition of 'smp_send_reschedule'

In file included from include/linux/sched.h:30:0,
from arch/mips/kernel/smp-cmp.c:22:
include/linux/smp.h:179:20: note: previous
definition of 'smp_send_reschedule' was here

In file included from arch/mips/kernel/smp-cmp.c:34:0:
arch/mips/include/asm/smp.h: In function 'smp_send_reschedule':
arch/mips/include/asm/smp.h:61:8:
error: dereferencing pointer to incomplete type
[...]

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
This patch is for the upstream-sfr/mips-for-linux-next tree
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 04bdd82..6d8082d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1985,6 +1985,7 @@ config MIPS_VPE_APSP_API
 config MIPS_CMP
 	bool "MIPS CMP framework support"
 	depends on SYS_SUPPORTS_MIPS_CMP
+	select SMP
 	select SYNC_R4K
 	select SYS_SUPPORTS_SMP
 	select SYS_SUPPORTS_SCHED_SMT if SMP
-- 
1.8.3.2
