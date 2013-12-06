Received: from multi.imgtec.com ([194.200.65.239]:30843 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6828766Ab3LFJVOdh9uc (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 6 Dec 2013 10:21:14 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH] mips/include/asm/mipsregs.h: s/u16/unsigned short/
Date: Fri, 6 Dec 2013 09:20:59 +0000
Message-ID: <1386321659-30073-1-git-send-email-qais.yousef@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-Path: <Qais.Yousef@imgtec.com>
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
Cc: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <20131206092059.ydKqgB7_cySgf-LWv-T18S_9Yghg_G3zcmhBijfql5E@z>

I was getting this error when including this header in my driver:

  arch/mips/include/asm/mipsregs.h:644:33: error: unknown type name ‘u16’

since the use of u16 is not really necessary, convert it to unsigned short.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
Reviewed-by: Steven J. Hill <Steven.Hill@imgtec.com>
---
 arch/mips/include/asm/mipsregs.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index e033141..0a2d6ef 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -641,9 +641,9 @@
  * microMIPS instructions can be 16-bit or 32-bit in length. This
  * returns a 1 if the instruction is 16-bit and a 0 if 32-bit.
  */
-static inline int mm_insn_16bit(u16 insn)
+static inline int mm_insn_16bit(unsigned short insn)
 {
-	u16 opcode = (insn >> 10) & 0x7;
+	unsigned short opcode = (insn >> 10) & 0x7;
 
 	return (opcode >= 1 && opcode <= 3) ? 1 : 0;
 }
-- 
1.7.1
