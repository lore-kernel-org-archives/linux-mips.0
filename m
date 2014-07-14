Received: from mailapp01.imgtec.com ([195.59.15.196]:2046 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6860096AbaGNJcrQdPNc (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 14 Jul 2014 11:32:47 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 4D31963987D65
        for <linux-mips@linux-mips.org>; Mon, 14 Jul 2014 10:32:38 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 4/4] MIPS: Malta: initialise MAARs
Date: Mon, 14 Jul 2014 10:32:16 +0100
Message-ID: <1405330336-18167-5-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1405330336-18167-1-git-send-email-paul.burton@imgtec.com>
References: <1405330336-18167-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140714093216.RdwkRQmm6F4Fvgtys5E19_IdZppvivmIOBlhsU2Iy5U@z>

Initialise the MAARs such that speculation is enabled for all physical
addresses outside of the I/O region.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/mti-malta/malta-memory.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/mips/mti-malta/malta-memory.c b/arch/mips/mti-malta/malta-memory.c
index 6d97730..e96803d 100644
--- a/arch/mips/mti-malta/malta-memory.c
+++ b/arch/mips/mti-malta/malta-memory.c
@@ -16,6 +16,7 @@
 #include <linux/string.h>
 
 #include <asm/bootinfo.h>
+#include <asm/maar.h>
 #include <asm/sections.h>
 #include <asm/fw/fw.h>
 
@@ -164,3 +165,28 @@ void __init prom_free_prom_memory(void)
 				addr, addr + boot_mem_map.map[i].size);
 	}
 }
+
+unsigned platform_maar_init(unsigned num_pairs)
+{
+	phys_addr_t mem_end = (physical_memsize & ~0xffffull) - 1;
+	struct maar_config cfg[] = {
+		/* DRAM preceeding I/O */
+		{ 0x00000000, 0x0fffffff, MIPS_MAAR_S },
+
+		/* DRAM following I/O */
+		{ 0x20000000, mem_end, MIPS_MAAR_S },
+
+		/* DRAM alias in upper half of physical */
+		{ 0x80000000, 0x80000000 + mem_end, MIPS_MAAR_S },
+	};
+	unsigned i, num_cfg = ARRAY_SIZE(cfg);
+
+	/* If DRAM fits before I/O, drop the region following it */
+	if (physical_memsize <= 0x10000000) {
+		num_cfg--;
+		for (i = 1; i < num_cfg; i++)
+			cfg[i] = cfg[i + 1];
+	}
+
+	return maar_config(cfg, num_cfg, num_pairs);
+}
-- 
2.0.1
