Received: from mailapp01.imgtec.com ([195.59.15.196]:35359 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009724AbbDBNnDz7TPA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 2 Apr 2015 15:43:03 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: Makefile: Fix MIPS ASE detection code
Date: Thu, 2 Apr 2015 14:42:52 +0100
Message-ID: <1427982172-10541-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, "Maciej W. Rozycki" <macro@linux-mips.org>
Message-ID: <20150402134252.B438ari6k1wMg7O3ormd84nSHHVPquFLsTWoDuNtHCs@z>

Commit 32098ec7bcba ("MIPS: Makefile: Move the ASEs checks after
setting the core's CFLAGS") re-arranged the MIPS ASE detection code
and also added the current cflags to the detection logic. However,
this introduced a few bugs. First of all, the mips-cflags should not
be quoted since that ends up being passed as a string to subsequent
commands leading to broken detection from the cc-option-* tools.
Moreover, in order to avoid duplicating the cflags-y because of how
cc-option works, we rework the logic so we pass only those cflags which
are needed by the selected ASE. Finally, fix some typos resulting in MSA
not being detected correctly.

Fixes: Commit 32098ec7bcba ("MIPS: Makefile: Move the ASEs checks after setting the core's CFLAGS")
Cc: Maciej W. Rozycki <macro@linux-mips.org>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/Makefile | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e644ac2d6501..198fd8d120a0 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -197,11 +197,17 @@ endif
 # Warning: the 64-bit MIPS architecture does not support the `smartmips' extension
 # Pass -Wa,--no-warn to disable all assembler warnings until the kernel code has
 # been fixed properly.
-mips-cflags				:= "$(cflags-y)"
-cflags-$(CONFIG_CPU_HAS_SMARTMIPS)	+= $(call cc-option,$(mips-cflags),-msmartmips) -Wa,--no-warn
-cflags-$(CONFIG_CPU_MICROMIPS)		+= $(call cc-option,$(mips-cflags),-mmicromips)
+mips-cflags				:= $(cflags-y)
+ifeq ($(CONFIG_CPU_HAS_SMARTMIPS),y)
+smartmips-ase				:= $(call cc-option-yn,$(mips-cflags) -msmartmips)
+cflags-$(smartmips-ase)			+= -msmartmips -Wa,--no-warn
+endif
+ifeq ($(CONFIG_CPU_MICROMIPS),y)
+micromips-ase				:= $(call cc-option-yn,$(mips-cflags) -mmicromips)
+cflags-$(micromips-ase)			+= -mmicromips
+endif
 ifeq ($(CONFIG_CPU_HAS_MSA),y)
-toolchain-msa				:= $(call cc-option-yn,-$(mips-cflags),mhard-float -mfp64 -Wa$(comma)-mmsa)
+toolchain-msa				:= $(call cc-option-yn,$(mips-cflags) -mhard-float -mfp64 -Wa$(comma)-mmsa)
 cflags-$(toolchain-msa)			+= -DTOOLCHAIN_SUPPORTS_MSA
 endif
 
-- 
2.3.5
