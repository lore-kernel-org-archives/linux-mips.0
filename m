Received: from relay1.mentorg.com ([192.94.38.131]:64449 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013838AbaKQQKJToKpb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Nov 2014 17:10:09 +0100
Date: Mon, 17 Nov 2014 16:09:54 +0000
From: "Maciej W. Rozycki" <macro@codesourcery.com>
Subject: [PATCH 1/2] MIPS: jump_label.c: Correct the span of the J
 instruction
Message-ID: <alpine.DEB.1.10.1411170524070.2881@tp.orcam.me.uk>
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
Message-ID: <20141117160954.qjl6ophwCwYZWI52hGpmziTDjIrVlTB0P3sT69NK2qs@z>

Correct the check for the span of the 256MB segment addressable by the J 
instruction according to this instruction's semantics.  The calculation 
of the jump target is applied to the address of the delay-slot 
instruction that immediately follows.  Adjust the check accordingly by 
adding 4 to `e->code' that holds the address of the J instruction 
itself.

Signed-off-by: Maciej W. Rozycki <macro@codesourcery.com>
---
Hi,

 I wonder why people still make this mistake, now that the architecture 
has been around for nearly 30 years now...  Please apply.

  Maciej

linux-mips-jump-label-range.diff
Index: linux-3.17-stable-malta/arch/mips/kernel/jump_label.c
===================================================================
--- linux-3.17-stable-malta.orig/arch/mips/kernel/jump_label.c	2014-11-17 02:12:17.000000000 +0000
+++ linux-3.17-stable-malta/arch/mips/kernel/jump_label.c	2014-11-17 02:22:04.741976773 +0000
@@ -27,8 +27,8 @@ void arch_jump_label_transform(struct ju
 	union mips_instruction *insn_p =
 		(union mips_instruction *)(unsigned long)e->code;
 
-	/* Jump only works within a 256MB aligned region. */
-	BUG_ON((e->target & ~J_RANGE_MASK) != (e->code & ~J_RANGE_MASK));
+	/* Jump only works within a 256MB aligned region of its delay slot. */
+	BUG_ON((e->target & ~J_RANGE_MASK) != ((e->code + 4) & ~J_RANGE_MASK));
 
 	/* Target must have 4 byte alignment. */
 	BUG_ON((e->target & 3) != 0);
