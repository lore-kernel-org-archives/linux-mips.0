Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:33965 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990502AbdLEWjUAbjTU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 5 Dec 2017 23:39:20 +0100
From: James Hogan <james.hogan@mips.com>
Subject: [PATCH] MIPS: CM: Drop WARN_ON(vp != 0)
Date: Tue, 5 Dec 2017 22:28:22 +0000
Message-ID: <20171205222822.15034-1-james.hogan@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@mips.com>
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
Cc: Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20171205222822.2eBl99WyWXMhJDrf6Za7r4zUzHaj9cfNWscJzDPiyPg@z>

From: James Hogan <jhogan@kernel.org>

Since commit 68923cdc2eb3 ("MIPS: CM: Add cluster & block args to
mips_cm_lock_other()"), mips_smp_send_ipi_mask() has used
mips_cm_lock_other_cpu() with each CPU number, rather than
mips_cm_lock_other() with the first VPE in each core. Prior to r6,
multicore multithreaded systems such as dual-core dual-thread
interAptivs with CPU Idle enabled (e.g. MIPS Creator Ci40) results in
mips_cm_lock_other() repeatedly hitting WARN_ON(vp != 0).

There doesn't appear to be anything fundamentally wrong about passing a
non-zero VP/VPE number, even if it is a core's region that is locked
into the other region before r6, so remove that particular WARN_ON().

Fixes: 68923cdc2eb3 ("MIPS: CM: Add cluster & block args to mips_cm_lock_other()")
Signed-off-by: James Hogan <jhogan@kernel.org>
Reviewed-by: Paul Burton <paul.burton@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org> # 4.14+
---
 arch/mips/kernel/mips-cm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index dd5567b1e305..8f5bd04f320a 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -292,7 +292,6 @@ void mips_cm_lock_other(unsigned int cluster, unsigned int core,
 				  *this_cpu_ptr(&cm_core_lock_flags));
 	} else {
 		WARN_ON(cluster != 0);
-		WARN_ON(vp != 0);
 		WARN_ON(block != CM_GCR_Cx_OTHER_BLOCK_LOCAL);
 
 		/*
-- 
2.14.1
