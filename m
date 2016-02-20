Received: from mail5.windriver.com ([192.103.53.11]:33304 "EHLO mail5.wrs.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S27012263AbcBTAcculyxy (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sat, 20 Feb 2016 01:32:32 +0100
From: Yang Shi <yang.shi@windriver.com>
Subject: [PATCH] mips: octeon: unselect NR_CPUS_DEFAULT_16
Date: Fri, 19 Feb 2016 16:09:28 -0800
Message-ID: <1455926968-12779-1-git-send-email-yang.shi@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Yang.Shi@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: david.daney@cavium.com, ralf@linux-mips.org
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20160220000928.2LFgRSq-8UtJH7byzoG8NxlGiBaNyAsPBNAypzpOAhY@z>

In the octeon defconfig, NR_CPUS is 32. And, some model of OCTEON II do have
> 16 cores. Given the typical memory size equipped by Octeon boards, it sounds
like not a big deal to set a bigger NR_CPUS value as default.

Signed-off-by: Yang Shi <yang.shi@windriver.com>
---
 arch/mips/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ab433d3..a885156 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -885,7 +885,6 @@ config CAVIUM_OCTEON_SOC
 	select USE_OF
 	select ARCH_SPARSEMEM_ENABLE
 	select SYS_SUPPORTS_SMP
-	select NR_CPUS_DEFAULT_16
 	select BUILTIN_DTB
 	select MTD_COMPLEX_MAPPINGS
 	help
-- 
2.0.2
