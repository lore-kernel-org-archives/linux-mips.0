Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792610733;
	b=MNLcRHBUABQLi/LmOp9J2mEesoHSuj1Ab9c8qP9JPOmnaRMOn5mynZoih/OPlKLT5WwD
	 1lxutx/RX5/f3WodIMrpHUaF5o0KMZtgccTFPX7P8tEGFVkEftJ3t23/fahjjnD6iFs7J
	 ij8Jq7J4Wg/LG8uupG65Jqq4ogZYTqddDPpnmW7QyqONVlIKX1Gier3k5y/X66YKGLN5p
	 EaPBSfUnEn79TefhhMRjr0UbofUbacrv0mpA0dweQnXfcjjKhZy0WSp6AyWmft5MAKjbw
	 cfZVh3DFXVubSIEgsX5WjdsPl+A1trV44pPJ0dgk+oedyshMDI0W/IPUz3LLD0+Blqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792610733;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mSX9v2pr1sdjjKRZWZbxDho1NDgHigoIBxnmLCesK40=;
	b=GF5k4UdcmRKZHO4P/lkLwx1sAcar2eWZdDx/MaeZDQz18+JXrglMKtJkw2Ww/B/NJqGf
	 mZF3lwLLKKiTVSsO+kZQJhvjgwvz++xGKLH7w7wbGzXTrU5h/LOAC8WhmXkrUlhU5VXC9
	 KdfxtPxvubCNrkYVnXjUIhu8lbiyRDSFYvJtK/+wvphHLcdZBt9+hPdBjdW2KMD3n+ffD
	 tLkUg3JxWYreE2kvEDCJcFFacRhD/0b9/Tq5M1X8BSC9kCoFXsi7BsdX2Ysb5l7eL6MDf
	 YL1f6Y/VVSCO07cCqdSRnmwtSzRVmuxRhks+ci7Re3ygrqybpjHxYw2OFsjgl11II2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JkIMys9Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4A7606A328;
	Wed, 21 Oct 2026 19:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JkIMys9Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E041F000C1;
	Wed, 21 Oct 2026 19:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792610733;
	bh=mSX9v2pr1sdjjKRZWZbxDho1NDgHigoIBxnmLCesK40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JkIMys9ZabwDH2UxEfZ7rZcg4quMsWIp2irU5dBLmK1QbqZfRROv6khr97pSDMd0X
	 YV/wQsJWFqaXZAeAhIUIH1wx2poLFTgPW67BL6iYkuXXI/kN9dsNY5ZyAMBvma4kj1
	 jm5DSFTznVHhNdMry9u1g7DYwr5/YtRRyCd7hlJSDB/SmZZYGJvLRuF9BjskbXk8/s
	 qBUuE/SvUcYwZ3TU7LxU5CHex8LFaX6cNv8vzh5cuDHMCYXp3v0IjPnVxbEJC4YmPO
	 OHI44bkcLyqR89MFBTd48ZnR13Namw3vyaeSHL38qZadz5CdDmIxoCU3HwXa7kQF+w
	 IlRaRasnRHl1Q==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] MIPS: sgi-ip32: Fence PIO reads on CRIME 1.1
Date: Wed, 21 Oct 2026 21:24:18 +0200
Message-ID: <20261021192418.7246-5-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021192418.7246-1-kaloz@kernel.org>
References: <20261021192418.7246-1-kaloz@kernel.org>
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

On CRIME 1.1, a MACE or PCI read within about 2us of a read of some PCI
registers (aic7880 HCNTRL, INTSTAT, ERROR) can return that read's data.
Under audio and SCSI DMA, repeating aic7xxx's ahc_pause(), register
read, ahc_unpause() hangs the machine; fenced, it runs clean, as
measured on an O2 with a CRIME 1.1. The next read can be an interrupt
handler's, so the fence follows the trigger.

Add a read hook to the MIPS accessors that, on CRIME 1.1, follows each
MMIO and port read by 5us with interrupts off. Other platforms compile
it out.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
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

