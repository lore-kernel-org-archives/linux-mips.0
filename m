Received: from mailapp01.imgtec.com ([195.59.15.196]:11295 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27028035AbcEFMfa2bk2G (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 6 May 2016 14:35:30 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: Implement __arch_bitrev* using bitswap for MIPSr6
Date: Fri, 6 May 2016 13:35:03 +0100
Message-ID: <1462538103-6633-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20160506123503.LH2lHnL1SxHgNDmfmJNEmsFboQN-s9heJUpcnlY3V7I@z>

Release 6 of the MIPS architecture introduced the bitswap instruction,
which reverses the bits within each byte of a word. Make use of this
instruction to implement the __arch_bitrev* functions, which should be
faster for most MIPSr6 CPUs, reduces code size slightly and allows us to
avoid the lookup table used by the generic implementation, saving 256
bytes in the kernel binary by dropping that.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/Kconfig              |  1 +
 arch/mips/include/asm/bitrev.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 arch/mips/include/asm/bitrev.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index dd2b372..5b8fd2e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2046,6 +2046,7 @@ config CPU_MIPSR2
 config CPU_MIPSR6
 	bool
 	default y if CPU_MIPS32_R6 || CPU_MIPS64_R6
+	select HAVE_ARCH_BITREVERSE
 	select MIPS_ASID_BITS_VARIABLE
 	select MIPS_SPRAM
 
diff --git a/arch/mips/include/asm/bitrev.h b/arch/mips/include/asm/bitrev.h
new file mode 100644
index 0000000..bc739a4
--- /dev/null
+++ b/arch/mips/include/asm/bitrev.h
@@ -0,0 +1,30 @@
+#ifndef __MIPS_ASM_BITREV_H__
+#define __MIPS_ASM_BITREV_H__
+
+#include <linux/swab.h>
+
+static __always_inline __attribute_const__ u32 __arch_bitrev32(u32 x)
+{
+	u32 ret;
+
+	asm("bitswap	%0, %1" : "=r"(ret) : "r"(__swab32(x)));
+	return ret;
+}
+
+static __always_inline __attribute_const__ u16 __arch_bitrev16(u16 x)
+{
+	u16 ret;
+
+	asm("bitswap	%0, %1" : "=r"(ret) : "r"(__swab16(x)));
+	return ret;
+}
+
+static __always_inline __attribute_const__ u8 __arch_bitrev8(u8 x)
+{
+	u8 ret;
+
+	asm("bitswap	%0, %1" : "=r"(ret) : "r"(x));
+	return ret;
+}
+
+#endif /* __MIPS_ASM_BITREV_H__ */
-- 
2.8.2
