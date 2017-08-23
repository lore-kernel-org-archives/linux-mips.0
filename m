Received: from mailapp01.imgtec.com ([195.59.15.196]:48124 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993932AbdHWSUfb1C0I (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Aug 2017 20:20:35 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 07/11] MIPS: Include linux/initrd.h for free_initrd_mem()
Date: Wed, 23 Aug 2017 11:17:50 -0700
Message-ID: <20170823181754.24044-8-paul.burton@imgtec.com>
In-Reply-To: <20170823181754.24044-1-paul.burton@imgtec.com>
References: <20170823181754.24044-1-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, trivial@kernel.org
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170823181750.o3kCGFHDaa5jSlo911FUx6AVFYiSo5LI4eMdDpdbgAM@z>

arch/mips/mm/init.c provides our implementation of free_initrd_mem(),
but doesn't include the linux/initrd.h header which declares them. This
leads to a warning from sparse:

  arch/mips/mm/init.c:501:6: warning: symbol 'free_initrd_mem' was not
    declared. Should it be static?

Fix this by including linux/initrd.h to get the declaration of
free_initrd_mem().

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/mm/init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 8ce2983a7015..5f6ea7d746de 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -31,6 +31,7 @@
 #include <linux/gfp.h>
 #include <linux/kcore.h>
 #include <linux/export.h>
+#include <linux/initrd.h>
 
 #include <asm/asm-offsets.h>
 #include <asm/bootinfo.h>
-- 
2.14.1
