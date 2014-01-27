Received: from multi.imgtec.com ([194.200.65.239]:4437 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6824283AbaA0PXjYWDqM (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 16:23:39 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 02/15] mips: update outdated comment
Date: Mon, 27 Jan 2014 15:23:01 +0000
Message-ID: <1390836194-26286-3-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1390836194-26286-1-git-send-email-paul.burton@imgtec.com>
References: <1390836194-26286-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140127152301.0enJs6bZ9U84mK-U4kokgrsZPMgmYfVVoJ8eLmx1RtI@z>

The hard-coded offsets mentioned in this comment seem to not exist
anymore, so remove mention of them from the comment.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Reviewed-by: Qais Yousef <qais.yousef@imgtec.com>
---
 arch/mips/include/asm/processor.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/processor.h b/arch/mips/include/asm/processor.h
index 49a61be..50cf4c3 100644
--- a/arch/mips/include/asm/processor.h
+++ b/arch/mips/include/asm/processor.h
@@ -125,10 +125,9 @@ BUILD_FPR_ACCESS(32)
 BUILD_FPR_ACCESS(64)
 
 /*
- * It would be nice to add some more fields for emulator statistics, but there
- * are a number of fixed offsets in offset.h and elsewhere that would have to
- * be recalculated by hand.  So the additional information will be private to
- * the FPU emulator for now.  See asm-mips/fpu_emulator.h.
+ * It would be nice to add some more fields for emulator statistics,
+ * the additional information is private to the FPU emulator for now.
+ * See arch/mips/include/asm/fpu_emulator.h.
  */
 
 struct mips_fpu_struct {
-- 
1.8.5.3
