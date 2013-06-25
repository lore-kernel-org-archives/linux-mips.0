Received: from multi.imgtec.com ([194.200.65.239]:8207 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6816521Ab3FYL3erJ3P4 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 25 Jun 2013 13:29:34 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: sibyte: Platform: Add load address for CONFIG_SIBYTE_LITTLESUR
Date: Tue, 25 Jun 2013 12:29:27 +0100
Message-ID: <1372159767-27554-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, sibyte-users@bitmover.com
Message-ID: <20130625112927.MpWVuq4PQYD5Pg76cV4aSdHMctKOAkLdGgyUyuz8K8A@z>

Fixes the following build problem:
mips-linux-gnu-ld:arch/mips/kernel/vmlinux.lds:253: syntax error

because VMLINUX_LOAD_ADDRESS was an empty string for that platform
so the vmlinux.lds.S created an invalid section entry on line 50.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Acked-by: Steven J. Hill <Steven.Hill@imgtec.com> 
Cc: sibyte-users@bitmover.com
---
This patch is for the upstream-sfr/mips-for-linux-next tree
---
 arch/mips/sibyte/Platform | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/sibyte/Platform b/arch/mips/sibyte/Platform
index d03a075..1bf90dc 100644
--- a/arch/mips/sibyte/Platform
+++ b/arch/mips/sibyte/Platform
@@ -41,3 +41,4 @@ load-$(CONFIG_SIBYTE_RHONE)	:= 0xffffffff80100000
 load-$(CONFIG_SIBYTE_SENTOSA)	:= 0xffffffff80100000
 load-$(CONFIG_SIBYTE_SWARM)	:= 0xffffffff80100000
 load-$(CONFIG_SIBYTE_BIGSUR)	:= 0xffffffff80100000
+load-$(CONFIG_SIBYTE_LITTLESUR) := 0xffffffff80100000
-- 
1.8.2.1
