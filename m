Received: from mail-wr0-x243.google.com ([IPv6:2a00:1450:400c:c0c::243]:43229
        "EHLO mail-wr0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990408AbdLZLiCQ0ZxK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 26 Dec 2017 12:38:02 +0100
From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH 1/2] MIPS: add declaration for function `memory_region_available`
Date: Tue, 26 Dec 2017 12:37:13 +0100
Message-ID: <20171226113717.15074-1-malat@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-Path: <mathieu.malaterre@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Cc: Mathieu Malaterre <malat@debian.org>, Ralf Baechle <ralf@linux-mips.org>, Marcin Nowakowski <marcin.nowakowski@mips.com>, David Daney <david.daney@cavium.com>, Goran Ferenc <goran.ferenc@imgtec.com>, Miodrag Dinic <miodrag.dinic@mips.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20171226113713.fNnFRKij_fxZkc6Qu43q5nLa-c8oYmnFydyVT71pvA0@z>

Fix non-fatal warning:

arch/mips/kernel/setup.c:158:13: warning: no previous prototype for ‘memory_region_available’ [-Wmissing-prototypes]
 bool __init memory_region_available(phys_addr_t start, phys_addr_t size)
             ^~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/mips/include/asm/bootinfo.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index e26a093bb17a..32e3c9a2c5a0 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -108,6 +108,7 @@ extern struct boot_mem_map boot_mem_map;
 
 extern void add_memory_region(phys_addr_t start, phys_addr_t size, long type);
 extern void detect_memory_region(phys_addr_t start, phys_addr_t sz_min,  phys_addr_t sz_max);
+extern bool memory_region_available(phys_addr_t start, phys_addr_t size);
 
 extern void prom_init(void);
 extern void prom_free_prom_memory(void);
-- 
2.11.0
