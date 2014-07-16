Received: from mailapp01.imgtec.com ([195.59.15.196]:35068 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6816671AbaGPHyAU3pPy (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Jul 2014 09:54:00 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 1082A8FCCFC6D
        for <linux-mips@linux-mips.org>; Wed, 16 Jul 2014 08:53:52 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: kernel: cps-vec: Set ISA level to mips32r2 for the MIPS MT ASE
Date: Wed, 16 Jul 2014 08:53:39 +0100
Message-ID: <1405497219-19878-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <Paul.Burton@imgtec.com>
Message-ID: <20140716075339.IExcOdYiSm25xV1gAETNK2F41txAFJ5fSJAPSo-0lSE@z>

Fixes the following build warnings:
arch/mips/kernel/cps-vec.S: Assembler messages:
arch/mips/kernel/cps-vec.S:228: Warning: the `mt' extension requires
MIPS32 revision 2 or greater
[...]
arch/mips/kernel/cps-vec.S: Assembler messages:
arch/mips/kernel/cps-vec.S:345: Warning: the `mt' extension requires
MIPS32 revision 2 or greater

Cc: Paul Burton <Paul.Burton@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/cps-vec.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index 6f4f739dad96..ec06a82f8210 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -225,6 +225,7 @@ LEAF(mips_cps_core_init)
 	 nop
 
 	.set	push
+	.set	mips32r2
 	.set	mt
 
 	/* Only allow 1 TC per VPE to execute... */
@@ -341,6 +342,7 @@ LEAF(mips_cps_boot_vpes)
 	 nop
 
 	.set	push
+	.set	mips32r2
 	.set	mt
 
 1:	/* Enter VPE configuration state */
-- 
2.0.0
