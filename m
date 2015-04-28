Received: from mail-db3on0084.outbound.protection.outlook.com ([157.55.234.84]:45664
        "EHLO emea01-db3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27026211AbbD1OmIkm6bt (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 28 Apr 2015 16:42:08 +0200
From: Chris Metcalf <cmetcalf@ezchip.com>
Subject: [PATCH] tile: properly use node_isset() on a nodemask_t
Date: Tue, 28 Apr 2015 10:41:47 -0400
Message-ID: <1430232107-15041-1-git-send-email-cmetcalf@ezchip.com>
In-Reply-To: <CAMuHMdXEH6ZnTSdBi2uJzPriqTLvJvd0bPYH3NPWV5LjZB5S=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <cmetcalf@ezchip.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Geert Uytterhoeven <geert@linux-m68k.org> Rusty Russell" <rusty@rustcorp.com.au>
Cc: Chris Metcalf <cmetcalf@ezchip.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, sparclinux <sparclinux@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mark Brown <broonie@kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>, Matthew Wilcox <willy@linux.intel.com>
Message-ID: <20150428144147.dcGmE3PQpxYX3a_IH7kmZZksKZrVrXAgCHB8YrzezrI@z>

The code accidentally used cpu_isset() previously in one place
(though properly node_isset() elsewhere).

Signed-off-by: Chris Metcalf <cmetcalf@ezchip.com>
---
 arch/tile/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/tile/kernel/setup.c b/arch/tile/kernel/setup.c
index 6873f006f7d0..d366675e4bf8 100644
--- a/arch/tile/kernel/setup.c
+++ b/arch/tile/kernel/setup.c
@@ -774,7 +774,7 @@ static void __init zone_sizes_init(void)
 		 * though, there'll be no lowmem, so we just alloc_bootmem
 		 * the memmap.  There will be no percpu memory either.
 		 */
-		if (i != 0 && cpumask_test_cpu(i, &isolnodes)) {
+		if (i != 0 && node_isset(i, isolnodes)) {
 			node_memmap_pfn[i] =
 				alloc_bootmem_pfn(0, memmap_size, 0);
 			BUG_ON(node_percpu[i] != 0);
-- 
2.1.2
