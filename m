Received: from mail-qt0-x243.google.com ([IPv6:2607:f8b0:400d:c0d::243]:36294
        "EHLO mail-qt0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992923AbeAXBrtAxBXZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 24 Jan 2018 02:47:49 +0100
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH RFC 4/6] MIPS: Prepare for supporting eXtended KSEG0/1
Date: Tue, 23 Jan 2018 17:47:04 -0800
Message-ID: <1516758426-8127-5-git-send-email-f.fainelli@gmail.com>
In-Reply-To: <1516758426-8127-1-git-send-email-f.fainelli@gmail.com>
References: <1516758426-8127-1-git-send-email-f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
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
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Kevin Cernekee <cernekee@gmail.com>, James Hogan <jhogan@kernel.org>, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, "Maciej W. Rozycki" <macro@mips.com>, Huacai Chen <chenhc@lemote.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcin Nowakowski <marcin.nowakowski@mips.com>, Andrew Morton <akpm@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>, Ingo Molnar <mingo@kernel.org>, David Howells <dhowells@redhat.com>, Kees Cook <keescook@chromium.org>, Thomas Meyer <thomas@m3y3r.de>, Bryan O'Donoghue <pure.logic@nexus-software.ie>, Robin Murphy <robin.murphy@arm.com>, Michal Hocko <mhocko@suse.com>, Lucas Stach <l.stach@pengutronix.de>, Vladimir Murzin <vladimir.murzin@arm.com>, Bart Van Assche <bart.vanassche@sandisk.com>, open list <linux-kernel@vger.kernel.org>
Message-ID: <20180124014704.u83PpV5T5SS9iqOOBbayrS8lFMWUfwCRJKIc4JxkV4I@z>

From: Florian Fainelli <florian.fainelli@broadcom.com>

Prepare the core MIPS files to support Broadcom's eXtended KSEG0/1:

- add MIPS_CPU_XKS01 feature flag
- flag BMIPS4380/5000/5200 with MIPS_CPU_XKS01
- update ioremap and CAC_ADDR() checks

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/include/asm/cpu-features.h |  8 ++++++++
 arch/mips/include/asm/cpu.h          |  1 +
 arch/mips/include/asm/io.h           | 18 ++++++++++--------
 arch/mips/include/asm/page.h         |  4 ++++
 arch/mips/kernel/cpu-probe.c         |  3 ++-
 arch/mips/mm/ioremap.c               | 16 +++++++++-------
 6 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index 721b698bfe3c..43e1163921a9 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -623,4 +623,12 @@
 #define cpu_guest_has_dyn_maar	(cpu_data[0].guest.options_dyn & MIPS_CPU_MAAR)
 #endif
 
+#if defined(CONFIG_XKS01)
+#ifndef cpu_has_xks01
+# define cpu_has_xks01		(cpu_data[0].options & MIPS_CPU_XKS01)
+#endif
+#else
+# define cpu_has_xks01		0
+#endif /* CONFIG_XKS01 */
+
 #endif /* __ASM_CPU_FEATURES_H */
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index d39324c4adf1..298356b9f7e6 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -418,6 +418,7 @@ enum cpu_type_enum {
 				MBIT_ULL(54)	/* CPU shares FTLB RAM with another */
 #define MIPS_CPU_SHARED_FTLB_ENTRIES \
 				MBIT_ULL(55)	/* CPU shares FTLB entries with another */
+#define MIPS_CPU_XKS01		MBIT_ULL(56)	/* CPU has eXtended KSEG0/1 */
 
 /*
  * CPU ASE encodings
diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 0cbf3af37eca..9f4ac0c394be 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -206,14 +206,16 @@ static inline void __iomem * __ioremap_mode(phys_addr_t offset, unsigned long si
 		if (!size || last_addr < phys_addr)
 			return NULL;
 
-		/*
-		 * Map uncached objects in the low 512MB of address
-		 * space using KSEG1.
-		 */
-		if (__IS_LOW512(phys_addr) && __IS_LOW512(last_addr) &&
-		    flags == _CACHE_UNCACHED)
-			return (void __iomem *)
-				(unsigned long)CKSEG1ADDR(phys_addr);
+		if (likely(!cpu_has_xks01)) {
+			/*
+			 * Map uncached objects in the low 512MB of address
+			 * space using KSEG1.
+			 */
+			if (__IS_LOW512(phys_addr) && __IS_LOW512(last_addr) &&
+			    flags == _CACHE_UNCACHED)
+				return (void __iomem *)
+					(unsigned long)CKSEG1ADDR(phys_addr);
+		}
 	}
 
 	return __ioremap(offset, size, flags);
diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index ad461216b5a1..7b8eea14b80e 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -252,8 +252,12 @@ extern int __virt_addr_valid(const volatile void *kaddr);
 	 ((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0) | \
 	 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
 
+#ifdef CONFIG_XKS01
+#define CAC_ADDR(addr)		({ BUG(); NULL; })
+#else
 #define UNCAC_ADDR(addr)	((addr) - PAGE_OFFSET + UNCAC_BASE)
 #define CAC_ADDR(addr)		((addr) - UNCAC_BASE + PAGE_OFFSET)
+#endif
 
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index cf3fd549e16d..200087ce9963 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1760,6 +1760,7 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
 			__cpu_name[cpu] = "Broadcom BMIPS4380";
 			set_elf_platform(cpu, "bmips4380");
 			c->options |= MIPS_CPU_RIXI;
+			c->options |= MIPS_CPU_XKS01;
 		} else {
 			c->cputype = CPU_BMIPS4350;
 			__cpu_name[cpu] = "Broadcom BMIPS4350";
@@ -1775,7 +1776,7 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
 		else
 			__cpu_name[cpu] = "Broadcom BMIPS5000";
 		set_elf_platform(cpu, "bmips5000");
-		c->options |= MIPS_CPU_ULRI | MIPS_CPU_RIXI;
+		c->options |= MIPS_CPU_ULRI | MIPS_CPU_RIXI | MIPS_CPU_XKS01;
 		break;
 	}
 }
diff --git a/arch/mips/mm/ioremap.c b/arch/mips/mm/ioremap.c
index 1986e09fb457..f8fd14188909 100644
--- a/arch/mips/mm/ioremap.c
+++ b/arch/mips/mm/ioremap.c
@@ -128,13 +128,15 @@ void __iomem * __ioremap(phys_addr_t phys_addr, phys_addr_t size, unsigned long
 	if (!size || last_addr < phys_addr)
 		return NULL;
 
-	/*
-	 * Map uncached objects in the low 512mb of address space using KSEG1,
-	 * otherwise map using page tables.
-	 */
-	if (IS_LOW512(phys_addr) && IS_LOW512(last_addr) &&
-	    flags == _CACHE_UNCACHED)
-		return (void __iomem *) CKSEG1ADDR(phys_addr);
+	if (likely(!cpu_has_xks01)) {
+		/*
+		 * Map uncached objects in the low 512mb of address space using
+		 * KSEG1, otherwise map using page tables.
+		 */
+		if (IS_LOW512(phys_addr) && IS_LOW512(last_addr) &&
+		    flags == _CACHE_UNCACHED)
+			return (void __iomem *) CKSEG1ADDR(phys_addr);
+	}
 
 	/*
 	 * Don't allow anybody to remap normal RAM that we're using..
-- 
2.7.4
