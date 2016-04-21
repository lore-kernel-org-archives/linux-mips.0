Received: from mailapp01.imgtec.com ([195.59.15.196]:18404 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026986AbcDUL0Fazsg4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 21 Apr 2016 13:26:05 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: Allow emulation for unaligned [LS]DXC1 instructions
Date: Thu, 21 Apr 2016 12:25:38 +0100
Message-ID: <1461237938-15228-1-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <20160421101923.GA24852@aurel32.net>
References: <20160421101923.GA24852@aurel32.net>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Aurelien Jarno <aurelien@aurel32.net>
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20160421112538.LwfSfSHMpEFNT5sw66mBI5gbHLqKRpCFVXSquRZHpRY@z>

If an address error exception occurs for a LDXC1 or SDXC1 instruction,
within the cop1x opcode space, allow it to be passed through to the FPU
emulator rather than resulting in a SIGILL. This causes LDXC1 & SDXC1 to
be handled in a manner consistent with the more common LDC1 & SDC1
instructions.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
---
Hi Aurelien,

Thanks for tracking that down. Does this simple patch fix your problem?

Thanks,
    Paul
---
 arch/mips/kernel/unaligned.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
index 5c62065..28b3af7 100644
--- a/arch/mips/kernel/unaligned.c
+++ b/arch/mips/kernel/unaligned.c
@@ -1191,6 +1191,7 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 	case ldc1_op:
 	case swc1_op:
 	case sdc1_op:
+	case cop1x_op:
 		die_if_kernel("Unaligned FP access in kernel code", regs);
 		BUG_ON(!used_math());
 
-- 
2.8.0
