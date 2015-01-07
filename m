Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:25502 "EHLO
        mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010172AbbAGLVYdZ5Jf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Jan 2015 12:21:24 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 01/17] MIPS: Netlogic: Fix wait for slave CPUs
Date: Wed, 7 Jan 2015 16:58:22 +0530
Message-ID: <1420630118-17198-2-git-send-email-jchandra@broadcom.com>
In-Reply-To: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
References: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <jchandra@broadcom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Shanghui Liu <shliu@broadcom.com>, ralf@linux-mips.org, Jayachandran C <jchandra@broadcom.com>
Message-ID: <20150107112822.Mt6GSd1cd2p19FESNfNg-Wfxi3iBjQElK3zeuml_jg8@z>

From: Shanghui Liu <shliu@broadcom.com>

For core 0, the condition of "cpu == bootcpu" is always true, so it
does not wait for other three threads to become ready. Fix this by
using correct check.

Signed-off-by: Shanghui Liu <shliu@broadcom.com>
Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/netlogic/xlp/wakeup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/netlogic/xlp/wakeup.c b/arch/mips/netlogic/xlp/wakeup.c
index e5f44d2..26d82f7 100644
--- a/arch/mips/netlogic/xlp/wakeup.c
+++ b/arch/mips/netlogic/xlp/wakeup.c
@@ -99,7 +99,7 @@ static int wait_for_cpus(int cpu, int bootcpu)
 	do {
 		notready = nlm_threads_per_core;
 		for (i = 0; i < nlm_threads_per_core; i++)
-			if (cpu_ready[cpu + i] || cpu == bootcpu)
+			if (cpu_ready[cpu + i] || (cpu + i) == bootcpu)
 				--notready;
 	} while (notready != 0 && --count > 0);
 
-- 
1.9.1
