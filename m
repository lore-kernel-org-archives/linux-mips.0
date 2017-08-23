Received: from mailapp01.imgtec.com ([195.59.15.196]:23117 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993922AbdHWSS7QowPI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Aug 2017 20:18:59 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 02/11] MIPS: generic: Include asm/time.h for get_c0_*_int()
Date: Wed, 23 Aug 2017 11:17:45 -0700
Message-ID: <20170823181754.24044-3-paul.burton@imgtec.com>
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
Message-ID: <20170823181745.nqa_4Vf5na_e7BU_VWd6K1B6wKZb728c55XKIeivgh8@z>

arch/mips/generic/irq.c provides implementations of the
get_c0_compare_int() & get_c0_perfcount_int() functions, but doesn't
include the asm/time.h header which declares them. This leads to
warnings from sparse:

  arch/mips/generic/irq.c:36:5: warning: symbol 'get_c0_perfcount_int'
    was not declared. Should it be static?
  arch/mips/generic/irq.c:52:14: warning: symbol 'get_c0_compare_int'
    was not declared. Should it be static?

Fix this by including asm/time.h to get the declarations of
get_c0_compare_int() & get_c0_perfcount_int().

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/generic/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/generic/irq.c b/arch/mips/generic/irq.c
index 14064bdd91dd..efe359ce2576 100644
--- a/arch/mips/generic/irq.c
+++ b/arch/mips/generic/irq.c
@@ -16,6 +16,7 @@
 #include <linux/types.h>
 
 #include <asm/irq.h>
+#include <asm/time.h>
 
 int get_c0_fdc_int(void)
 {
-- 
2.14.1
