Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794012845;
	b=MHf1ZK35a7csBGHzVsZ6mI6XoK/G3T156fR/RJmPxjx2pKIhYgJwDbfATCWf8uXiSOYx
	 Nzb83KymntGI/wuxjLyRr0u5u96CfNp0++HloKpw2WKXXSzNqUkJUU4kJVUNXQIs4FOPn
	 Cr/GmKTZjFicAb6crdBQwLsZqztCzPC5AMC+5vav34kRyPrqZ746iW6MNaob4UA5v4QvB
	 4DfYjdcSuv6WaDjV2Ouvct3hR72qkJT9Io2bAYo8DmTKfKtOLlRtSRoCMcBb0ArxEd05t
	 NKYfttk2WnDddvj+No25RpmtqElLaH5zY8BeWoUjr1c4HEfcCGESiVT1aKehYqgqzxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794012845;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pjNeBK7qaQR2cfSs28TNbrSZTUgLgAf+poVMpkxqhFQ=;
	b=AOHRgqb7Hm9ik3IrANnWESgq5355pcYmDnclQ/FaSHftVkVZ5rAtSpkeEjD2DYJROlOG
	 N9e70MHEFEigxp72f5AT+igaDQNI5QG/DjshwsQ6/bZtiMCmRoqYWJq5IUZf6pMgmJuPM
	 2P4X0u6cY5o+xNrGodLOc7qQbS2epUr2lzJnL8BGknqBoXRO8ZDB11knD0HVASTaF8hJn
	 tMD/FjYoMrzPIEd7H59+9wPB/JCZ7HeHGogNnW3Fq7eozNUcH0I9ICnJuibu65RyuroVj
	 ygcAhhp/W49hmcHNz8KPJK8oOcmLZDLIMMXAGu3lgfRZXdI6iwJ0/WXSlCpNd/xM4Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fy3YG7sD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F495606A333;
	Sat,  7 Nov 2026 00:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fy3YG7sD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D951F008A1;
	Sat,  7 Nov 2026 00:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794012845;
	bh=pjNeBK7qaQR2cfSs28TNbrSZTUgLgAf+poVMpkxqhFQ=;
	h=From:To:Cc:Subject:Date;
	b=Fy3YG7sDVYMMmQkBgSspBY2tPckDWj/BAUZ0gEzSSShq5gf/Are+KnwGBBfQodYAL
	 8IdCkRiEv2Bo5jnKc1GYbMBbv5MUIEC9euN0/8AlMgKwqjjXLQU+bU6cwkITcgElMQ
	 vpZbsRMZK+kLXv+B/FnTLLG0Xq59RIo2XGI0MiUBvjEmxbYaXBkW5EKna2XLdt4K7y
	 C5FrHdbrlVEHxVgDRjPII8wD4uLG1Y89uBgeLNQtPVrfxZIKbWrkvgzVr4BvfTWrN2
	 C9odlR8cZ1XnV8lz7nNuZ48/8J+CN7EsHV+kOEtkYAYMcrDtpscJ5zSLl4NU3MGMEA
	 KEBGy6TP1ZuIg==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2] MIPS: sgi-ip32: Fence PIO reads on CRIME 1.1
Date: Sat,  7 Nov 2026 01:52:45 +0100
Message-ID: <20261107005245.20299-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On CRIME 1.1, the next MACE or PCI load after a read of the aic7880
HCNTRL, INTSTAT or ERROR register can return that register's data
instead of its own; a gap of about 2us avoids it. Under audio and SCSI
DMA, repeating aic7xxx's ahc_pause(), register read, ahc_unpause() can
hang; fenced, it runs clean. The next load can be an interrupt
handler's, so the fence follows the trigger.

Add a read hook to the MIPS accessors that, on CRIME 1.1, follows each
MMIO and port read by 5us with interrupts off. Other platforms compile
it out.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
Changes in v2:
- Reworded the first paragraph of the commit message.

v1: https://lore.kernel.org/r/20261021192418.7246-5-kaloz@kernel.org

 arch/mips/include/asm/io.h                    | 11 +++++++
 .../include/asm/mach-generic/read-fence.h     | 20 +++++++++++++
 arch/mips/include/asm/mach-ip32/read-fence.h  | 29 +++++++++++++++++++
 arch/mips/sgi-ip32/crime.c                    | 12 ++++++++
 4 files changed, 72 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-generic/read-fence.h
 create mode 100644 arch/mips/include/asm/mach-ip32/read-fence.h

diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 980187a83053..a5c49d319546 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -26,6 +26,7 @@
 #include <asm/pgtable-bits.h>
 #include <asm/string.h>
 #include <mangle-port.h>
