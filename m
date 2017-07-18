Received: from mailapp01.imgtec.com ([195.59.15.196]:40862 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994848AbdGRN0iIhq1t (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 18 Jul 2017 15:26:38 +0200
From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [PATCH 2/2] MIPS: ralink: mt7620: Add missing header
Date: Tue, 18 Jul 2017 14:25:46 +0100
Message-ID: <1500384346-10527-2-git-send-email-harvey.hunt@imgtec.com>
In-Reply-To: <1500384346-10527-1-git-send-email-harvey.hunt@imgtec.com>
References: <1500384346-10527-1-git-send-email-harvey.hunt@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-Path: <Harvey.Hunt@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, John Crispin <john@phrozen.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20170718132546.pq4xQMQuh76nUFRA2iQL62_I-Uwh5zT-peLYkHw_og4@z>

Fix a build error caused by not including <linux/bug.h>.

The following compilation errors are caused by the missing header:

arch/mips/ralink/mt7620.c: In function ‘mt7620_get_cpu_pll_rate’:
arch/mips/ralink/mt7620.c:431:2: error: implicit declaration of function ‘WARN_ON’ [-Werror=implicit-function-declaration]
  WARN_ON(div >= ARRAY_SIZE(mt7620_clk_divider));
  ^
arch/mips/ralink/mt7620.c: In function ‘mt7620_get_sys_rate’:
arch/mips/ralink/mt7620.c:500:2: error: implicit declaration of function ‘WARN’ [-Werror=implicit-function-declaration]
  if (WARN(!div, "invalid divider for OCP ratio %u", ocp_ratio))
  ^
arch/mips/ralink/mt7620.c: In function ‘mt7620_dram_init’:
arch/mips/ralink/mt7620.c:619:3: error: implicit declaration of function ‘BUG’ [-Werror=implicit-function-declaration]
   BUG();
   ^
cc1: some warnings being treated as errors
scripts/Makefile.build:302: recipe for target 'arch/mips/ralink/mt7620.o' failed

Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: John Crispin <john@phrozen.org>
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org
---
 arch/mips/ralink/mt7620.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/ralink/mt7620.c b/arch/mips/ralink/mt7620.c
index 094a0ee..9be8b08 100644
--- a/arch/mips/ralink/mt7620.c
+++ b/arch/mips/ralink/mt7620.c
@@ -12,6 +12,7 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/bug.h>
 
 #include <asm/mipsregs.h>
 #include <asm/mach-ralink/ralink_regs.h>
-- 
2.7.4
