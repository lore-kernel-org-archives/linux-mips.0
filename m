Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:54496 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991068AbeAVQfiHYwaH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 22 Jan 2018 17:35:38 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH] MIPS: KASLR: Drop relocatable fixup from reservation_init
Date: Mon, 22 Jan 2018 16:33:31 +0000
Message-ID: <1516638811-24880-1-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <20180117222312.14763-1-fancer.lancer@gmail.com>
References: <20180117222312.14763-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <20180122163331.ljDOSX8BysLqcGFjWXrzigCcC7MtagLlfgBSCVInxkU@z>

A recent change ("MIPS: memblock: Discard bootmem initialization")
removed the reservation of all memory below the kernel's _end symbol in
bootmem. This makes the call to free_bootmem unnecessary, since the
memory region is no longer marked reserved.

Additionally, ("MIPS: memblock: Print out kernel virtual mem
layout") added a display of the kernel's virtual memory layout, so
printing the relocation information at this point is redundant.

Remove this section of code.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>

---

This patch (or a derivative of it) tidies up some of the bootmem init code
when CONFIG_RELOCATABLE is active during the switch to memblock - please
can you include in the series?

Thanks,
Matt
---
 arch/mips/kernel/setup.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 99bfaa6b9279..a0eac8160750 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -536,29 +536,6 @@ static void __init reservation_init(void)
 		}
 	}
 
-#ifdef CONFIG_RELOCATABLE
-	/*
-	 * The kernel reserves all memory below its _end symbol as bootmem,
-	 * but the kernel may now be at a much higher address. The memory
-	 * between the original and new locations may be returned to the system.
-	 */
-	if (__pa_symbol(_text) > __pa_symbol(VMLINUX_LOAD_ADDRESS)) {
-		unsigned long offset;
-		extern void show_kernel_relocation(const char *level);
-
-		offset = __pa_symbol(_text) - __pa_symbol(VMLINUX_LOAD_ADDRESS);
-		free_bootmem(__pa_symbol(VMLINUX_LOAD_ADDRESS), offset);
-
-#if defined(CONFIG_DEBUG_KERNEL) && defined(CONFIG_DEBUG_INFO)
-		/*
-		 * This information is necessary when debugging the kernel
-		 * But is a security vulnerability otherwise!
-		 */
-		show_kernel_relocation(KERN_INFO);
-#endif
-	}
-#endif
-
 	/*
 	 * Reserve initrd memory if needed.
 	 */
-- 
2.7.4
