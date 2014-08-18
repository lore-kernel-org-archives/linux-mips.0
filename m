Received: from mailapp01.imgtec.com ([195.59.15.196]:17473 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6855225AbaHROE3L8oNB (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 18 Aug 2014 16:04:29 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: Malta: memory: Improve system memory detection for '{e,}memsize' >= 2G
Date: Mon, 18 Aug 2014 15:04:11 +0100
Message-ID: <1408370651-1505-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140818140411.tBDp3yagVwXQsPQWOIDbwEkkS_dIPx5LD8LWX8LJGwQ@z>

Using kstrtol to parse the "{e,}memsize" variables was wrong because this
parses signed long numbers. In case of '{e,}memsize' >= 2G, the top bit
is set, resulting to -ERANGE errors and possibly random system memory
boundaries. We fix this by replacing "kstrtol" with "kstrtoul".
We also improve the code to check the kstrtoul return value and
print a warning if an error was returned.

Cc: <stable@vger.kernel.org> # v3.15+
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/mti-malta/malta-memory.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/mips/mti-malta/malta-memory.c b/arch/mips/mti-malta/malta-memory.c
index 0c35dee0a215..8fddd2cdbff7 100644
--- a/arch/mips/mti-malta/malta-memory.c
+++ b/arch/mips/mti-malta/malta-memory.c
@@ -35,13 +35,19 @@ fw_memblock_t * __init fw_getmdesc(int eva)
 	/* otherwise look in the environment */
 
 	memsize_str = fw_getenv("memsize");
-	if (memsize_str)
-		tmp = kstrtol(memsize_str, 0, &memsize);
+	if (memsize_str) {
+		tmp = kstrtoul(memsize_str, 0, &memsize);
+		if (tmp)
+			pr_warn("Failed to read the 'memsize' env variable.\n");
+	}
 	if (eva) {
 	/* Look for ememsize for EVA */
 		ememsize_str = fw_getenv("ememsize");
-		if (ememsize_str)
-			tmp = kstrtol(ememsize_str, 0, &ememsize);
+		if (ememsize_str) {
+			tmp = kstrtoul(ememsize_str, 0, &ememsize);
+			if (tmp)
+				pr_warn("Failed to read the 'ememsize' env variable.\n");
+		}
 	}
 	if (!memsize && !ememsize) {
 		pr_warn("memsize not set in YAMON, set to default (32Mb)\n");
-- 
2.0.4
