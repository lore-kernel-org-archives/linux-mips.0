Received: from mail1.windriver.com ([147.11.146.13]:61726 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013027AbcBTB1ISJehk (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 20 Feb 2016 02:27:08 +0100
From: Yang Shi <yang.shi@windriver.com>
Subject: [PATCH] mips: octeon: mark some functions __init in smp.c
Date: Fri, 19 Feb 2016 17:04:07 -0800
Message-ID: <1455930247-18490-1-git-send-email-yang.shi@windriver.com>
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
Message-ID: <20160220010407.bW_myagKKdpdpy0X7hM5_Co4WNc3kwsk5xU0E_LbvE8@z>

octeon_smp_setup and octeon_prepare_cpus are just used during initialization
period, so mark them as __init. And, octeon_prepare_cpus is just used in smp.c,
so make it static as well.

Signed-off-by: Yang Shi <yang.shi@windriver.com>
---
 arch/mips/cavium-octeon/smp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/cavium-octeon/smp.c b/arch/mips/cavium-octeon/smp.c
index b7fa9ae..3f03893 100644
--- a/arch/mips/cavium-octeon/smp.c
+++ b/arch/mips/cavium-octeon/smp.c
@@ -97,7 +97,7 @@ static void octeon_smp_hotplug_setup(void)
 #endif
 }
 
-static void octeon_smp_setup(void)
+static void __init octeon_smp_setup(void)
 {
 	const int coreid = cvmx_get_core_num();
 	int cpus;
@@ -196,7 +196,7 @@ static void octeon_init_secondary(void)
  * Callout to firmware before smp_init
  *
  */
-void octeon_prepare_cpus(unsigned int max_cpus)
+static void __init octeon_prepare_cpus(unsigned int max_cpus)
 {
 	/*
 	 * Only the low order mailbox bits are used for IPIs, leave
-- 
2.0.2
