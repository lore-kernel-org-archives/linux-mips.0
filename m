Received: from mailapp01.imgtec.com ([195.59.15.196]:18155 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007055AbbBYNIYR5uFf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Feb 2015 14:08:24 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: lose_fpu(): Disable FPU when MSA enabled
Date: Wed, 25 Feb 2015 13:08:05 +0000
Message-ID: <1424869685-18668-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20150225130805.O04tcUWwBEUiH1s1asyp9rNoshMye8TN9NmbUHHoeoQ@z>

The lose_fpu() function only disables the FPU in CP0_Status.CU1 if the
FPU is in use and MSA isn't enabled.

This isn't necessarily a problem because KSTK_STATUS(current), the
version of CP0_Status stored on the kernel stack on entry from user
mode, does always get updated and gets restored when returning to user
mode, but I don't think it was intended, and it is inconsistent with the
case of only the FPU being in use. Sometimes leaving the FPU enabled may
also mask kernel bugs where FPU operations are executed when the FPU
might not be enabled.

So lets disable the FPU in the MSA case too.

Fixes: 33c771ba5c5d ("MIPS: save/disable MSA in lose_fpu")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/include/asm/fpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/asm/fpu.h b/arch/mips/include/asm/fpu.h
index dd083e999b08..9f26b079cc6a 100644
--- a/arch/mips/include/asm/fpu.h
+++ b/arch/mips/include/asm/fpu.h
@@ -170,6 +170,7 @@ static inline void lose_fpu(int save)
 		}
 		disable_msa();
 		clear_thread_flag(TIF_USEDMSA);
+		__disable_fpu();
 	} else if (is_fpu_owner()) {
 		if (save)
 			_save_fp(current);
-- 
2.0.5
