Received: from 19pmail.ess.barracuda.com ([64.235.150.245]:52919 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992338AbdJaWJK4SWMl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 31 Oct 2017 23:09:10 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH] MIPS: Fix CM region target definitions
Date: Tue, 31 Oct 2017 15:09:22 -0700
Message-ID: <20171031220922.14931-1-paul.burton@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@mips.com>
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
Cc: Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, Ralf Baechle <ralf@linux-mips.org>, stable@vger.kernel.org
Message-ID: <20171031220922.WxSZLMHjjnm2V16oe5kKaQp4dXPDiVQmXpfHFivbbI8@z>

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
likely carried forwards from older but unused code introduced by
commit 39b8d5254246 ("[MIPS] Add support for MIPS CMP platform.") in the
v2.6.26 cycle.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Reported-by: Matt Redfearn <matt.redfearn@mips.com>
Cc: Matt Redfearn <matt.redfearn@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org> # v3.15+
---

 arch/mips/include/asm/mips-cm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index f6231b91b724..c6aaabd7cfd1 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -142,8 +142,8 @@ GCR_ACCESSOR_RO(64, 0x000, config)
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
2.15.0
