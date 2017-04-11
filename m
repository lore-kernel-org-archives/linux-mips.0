Received: from mailapp01.imgtec.com ([195.59.15.196]:32388 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993914AbdDKHAwKXKY6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 11 Apr 2017 09:00:52 +0200
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH 2/3] MIPS: highmem: ensure that we don't use more than one page for PTEs
Date: Tue, 11 Apr 2017 09:00:35 +0200
Message-ID: <1491894036-5440-3-git-send-email-marcin.nowakowski@imgtec.com>
In-Reply-To: <1491894036-5440-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1491894036-5440-1-git-send-email-marcin.nowakowski@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <20170411070035.LYPsIan0QDLJ14h403LieKi0AR56-3U-QIC7Li4IZjs@z>

All PTEs used by PKMAP should be allocated in a contiguous memory area,
but we do not currently have a mechanism to enforce that, so ensure that
we don't try to allocate more entries than would fit in a single page.

Current fixed value of 1024 would not work with XPA enabled when
sizeof(pte_t)==8 and we need two pages to store pte tables.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 arch/mips/include/asm/highmem.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/include/asm/highmem.h b/arch/mips/include/asm/highmem.h
index d34536e..279b6d1 100644
--- a/arch/mips/include/asm/highmem.h
+++ b/arch/mips/include/asm/highmem.h
@@ -35,7 +35,12 @@ extern pte_t *pkmap_page_table;
  * easily, subsequent pte tables have to be allocated in one physical
  * chunk of RAM.
  */
+#ifdef CONFIG_PHYS_ADDR_T_64BIT
+#define LAST_PKMAP 512
+#else
 #define LAST_PKMAP 1024
+#endif
+
 #define LAST_PKMAP_MASK (LAST_PKMAP-1)
 #define PKMAP_NR(virt)	((virt-PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)	(PKMAP_BASE + ((nr) << PAGE_SHIFT))
-- 
2.7.4
