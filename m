Received: from mailapp02.imgtec.com ([217.156.133.132]:58459 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992155AbcJERWAXH5Zu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 5 Oct 2016 19:22:00 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v3 12/18] MIPS: Adjust MIPS64 CAC_BASE to reflect Config.K0
Date: Wed, 5 Oct 2016 18:18:18 +0100
Message-ID: <20161005171824.18014-13-paul.burton@imgtec.com>
In-Reply-To: <20161005171824.18014-1-paul.burton@imgtec.com>
References: <20161005171824.18014-1-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20161005171818.fVUDYT4TcG9QhUVtLoGFmaMjpmF-glyBOOzERXPwjGQ@z>

On MIPS64 we define the default CAC_BASE as one of the xkphys regions of
the virtual address space. Since the CCA is encoded in bits 61:59 of
xkphys addresses, fixing CAC_BASE to any particular one prevents us from
dynamically changing the CCA as we do for MIPS32 where CAC_BASE is
placed within kseg0. In order to make the kernel more generic, drop the
current kludge that gives CAC_BASE CCA=3 if CONFIG_DMA_NONCOHERENT is
selected (disregarding CONFIG_DMA_MAYBE_COHERENT) & CCA=5 (which is not
standardised by the architecture) otherwise. Instead read Config.K0 and
generate the appropriate offset into xkphys, presuming that either the
bootloader or early kernel code will have configured Config.K0
appropriately. This seems like the best option for a generic
implementation.

The ip27 spaces.h is adjusted to set its former value of CAC_BASE, since
it's the only user of CAC_BASE from assembly (in its smp_slave_setup
macro). This allows the generic case to focus solely on C code without
breaking ip27.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

Changes in v3: None
Changes in v2: None

 arch/mips/include/asm/addrspace.h           | 3 +--
 arch/mips/include/asm/mach-generic/spaces.h | 8 +++-----
 arch/mips/include/asm/mach-ip27/spaces.h    | 1 +
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/addrspace.h b/arch/mips/include/asm/addrspace.h
index c5b04e7..4856adc 100644
--- a/arch/mips/include/asm/addrspace.h
+++ b/arch/mips/include/asm/addrspace.h
@@ -126,8 +126,7 @@
 #define PHYS_TO_XKSEG_UNCACHED(p)	PHYS_TO_XKPHYS(K_CALG_UNCACHED, (p))
 #define PHYS_TO_XKSEG_CACHED(p)		PHYS_TO_XKPHYS(K_CALG_COH_SHAREABLE, (p))
 #define XKPHYS_TO_PHYS(p)		((p) & TO_PHYS_MASK)
-#define PHYS_TO_XKPHYS(cm, a)		(_CONST64_(0x8000000000000000) | \
-					 (_CONST64_(cm) << 59) | (a))
+#define PHYS_TO_XKPHYS(cm, a)		(XKPHYS | (_ACAST64_(cm) << 59) | (a))
 
 /*
  * The ultimate limited of the 64-bit MIPS architecture:  2 bits for selecting
diff --git a/arch/mips/include/asm/mach-generic/spaces.h b/arch/mips/include/asm/mach-generic/spaces.h
index afc96ec..952b0fd 100644
--- a/arch/mips/include/asm/mach-generic/spaces.h
+++ b/arch/mips/include/asm/mach-generic/spaces.h
@@ -12,6 +12,8 @@
 
 #include <linux/const.h>
 
+#include <asm/mipsregs.h>
+
 /*
  * This gives the physical RAM offset.
  */
@@ -52,11 +54,7 @@
 #ifdef CONFIG_64BIT
 
 #ifndef CAC_BASE
-#ifdef CONFIG_DMA_NONCOHERENT
-#define CAC_BASE		_AC(0x9800000000000000, UL)
-#else
-#define CAC_BASE		_AC(0xa800000000000000, UL)
-#endif
+#define CAC_BASE	PHYS_TO_XKPHYS(read_c0_config() & CONF_CM_CMASK, 0)
 #endif
 
 #ifndef IO_BASE
diff --git a/arch/mips/include/asm/mach-ip27/spaces.h b/arch/mips/include/asm/mach-ip27/spaces.h
index b18802a..4775a11 100644
--- a/arch/mips/include/asm/mach-ip27/spaces.h
+++ b/arch/mips/include/asm/mach-ip27/spaces.h
@@ -19,6 +19,7 @@
 #define IO_BASE			0x9200000000000000
 #define MSPEC_BASE		0x9400000000000000
 #define UNCAC_BASE		0x9600000000000000
+#define CAC_BASE		0xa800000000000000
 
 #define TO_MSPEC(x)		(MSPEC_BASE | ((x) & TO_PHYS_MASK))
 #define TO_HSPEC(x)		(HSPEC_BASE | ((x) & TO_PHYS_MASK))
-- 
2.10.0
