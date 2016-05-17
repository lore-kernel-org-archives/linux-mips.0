Received: from mailapp01.imgtec.com ([195.59.15.196]:19852 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27029683AbcEQO4nWIqoo (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 May 2016 16:56:43 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 2/2] MIPS: Error out if unsupported compact branch policy is set
Date: Tue, 17 May 2016 15:55:54 +0100
Message-ID: <1463496954-24713-2-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1463496954-24713-1-git-send-email-paul.burton@imgtec.com>
References: <1463496954-24713-1-git-send-email-paul.burton@imgtec.com>
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
Cc: "Maciej W . Rozycki" <Maciej.Rozycki@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, "stable # v4 . 4+" <stable@vger.kernel.org>, linux-kernel@vger.kernel.org
Message-ID: <20160517145554.YHF1Win8DFFUFB5ZqfI2f7pVBDYHTvRfqD1iw2Q6Tp8@z>

If an explicit compact branch policy is requested by the user via the
debug options in Kconfig, and the toolchain does not support specifying
an explicit compact branch policy, then error out with an understandable
error message to make it clearer what's happened.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Fixes: c1a0e9bc885d ("MIPS: Allow compact branch policy to be changed")
Cc: stable <stable@vger.kernel.org> # v4.4+

---

Changes in v2:
- New patch.

 arch/mips/Makefile | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e78d60d..1ac4612 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -194,9 +194,13 @@ toolchain-msa				:= $(call cc-option-yn,$(mips-cflags) -mhard-float -mfp64 -Wa$(
 cflags-$(toolchain-msa)			+= -DTOOLCHAIN_SUPPORTS_MSA
 endif
 
-cflags-$(CONFIG_MIPS_COMPACT_BRANCHES_NEVER)	+= -mcompact-branches=never
-cflags-$(CONFIG_MIPS_COMPACT_BRANCHES_OPTIMAL)	+= -mcompact-branches=optimal
-cflags-$(CONFIG_MIPS_COMPACT_BRANCHES_ALWAYS)	+= -mcompact-branches=always
+ifeq ($(call cc-option-yn,-mcompact-branches=optimal), y)
+  cflags-$(CONFIG_MIPS_COMPACT_BRANCHES_NEVER)		+= -mcompact-branches=never
+  cflags-$(CONFIG_MIPS_COMPACT_BRANCHES_OPTIMAL)	+= -mcompact-branches=optimal
+  cflags-$(CONFIG_MIPS_COMPACT_BRANCHES_ALWAYS)		+= -mcompact-branches=always
+else ifneq ($(CONFIG_MIPS_COMPACT_BRANCHES_DEFAULT),y)
+  $(error Compact branch policy specified, but lacking toolchain support)
+endif
 
 #
 # Firmware support
-- 
2.8.2
