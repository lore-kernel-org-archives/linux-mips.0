Received: from mailapp01.imgtec.com ([195.59.15.196]:30768 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008556AbbIVRIFQc0fr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 19:08:05 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: allow compact branch policy to be changed
Date: Tue, 22 Sep 2015 10:07:41 -0700
Message-ID: <1442941661-31539-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org
Message-ID: <20150922170741.gUyljrpKHdGT1VdxzSJ6UJxAWK_V4guyxfw5F5y67gA@z>

When debugging it can be helpful to change the policy for compiler use
of MIPSr6 compact branches, in order to rule out or home in on their
involvement in bugs. Allow the GCC -mcompact-branches= flag to be set
via Kconfig under the "Kernel hacking" menu.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/Kconfig.debug | 36 ++++++++++++++++++++++++++++++++++++
 arch/mips/Makefile      |  4 ++++
 2 files changed, 40 insertions(+)

diff --git a/arch/mips/Kconfig.debug b/arch/mips/Kconfig.debug
index e250524..13d7965 100644
--- a/arch/mips/Kconfig.debug
+++ b/arch/mips/Kconfig.debug
@@ -113,4 +113,40 @@ config SPINLOCK_TEST
 	help
 	  Add several files to the debugfs to test spinlock speed.
 
+if CPU_MIPSR6
+
+choice
+	prompt "Compact branch policy"
+	default MIPS_COMPACT_BRANCHES_OPTIMAL
+
+config MIPS_COMPACT_BRANCHES_NEVER
+	bool "Never (force delay slot branches)"
+	help
+	  Pass the -mcompact-branches=never flag to the compiler in order to
+	  force it to always emit branches with delay slots, and make no use
+	  of the compact branch instructions introduced by MIPSr6. This is
+	  useful if you suspect there may be an issue with compact branches in
+	  either the compiler or the CPU.
+
+config MIPS_COMPACT_BRANCHES_OPTIMAL
+	bool "Optimal (use where beneficial)"
+	help
+	  Pass the -mcompact-branches=optimal flag to the compiler in order for
+	  it to make use of compact branch instructions where it deems them
+	  beneficial, and use branches with delay slots elsewhere. This is the
+	  default compiler behaviour, and should be used unless you have a
+	  reason to choose otherwise.
+
+config MIPS_COMPACT_BRANCHES_ALWAYS
+	bool "Always (force compact branches)"
+	help
+	  Pass the -mcompact-branches=always flag to the compiler in order to
+	  force it to always emit compact branches, making no use of branch
+	  instructions with delay slots. This can result in more compact code
+	  which may be beneficial in some scenarios.
+
+endchoice
+
+endif # CPU_MIPSR6
+
 endmenu
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 252e347..3f70ba5 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -204,6 +204,10 @@ toolchain-msa				:= $(call cc-option-yn,$(mips-cflags) -mhard-float -mfp64 -Wa$(
 cflags-$(toolchain-msa)			+= -DTOOLCHAIN_SUPPORTS_MSA
 endif
 
+cflags-$(CONFIG_MIPS_COMPACT_BRANCHES_NEVER)	+= -mcompact-branches=never
+cflags-$(CONFIG_MIPS_COMPACT_BRANCHES_OPTIMAL)	+= -mcompact-branches=optimal
+cflags-$(CONFIG_MIPS_COMPACT_BRANCHES_ALWAYS)	+= -mcompact-branches=always
+
 #
 # Firmware support
 #
-- 
2.5.3
