Received: from mailapp01.imgtec.com ([195.59.15.196]:32024 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006788AbbFBH57Jrqo4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 2 Jun 2015 09:57:59 +0200
Subject: [PATCH 1/3] MIPS: R6: Use lightweight SYNC instruction in smp_*
 memory barriers
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Date: Mon, 1 Jun 2015 17:09:34 -0700
Message-ID: <20150602000934.6668.43645.stgit@ubuntu-yegoshin>
In-Reply-To: <20150602000818.6668.76632.stgit@ubuntu-yegoshin>
References: <20150602000818.6668.76632.stgit@ubuntu-yegoshin>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, benh@kernel.crashing.org, will.deacon@arm.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, markos.chandras@imgtec.com, macro@linux-mips.org, Steven.Hill@imgtec.com, alexander.h.duyck@redhat.com, davem@davemloft.net
Message-ID: <20150602000934.dWKWVDoPPRgzl9RVR6lJ2Eci5n5Pf_2RcCE4Um7U4mg@z>

This instructions were specifically designed to work for smp_*() sort of
memory barriers in MIPS R2/R3/R5 and R6.

Unfortunately, it's description is very cryptic and is done in HW engineering
style which prevents use of it by SW. This instructions are not mandatory but
there is a mandatory requirement - if not implemented, then a regular MIPS
SYNC 0 must be used instead.

The reason for this change is - SYNC 0 is a heavvy-weighted in many CPUs, it may
disrupt other cores pipelines etc.

Due to concern about verification of old MIPS R2 compatible cores of other
vendors it is enforced only for MIPS R6 and other MIPS32/64 R2/R5 processors
have it configurable.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
---
 arch/mips/Kconfig               |   22 ++++++++++++++++++++++
 arch/mips/include/asm/barrier.h |    6 ++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index be384d6a58bb..c7d0cacece3d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1347,6 +1347,7 @@ config CPU_MIPS32_R2
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_MSA
+	select CPU_SUPPORTS_MIPS_LIGHTWEIGHT_SYNC
 	select HAVE_KVM
 	help
 	  Choose this option to build a kernel for release 2 or later of the
@@ -1365,6 +1366,8 @@ config CPU_MIPS32_R6
 	select GENERIC_CSUM
 	select HAVE_KVM
 	select MIPS_O32_FP64_SUPPORT
+	select CPU_SUPPORTS_MIPS_LIGHTWEIGHT_SYNC
+	select WEAK_REORDERING_BEYOND_LLSC
 	help
 	  Choose this option to build a kernel for release 6 or later of the
 	  MIPS32 architecture.  New MIPS processors, starting with the Warrior
@@ -1399,6 +1402,7 @@ config CPU_MIPS64_R2
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_HUGEPAGES
 	select CPU_SUPPORTS_MSA
+	select CPU_SUPPORTS_MIPS_LIGHTWEIGHT_SYNC
 	help
 	  Choose this option to build a kernel for release 2 or later of the
 	  MIPS64 architecture.  Many modern embedded systems with a 64-bit
@@ -1415,6 +1419,8 @@ config CPU_MIPS64_R6
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_MSA
 	select GENERIC_CSUM
+	select CPU_SUPPORTS_MIPS_LIGHTWEIGHT_SYNC
+	select WEAK_REORDERING_BEYOND_LLSC
 	help
 	  Choose this option to build a kernel for release 6 or later of the
 	  MIPS64 architecture.  New MIPS processors, starting with the Warrior
@@ -1876,6 +1882,20 @@ config WEAK_ORDERING
 #
 config WEAK_REORDERING_BEYOND_LLSC
 	bool
+
+config MIPS_LIGHTWEIGHT_SYNC
+	bool "CPU lightweight SYNC instruction for weak reordering"
+	depends on CPU_SUPPORTS_MIPS_LIGHTWEIGHT_SYNC && WEAK_ORDERING
+	default y if CPU_MIPSR6
+	help
+	  This option enforces a use of "lightweight sync" instructions
+	  for SMP (multi-CPU) memory barriers. This instructions are much
+	  more faster than a traditional "SYNC 0".
+
+	  If that instructions are not implemented in processor then it is
+	  converted to generic "SYNC 0".
+
+	  If you unsure, say N here, it may slightly decrease your performance
 endmenu
 
 #
@@ -1928,6 +1948,8 @@ config CPU_SUPPORTS_HUGEPAGES
 	bool
 config CPU_SUPPORTS_UNCACHED_ACCELERATED
 	bool
+config CPU_SUPPORTS_MIPS_LIGHTWEIGHT_SYNC
+	bool
 config MIPS_PGD_C0_CONTEXT
 	bool
 	default y if 64BIT && CPU_MIPSR2 && !CPU_XLP
diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrier.h
index 2b8bbbcb9be0..d2a63abfc7c6 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -96,9 +96,15 @@
 #  define smp_rmb()	barrier()
 #  define smp_wmb()	__syncw()
 # else
+#  ifdef CONFIG_MIPS_LIGHTWEIGHT_SYNC
+#  define smp_mb()      __asm__ __volatile__("sync 0x10" : : :"memory")
+#  define smp_rmb()     __asm__ __volatile__("sync 0x13" : : :"memory")
+#  define smp_wmb()     __asm__ __volatile__("sync 0x4" : : :"memory")
+#  else
 #  define smp_mb()	__asm__ __volatile__("sync" : : :"memory")
 #  define smp_rmb()	__asm__ __volatile__("sync" : : :"memory")
 #  define smp_wmb()	__asm__ __volatile__("sync" : : :"memory")
+#  endif
 # endif
 #else
 #define smp_mb()	barrier()
