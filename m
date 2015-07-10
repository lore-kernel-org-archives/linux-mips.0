Received: from mailapp01.imgtec.com ([195.59.15.196]:37475 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010210AbbGJPxWSZ041 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Jul 2015 17:53:22 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 1/2] MIPS: mm: default platform_maar_init using bootmem data
Date: Fri, 10 Jul 2015 16:52:38 +0100
Message-ID: <1436543559-26886-2-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1436543559-26886-1-git-send-email-paul.burton@imgtec.com>
References: <1436543559-26886-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20150710155238.ENPP_sS-C156gY_aMTF7idthEHYR2a7bArnMHqVUn-o@z>

Introduce a default weak implementation of platform_maar_init which
makes use of the data that platforms already provide to the bootmem
allocator. This should hopefully cover the most common configurations,
reduce the duplication of information provided by platforms & leaves
platforms with the option of providing a custom implementation if
required.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>

---

 arch/mips/mm/init.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index faa5c98..e8c8b6f 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -37,6 +37,7 @@
 #include <asm/cpu.h>
 #include <asm/dma.h>
 #include <asm/kmap_types.h>
+#include <asm/maar.h>
 #include <asm/mmu_context.h>
 #include <asm/sections.h>
 #include <asm/pgtable.h>
@@ -331,9 +332,40 @@ static inline void mem_init_free_highmem(void)
 #endif
 }
 
-unsigned __weak platform_maar_init(unsigned num_maars)
+unsigned __weak platform_maar_init(unsigned num_pairs)
 {
-	return 0;
+	struct maar_config cfg[BOOT_MEM_MAP_MAX];
+	unsigned i, num_configured, num_cfg = 0;
+	phys_addr_t skip;
+
+	for (i = 0; i < boot_mem_map.nr_map; i++) {
+		switch (boot_mem_map.map[i].type) {
+		case BOOT_MEM_RAM:
+		case BOOT_MEM_INIT_RAM:
+			break;
+		default:
+			continue;
+		}
+
+		skip = 0x10000 - (boot_mem_map.map[i].addr & 0xffff);
+
+		cfg[num_cfg].lower = boot_mem_map.map[i].addr;
+		cfg[num_cfg].lower += skip;
+
+		cfg[num_cfg].upper = cfg[num_cfg].lower;
+		cfg[num_cfg].upper += boot_mem_map.map[i].size - 1;
+		cfg[num_cfg].upper -= skip;
+
+		cfg[num_cfg].attrs = MIPS_MAAR_S;
+		num_cfg++;
+	}
+
+	num_configured = maar_config(cfg, num_cfg, num_pairs);
+	if (num_configured < num_cfg)
+		pr_warn("Not enough MAAR pairs (%u) for all bootmem regions (%u)\n",
+			num_pairs, num_cfg);
+
+	return num_configured;
 }
 
 static void maar_init(void)
-- 
2.4.4
