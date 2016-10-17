Received: from mailapp02.imgtec.com ([217.156.133.132]:16045 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23991759AbcJQOf4HKFb4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Oct 2016 16:35:56 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 4/4] MIPS: Remove RESTORE_ALL_AND_RET
Date: Mon, 17 Oct 2016 15:34:38 +0100
Message-ID: <20161017143438.17298-5-paul.burton@imgtec.com>
In-Reply-To: <20161017143438.17298-1-paul.burton@imgtec.com>
References: <20161017143438.17298-1-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20161017143438.sgxluaThwAj73G8S_8-XBmnDLXc3jCPAqZti8DRB5N4@z>

The RESTORE_ALL_AND_RET macro is never used. Remove the dead code.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>

---

 arch/mips/include/asm/stackframe.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
index 41e6836..b183d5e 100644
--- a/arch/mips/include/asm/stackframe.h
+++ b/arch/mips/include/asm/stackframe.h
@@ -380,14 +380,6 @@
 		RESTORE_SP
 		.endm
 
-		.macro	RESTORE_ALL_AND_RET
-		RESTORE_TEMP
-		RESTORE_STATIC
-		RESTORE_AT
-		RESTORE_SOME
-		RESTORE_SP_AND_RET
-		.endm
-
 /*
  * Move to kernel mode and disable interrupts.
  * Set cp0 enable bit as sign that we're running on the kernel stack
-- 
2.10.0