+#include <read-fence.h>
 
 /*
  * Raw operations are never swapped in software.  OTOH values that raw
@@ -222,6 +223,8 @@ static inline void pfx##write##bwlq(type val,				\
 static inline type pfx##read##bwlq(const volatile void __iomem *mem)	\
 {									\
 	volatile type *__mem;						\
+	unsigned long __rflags;						\
+	bool __fence;							\
 	type __val;							\
 									\
 	__mem = (void *)__swizzle_addr_##bwlq((unsigned long)(mem));	\
@@ -229,6 +232,7 @@ static inline type pfx##read##bwlq(const volatile void __iomem *mem)	\
 	if (barrier)							\
 		iobarrier_rw();						\
 									\
+	__fence = plat_read_fence_begin(&__rflags);			\
 	if (sizeof(type) != sizeof(u64) || sizeof(u64) == sizeof(long)) \
 		__val = *__mem;						\
 	else if (cpu_has_64bits) {					\
@@ -251,6 +255,8 @@ static inline type pfx##read##bwlq(const volatile void __iomem *mem)	\
 		__val = 0;						\
 		BUG();							\
 	}								\
+	if (__fence)							\
+		plat_read_fence_end(__rflags);				\
 									\
 	/* prevent prefetching of coherent DMA data prematurely */	\
 	if (!relax)							\
@@ -283,6 +289,8 @@ static inline void pfx##out##bwlq(type val, unsigned long port)		\
 static inline type pfx##in##bwlq(unsigned long port)			\
 {									\
 	volatile type *__addr;						\
+	unsigned long __rflags;						\
+	bool __fence;							\
 	type __val;							\
 									\
 	__addr = (void *)__swizzle_addr_##bwlq(mips_io_port_base + port); \
@@ -292,7 +300,10 @@ static inline type pfx##in##bwlq(unsigned long port)			\
 	if (barrier)							\
 		iobarrier_rw();						\
 									\
+	__fence = plat_read_fence_begin(&__rflags);			\
 	__val = *__addr;						\
+	if (__fence)							\
+		plat_read_fence_end(__rflags);				\
 									\
 	/* prevent prefetching of coherent DMA data prematurely */	\
 	if (!relax)							\
diff --git a/arch/mips/include/asm/mach-generic/read-fence.h b/arch/mips/include/asm/mach-generic/read-fence.h
new file mode 100644
index 000000000000..0147ed88bc01
--- /dev/null
+++ b/arch/mips/include/asm/mach-generic/read-fence.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MACH_GENERIC_READ_FENCE_H
+#define __ASM_MACH_GENERIC_READ_FENCE_H
+
+#include <linux/types.h>
+
+/*
+ * Called around every MMIO and port read; plat_read_fence_end() runs only
+ * when plat_read_fence_begin() returned true.
+ */
+static inline bool plat_read_fence_begin(unsigned long *flags)
+{
+	return false;
+}
+
+static inline void plat_read_fence_end(unsigned long flags)
+{
+}
+
+#endif /* __ASM_MACH_GENERIC_READ_FENCE_H */
diff --git a/arch/mips/include/asm/mach-ip32/read-fence.h b/arch/mips/include/asm/mach-ip32/read-fence.h
new file mode 100644
index 000000000000..7e3105af4c6f
--- /dev/null
+++ b/arch/mips/include/asm/mach-ip32/read-fence.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MACH_IP32_READ_FENCE_H
+#define __ASM_MACH_IP32_READ_FENCE_H
+
+#include <linux/irqflags.h>
+#include <linux/types.h>
+
+extern bool crime_read_fence;
+void crime_read_fence_end(unsigned long flags);
+
+/*
+ * CRIME 1.1 can return a PCI read's data again to the next MACE or PCI
+ * read issued within about 2us, so each read is followed by 5us with
+ * interrupts off.
+ */
+static inline bool plat_read_fence_begin(unsigned long *flags)
+{
+	if (!crime_read_fence)
+		return false;
+	local_irq_save(*flags);
+	return true;
+}
+
+static inline void plat_read_fence_end(unsigned long flags)
+{
+	crime_read_fence_end(flags);
+}
+
+#endif /* __ASM_MACH_IP32_READ_FENCE_H */
diff --git a/arch/mips/sgi-ip32/crime.c b/arch/mips/sgi-ip32/crime.c
index a24424437c6b..0b94150fbec1 100644
--- a/arch/mips/sgi-ip32/crime.c
+++ b/arch/mips/sgi-ip32/crime.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2005 Ilya A. Volynets <ilya@total-knowledge.com>
  */
 #include <linux/types.h>
+#include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
@@ -25,6 +26,16 @@ struct sgi_mace __iomem *mace;
 
 EXPORT_SYMBOL_GPL(mace);
 
+bool crime_read_fence __read_mostly;
+EXPORT_SYMBOL(crime_read_fence);
+
+void crime_read_fence_end(unsigned long flags)
+{
+	udelay(5);
+	local_irq_restore(flags);
+}
+EXPORT_SYMBOL(crime_read_fence_end);
+
 void __init crime_init(void)
 {
 	static const char * const revs[] = { "1.1", "1.3", "1.4" };
@@ -41,6 +52,7 @@ void __init crime_init(void)
 	switch (id & CRIME_ID_IDBITS) {
 	case CRIME_ID_IDVALUE:
 		rev = revs[min_t(u64, id >> 32, ARRAY_SIZE(revs) - 1)];
+		crime_read_fence = !(id >> 32);
 		break;
 	case CRIME_ID_IDVALUE_B:
 		rev = "1.5";
-- 
2.47.3

