Received: from mga04.intel.com ([192.55.52.120]:7088 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23992391AbdLSHB6fttkE (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 19 Dec 2017 08:01:58 +0100
From: thirtsa.dreyfus@intel.com
Subject: [PATCH 01/14] MIPS: Fix CM region target definitions
Date: Tue, 19 Dec 2017 02:14:48 -0500
Message-ID: <1513667701-16961-1-git-send-email-thirtsa.dreyfus@intel.com>
Return-Path: <thirtsa.dreyfus@intel.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: thirtsa.dreyfus@intel.com
Cc: Paul Burton <paul.burton@imgtec.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20171219071448.hAMDhAdDzcKPUOWST6DMj95AiZv70qoWu9jwB-c9hPY@z>

From: Paul Burton <paul.burton@imgtec.com>

The default CM target field in the GCR_BASE register is encoded with 0
meaning memory & 1 being reserved. However the definitions we use for
those bits effectively get these two values backwards - likely because
they were copied from the definitions for the CM regions where the
target is encoded differently. This results in use setting up GCR_BASE
with the reserved target value by default, rather than targeting memory
as intended. Although we currently seem to get away with this it's not a
great idea to rely upon.

Fix this by changing our macros to match the documentated target values.

The incorrect encoding became used as of commit 9f98f3dd0c51 ("MIPS: Add
generic CM probe & access code") in the Linux v3.15 cycle, and was
likely carried forwards from older but unused code introduced by commit
39b8d5254246 ("[MIPS] Add support for MIPS CMP platform.") in the
v2.6.26 cycle.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Reported-by: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org> # v3.15+
---
 arch/mips/include/asm/mips-cm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index f6231b9..c6aaabd 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -142,8 +142,8 @@ static inline bool mips_cm_has_l2sync(void)
 GCR_ACCESSOR_RW(64, 0x008, base)
 #define CM_GCR_BASE_GCRBASE			GENMASK_ULL(47, 15)
 #define CM_GCR_BASE_CMDEFTGT			GENMASK(1, 0)
-#define  CM_GCR_BASE_CMDEFTGT_DISABLED		0
-#define  CM_GCR_BASE_CMDEFTGT_MEM		1
+#define  CM_GCR_BASE_CMDEFTGT_MEM		0
+#define  CM_GCR_BASE_CMDEFTGT_RESERVED		1
 #define  CM_GCR_BASE_CMDEFTGT_IOCU0		2
 #define  CM_GCR_BASE_CMDEFTGT_IOCU1		3
 
-- 
1.9.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
