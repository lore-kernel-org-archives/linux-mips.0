Received: from mailapp01.imgtec.com ([195.59.15.196]:18882 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008868AbaIXJuzBiQpM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 24 Sep 2014 11:50:55 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 0A64EB8DBB164
        for <linux-mips@linux-mips.org>; Wed, 24 Sep 2014 10:50:46 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 11/11] MIPS: MSA: Fix big-endian FPR_IDX implementation
Date: Wed, 24 Sep 2014 10:45:42 +0100
Message-ID: <1411551942-11153-12-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1411551942-11153-1-git-send-email-paul.burton@imgtec.com>
References: <1411551942-11153-1-git-send-email-paul.burton@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140924094542.30cKlvgoADNDMHqeMlPRI1YKdPNpZfW67q1yzPiexCw@z>

From: James Hogan <james.hogan@imgtec.com>

The maximum word size is 64-bits since MSA state is saved using st.d
which stores two 64-bit words, therefore reimplement FPR_IDX using xor,
and only within each 64-bit word.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/processor.h b/arch/mips/include/asm/processor.h
index 05f0843..1c6f086 100644
--- a/arch/mips/include/asm/processor.h
+++ b/arch/mips/include/asm/processor.h
@@ -111,7 +111,7 @@ union fpureg {
 #ifdef CONFIG_CPU_LITTLE_ENDIAN
 # define FPR_IDX(width, idx)	(idx)
 #else
-# define FPR_IDX(width, idx)	((FPU_REG_WIDTH / (width)) - 1 - (idx))
+# define FPR_IDX(width, idx)	((idx) ^ ((64 / (width)) - 1))
 #endif
 
 #define BUILD_FPR_ACCESS(width) \
-- 
2.0.4
