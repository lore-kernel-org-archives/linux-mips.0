Received: from aserp1040.oracle.com ([141.146.126.69]:27189 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010794AbbHBIosCxADo (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 2 Aug 2015 10:44:48 +0200
From: Yuval Shaia <yuval.shaia@oracle.com>
Subject: [PATCH 25/30] MIPS: fpu.h: Allow 64-bit FPU on a 64-bit MIPS R6 CPU
Date: Sun,  2 Aug 2015 01:34:21 -0700
Message-ID: <1438504466-21888-26-git-send-email-yuval.shaia@oracle.com>
In-Reply-To: <1438504466-21888-1-git-send-email-yuval.shaia@oracle.com>
References: <1438504466-21888-1-git-send-email-yuval.shaia@oracle.com>
Return-Path: <yuval.shaia@oracle.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: yuval.shaia@oracle.com
Cc: Markos Chandras <markos.chandras@imgtec.com>, stable@vger.kernel.org, #, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150802083421.Yq28iizw41YCkTuxQ4oIuC4vjBaa-d9g7L2K13CRNjs@z>

From: Markos Chandras <markos.chandras@imgtec.com>

Commit 6134d94923d0 ("MIPS: asm: fpu: Allow 64-bit FPU on MIPS32 R6")
added support for 64-bit FPU on a 32-bit MIPS R6 processor but it missed
the 64-bit CPU case leading to FPU failures when requesting FR=1 mode
(which is always the case for MIPS R6 userland) when running a 32-bit
kernel on a 64-bit CPU. We also fix the MIPS R2 case.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Fixes: 6134d94923d0 ("MIPS: asm: fpu: Allow 64-bit FPU on MIPS32 R6")
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
Cc: <stable@vger.kernel.org> # 4.0+
Cc: linux-mips@linux-mips.org
Patchwork: https://patchwork.linux-mips.org/patch/10734/
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
---
 arch/mips/include/asm/fpu.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/mips/include/asm/fpu.h b/arch/mips/include/asm/fpu.h
index 084780b..1b06251 100644
--- a/arch/mips/include/asm/fpu.h
+++ b/arch/mips/include/asm/fpu.h
@@ -74,7 +74,7 @@ static inline int __enable_fpu(enum fpu_mode mode)
 		goto fr_common;
 
 	case FPU_64BIT:
-#if !(defined(CONFIG_CPU_MIPS32_R2) || defined(CONFIG_CPU_MIPS32_R6) \
+#if !(defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6) \
       || defined(CONFIG_64BIT))
 		/* we only have a 32-bit FPU */
 		return SIGFPE;
-- 
1.7.1
