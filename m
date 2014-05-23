Received: from mailapp01.imgtec.com ([195.59.15.196]:62721 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6855797AbaEWMcONce02 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 23 May 2014 14:32:14 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 2/2] MIPS: malta: Remove 'maybe_unused' attribute from ememsize{,_str}
Date: Fri, 23 May 2014 13:31:32 +0100
Message-ID: <1400848292-19544-2-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1400848292-19544-1-git-send-email-markos.chandras@imgtec.com>
References: <1400848292-19544-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140523123132.8RSR2PXFD5FehahMNz1C7IXNlYA2temws4SbShSIs0E@z>

First introduced in e6ca4e5bf11466b5e9423a1e4ea51a8216c4b9b6
"MIPS: malta: malta-memory: Add support for the 'ememsize' variable"
but it is not needed since both variables are visible to the compiler.

Cc: <stable@vger.kernel.org> # v3.15+
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/mti-malta/malta-memory.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mti-malta/malta-memory.c b/arch/mips/mti-malta/malta-memory.c
index f2364e4..6d97730 100644
--- a/arch/mips/mti-malta/malta-memory.c
+++ b/arch/mips/mti-malta/malta-memory.c
@@ -26,8 +26,8 @@ unsigned long physical_memsize = 0L;
 
 fw_memblock_t * __init fw_getmdesc(int eva)
 {
-	char *memsize_str, *ememsize_str __maybe_unused = NULL, *ptr;
-	unsigned long memsize = 0, ememsize __maybe_unused = 0;
+	char *memsize_str, *ememsize_str = NULL, *ptr;
+	unsigned long memsize = 0, ememsize = 0;
 	static char cmdline[COMMAND_LINE_SIZE] __initdata;
 	int tmp;
 
-- 
1.9.3
