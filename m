Received: from mailapp01.imgtec.com ([195.59.15.196]:3245 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009761AbcAVFUQZyeaz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Jan 2016 06:20:16 +0100
Date: Fri, 22 Jan 2016 05:20:37 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 2/7] MIPS: math-emu: dsemul: Fix ill formatting of microMIPS
 part
In-Reply-To: <alpine.DEB.2.00.1601220227590.5958@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1601220253500.5958@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1601220227590.5958@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
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
Cc: Aurelien Jarno <aurelien@aurel32.net>, linux-mips@linux-mips.org
Message-ID: <20160122052037.QIolxlmtdKdf3B5T5kuMhFcp0zvKWQAOTiHCi0i2rPI@z>

Correct formatting breakage introduced with commit 102cedc32a6e ("MIPS: 
microMIPS: Floating point support."), so that further changes to this 
code can be consistent.

Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
---
Ralf,

 Please apply; as I noted in 0/7 the structure of this code would become 
inconsistent with the next change or the change itself would have to break 
our formatting rules, to say nothing of legibility.  Consequently this 
change needs backporting to stable branches so that 3/7 can be backported 
as well.

 I'm all but happy about the style of this code itself BTW, the chains of 
casts of casts are not really needed, but I'll save a further clean-up for 
another day.

  Maciej

linux-umips-dsemul-format.diff
Index: linux-sfr-sead/arch/mips/math-emu/dsemul.c
===================================================================
--- linux-sfr-sead.orig/arch/mips/math-emu/dsemul.c	2016-01-22 01:21:57.194943000 +0000
+++ linux-sfr-sead/arch/mips/math-emu/dsemul.c	2016-01-22 01:57:12.640605000 +0000
@@ -75,10 +75,14 @@ int mips_dsemul(struct pt_regs *regs, mi
 		return SIGBUS;
 
 	if (get_isa16_mode(regs->cp0_epc)) {
-		err = __put_user(ir >> 16, (u16 __user *)(&fr->emul));
-		err |= __put_user(ir & 0xffff, (u16 __user *)((long)(&fr->emul) + 2));
-		err |= __put_user(BREAK_MATH >> 16, (u16 __user *)(&fr->badinst));
-		err |= __put_user(BREAK_MATH & 0xffff, (u16 __user *)((long)(&fr->badinst) + 2));
+		err = __put_user(ir >> 16,
+				 (u16 __user *)(&fr->emul));
+		err |= __put_user(ir & 0xffff,
+				  (u16 __user *)((long)(&fr->emul) + 2));
+		err |= __put_user(BREAK_MATH >> 16,
+				  (u16 __user *)(&fr->badinst));
+		err |= __put_user(BREAK_MATH & 0xffff,
+				  (u16 __user *)((long)(&fr->badinst) + 2));
 	} else {
 		err = __put_user(ir, &fr->emul);
 		err |= __put_user((mips_instruction)BREAK_MATH, &fr->badinst);
@@ -125,8 +129,10 @@ int do_dsemulret(struct pt_regs *xcp)
 	 *  - Is the following memory word the BD_COOKIE?
 	 */
 	if (get_isa16_mode(xcp->cp0_epc)) {
-		err = __get_user(instr[0], (u16 __user *)(&fr->badinst));
-		err |= __get_user(instr[1], (u16 __user *)((long)(&fr->badinst) + 2));
+		err = __get_user(instr[0],
+				 (u16 __user *)(&fr->badinst));
+		err |= __get_user(instr[1],
+				  (u16 __user *)((long)(&fr->badinst) + 2));
 		insn = (instr[0] << 16) | instr[1];
 	} else {
 		err = __get_user(insn, &fr->badinst);
