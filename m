Received: from mailapp01.imgtec.com ([195.59.15.196]:22369 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993035AbcKWNoKCJSuG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Nov 2016 14:44:10 +0100
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH 07/10] MIPS: fix mem=X@Y commandline processing
Date: Wed, 23 Nov 2016 14:43:49 +0100
Message-ID: <1479908632-30392-8-git-send-email-marcin.nowakowski@imgtec.com>
In-Reply-To: <1479908632-30392-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1479908632-30392-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20161123134349.JOr3RJyqzsS8yTkbmq8sxIe8WxoU5QLSAMwh6cSM8l4@z>

When a memory offset is specified through the commandline, add the
memory in range PHYS_OFFSET:Y as reserved memory area.
Otherwise the bootmem allocator is initialised with low page equal to
min_low_pfn = PHYS_OFFSET, and in free_all_bootmem will process pages
starting from min_low_pfn instead of PFN(Y).

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 arch/mips/kernel/setup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index c22f0fd..ae88866 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -662,6 +662,10 @@ static int __init early_parse_mem(char *p)
 		start = memparse(p + 1, &p);
 
 	add_memory_region(start, size, BOOT_MEM_RAM);
+
+	if (start && start > PHYS_OFFSET)
+		add_memory_region(PHYS_OFFSET, start - PHYS_OFFSET,
+				BOOT_MEM_RESERVED);
 	return 0;
 }
 early_param("mem", early_parse_mem);
-- 
2.7.4
