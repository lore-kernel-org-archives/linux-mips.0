Received: from mail-cys01nam02on0046.outbound.protection.outlook.com ([104.47.37.46]:54530
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993188AbcKVToea0hnv (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 22 Nov 2016 20:44:34 +0100
Subject: [PATCH 4/5] MIPS: OCTEON: Add plat_get_fdt() function for Cavium
 platforms.
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <d6661543-da93-b164-8cd3-480b33165bac@cavium.com>
Date: Tue, 22 Nov 2016 13:44:20 -0600
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
Message-ID: <20161122194420.QUmF17J7AJmqJtRLaa-_AE3fg8JJyqLpLZG9-32NZQQ@z>

Add in the function needed for OCTEON platforms to support KASLR.

Signed-off-by: Steven J. Hill <Steven.Hill@cavium.com>
---
 arch/mips/cavium-octeon/setup.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 4809ce4..d9dbeb0 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -965,6 +965,13 @@ void __init fw_init_cmdline(void)
 	}
 }

+void __init *plat_get_fdt(void)
+{
+	octeon_bootinfo =
+		cvmx_phys_to_ptr(octeon_boot_desc_ptr->cvmx_desc_vaddr);
+	return phys_to_virt(octeon_bootinfo->fdt_addr);
+}
+
 void __init plat_mem_setup(void)
 {
 	uint64_t mem_alloc_size;
-- 
1.9.1
