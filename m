Received: from mailapp01.imgtec.com ([195.59.15.196]:13354 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006955AbcDVInzIDiGk (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Apr 2016 10:43:55 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: Allow R6 compact branch policy to be left unspecified
Date: Fri, 22 Apr 2016 09:43:31 +0100
Message-ID: <1461314611-15317-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: "Maciej W . Rozycki" <macro@imgtec.com>, fengguang.wu@intel.com, Paul Burton <paul.burton@imgtec.com>, "stable # v4 . 4+" <stable@vger.kernel.org>, linux-kernel@vger.kernel.org
Message-ID: <20160422084331.2D-QaToj5REVwlbosM9fakqhPmJzN_k7Sr4hXOOhSs0@z>

It turns out that some toolchains which support MIPS R6 don't support
the -mcompact-branches flag to specify compact branch behaviour. Default
to not providing the -mcompact-branch option to the compiler such that
we can build with such toolchains.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Reported-by: kbuild test robot <fengguang.wu@intel.com>
Fixes: c1a0e9bc885d ("MIPS: Allow compact branch policy to be changed")
Cc: stable <stable@vger.kernel.org> # v4.4+

---

 arch/mips/Kconfig.debug | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig.debug b/arch/mips/Kconfig.debug
index f0e314c..e91b3d1 100644
--- a/arch/mips/Kconfig.debug
+++ b/arch/mips/Kconfig.debug
@@ -117,7 +117,15 @@ if CPU_MIPSR6
 
 choice
 	prompt "Compact branch policy"
-	default MIPS_COMPACT_BRANCHES_OPTIMAL
+	default MIPS_COMPACT_BRANCHES_DEFAULT
+
+config MIPS_COMPACT_BRANCHES_DEFAULT
+	bool "Toolchain Default (don't specify)"
+	help
+	  Don't pass the -mcompact-branches flag to the compiler, allowing it
+	  to use its default (generally "optimal"). This is particularly
+	  useful for early R6-supporting toolchains which don't support the
+	  -mcompact-branches flag.
 
 config MIPS_COMPACT_BRANCHES_NEVER
 	bool "Never (force delay slot branches)"
-- 
2.8.0
