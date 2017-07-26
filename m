Received: from mailapp01.imgtec.com ([195.59.15.196]:59963 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991978AbdGZHlUc4rzn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 26 Jul 2017 09:41:20 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH v3 1/2] MIPS: Introduce cpu_tcache_line_size
Date: Wed, 26 Jul 2017 08:41:08 +0100
Message-ID: <1501054869-15068-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, "Maciej W. Rozycki" <macro@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170726074108.Mu2vhP5lbAIQj4sKXa0U-qxOR4SSpWVx7XjaKeeJBow@z>

There exist macros to return the cache line size of the L1 dcache and L2
scache but there is currently no macro for the L3 tcache. Add this macro
which will be used by the following patch "MIPS: PCI: Fix
smp_processor_id() in preemptible"

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>

---

Changes in v3:
Split into 2 patches

Changes in v2: None

 arch/mips/include/asm/cpu-features.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index 8baa9033b181..721b698bfe3c 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -428,6 +428,9 @@
 #ifndef cpu_scache_line_size
 #define cpu_scache_line_size()	cpu_data[0].scache.linesz
 #endif
+#ifndef cpu_tcache_line_size
+#define cpu_tcache_line_size()	cpu_data[0].tcache.linesz
+#endif
 
 #ifndef cpu_hwrena_impl_bits
 #define cpu_hwrena_impl_bits		0
-- 
2.7.4
