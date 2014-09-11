Received: from mailapp01.imgtec.com ([195.59.15.196]:22638 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008708AbaIKIhhBaHn3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 11 Sep 2014 10:37:37 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 04/10] MIPS: define bits introduced for hybrid FPRs
Date: Thu, 11 Sep 2014 08:30:17 +0100
Message-ID: <1410420623-11691-5-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1410420623-11691-1-git-send-email-paul.burton@imgtec.com>
References: <1410420623-11691-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140911073017.mSvWOUojojW1Wi75GBWtfmDn_beyq2eabdViG5_ew10@z>

Add definitions for the FRE & UFE bits in Config5, and the FREP bit in
FPIR. These bits are used to support a hybrid FPR scheme allowing a
mixture of FP32 & FP64 code to execute within a task.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/include/asm/mipsregs.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index cf3b580..5f4dde3 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -653,6 +653,8 @@
 #define MIPS_CONF5_NF		(_ULCAST_(1) << 0)
 #define MIPS_CONF5_UFR		(_ULCAST_(1) << 2)
 #define MIPS_CONF5_MRP		(_ULCAST_(1) << 3)
+#define MIPS_CONF5_FRE		(_ULCAST_(1) << 8)
+#define MIPS_CONF5_UFE		(_ULCAST_(1) << 9)
 #define MIPS_CONF5_MSAEN	(_ULCAST_(1) << 27)
 #define MIPS_CONF5_EVA		(_ULCAST_(1) << 28)
 #define MIPS_CONF5_CV		(_ULCAST_(1) << 29)
@@ -692,6 +694,7 @@
 #define MIPS_FPIR_W		(_ULCAST_(1) << 20)
 #define MIPS_FPIR_L		(_ULCAST_(1) << 21)
 #define MIPS_FPIR_F64		(_ULCAST_(1) << 22)
+#define MIPS_FPIR_FREP		(_ULCAST_(1) << 29)
 
 /*
  * Bits in the MIPS32 Memory Segmentation registers.
-- 
2.0.4
