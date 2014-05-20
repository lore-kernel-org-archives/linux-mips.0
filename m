Received: from mail-bl2lp0208.outbound.protection.outlook.com ([207.46.163.208]:26693
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6855083AbaETOtBq0Lne (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 20 May 2014 16:49:01 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH 04/15] MIPS: Don't use RI/XI with 32-bit kernels on 64-bit CPUs.
Date: Tue, 20 May 2014 16:47:05 +0200
Message-ID: <1400597236-11352-5-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140520144705.cK0Ek_iYrdn-VCGxdPCF18tFJla2R3UJ2z6HM_xn_0I@z>

From: David Daney <david.daney@cavium.com>

The TLB handlers cannot handle this case, so disable it for now.

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 arch/mips/include/asm/cpu-features.h |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index f56cc97..01486eb 100644
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
