Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391092;
	b=TEdo+16xGUHWyHp+nsQ1GWCdz/xpPlixFY3IygPzzwc5PzFNFat5NMzsQzalxnGDt1kN
	 /Vbss3TuNhgIRmOEnlHMGJxc5PeKP7lku4mALgBoU/Zp+eko1UL2WAmDZ3/prU5KxJMqY
	 xHw8I4/El9YKRJ2HdqXWtHrnn69/Cnba6pPkplmj7SG5PjghJTRmx55LRR/R+hjVwwKPd
	 aheJvxoSsjWkfD9BcqsW8Y4zfwK+tqEGe8PtirfCRID2QtbGYNcFnRXWhZbtLqAxQFZI8
	 k5cLaeb8VmNsk0TTzsBYFiONcpnQEgjyTGwNuhCMTwZlnma87ic4q92gzNNkxdt3Hcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391092;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SaBu0BAwfS5+msHmIDRTXeowjSfEr2KtUFF7yfQhBuE=;
	b=b6Kd5ZnYRexwc7QUnrQ3BqRvuxA8EtG7PVPL+IIN08tnX9Ot9LrnALrkqD4IbRewGGxR
	 qF2GGLjlbMdMaI7XLYGlmkckp/uoLVCtO61XWGJ+Cgqx33Fex61CY9TnycuZtUaQVkYzr
	 1hB8OV1PdAT7xV3AFkJx2dNMcrWvBpmpGudpz6FkLxjeFzYOdWmHf/eNjBtm8vBt9fzag
	 MHhGzIw47z4ejCzYMI63aBURzuD3S87Ur5V2aZb7isY+etq169E6/3P039v6DZWoJcCW3
	 IK6rDkKQZBRWt1K855svH1jK+EgtXNmWN/FKw1p/nAbB2Eqh+ge/1fLT+dWHCOOhLEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CkSkL2Ap;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F31606A32D;
	Wed, 11 Nov 2026 09:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CkSkL2Ap
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE151F00A08;
	Wed, 11 Nov 2026 09:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391092;
	bh=SaBu0BAwfS5+msHmIDRTXeowjSfEr2KtUFF7yfQhBuE=;
	h=From:To:Cc:Subject:Date;
	b=CkSkL2ApDm/qluab7N66hwT+a0Pti+jgJXy84MIppFok7mwCvwumfdHNr0sbMqaTf
	 cp+a/N1C6Srk20mwwfT6G0JpHx0Armdi7oFxkzY/HaQeTMfGmlauxR2U1UXnWQMpPL
	 fnwTHv+iTcuomLbtfza5YryjIIV1B4D0W+sWBlwniJ1nJPJrFRDyH/CmHyfRoTBWJR
	 sTMNXZVLohA3j/8PqbMWSQ6fdRgv0Prf2WK2Waa1e6XuFyugJwsY8rFdEkCg2On9XY
	 mzNqgYscp4LPQonapPlZuz8cfjx4R7ZW7oWhgq/mz7J+e5lPD3BBha4DPfP+dXg57L
	 W4gTwMyurRwaQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: [PATCH v3] MIPS: sgi-ip32: Fence PIO reads on CRIME 1.1
Date: Wed, 11 Nov 2026 10:56:50 +0100
Message-ID: <20261111095650.14954-1-kaloz@kernel.org>
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
Changes in v3:
- Interrupts are restored in read-fence.h next to the save; only the
  delay is out of line.

Changes in v2:
- Reworded the first paragraph of the commit message.

v2: https://lore.kernel.org/r/20261107005245.20299-1-kaloz@kernel.org
v1: https://lore.kernel.org/r/20261021192418.7246-5-kaloz@kernel.org

 arch/mips/include/asm/io.h                    | 11 +++++++
 .../include/asm/mach-generic/read-fence.h     | 20 +++++++++++++
 arch/mips/include/asm/mach-ip32/read-fence.h  | 30 +++++++++++++++++++
 arch/mips/sgi-ip32/crime.c                    | 11 +++++++
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
index 000000000000..4948a2c7cc79
--- /dev/null
+++ b/arch/mips/include/asm/mach-ip32/read-fence.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MACH_IP32_READ_FENCE_H
+#define __ASM_MACH_IP32_READ_FENCE_H
+
+#include <linux/irqflags.h>
+#include <linux/types.h>
+
+extern bool crime_read_fence;
+void crime_read_fence_delay(void);
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
+	crime_read_fence_delay();
+	local_irq_restore(flags);
+}
+
+#endif /* __ASM_MACH_IP32_READ_FENCE_H */
diff --git a/arch/mips/sgi-ip32/crime.c b/arch/mips/sgi-ip32/crime.c
index a24424437c6b..a8cdc272aa6b 100644
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
@@ -25,6 +26,15 @@ struct sgi_mace __iomem *mace;
 
 EXPORT_SYMBOL_GPL(mace);
 
+bool crime_read_fence __read_mostly;
+EXPORT_SYMBOL(crime_read_fence);
+
+void crime_read_fence_delay(void)
+{
+	udelay(5);
+}
+EXPORT_SYMBOL(crime_read_fence_delay);
+
 void __init crime_init(void)
 {
 	static const char * const revs[] = { "1.1", "1.3", "1.4" };
@@ -41,6 +51,7 @@ void __init crime_init(void)
 	switch (id & CRIME_ID_IDBITS) {
 	case CRIME_ID_IDVALUE:
 		rev = revs[min_t(u64, id >> 32, ARRAY_SIZE(revs) - 1)];
+		crime_read_fence = !(id >> 32);
 		break;
 	case CRIME_ID_IDVALUE_B:
 		rev = "1.5";
-- 
2.47.3

