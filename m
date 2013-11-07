Received: from relay1.mentorg.com ([192.94.38.131]:65080 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6823013Ab3KGSgMNC9L5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 7 Nov 2013 19:36:12 +0100
Date: Thu, 7 Nov 2013 18:35:54 +0000
From: "Maciej W. Rozycki" <macro@codesourcery.com>
Subject: [PATCH] MIPS: copy_to_user_page: Avoid ptrace(2) I-cache
 incoherency
Message-ID: <alpine.DEB.1.10.1311071758410.21686@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej_Rozycki@mentor.com>
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
Cc: linux-mips@linux-mips.org
Message-ID: <20131107183554.-a_u5zCy8-xEImWK7MykDQShLIs_a7MGcdMboMThAdY@z>

We currently support no MIPS processor that has its I-cache coherent with 
the D-cache, no such processor may even exist.  We apparently have two 
configurations that have fully coherent D-caches and therefore set 
cpu_has_ic_fills_f_dc, and these are the Alchemy and NetLogic processor 
families.  I have checked relevant CPU documentation I was able to track 
down and in both cases the respective documents[1][2] clearly state that 
the I-cache provides no hardware coherency and whenever instructions in 
memory are modified then the I-cache has to be synchronized by software 
even though the D-caches are fully coherent.

Therefore we cannot ever avoid the call to flush_cache_page in 
copy_to_user_page and here is a change that reflects this observation.  
The implementation of flush_cache_page may then choose freely whether it 
needs to perform a full cache synchronization with D-cache writeback and 
invalidation requests or whether a lone I-cache invalidation will suffice.  
The c-r4k.c implementation already respects the setting of 
cpu_has_ic_fills_f_dc and avoids touching the D-cache unless necessary.

The lack of I-cache synchronization is typically seen in debugging 
sessions e.g. with GDB where software breakpoints are used.  When such a 
breakpoint is hit and subsequently replaced using a ptrace(2) call with 
the original instruction, the BREAK instruction previously executed 
sometimes remains in the I-cache and causes the breakpoint just removed to 
hit again regardless, resulting in a spurious SIGTRAP signal delivery that 
debuggers typically complain about (e.g. "Program received signal SIGTRAP, 
Trace/breakpoint trap" in the case of GDB).  Of course the I-cache line 
containing the BREAK instruction may have since been randomly replaced, in 
which case no problem occurs.

[1] "AMD Alchemy Au1200 Processor Data Book", AMD Alchemy, January, 2005, 
    Publication ID: 32798A

[2] "XLP Processor Family Programming Reference Manual", NetLogic 
    Microsystems, Revision Level 1.10, February, 2011, Document Number 
    10724V110PM-CR (regrettably not publicly available)

Signed-off-by: Maciej W. Rozycki <macro@codesourcery.com>
---
Ralf,

 Please apply.  I've seen these SIGTRAPs in some NetLogic GDB testing and 
the removal of this cpu_has_ic_fills_f_dc condition from copy_to_user_page 
is really necessary; also the Au1200 document is very explicit about the 
requirement of I-cache invalidation in software (see Section 2.3.7.3 
"Instruction Cache Coherency").

  Maciej

linux-mips-exec-cache-sync.diff
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 3e0eb5f..1251d86 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -239,7 +239,7 @@ void copy_to_user_page(struct vm_area_struct *vma,
 		if (cpu_has_dc_aliases)
 			SetPageDcacheDirty(page);
 	}
-	if ((vma->vm_flags & VM_EXEC) && !cpu_has_ic_fills_f_dc)
+	if (vma->vm_flags & VM_EXEC)
 		flush_cache_page(vma, vaddr, page_to_pfn(page));
 }
 
