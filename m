Received: from mailapp01.imgtec.com ([195.59.15.196]:51624 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008688AbbIVR1Z2MvsU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 19:27:25 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 1/5] MIPS: clarify mips_cm_is64 documentation
Date: Tue, 22 Sep 2015 10:26:37 -0700
Message-ID: <1442942801-2883-2-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1442942801-2883-1-git-send-email-paul.burton@imgtec.com>
References: <1442942801-2883-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150922172637.0LUMUztRVUHtLieWMozqWxyroM4iJmB4TX2rXHeUJl0@z>

The documentation for mips_cm_is64 implied that the width of the CM GCRs
would change depending upon the CPU, which is not true. Reword the
explanation to be clearer that the GCR width is purely dependent upon
the version of the CM.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/include/asm/mips-cm.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index d75b75e..2a70b76 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -36,12 +36,12 @@ extern phys_addr_t __mips_cm_phys_base(void);
 /*
  * mips_cm_is64 - determine CM register width
  *
- * The CM register width is processor and CM specific. A 64-bit processor
- * usually has a 64-bit CM and a 32-bit one has a 32-bit CM but a 64-bit
- * processor could come with a 32-bit CM. Moreover, accesses on 64-bit CMs
- * can be done either using regular 64-bit load/store instructions, or 32-bit
- * load/store instruction on 32-bit register pairs. We opt for using 64-bit
- * accesses on 64-bit CMs and kernels and 32-bit in any other case.
+ * The CM register width is determined by the version of the CM, with CM3
+ * introducing 64 bit GCRs and all prior CM versions having 32 bit GCRs.
+ * However we may run a kernel built for MIPS32 on a system with 64 bit GCRs,
+ * or vice-versa. This variable indicates the width of the memory accesses
+ * that the kernel will perform to GCRs, which may differ from the actual
+ * width of the GCRs.
  *
  * It's set to 0 for 32-bit accesses and 1 for 64-bit accesses.
  */
-- 
2.5.3
