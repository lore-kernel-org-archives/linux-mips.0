Received: from mailapp01.imgtec.com ([195.59.15.196]:9206 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009171AbaLRPM7GCGLX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:12:59 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id DB3C07A1F42F7
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:12:50 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 41/67] MIPS: mm: c-r4k: Set the correct ISA level
Date: Thu, 18 Dec 2014 15:09:50 +0000
Message-ID: <1418915416-3196-42-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
References: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20141218150950.irfVhe-ReQKERtltqSIkhjqtfKFZmEfn0ZPg_Ymiz9s@z>

The local_r4k_flush_cache_sigtramp function uses the 'cache'
instruction inside an asm block. However, MIPS R6 changed the
opcode for the cache instruction and as a result of which we
need to set the correct ISA level.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/mm/c-r4k.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index a659770bc539..6e79be368645 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -794,7 +794,7 @@ static void local_r4k_flush_cache_sigtramp(void * arg)
 		__asm__ __volatile__ (
 			".set push\n\t"
 			".set noat\n\t"
-			".set mips3\n\t"
+			".set "MIPS_ISA_LEVEL"\n\t"
 #ifdef CONFIG_32BIT
 			"la	$at,1f\n\t"
 #endif
-- 
2.2.0
