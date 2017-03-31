Received: from mailapp01.imgtec.com ([195.59.15.196]:43843 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993302AbdCaKvnZLwmd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 31 Mar 2017 12:51:43 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] MIPS: KASLR: Add missing header files
Date: Fri, 31 Mar 2017 11:51:33 +0100
Message-ID: <1490957493-27329-1-git-send-email-matt.redfearn@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, linux-kernel@vger.kernel.org, "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <20170331105133.sBo4UmiWILZDPW7np1Qku-8w-srsqEiL0SqeJ0BnYfA@z>

After the split of linux/sched.h, KASLR stopped building.

Fix this by including the correct header file for init_thread_union

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>

---

 arch/mips/kernel/relocate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index 9103bebc9a8e..2d1a0c438771 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -18,7 +18,7 @@
 #include <linux/kernel.h>
 #include <linux/libfdt.h>
 #include <linux/of_fdt.h>
-#include <linux/sched.h>
+#include <linux/sched/task.h>
 #include <linux/start_kernel.h>
 #include <linux/string.h>
 #include <linux/printk.h>
-- 
2.7.4
