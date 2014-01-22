Received: from multi.imgtec.com ([194.200.65.239]:24636 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6870558AbaAVOmDsIa5u (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 22 Jan 2014 15:42:03 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 8/8] MIPS: Select HAVE_ARCH_SECCOMP_FILTER
Date: Wed, 22 Jan 2014 14:40:04 +0000
Message-ID: <1390401604-11830-9-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1390401604-11830-1-git-send-email-markos.chandras@imgtec.com>
References: <1390401604-11830-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140122144004.NGCb03DAgI1Gjftg-xMLbdHIyCUdhkv60WoqQQ23i4I@z>

Reviewed-by: James Hogan <james.hogan@imgtec.com>
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f4c78c9..f1fac99 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -9,6 +9,7 @@ config MIPS
 	select HAVE_PERF_EVENTS
 	select PERF_USE_VMALLOC
 	select HAVE_ARCH_KGDB
+	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
 	select ARCH_HAVE_CUSTOM_GPIO_H
 	select HAVE_FUNCTION_TRACER
-- 
1.8.5.3
