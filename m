Received: from mailapp01.imgtec.com ([195.59.15.196]:30783 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27030050AbcETW3B1nHqC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 21 May 2016 00:29:01 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH for-v4.7 1/5] MIPS: Add inline asm encoding helpers
Date: Fri, 20 May 2016 23:28:37 +0100
Message-ID: <1463783321-24442-2-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1463783321-24442-1-git-send-email-james.hogan@imgtec.com>
References: <1463783321-24442-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160520222837.NXSsYng3to8FliU7IpJ8JiXMb9UhdfKN2IWK9lYPzgI@z>

To allow simplification of macros which use inline assembly to
explicitly encode instructions, add a few simple abstractions to
mipsregs.h which expand to specific microMIPS or normal MIPS encodings
depending on what type of kernel is being built:

_ASM_INSN_IF_MIPS(_enc) : Emit a 32bit MIPS instruction if microMIPS is
                          not enabled.
_ASM_INSN32_IF_MM(_enc) : Emit a 32bit microMIPS instruction if enabled.
_ASM_INSN16_IF_MM(_enc) : Emit a 16bit microMIPS instruction if enabled.

The macros can be used one after another since the MIPS / microMIPS
macros are mutually exclusive, for example:

__asm__ __volatile__(
        ".set push\n\t"
        ".set noat\n\t"
        "# mfgc0 $1, $%1, %2\n\t"
        _ASM_INSN_IF_MIPS(0x40610000 | %1 << 11 | %2)
        _ASM_INSN32_IF_MM(0x002004fc | %1 << 16 | %2 << 11)
        "move %0, $1\n\t"
        ".set pop"
        : "=r" (__res)
        : "i" (source), "i" (sel));

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/include/asm/mipsregs.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 18bb6f9f0d16..744dec36773c 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1046,6 +1046,33 @@ static inline int mm_insn_16bit(u16 insn)
 }
 
 /*
+ * Helper macros for generating raw instruction encodings in inline asm.
+ */
+#ifdef CONFIG_CPU_MICROMIPS
+#define _ASM_INSN16_IF_MM(_enc)			\
+	".insn\n\t"				\
+	".hword (" #_enc ")\n\t"
+#define _ASM_INSN32_IF_MM(_enc)			\
+	".insn\n\t"				\
+	".hword ((" #_enc ") >> 16)\n\t"	\
+	".hword ((" #_enc ") & 0xffff)\n\t"
+#else
+#define _ASM_INSN_IF_MIPS(_enc)			\
+	".insn\n\t"				\
+	".word (" #_enc ")\n\t"
+#endif
+
+#ifndef _ASM_INSN16_IF_MM
+#define _ASM_INSN16_IF_MM(_enc)
+#endif
+#ifndef _ASM_INSN32_IF_MM
+#define _ASM_INSN32_IF_MM(_enc)
+#endif
+#ifndef _ASM_INSN_IF_MIPS
+#define _ASM_INSN_IF_MIPS(_enc)
+#endif
+
+/*
  * TLB Invalidate Flush
  */
 static inline void tlbinvf(void)
-- 
2.4.10
