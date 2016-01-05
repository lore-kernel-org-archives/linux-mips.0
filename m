Received: from smtpbguseast2.qq.com ([54.204.34.130]:58643 "EHLO
        smtpbguseast2.qq.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008336AbcAEFy6M2F0- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 5 Jan 2016 06:54:58 +0100
From: Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 3/6] MIPS: Loongson-3: Fix SMP_ASK_C0COUNT IPI handler
Date: Tue,  5 Jan 2016 13:59:06 +0800
Message-ID: <1451973549-16198-4-git-send-email-chenhc@lemote.com>
In-Reply-To: <1451973549-16198-1-git-send-email-chenhc@lemote.com>
References: <1451973549-16198-1-git-send-email-chenhc@lemote.com>
Return-Path: <chenhc@lemote.com>
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
Cc: Aurelien Jarno <aurelien@aurel32.net>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, Huacai Chen <chenhc@lemote.com>, stable@vger.kernel.org
Message-ID: <20160105055906.Nm_bOdstvosmk2QTCQp4evXzVnBB0fqz9UpEuOQB03Y@z>

When Core-0 handle SMP_ASK_C0COUNT IPI, we should make other cores to
see the result as soon as possible (especially when Store-Fill-Buffer
is enabled). Otherwise, C0_Count syncronization makes no sense.

BTW, there is a corner should be avoid: C0_Count of Core-0 is really 0.

Cc: <stable@vger.kernel.org>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/loongson64/loongson-3/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/loongson64/loongson-3/smp.c b/arch/mips/loongson64/loongson-3/smp.c
index 1a4738a..55d0f5f 100644
--- a/arch/mips/loongson64/loongson-3/smp.c
+++ b/arch/mips/loongson64/loongson-3/smp.c
@@ -275,8 +275,10 @@ void loongson3_ipi_interrupt(struct pt_regs *regs)
 	if (action & SMP_ASK_C0COUNT) {
 		BUG_ON(cpu != 0);
 		c0count = read_c0_count();
+		c0count = c0count ? c0count : 1;
 		for (i = 1; i < num_possible_cpus(); i++)
 			per_cpu(core0_c0count, i) = c0count;
+		__wbflush(); /* Let others see the result ASAP */
 	}
 }
 
-- 
2.4.6



ÿÿ		
