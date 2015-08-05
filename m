Received: from mailapp01.imgtec.com ([195.59.15.196]:23308 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012619AbbHEWoqGkNT8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 6 Aug 2015 00:44:46 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 6/6] MIPS: CPS: drop .set mips64r2 directives
Date: Wed, 5 Aug 2015 15:42:40 -0700
Message-ID: <1438814560-19821-7-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1438814560-19821-1-git-send-email-paul.burton@imgtec.com>
References: <1438814560-19821-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150805224240.SkH332SwtUfQqaQvAx3SIGDmA7ZGO7rPnxZmvXNeqGU@z>

Commit 977e043d5ea1 ("MIPS: kernel: cps-vec: Replace mips32r2 ISA level
with mips64r2") leads to .set mips64r2 directives being present in 32
bit (ie. CONFIG_32BIT=y) kernels. This is incorrect & leads to MIPS64
instructions being emitted by the assembler when expanding
pseudo-instructions. For example the "move" instruction can legitimately
be expanded to a "daddu". This causes problems when the kernel is run on
a MIPS32 CPU, as CONFIG_32BIT kernels of course often are...

Fix this by dropping the .set <ISA> directives entirely now that Kconfig
should be ensuring that kernels including this code are built with a
suitable -march= compiler flag.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Markos Chandras <markos.chandras@imgtec.com>
Cc: <stable@vger.kernel.org> # 3.16+
---

 arch/mips/kernel/cps-vec.S | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index 209ded1..763d8b7 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -229,7 +229,6 @@ LEAF(mips_cps_core_init)
 	has_mt	t0, 3f
 
 	.set	push
-	.set	mips64r2
 	.set	mt
 
 	/* Only allow 1 TC per VPE to execute... */
@@ -348,7 +347,6 @@ LEAF(mips_cps_boot_vpes)
 	 nop
 
 	.set	push
-	.set	mips64r2
 	.set	mt
 
 1:	/* Enter VPE configuration state */
-- 
2.5.0
