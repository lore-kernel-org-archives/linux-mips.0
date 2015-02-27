Received: from mailapp01.imgtec.com ([195.59.15.196]:51247 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006155AbbB0HvokJdIr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 27 Feb 2015 08:51:44 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: Malta: malta-memory: Detect and fix bad memsize values
Date: Fri, 27 Feb 2015 07:51:32 +0000
Message-ID: <1425023492-23248-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, stable@vger.kernel.org
Message-ID: <20150227075132.dzXIRS86YgsuhRg4qXA22RZW3fwAe7P88SEjzFwnaCk@z>

memsize denotes the amount of RAM we can access from kseg{0,1} and
that should be up to 256M. In case the bootloader reports a value
higher than that (perhaps reporting all the available RAM) it's best
if we fix it ourselves and just warn the user about that. This is
usually a problem with the bootloader and/or its environment.

Cc: <stable@vger.kernel.org> # v3.15+
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/mti-malta/malta-memory.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/mti-malta/malta-memory.c b/arch/mips/mti-malta/malta-memory.c
index 8fddd2cdbff7..3a0a06450ef8 100644
--- a/arch/mips/mti-malta/malta-memory.c
+++ b/arch/mips/mti-malta/malta-memory.c
@@ -53,6 +53,11 @@ fw_memblock_t * __init fw_getmdesc(int eva)
 		pr_warn("memsize not set in YAMON, set to default (32Mb)\n");
 		physical_memsize = 0x02000000;
 	} else {
+		if (memsize > (256 << 20)) { /* memsize should be capped to 256M */
+			pr_warn("Unsupported memsize value (0x%lx) detected! Using 0x10000000 (256M) instead\n",
+				memsize);
+			memsize = (256 << 20);
+		}
 		/* If ememsize is set, then set physical_memsize to that */
 		physical_memsize = ememsize ? : memsize;
 	}
-- 
2.3.0
