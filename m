Received: from mail-wr0-x241.google.com ([IPv6:2a00:1450:400c:c0c::241]:41126
        "EHLO mail-wr0-x241.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990510AbdLZLiNK5TbK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 26 Dec 2017 12:38:13 +0100
From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH 2/2] MIPS: Remove a warning when PHYS_OFFSET is 0x0
Date: Tue, 26 Dec 2017 12:37:14 +0100
Message-ID: <20171226113717.15074-2-malat@debian.org>
In-Reply-To: <20171226113717.15074-1-malat@debian.org>
References: <20171226113717.15074-1-malat@debian.org>
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
Cc: Mathieu Malaterre <malat@debian.org>, Ralf Baechle <ralf@linux-mips.org>, Marcin Nowakowski <marcin.nowakowski@mips.com>, Miodrag Dinic <miodrag.dinic@mips.com>, James Hogan <jhogan@kernel.org>, Aleksandar Markovic <aleksandar.markovic@mips.com>, David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20171226113714.Xq_8vSIbK7DfGrii4tC_HYeAkjkmOgb0kXMGajONa0s@z>

Rewrite the comparison in `else if` statement, case where `min_low_pfn >
ARCH_PFN_OFFSET` has already been checked in the first `if` statement:

  if (min_low_pfn > ARCH_PFN_OFFSET) {

Fix non-fatal warning:

arch/mips/kernel/setup.c: In function ‘bootmem_init’:
arch/mips/kernel/setup.c:461:25: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
  } else if (min_low_pfn < ARCH_PFN_OFFSET) {
                         ^

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/mips/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index f19d61224c71..073695ccc1aa 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -458,7 +458,7 @@ static void __init bootmem_init(void)
 		pr_info("Wasting %lu bytes for tracking %lu unused pages\n",
 			(min_low_pfn - ARCH_PFN_OFFSET) * sizeof(struct page),
 			min_low_pfn - ARCH_PFN_OFFSET);
-	} else if (min_low_pfn < ARCH_PFN_OFFSET) {
+	} else if (ARCH_PFN_OFFSET - min_low_pfn > 0UL) {
 		pr_info("%lu free pages won't be used\n",
 			ARCH_PFN_OFFSET - min_low_pfn);
 	}
-- 
2.11.0
