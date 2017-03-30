Received: from mailapp01.imgtec.com ([195.59.15.196]:35231 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992366AbdC3UwYkbDqH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 30 Mar 2017 22:52:24 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: Remove CONFIG_ARCH_HAS_ILOG2_U{32,64}
Date: Thu, 30 Mar 2017 13:51:59 -0700
Message-ID: <20170330205200.25635-1-paul.burton@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, trivial@kernel.org
Message-ID: <20170330205159.O9g3mvNGMaApk4bJtVKAWYKlcGdFC2o42emvYfzC-pE@z>

We declare CONFIG_ARCH_HAS_ILOG2_U32 & CONFIG_ARCH_HAS_ILOG2_U64 in
Kconfig, but they are always false since nothing ever selects them. The
generic fls-based implementation is efficient for MIPS anyway. Remove
the redundant Kconfig entries.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: trivial@kernel.org

---

 arch/mips/Kconfig | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a008a9f03072..33bc84ffd6b2 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1040,14 +1040,6 @@ config RWSEM_GENERIC_SPINLOCK
 config RWSEM_XCHGADD_ALGORITHM
 	bool
 
-config ARCH_HAS_ILOG2_U32
-	bool
-	default n
-
-config ARCH_HAS_ILOG2_U64
-	bool
-	default n
-
 config GENERIC_HWEIGHT
 	bool
 	default y
-- 
2.12.1
