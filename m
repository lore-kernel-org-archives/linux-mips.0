Received: from 19pmail.ess.barracuda.com ([64.235.154.230]:47411 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990593AbdKFUUASMijm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 6 Nov 2017 21:20:00 +0100
From: James Hogan <james.hogan@mips.com>
Subject: [PATCH BACKPORT 3.15..4.13] MIPS: Fix CM region target definitions
Date: Mon, 6 Nov 2017 20:19:02 +0000
Message-ID: <20171106201902.20659-1-james.hogan@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: stable@vger.kernel.org
Cc: James Hogan <james.hogan@mips.com>, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, James Hogan <jhogan@kernel.org>
Message-ID: <20171106201902.5cbRQ0gA70JmjMWVddAT8iHftuWaF0HHntgRYOuPB7g@z>

From: Paul Burton <paul.burton@mips.com>

commit 6a6cba1d945a7511cdfaf338526871195e420762 upstream.

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

Fixes: 9f98f3dd0c51 ("MIPS: Add generic CM probe & access code")
Signed-off-by: Paul Burton <paul.burton@mips.com>
Reported-by: Matt Redfearn <matt.redfearn@mips.com>
Reviewed-by: James Hogan <jhogan@kernel.org>
Cc: Matt Redfearn <matt.redfearn@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Patchwork: https://patchwork.linux-mips.org/patch/17562/
Signed-off-by: James Hogan <jhogan@kernel.org>
[jhogan@kernel.org: Backported 3.15..4.13]
---
 arch/mips/include/asm/mips-cm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index cfdbab015769..163317fd3d7e 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -240,8 +240,8 @@ BUILD_CM_Cx_R_(tcid_8_priority,	0x80)
 #define CM_GCR_BASE_GCRBASE_MSK			(_ULCAST_(0x1ffff) << 15)
 #define CM_GCR_BASE_CMDEFTGT_SHF		0
 #define CM_GCR_BASE_CMDEFTGT_MSK		(_ULCAST_(0x3) << 0)
-#define  CM_GCR_BASE_CMDEFTGT_DISABLED		0
-#define  CM_GCR_BASE_CMDEFTGT_MEM		1
+#define  CM_GCR_BASE_CMDEFTGT_MEM		0
+#define  CM_GCR_BASE_CMDEFTGT_RESERVED		1
 #define  CM_GCR_BASE_CMDEFTGT_IOCU0		2
 #define  CM_GCR_BASE_CMDEFTGT_IOCU1		3
 
-- 
2.14.1
