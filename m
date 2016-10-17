Received: from mailapp02.imgtec.com ([217.156.133.132]:25110 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23990521AbcJQKFELThuU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Oct 2016 12:05:04 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] MIPS: KASLR: Fix handling of NULL FDT
Date: Mon, 17 Oct 2016 11:04:54 +0100
Message-ID: <1476698694-6685-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, "# 4 . 7+" <stable@vger.kernel.org>, linux-kernel@vger.kernel.org
Message-ID: <20161017100454.Fjmoq9KEDRxcIMv_KMn2hJK_7cZS9HneMdkdQE_X_EY@z>

If platform code returns a NULL pointer to the FDT, initial_boot_params
will not get set to a valid pointer and attempting to find the /chosen
node in it will cause a NULL pointer dereference and the kernel to crash
immediately on startup - with no output to the console.

Fix this by checking that initial_boot_params is valid before using it.

Fixes: 405bc8fd12f5 ("MIPS: Kernel: Implement KASLR using CONFIG_RELOCATABLE")
Cc: <stable@vger.kernel.org> # 4.7+
Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 arch/mips/kernel/relocate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index ca1cc30c0891..8810183840ca 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -200,6 +200,7 @@ static inline __init unsigned long get_random_boot(void)
 
 #if defined(CONFIG_USE_OF)
 	/* Get any additional entropy passed in device tree */
+	if (initial_boot_params)
 	{
 		int node, len;
 		u64 *prop;
-- 
2.7.4
