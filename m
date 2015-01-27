Received: from mailapp01.imgtec.com ([195.59.15.196]:48852 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011885AbbA0VRZ4ymsV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 27 Jan 2015 22:17:25 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 3/3] MIPS: Malta: Implement mips_cdmm_phys_base()
Date: Tue, 27 Jan 2015 21:16:41 +0000
Message-ID: <1422393401-13543-4-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1422393401-13543-1-git-send-email-james.hogan@imgtec.com>
References: <1422393401-13543-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
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
Cc: linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20150127211641.KsvSsgGyhNOhsFS21mQVotMMDTClmMS2sfXZELQn6Ng@z>

Implement mips_cdmm_phys_base() for Malta, returning the physical base
address 0x1fc10000 which is "typically unused".

This allows the Common Device Mapped Memory (CDMM) region to be mapped,
and devices in that region (such as the Fast Debug Channel (FDC)
hardware for communication over EJTAG) to be discovered.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/mti-malta/malta-memory.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/mti-malta/malta-memory.c b/arch/mips/mti-malta/malta-memory.c
index 8fddd2cdbff7..32c27cb8e463 100644
--- a/arch/mips/mti-malta/malta-memory.c
+++ b/arch/mips/mti-malta/malta-memory.c
@@ -16,6 +16,7 @@
 #include <linux/string.h>
 
 #include <asm/bootinfo.h>
+#include <asm/cdmm.h>
 #include <asm/maar.h>
 #include <asm/sections.h>
 #include <asm/fw/fw.h>
@@ -196,3 +197,9 @@ unsigned platform_maar_init(unsigned num_pairs)
 
 	return maar_config(cfg, num_cfg, num_pairs);
 }
+
+phys_addr_t mips_cdmm_phys_base(void)
+{
+	/* This address is "typically unused" */
+	return 0x1fc10000;
+}
-- 
2.0.5
