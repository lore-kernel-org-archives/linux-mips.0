Received: from mailapp01.imgtec.com ([195.59.15.196]:31875 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012315AbbA3MMu2zP6g (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 30 Jan 2015 13:12:50 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 86510C1CE2635
        for <linux-mips@linux-mips.org>; Fri, 30 Jan 2015 12:12:41 +0000 (GMT)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 10/10] MIPS: MSA: Fix big-endian FPR_IDX implementation
Date: Fri, 30 Jan 2015 12:09:39 +0000
Message-ID: <1422619779-9940-11-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1422619779-9940-1-git-send-email-paul.burton@imgtec.com>
References: <1422619779-9940-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20150130120939.QYZaZgdOEtRxFjVmxE01fjS0DmaYSTa8Ih2UZRrNtXk@z>

From: James Hogan <james.hogan@imgtec.com>

The maximum word size is 64-bits since MSA state is saved using st.d
which stores two 64-bit words, therefore reimplement FPR_IDX using xor,
and only within each 64-bit word.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
Changes in v2:
  - Rebase atop v3.19-rc6.
---
 arch/mips/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/processor.h b/arch/mips/include/asm/processor.h
index 9daa386..9162aa2 100644
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
2.2.2
