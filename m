Received: from mailapp01.imgtec.com ([195.59.15.196]:62325 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993922AbdHWSTlAEdAI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Aug 2017 20:19:41 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 04/11] MIPS: Include linux/cpu.h for arch_cpu_idle()
Date: Wed, 23 Aug 2017 11:17:47 -0700
Message-ID: <20170823181754.24044-5-paul.burton@imgtec.com>
In-Reply-To: <20170823181754.24044-1-paul.burton@imgtec.com>
References: <20170823181754.24044-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, trivial@kernel.org
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170823181747.qUt7eI5TDYStX4SCfnqBN5lYkY2slGqi4bBkA7YUnVQ@z>

arch/mips/kernel/idle.c provides our implementation of the
arch_cpu_idle() function, but doesn't include the linux/cpu.h header
which declares it. This leads to a warning from sparse:

  arch/mips/kernel/idle.c:256:6: warning: symbol 'arch_cpu_idle' was not
    declared. Should it be static?

Fix this by including linux/cpu.h to get the declaration of
arch_cpu_idle().

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/kernel/idle.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
index 60ab4c44d305..7c246b69c545 100644
--- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -11,6 +11,7 @@
  * as published by the Free Software Foundation; either version
  * 2 of the License, or (at your option) any later version.
  */
+#include <linux/cpu.h>
 #include <linux/export.h>
 #include <linux/init.h>
 #include <linux/irqflags.h>
-- 
2.14.1
