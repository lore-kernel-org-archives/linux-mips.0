Received: from multi.imgtec.com ([194.200.65.239]:44781 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827367AbaA0U0DiWddO (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 21:26:03 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 47/58] MIPS: mm: init: Add free_init_pages() callback for EVA
Date: Mon, 27 Jan 2014 20:19:34 +0000
Message-ID: <1390853985-14246-48-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
References: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140127201934.BXzsPZx_UG4ShzRdSldHOXk3Rl6uCY5dlu6E6HW0Bc4@z>

A core in EVA mode can have any possible segment mapping, so the
default free_initmem_default() function may not always work as expected.
Therefore, add a callback that platforms can use to free up the init section.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/bootinfo.h |  2 ++
 arch/mips/mm/init.c              | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 4d2cdea..83a4db4e 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -112,6 +112,8 @@ extern void prom_free_prom_memory(void);
 extern void free_init_pages(const char *what,
 			    unsigned long begin, unsigned long end);
 
+extern void (*free_init_pages_eva)(void *begin, void *end);
+
 /*
  * Initial kernel command line, usually setup by prom_init()
  */
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 6b59617..4fc74c7 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -422,10 +422,20 @@ void free_initrd_mem(unsigned long start, unsigned long end)
 }
 #endif
 
+void (*free_init_pages_eva)(void *begin, void *end) = NULL;
+
 void __init_refok free_initmem(void)
 {
 	prom_free_prom_memory();
-	free_initmem_default(POISON_FREE_INITMEM);
+	/*
+	 * Let the platform define a specific function to free the
+	 * init section since EVA may have used any possible mapping
+	 * between virtual and physical addresses.
+	 */
+	if (free_init_pages_eva)
+		free_init_pages_eva((void *)&__init_begin, (void *)&__init_end);
+	else
+		free_initmem_default(POISON_FREE_INITMEM);
 }
 
 #ifndef CONFIG_MIPS_PGD_C0_CONTEXT
-- 
1.8.5.3
