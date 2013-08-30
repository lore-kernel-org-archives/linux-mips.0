Received: from multi.imgtec.com ([194.200.65.239]:47283 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6822344Ab3H3Pnxji0xB (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 30 Aug 2013 17:43:53 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 1/3] MIPS: refactor boot and boot/compressed rules
Date: Fri, 30 Aug 2013 16:42:40 +0100
Message-ID: <1377877362-15650-2-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1377877362-15650-1-git-send-email-james.hogan@imgtec.com>
References: <1377877362-15650-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20130830154240.ot-7bAEIQvj_bbj_G7T_w442KrOSbizfDoCILdotmWE@z>

Split out the arch/mips/boot/ and arch/mips/boot/compressed/ targets
into boot-y and bootz-y variables. This makes it slightly cleaner to add
new targets.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/Makefile | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index b2be6b8..8be2f89 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -258,6 +258,17 @@ drivers-$(CONFIG_OPROFILE)	+= arch/mips/oprofile/
 # suspend and hibernation support
 drivers-$(CONFIG_PM)	+= arch/mips/power/
 
+# boot image targets (arch/mips/boot/)
+boot-y			:= vmlinux.bin
+boot-y			+= vmlinux.ecoff
+boot-y			+= vmlinux.srec
+
+# compressed boot image targets (arch/mips/boot/compressed/)
+bootz-y			:= vmlinuz
+bootz-y			+= vmlinuz.bin
+bootz-y			+= vmlinuz.ecoff
+bootz-y			+= vmlinuz.srec
+
 ifdef CONFIG_LASAT
 rom.bin rom.sw: vmlinux
 	$(Q)$(MAKE) $(build)=arch/mips/lasat/image $@
@@ -284,11 +295,11 @@ vmlinux.64: vmlinux
 all:	$(all-y)
 
 # boot
-vmlinux.bin vmlinux.ecoff vmlinux.srec: $(vmlinux-32) FORCE
+$(boot-y): $(vmlinux-32) FORCE
 	$(Q)$(MAKE) $(build)=arch/mips/boot VMLINUX=$(vmlinux-32) arch/mips/boot/$@
 
 # boot/compressed
-vmlinuz vmlinuz.bin vmlinuz.ecoff vmlinuz.srec: $(vmlinux-32) FORCE
+$(bootz-y): $(vmlinux-32) FORCE
 	$(Q)$(MAKE) $(build)=arch/mips/boot/compressed \
 	   VMLINUX_LOAD_ADDRESS=$(load-y) 32bit-bfd=$(32bit-bfd) $@
 
-- 
1.8.1.2
