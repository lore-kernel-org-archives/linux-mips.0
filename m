Received: from mailapp01.imgtec.com ([195.59.15.196]:26491 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993201AbdDLFVu2TWz2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 12 Apr 2017 07:21:50 +0200
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH] MIPS: smp-cps: add missing include
Date: Wed, 12 Apr 2017 07:21:39 +0200
Message-ID: <1491974499-28414-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <20170412052139.uBNM7BACFSbCpXQ5eSYQtjCwcc8hAZbJ52mrvqq8w6Q@z>

An earlier change ('MIPS: Use common outgoing-CPU-notification code')
is missing a required header with cpu notification method declarations
leading to build failures.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---

Ralf,
 Could you squash this patch together with the original commit?

 arch/mips/kernel/smp-cps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 0aee71b..306b4a6 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -8,6 +8,7 @@
  * option) any later version.
  */
 
+#include <linux/cpu.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/irqchip/mips-gic.h>
-- 
2.7.4
