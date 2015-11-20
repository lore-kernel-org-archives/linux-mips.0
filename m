Received: from mailapp01.imgtec.com ([195.59.15.196]:32211 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012613AbbKTBiaMQN9u (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 20 Nov 2015 02:38:30 +0100
Subject: [PATCH] MIPS: remove aliasing alignment if HW has antialising
 support
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Date: Thu, 19 Nov 2015 17:38:21 -0800
Message-ID: <20151120013821.13687.44983.stgit@ubuntu-yegoshin>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, cernekee@gmail.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, paul.gortmaker@windriver.com, macro@codesourcery.com, markos.chandras@imgtec.com, kumba@gentoo.org
Message-ID: <20151120013821.95G_tul6TcGLzsaamVpuh0GIMvIImFHDtr9IhgWC_0I@z>

MIPS hardware may have an antialising support and it works even
page size is small.

Setup a shared memory aliasing mask to page size if hardware has
an antialising support. Big shared memory mask forces a disruption
in page address assignment and that corrupts Android library memory
handling.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
---
 arch/mips/mm/c-r4k.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 5d3a25e1cfae..493f5226da10 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1670,7 +1670,7 @@ void r4k_cache_init(void)
 	 * This code supports virtually indexed processors and will be
 	 * unnecessarily inefficient on physically indexed processors.
 	 */
-	if (c->dcache.linesz)
+	if (c->dcache.linesz && cpu_has_dc_aliases)
 		shm_align_mask = max_t( unsigned long,
 					c->dcache.sets * c->dcache.linesz - 1,
 					PAGE_SIZE - 1);
