Received: from mailapp01.imgtec.com ([195.59.15.196]:58857 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012958AbaKQJahiBqJi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Nov 2014 10:30:37 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: asm: uaccess: Add v1 register to clobber list on EVA
Date: Mon, 17 Nov 2014 09:30:23 +0000
Message-ID: <1416216623-24300-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, stable@vger.kernel.org
Message-ID: <20141117093023._551Z-Nz0Z-EUBAXsT54gvIQs293Q6r3sLcC7ROsk_c@z>

When EVA is turned on and prefetching is being used in memcpy.S,
the v1 register is being used as a helper register to the PREFE
instruction. However, v1 ($3) was not in the clobber list, which
means that the compiler did not preserve it across function calls,
and that could corrupt the value of the register leading to all
sorts of userland crashes. We fix this problem by using the
DADDI_SCRATCH macro to define the clobbered register when
CONFIG_EVA && CONFIG_CPU_HAS_PREFETCH are enabled.

Cc: <stable@vger.kernel.org> # v3.15+
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/uaccess.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
index 6e057aa55b8e..9cbd2949ce19 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -773,10 +773,11 @@ extern void __put_user_unaligned_unknown(void);
 	"jal\t" #destination "\n\t"
 #endif
 
-#ifndef CONFIG_CPU_DADDI_WORKAROUNDS
-#define DADDI_SCRATCH "$0"
-#else
+#if defined(CONFIG_CPU_DADDI_WORKAROUNDS) || (defined(CONFIG_EVA) &&	\
+					      defined(CONFIG_CPU_HAS_PREFETCH))
 #define DADDI_SCRATCH "$3"
+#else
+#define DADDI_SCRATCH "$0"
 #endif
 
 extern size_t __copy_user(void *__to, const void *__from, size_t __n);
-- 
2.1.3
