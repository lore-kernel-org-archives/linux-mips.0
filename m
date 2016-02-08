Received: from mailapp01.imgtec.com ([195.59.15.196]:1276 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012049AbcBHSFrIHUjY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 8 Feb 2016 19:05:47 +0100
From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [PATCH] MIPS: Always page align TASK_SIZE
Date: Mon, 8 Feb 2016 18:05:23 +0000
Message-ID: <1454954723-24887-1-git-send-email-harvey.hunt@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Harvey.Hunt@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, David Daney <david.daney@cavium.com>, Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20160208180523.X-MqufZdoZFnCiB1NvXFXGyJKuoU0ZHl6nCoc0Ww-lA@z>

STACK_TOP_MAX is aligned on a 32k boundary. When __bprm_mm_init() creates an
initial stack for a process, it does so using STACK_TOP_MAX as the end of the
vma. A process's arguments and environment information are placed on the stack
and then the stack is relocated and aligned on a page boundary. When using a 32
bit kernel with 64k pages, the relocated stack has the process's args
erroneously stored in the middle of the stack. This means that processes
receive no arguments or environment variables, preventing them from running
correctly.

Fix this by aligning TASK_SIZE on a page boundary.

Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: David Daney <david.daney@cavium.com>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: James Hogan <james.hogan@imgtec.com>
Cc: linux-kernel@vger.kernel.org
---
 arch/mips/include/asm/processor.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/processor.h b/arch/mips/include/asm/processor.h
index 3f832c3..b618b40 100644
--- a/arch/mips/include/asm/processor.h
+++ b/arch/mips/include/asm/processor.h
@@ -39,13 +39,13 @@ extern unsigned int vced_count, vcei_count;
 #ifdef CONFIG_32BIT
 #ifdef CONFIG_KVM_GUEST
 /* User space process size is limited to 1GB in KVM Guest Mode */
-#define TASK_SIZE	0x3fff8000UL
+#define TASK_SIZE	(0x40000000UL - PAGE_SIZE)
 #else
 /*
  * User space process size: 2GB. This is hardcoded into a few places,
  * so don't change it unless you know what you are doing.
  */
-#define TASK_SIZE	0x7fff8000UL
+#define TASK_SIZE	(0x7fff8000UL & PAGE_SIZE)
 #endif
 
 #define STACK_TOP_MAX	TASK_SIZE
@@ -62,7 +62,7 @@ extern unsigned int vced_count, vcei_count;
  * support 16TB; the architectural reserve for future expansion is
  * 8192EB ...
  */
-#define TASK_SIZE32	0x7fff8000UL
+#define TASK_SIZE32	(0x7fff8000UL & PAGE_SIZE)
 #define TASK_SIZE64	0x10000000000UL
 #define TASK_SIZE (test_thread_flag(TIF_32BIT_ADDR) ? TASK_SIZE32 : TASK_SIZE64)
 #define STACK_TOP_MAX	TASK_SIZE64
-- 
2.7.1
