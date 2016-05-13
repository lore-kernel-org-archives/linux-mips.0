Received: from mailapp01.imgtec.com ([195.59.15.196]:2893 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27027876AbcEMSlUD0QjE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 May 2016 20:41:20 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: Fix genvdso error on rebuild
Date: Fri, 13 May 2016 19:41:06 +0100
Message-ID: <1463164866-13421-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160513184106.Bp4B_qgizx4UK4_kg_Ajp3GN9BvZQ1NF5S9mBIx_Yzs@z>

The genvdso program modifies the debug and stripped versions of the
VDSOs in place, and errors if the modification has already taken place.
Unfortunately this means that a rebuild which tries to rerun genvdso to
generate vdso*-image.c without also rebuilding vdso.so.dbg (for example
if genvdso.c is modified) hits a build error like this:

arch/mips/vdso/genvdso 'arch/mips/vdso/vdso.so.dbg' already contains a '.MIPS.abiflags' section

This is fixed by reorganising the rules such that unmodified .so files
have a .raw suffix, and these are copied in the same rule that runs
genvdso on the copies.

I.e. previously we had:

 cmd_vdsold:
  link objects -> vdso.so.dbg

 cmd_genvdso:
  strip vdso.so.dbg -> vdso.so
  run genvdso -> vdso-image.c
   and modify vdso.so.dbg and vdso.so in place

Now we have:

 cmd_vdsold:
  link objects -> vdso.so.dbg.raw

 a new cmd_objcopy based strip rule (inspired by ARM):
  strip vdso.so.dbg.raw -> vdso.so.raw

 cmd_genvdso:
  copy vdso.so.dbg.raw -> vdso.so.dbg
  copy vdso.so.raw -> vdso.so
  run genvdso -> vdso-image.c
   and modify vdso.so.dbg and vdso.so in place

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/vdso/Makefile | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index ee3617c0c5e2..b369509e9753 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -50,13 +50,17 @@ quiet_cmd_vdsold = VDSO    $@
       cmd_vdsold = $(CC) $(c_flags) $(VDSO_LDFLAGS) \
                    -Wl,-T $(filter %.lds,$^) $(filter %.o,$^) -o $@
 
+# Strip rule for the raw .so files
+$(obj)/%.so.raw: OBJCOPYFLAGS := -S
+$(obj)/%.so.raw: $(obj)/%.so.dbg.raw FORCE
+	$(call if_changed,objcopy)
+
 hostprogs-y := genvdso
 
 quiet_cmd_genvdso = GENVDSO $@
 define cmd_genvdso
-	cp $< $(<:%.dbg=%) && \
-	$(OBJCOPY) -S $< $(<:%.dbg=%) && \
-	$(obj)/genvdso $< $(<:%.dbg=%) $@ $(VDSO_NAME)
+	$(foreach file,$(filter %.raw,$^),cp $(file) $(file:%.raw=%) &&) \
+	$(obj)/genvdso $(<:%.raw=%) $(<:%.dbg.raw=%) $@ $(VDSO_NAME)
 endef
 
 #
@@ -66,7 +70,10 @@ endef
 native-abi := $(filter -mabi=%,$(KBUILD_CFLAGS))
 
 targets += $(obj-vdso-y)
-targets += vdso.lds vdso.so.dbg vdso.so vdso-image.c
+targets += vdso.lds
+targets += vdso.so.dbg.raw vdso.so.raw
+targets += vdso.so.dbg vdso.so
+targets += vdso-image.c
 
 obj-vdso := $(obj-vdso-y:%.o=$(obj)/%.o)
 
@@ -75,10 +82,11 @@ $(obj-vdso): KBUILD_AFLAGS := $(aflags-vdso) $(native-abi)
 
 $(obj)/vdso.lds: KBUILD_CPPFLAGS := $(native-abi)
 
-$(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
+$(obj)/vdso.so.dbg.raw: $(obj)/vdso.lds $(obj-vdso) FORCE
 	$(call if_changed,vdsold)
 
-$(obj)/vdso-image.c: $(obj)/vdso.so.dbg $(obj)/genvdso FORCE
+$(obj)/vdso-image.c: $(obj)/vdso.so.dbg.raw $(obj)/vdso.so.raw \
+                     $(obj)/genvdso FORCE
 	$(call if_changed,genvdso)
 
 obj-y += vdso-image.o
@@ -89,7 +97,10 @@ obj-y += vdso-image.o
 
 # Define these outside the ifdef to ensure they are picked up by clean.
 targets += $(obj-vdso-y:%.o=%-o32.o)
-targets += vdso-o32.lds vdso-o32.so.dbg vdso-o32.so vdso-o32-image.c
+targets += vdso-o32.lds
+targets += vdso-o32.so.dbg.raw vdso-o32.so.raw
+targets += vdso-o32.so.dbg vdso-o32.so
+targets += vdso-o32-image.c
 
 ifdef CONFIG_MIPS32_O32
 
@@ -109,11 +120,12 @@ $(obj)/vdso-o32.lds: KBUILD_CPPFLAGS := -mabi=32
 $(obj)/vdso-o32.lds: $(src)/vdso.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
 
-$(obj)/vdso-o32.so.dbg: $(obj)/vdso-o32.lds $(obj-vdso-o32) FORCE
+$(obj)/vdso-o32.so.dbg.raw: $(obj)/vdso-o32.lds $(obj-vdso-o32) FORCE
 	$(call if_changed,vdsold)
 
 $(obj)/vdso-o32-image.c: VDSO_NAME := o32
-$(obj)/vdso-o32-image.c: $(obj)/vdso-o32.so.dbg $(obj)/genvdso FORCE
+$(obj)/vdso-o32-image.c: $(obj)/vdso-o32.so.dbg.raw $(obj)/vdso-o32.so.raw \
+                         $(obj)/genvdso FORCE
 	$(call if_changed,genvdso)
 
 obj-y += vdso-o32-image.o
@@ -125,7 +137,10 @@ endif
 #
 
 targets += $(obj-vdso-y:%.o=%-n32.o)
-targets += vdso-n32.lds vdso-n32.so.dbg vdso-n32.so vdso-n32-image.c
+targets += vdso-n32.lds
+targets += vdso-n32.so.dbg.raw vdso-n32.so.raw
+targets += vdso-n32.so.dbg vdso-n32.so
+targets += vdso-n32-image.c
 
 ifdef CONFIG_MIPS32_N32
 
@@ -145,11 +160,12 @@ $(obj)/vdso-n32.lds: KBUILD_CPPFLAGS := -mabi=n32
 $(obj)/vdso-n32.lds: $(src)/vdso.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
 
-$(obj)/vdso-n32.so.dbg: $(obj)/vdso-n32.lds $(obj-vdso-n32) FORCE
+$(obj)/vdso-n32.so.dbg.raw: $(obj)/vdso-n32.lds $(obj-vdso-n32) FORCE
 	$(call if_changed,vdsold)
 
 $(obj)/vdso-n32-image.c: VDSO_NAME := n32
-$(obj)/vdso-n32-image.c: $(obj)/vdso-n32.so.dbg $(obj)/genvdso FORCE
+$(obj)/vdso-n32-image.c: $(obj)/vdso-n32.so.dbg.raw $(obj)/vdso-n32.so.raw \
+                         $(obj)/genvdso FORCE
 	$(call if_changed,genvdso)
 
 obj-y += vdso-n32-image.o
-- 
2.4.10
