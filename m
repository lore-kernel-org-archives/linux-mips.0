Received: from mailapp02.imgtec.com ([217.156.133.132]:13092 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23991759AbcJQQV4Zj10B (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Oct 2016 18:21:56 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH v2] MIPS: KASLR: Fix handling of NULL FDT
Date: Mon, 17 Oct 2016 17:21:46 +0100
Message-ID: <1476721306-14742-1-git-send-email-matt.redfearn@imgtec.com>
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
Message-ID: <20161017162146.7G2p_jiJlxguLj7-akSCJ8pmRvuV6YSLmQITMh_C1zs@z>

If platform code returns a NULL pointer to the FDT, initial_boot_params
will not get set to a valid pointer and attempting to find the /chosen
node in it will cause a NULL pointer dereference and the kernel to crash
immediately on startup - with no output to the console.

Fix this by checking that initial_boot_params is valid before using it.

Fixes: 405bc8fd12f5 ("MIPS: Kernel: Implement KASLR using CONFIG_RELOCATABLE")
Cc: <stable@vger.kernel.org> # 4.7+
Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 arch/mips/kernel/relocate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index ca1cc30c0891..1958910b75c0 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -200,7 +200,7 @@ static inline __init unsigned long get_random_boot(void)
 
 #if defined(CONFIG_USE_OF)
 	/* Get any additional entropy passed in device tree */
-	{
+	if (initial_boot_params) {
 		int node, len;
 		u64 *prop;
 
-- 
2.7.4
