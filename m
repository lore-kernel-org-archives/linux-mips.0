Received: from mailapp01.imgtec.com ([195.59.15.196]:64222 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993962AbdCMO5Yk4Bad (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 13 Mar 2017 15:57:24 +0100
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH] MIPS: generic: fix out-of-tree defconfig target builds
Date: Mon, 13 Mar 2017 15:57:14 +0100
Message-ID: <1489417034-12258-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org
Cc: linux-mips@linux-mips.org, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170313145714.osfR65BoaxB56mJqOVwJFhwsvxDSknAawfN6D2DxneI@z>

When specifying a generic defconfig target with O=... option set, make
is invoked in the output location before a target makefile wrapper is
created. Ensure that the correct makefile is used by specifying the
kernel source makefile during make invocation.

This fixes the either of the following errors:

$ make sead3_defoncifg ARCH=mips O=test
make[1]: Entering directory '/mnt/ssd/MIPS/linux-next/test'
make[2]: *** No rule to make target '32r2el_defconfig'.  Stop.
arch/mips/Makefile:506: recipe for target 'sead3_defconfig' failed
make[1]: *** [sead3_defconfig] Error 2
make[1]: Leaving directory '/mnt/ssd/MIPS/linux-next/test'
Makefile:152: recipe for target 'sub-make' failed
make: *** [sub-make] Error 2

$ make 32r2el_defconfig ARCH=mips O=test
make[1]: Entering directory '/mnt/ssd/MIPS/linux-next/test'
Using ../arch/mips/configs/generic_defconfig as base
Merging ../arch/mips/configs/generic/32r2.config
Merging ../arch/mips/configs/generic/el.config
Merging ../arch/mips/configs/generic/board-sead-3.config
!
! merged configuration written to .config (needs make)
!
make[2]: *** No rule to make target 'olddefconfig'.  Stop.
arch/mips/Makefile:489: recipe for target '32r2el_defconfig' failed
make[1]: *** [32r2el_defconfig] Error 2
make[1]: Leaving directory '/mnt/ssd/MIPS/linux-next/test'
Makefile:152: recipe for target 'sub-make' failed
make: *** [sub-make] Error 2

Fixes: eed0eabd12ef ('MIPS: generic: Introduce generic DT-based board support')
Fixes: 3f5f0a4475e1 ('MIPS: generic: Convert SEAD-3 to a generic board')
Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Cc: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 8ef9c02..02a1787 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -489,7 +489,7 @@ $(generic_defconfigs):
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
 		-m -O $(objtree) $(srctree)/arch/$(ARCH)/configs/generic_defconfig $^ \
 		$(foreach board,$(BOARDS),$(generic_config_dir)/board-$(board).config)
-	$(Q)$(MAKE) olddefconfig
+	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 
 #
 # Prevent generic merge_config rules attempting to merge single fragments
@@ -503,8 +503,8 @@ $(generic_config_dir)/%.config: ;
 #
 .PHONY: sead3_defconfig
 sead3_defconfig:
-	$(Q)$(MAKE) 32r2el_defconfig BOARDS=sead-3
+	$(Q)$(MAKE) -f $(srctree)/Makefile 32r2el_defconfig BOARDS=sead-3
 
 .PHONY: sead3micro_defconfig
 sead3micro_defconfig:
-	$(Q)$(MAKE) micro32r2el_defconfig BOARDS=sead-3
+	$(Q)$(MAKE) -f $(srctree)/Makefile micro32r2el_defconfig BOARDS=sead-3
-- 
2.7.4
