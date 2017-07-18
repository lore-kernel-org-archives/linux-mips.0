Received: from mailapp01.imgtec.com ([195.59.15.196]:14798 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992143AbdGRN0YzjdYt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 18 Jul 2017 15:26:24 +0200
From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [PATCH 1/2] MIPS: ralink: Fix build error due to missing header
Date: Tue, 18 Jul 2017 14:25:45 +0100
Message-ID: <1500384346-10527-1-git-send-email-harvey.hunt@imgtec.com>
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
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, "#4 . 11+" <stable@vger.kernel.org>, John Crispin <john@phrozen.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20170718132545.5OcbWJomPbjlbsAZCHi4h-gzbfzfWpi4-1kNyBdP6Kw@z>

Previously, <linux/module.h> was included before ralink_regs.h in all
ralink files - leading to <linux/io.h> being implicitly included.

After commit 26dd3e4ff9ac ("MIPS: Audit and remove any unnecessary
uses of module.h") removed the inclusion of module.h from multiple
places, some ralink platforms failed to build with the following error:

In file included from arch/mips/ralink/mt7620.c:17:0:
./arch/mips/include/asm/mach-ralink/ralink_regs.h: In function ‘rt_sysc_w32’:
./arch/mips/include/asm/mach-ralink/ralink_regs.h:38:2: error: implicit declaration of function ‘__raw_writel’ [-Werror=implicit-function-declaration]
  __raw_writel(val, rt_sysc_membase + reg);
  ^
./arch/mips/include/asm/mach-ralink/ralink_regs.h: In function ‘rt_sysc_r32’:
./arch/mips/include/asm/mach-ralink/ralink_regs.h:43:2: error: implicit declaration of function ‘__raw_readl’ [-Werror=implicit-function-declaration]
  return __raw_readl(rt_sysc_membase + reg);

Fix this by including <linux/io.h>.

Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
Fixes: 26dd3e4ff9ac ("MIPS: Audit and remove any unnecessary uses of module.h")
Cc: <stable@vger.kernel.org> #4.11+
Cc: John Crispin <john@phrozen.org>
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org
---
 arch/mips/include/asm/mach-ralink/ralink_regs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/mach-ralink/ralink_regs.h b/arch/mips/include/asm/mach-ralink/ralink_regs.h
index 9df1a53..b4e7dfa 100644
--- a/arch/mips/include/asm/mach-ralink/ralink_regs.h
+++ b/arch/mips/include/asm/mach-ralink/ralink_regs.h
@@ -13,6 +13,8 @@
 #ifndef _RALINK_REGS_H_
 #define _RALINK_REGS_H_
 
+#include <linux/io.h>
+
 enum ralink_soc_type {
 	RALINK_UNKNOWN = 0,
 	RT2880_SOC,
-- 
2.7.4
