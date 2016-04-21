Received: from mailapp01.imgtec.com ([195.59.15.196]:37336 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27027252AbcDUNGPuGKej (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 21 Apr 2016 15:06:15 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 03/11] MIPS: inst: Declare fsel_op for sel.fmt instruction
Date: Thu, 21 Apr 2016 14:04:47 +0100
Message-ID: <1461243895-30371-4-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1461243895-30371-1-git-send-email-paul.burton@imgtec.com>
References: <1461243895-30371-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, "Maciej W. Rozycki" <macro@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20160421130447.7Y-ftfJb5o7fUpXn5ZX-nHbny2TLEZXplabTwZEBKvA@z>

Declare the opcode for the MIPSr6 sel.fmt instruction, as fsel_op in
order to match other FP op names.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/include/uapi/asm/inst.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/uapi/asm/inst.h b/arch/mips/include/uapi/asm/inst.h
index ddea53e..28f4151 100644
--- a/arch/mips/include/uapi/asm/inst.h
+++ b/arch/mips/include/uapi/asm/inst.h
@@ -167,6 +167,7 @@ enum cop1_sdw_func {
 	fceill_op    =	0x0a, ffloorl_op   =  0x0b,
 	fround_op    =	0x0c, ftrunc_op	   =  0x0d,
 	fceil_op     =	0x0e, ffloor_op	   =  0x0f,
+	fsel_op      =  0x10,
 	fmovc_op     =	0x11, fmovz_op	   =  0x12,
 	fmovn_op     =	0x13, fseleqz_op   =  0x14,
 	frecip_op    =  0x15, frsqrt_op    =  0x16,
-- 
2.8.0
