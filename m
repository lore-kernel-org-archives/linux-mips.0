Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:46773 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994626AbdLLJ7kGbcTC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 12 Dec 2017 10:59:40 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [RFC PATCH 07/16] MIPS: kprobes: Remove unused definitions
Date: Tue, 12 Dec 2017 09:57:53 +0000
Message-ID: <1513072682-1371-8-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1513072682-1371-1-git-send-email-matt.redfearn@mips.com>
References: <1513072682-1371-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20171212095753.uD6Vy28hnQP1mS76dnlnN_a0nlDBNTTG6p0PGPUMM-s@z>

MAX_JPROBES_STACK_ADDR will stop working correctly once
CONFIG_THREAD_INFO_IN_TASK is active, since current_thread_info() will
no longer return the base of the kernel stack. As the definition is
unused, rather than fix it, remove it.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/include/asm/kprobes.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/mips/include/asm/kprobes.h b/arch/mips/include/asm/kprobes.h
index ad1a99948f27..413e8be38a35 100644
--- a/arch/mips/include/asm/kprobes.h
+++ b/arch/mips/include/asm/kprobes.h
@@ -69,14 +69,6 @@ struct prev_kprobe {
 };
 
 #define MAX_JPROBES_STACK_SIZE 128
-#define MAX_JPROBES_STACK_ADDR \
-	(((unsigned long)current_thread_info()) + THREAD_SIZE - 32 - sizeof(struct pt_regs))
-
-#define MIN_JPROBES_STACK_SIZE(ADDR)					\
-	((((ADDR) + MAX_JPROBES_STACK_SIZE) > MAX_JPROBES_STACK_ADDR)	\
-		? MAX_JPROBES_STACK_ADDR - (ADDR)			\
-		: MAX_JPROBES_STACK_SIZE)
-
 
 #define SKIP_DELAYSLOT 0x0001
 
-- 
2.7.4
