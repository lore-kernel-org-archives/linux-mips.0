Received: from mailapp01.imgtec.com ([195.59.15.196]:3396 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6842530AbaGVIa1p4HqP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Jul 2014 10:30:27 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id ACC529550CDAE
        for <linux-mips@linux-mips.org>; Tue, 22 Jul 2014 09:29:59 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: Kconfig: Select SMP symbols for CMP
Date: Tue, 22 Jul 2014 09:29:34 +0100
Message-ID: <1406017774-2187-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140722082934.sO3Jp005IgvV7Oz102oRQZsmeAZT4SqEQBzQrpzcEmI@z>

CMP is an SMP implementation, and as a result of which, it needs
to select the SYS_SUPPORTS_SMP and SMP symbols. This fixes the
following build problem when CMP is enabled but SMP is not.

In file included from arch/mips/kernel/smp-cmp.c:34:0:
./arch/mips/include/asm/smp.h:26:0: error: "raw_smp_processor_id" redefined
[-Werror]
 #define raw_smp_processor_id() (current_thread_info()->cpu)
[...]
In file included from arch/mips/kernel/smp-cmp.c:34:0:
./arch/mips/include/asm/smp.h:59:20: error: redefinition of
'smp_send_reschedule'
[...]
./arch/mips/include/asm/smp.h: In function 'smp_send_reschedule':
./arch/mips/include/asm/smp.h:63:8: error: dereferencing pointer to incomplete
type

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4e238e6e661c..9e3b67c65a32 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2026,7 +2026,9 @@ config MIPS_CMP
 	bool "MIPS CMP framework support (DEPRECATED)"
 	depends on SYS_SUPPORTS_MIPS_CMP
 	select MIPS_GIC_IPI
+	select SMP
 	select SYNC_R4K
+	select SYS_SUPPORTS_SMP
 	select WEAK_ORDERING
 	default n
 	help
-- 
2.0.2
