Received: from mailapp01.imgtec.com ([195.59.15.196]:57986 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011577AbaJ1Lal3oRkf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Oct 2014 12:30:41 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH] mips: cma: Do not reserve memory if not required
Date: Tue, 28 Oct 2014 11:28:34 +0000
Message-ID: <1414495714-40815-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Zubair.Kakakhel@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org, Zubair.Kakakhel@imgtec.com
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20141028112834.ybJG9jF6lSlAFXKVtM-FcUIHh0ocdmSi39iq0nvaU2w@z>

Even if CMA is disabled, the for_each_memblock macro expands
to run reserve_bootmem once. Hence, reserve_bootmem attempts to
reserve location 0 of size 0.

Add a check to avoid that.

Issue was highlighted during testing with EVA enabled.
resrve_bootmem used to exit gracefully when passed arguments to
reserve 0 size location at 0 without EVA.

But with EVA enabled, macros would point to different addresses
and the code would trigger a BUG.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Tested-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/setup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 938f157..eacfd7d 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -683,7 +683,8 @@ static void __init arch_mem_init(char **cmdline_p)
 	dma_contiguous_reserve(PFN_PHYS(max_low_pfn));
 	/* Tell bootmem about cma reserved memblock section */
 	for_each_memblock(reserved, reg)
-		reserve_bootmem(reg->base, reg->size, BOOTMEM_DEFAULT);
+		if (reg->size != 0)
+			reserve_bootmem(reg->base, reg->size, BOOTMEM_DEFAULT);
 }
 
 static void __init resource_init(void)
-- 
1.9.1
