Received: from mailapp01.imgtec.com ([195.59.15.196]:52366 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993914AbdFBWjfq8x23 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 3 Jun 2017 00:39:35 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 3/6] MIPS: Allow storing pgd in C0_CONTEXT for MIPSr6
Date: Fri, 2 Jun 2017 15:38:03 -0700
Message-ID: <20170602223806.5078-4-paul.burton@imgtec.com>
In-Reply-To: <20170602223806.5078-1-paul.burton@imgtec.com>
References: <20170602223806.5078-1-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170602223803.y7rewnNlu4MCGkqUv_8I1m9uW8umRO3VWSn_WZmJFBc@z>

CONFIG_MIPS_PGD_C0_CONTEXT, which allows a pointer to the page directory
to be stored in the cop0 Context register when enabled, was previously
only allowed for MIPSr2. MIPSr6 is just as able to make use of it, so
allow it there too.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 2828ecde133d..bcfd4c30ea2a 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2061,7 +2061,7 @@ config CPU_SUPPORTS_UNCACHED_ACCELERATED
 	bool
 config MIPS_PGD_C0_CONTEXT
 	bool
-	default y if 64BIT && CPU_MIPSR2 && !CPU_XLP
+	default y if 64BIT && (CPU_MIPSR2 || CPU_MIPSR6) && !CPU_XLP
 
 #
 # Set to y for ptrace access to watch registers.
-- 
2.13.0
