Received: from mailapp01.imgtec.com ([195.59.15.196]:37841 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27024632AbcCAWT7ukJO- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 1 Mar 2016 23:19:59 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 3/4] MIPS: Add and use CAUSEF_WP definition
Date: Tue, 1 Mar 2016 22:19:38 +0000
Message-ID: <1456870779-21007-4-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1456870779-21007-1-git-send-email-james.hogan@imgtec.com>
References: <1456870779-21007-1-git-send-email-james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160301221938.OpHAoVjhWIp58ZY8EQiwTtAi7APD4BOEYkCLqK01e10@z>

do_watch() clears bit 22 of cause without using a CAUSEF_* definition
from mipsregs.h. Add a definition for this bit (CAUSEF_WP) and make use
of it. Also use clear_c0_cause() instead of manual read/modify/write.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/include/asm/mipsregs.h | 2 ++
 arch/mips/kernel/traps.c         | 5 +----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 3ad19ad04d8a..f7e3215ca2f6 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -390,6 +390,8 @@
 #define	 CAUSEF_IP7		(_ULCAST_(1)   << 15)
 #define CAUSEB_FDCI		21
 #define CAUSEF_FDCI		(_ULCAST_(1)   << 21)
+#define CAUSEB_WP		22
+#define CAUSEF_WP		(_ULCAST_(1)   << 22)
 #define CAUSEB_IV		23
 #define CAUSEF_IV		(_ULCAST_(1)   << 23)
 #define CAUSEB_PCI		26
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index ae790c575d4f..6ee2443c6fd5 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -1494,16 +1494,13 @@ asmlinkage void do_mdmx(struct pt_regs *regs)
 asmlinkage void do_watch(struct pt_regs *regs)
 {
 	enum ctx_state prev_state;
-	u32 cause;
 
 	prev_state = exception_enter();
 	/*
 	 * Clear WP (bit 22) bit of cause register so we don't loop
 	 * forever.
 	 */
-	cause = read_c0_cause();
-	cause &= ~(1 << 22);
-	write_c0_cause(cause);
+	clear_c0_cause(CAUSEF_WP);
 
 	/*
 	 * If the current thread has the watch registers loaded, save
-- 
2.4.10
