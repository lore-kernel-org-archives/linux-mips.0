Received: from mail-dm3nam03on0065.outbound.protection.outlook.com ([104.47.41.65]:15276
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993120AbcKVToWbgrFv (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 22 Nov 2016 20:44:22 +0100
Subject: [PATCH 3/5] MIPS: OCTEON: Add fw_init_cmdline() for Cavium platforms.
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <d8fd1d05-8617-8e12-8250-ef9f05d241ba@cavium.com>
Date: Tue, 22 Nov 2016 13:44:10 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@cavium.com>
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
Cc: ralf@linux-mips.org
Message-ID: <20161122194410.aj0biJ7UctBrGpigEc-yabN2JiNc6K9Ie-WU8B2oWJM@z>

Add platform-specific kernel command line processing for OCTEON.

Signed-off-by: Steven J. Hill <steven.hill@cavium.com>
---
 arch/mips/cavium-octeon/setup.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 9a2db1c..4809ce4 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -949,6 +949,22 @@ static __init void memory_exclude_page(u64 addr, u64 *mem, u64 *size)
 }
 #endif /* CONFIG_CRASH_DUMP */

+void __init fw_init_cmdline(void)
+{
+	int i;
+
+	octeon_boot_desc_ptr = (struct octeon_boot_descriptor *)fw_arg3;
+	for (i = 0; i < octeon_boot_desc_ptr->argc; i++) {
+		const char *arg =
+			cvmx_phys_to_ptr(octeon_boot_desc_ptr->argv[i]);
+		if (strlen(arcs_cmdline) + strlen(arg) + 1 <
+			   sizeof(arcs_cmdline) - 1) {
+			strcat(arcs_cmdline, " ");
+			strcat(arcs_cmdline, arg);
+		}
+	}
+}
+
 void __init plat_mem_setup(void)
 {
 	uint64_t mem_alloc_size;
-- 
1.9.1
