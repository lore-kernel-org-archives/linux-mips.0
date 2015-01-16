Received: from mailapp01.imgtec.com ([195.59.15.196]:1299 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010678AbbAPKxJmZr3Y (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:53:09 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id D82A3EA828CA4
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:52:59 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 34/70] MIPS: kernel: genex: Set correct ISA level
Date: Fri, 16 Jan 2015 10:49:13 +0000
Message-ID: <1421405389-15512-35-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150116104913.eeqnXZ86xW3298SAUqUrerKlv2gVaNpTtxH4h7Zts-0@z>

The jr instruction opcode has changed in R6 so make sure
the correct ISA level is set prior using that instruction.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/genex.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index a5e26dd90592..2ebaabe3af15 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -125,7 +125,7 @@ LEAF(__r4k_wait)
 	nop
 	nop
 #endif
-	.set	arch=r4000
+	.set	MIPS_ISA_ARCH_LEVEL_RAW
 	wait
 	/* end of rollback region (the region size must be power of two) */
 1:
-- 
2.2.1
