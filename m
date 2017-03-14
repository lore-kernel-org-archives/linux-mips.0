Received: from mailapp01.imgtec.com ([195.59.15.196]:50948 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994798AbdCNKSNBJdvU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Mar 2017 11:18:13 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 5/33] MIPS: Add some missing guest CP0 accessors & defs
Date: Tue, 14 Mar 2017 10:15:12 +0000
Message-ID: <0da7741c49128b9292aa1c94504b38febf0b9bd0.1489485940.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
In-Reply-To: <cover.26e10ec77a4ed0d3177ccf4fabf57bc95ea030f8.1489485940.git-series.james.hogan@imgtec.com>
References: <cover.26e10ec77a4ed0d3177ccf4fabf57bc95ea030f8.1489485940.git-series.james.hogan@imgtec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
To: linux-mips@linux-mips.org, kvm@vger.kernel.org
Cc: James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>
Message-ID: <20170314101512.bDmBA2wuHIbZSwAbhpWrugugHCh1dmQx72mhCeJl84U@z>

Add some missing guest accessors and register field definitions for KVM
for MIPS VZ to make use of.

Guest CP0_LLAddr register accessors and definitions for the LLB field
allow KVM to clear the guest LLB to cancel in-progress LL/SC atomics on
restore, and to emulate accesses by the guest to the CP0_LLAddr
register.

Bitwise modifiers and definitions for the guest CP0_Wired and
CP0_Config1 registers allow KVM to modify fields within the CP0_Wired
and CP0_Config1 registers.

Finally a definition for the CP0_Config5.SBRI bit allows KVM to
initialise and allow modification of the guest version of the SBRI bit.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/include/asm/mipsregs.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index c20df6081479..c6b8f96b80f9 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -219,8 +219,10 @@
 /*
  * Wired register bits
  */
-#define MIPSR6_WIRED_LIMIT	(_ULCAST_(0xffff) << 16)
-#define MIPSR6_WIRED_WIRED	(_ULCAST_(0xffff) << 0)
+#define MIPSR6_WIRED_LIMIT_SHIFT 16
+#define MIPSR6_WIRED_LIMIT	(_ULCAST_(0xffff) << MIPSR6_WIRED_LIMIT_SHIFT)
+#define MIPSR6_WIRED_WIRED_SHIFT 0
+#define MIPSR6_WIRED_WIRED	(_ULCAST_(0xffff) << MIPSR6_WIRED_WIRED_SHIFT)
 
 /*
  * Values used for computation of new tlb entries
@@ -647,6 +649,7 @@
 #define MIPS_CONF5_LLB		(_ULCAST_(1) << 4)
 #define MIPS_CONF5_MVH		(_ULCAST_(1) << 5)
 #define MIPS_CONF5_VP		(_ULCAST_(1) << 7)
+#define MIPS_CONF5_SBRI		(_ULCAST_(1) << 6)
 #define MIPS_CONF5_FRE		(_ULCAST_(1) << 8)
 #define MIPS_CONF5_UFE		(_ULCAST_(1) << 9)
 #define MIPS_CONF5_MSAEN	(_ULCAST_(1) << 27)
@@ -742,6 +745,10 @@
 #define MIPS_CMGCRB_BASE	11
 #define MIPS_CMGCRF_BASE	(~_ULCAST_((1 << MIPS_CMGCRB_BASE) - 1))
 
+/* LLAddr bit definitions */
+#define MIPS_LLADDR_LLB_SHIFT	0
+#define MIPS_LLADDR_LLB		(_ULCAST_(1) << MIPS_LLADDR_LLB_SHIFT)
+
 /*
  * Bits in the MIPS32 Memory Segmentation registers.
  */
@@ -2018,6 +2025,9 @@ do {									\
 #define write_gc0_config6(val)		__write_32bit_gc0_register(16, 6, val)
 #define write_gc0_config7(val)		__write_32bit_gc0_register(16, 7, val)
 
+#define read_gc0_lladdr()		__read_ulong_gc0_register(17, 0)
+#define write_gc0_lladdr(val)		__write_ulong_gc0_register(17, 0, val)
+
 #define read_gc0_watchlo0()		__read_ulong_gc0_register(18, 0)
 #define read_gc0_watchlo1()		__read_ulong_gc0_register(18, 1)
 #define read_gc0_watchlo2()		__read_ulong_gc0_register(18, 2)
@@ -2702,9 +2712,11 @@ __BUILD_SET_C0(brcm_mode)
  */
 #define __BUILD_SET_GC0(name)	__BUILD_SET_COMMON(gc0_##name)
 
+__BUILD_SET_GC0(wired)
 __BUILD_SET_GC0(status)
 __BUILD_SET_GC0(cause)
 __BUILD_SET_GC0(ebase)
+__BUILD_SET_GC0(config1)
 
 /*
  * Return low 10 bits of ebase.
-- 
git-series 0.8.10
