Received: from mail-bn1lp0141.outbound.protection.outlook.com ([207.46.163.141]:9334
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6854786AbaE1WKMVhB4P (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 29 May 2014 00:10:12 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH v2 04/13] MIPS: Don't use RI/XI with 32-bit kernels on 64-bit CPUs
Date: Wed, 28 May 2014 23:52:07 +0200
Message-ID: <1401313936-11867-5-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1401313936-11867-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1401313936-11867-1-git-send-email-andreas.herrmann@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140528215207.5zovcfleuSJFdBzKL790sevx-hRxZ_XSeEwB0mtfNKs@z>

From: David Daney <david.daney@cavium.com>

The TLB handlers cannot handle this case, so disable it for now.

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 arch/mips/include/asm/cpu-features.h |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index f75dd70..c7d8c99 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -110,9 +110,15 @@
 #ifndef cpu_has_smartmips
 #define cpu_has_smartmips	(cpu_data[0].ases & MIPS_ASE_SMARTMIPS)
 #endif
+
 #ifndef cpu_has_rixi
-#define cpu_has_rixi		(cpu_data[0].options & MIPS_CPU_RIXI)
+# ifdef CONFIG_64BIT
+# define cpu_has_rixi		(cpu_data[0].options & MIPS_CPU_RIXI)
+# else /* CONFIG_32BIT */
+# define cpu_has_rixi		((cpu_data[0].options & MIPS_CPU_RIXI) && !cpu_has_64bits)
+# endif
 #endif
+
 #ifndef cpu_has_mmips
 # ifdef CONFIG_SYS_SUPPORTS_MICROMIPS
 #  define cpu_has_mmips		(cpu_data[0].options & MIPS_CPU_MICROMIPS)
@@ -120,6 +126,7 @@
 #  define cpu_has_mmips		0
 # endif
 #endif
+
 #ifndef cpu_has_vtag_icache
 #define cpu_has_vtag_icache	(cpu_data[0].icache.flags & MIPS_CACHE_VTAG)
 #endif
-- 
1.7.9.5
