Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:25072 "EHLO
        mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010496AbbAGLVjHR00k (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Jan 2015 12:21:39 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 14/17] MIPS: Netlogic: Do not enable SUE for core
Date: Wed, 7 Jan 2015 16:58:35 +0530
Message-ID: <1420630118-17198-15-git-send-email-jchandra@broadcom.com>
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
Cc: Jayachandran C <jchandra@broadcom.com>, ralf@linux-mips.org
Message-ID: <20150107112835.DjRd9TsR8a81k77SRpP9lsVEvhS_mtJ7FMUZ_1rYQNY@z>

Enabling the SUE bit for core can can result in rare cache errors
which are difficult to track down, so do not enable it. This can
cause a minor performance loss in some tests.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/netlogic/common/reset.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/netlogic/common/reset.S b/arch/mips/netlogic/common/reset.S
index ff2673a..ebbd598 100644
--- a/arch/mips/netlogic/common/reset.S
+++ b/arch/mips/netlogic/common/reset.S
@@ -60,7 +60,7 @@
 	li	t0, LSU_DEFEATURE
 	mfcr	t1, t0
 
-	lui	t2, 0xc080	/* SUE, Enable Unaligned Access, L2HPE */
+	lui	t2, 0x4080	/* Enable Unaligned Access, L2HPE */
 	or	t1, t1, t2
 	mtcr	t1, t0
 
-- 
1.9.1
