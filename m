Received: from multi.imgtec.com ([194.200.65.239]:2614 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6820491Ab3KSRcSEjAw9 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 19 Nov 2013 18:32:18 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 5/6] mips: replace open-coded init_dsp
Date: Tue, 19 Nov 2013 17:30:38 +0000
Message-ID: <1384882239-17965-6-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1384882239-17965-1-git-send-email-paul.burton@imgtec.com>
References: <1384882239-17965-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20131119173038.bz07jFhS1Mx_Y93Fyv3ckAW7sqAAVnx1pqHhEchUGiM@z>

There is already an init_dsp function which checks cpu_has_dsp & calls
__init_dsp if it does. Make use of it instead of duplicating the same
code.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Reviewed-by: Qais Yousef <qais.yousef@imgtec.com>
---
 arch/mips/kernel/process.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 0219502..a1b94c5 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -65,8 +65,7 @@ void start_thread(struct pt_regs * regs, unsigned long pc, unsigned long sp)
 	regs->cp0_status = status;
 	clear_used_math();
 	clear_fpu_owner();
-	if (cpu_has_dsp)
-		__init_dsp();
+	init_dsp();
 	regs->cp0_epc = pc;
 	regs->regs[29] = sp;
 }
-- 
1.8.4.2
