Received: from mail-sn1nam02on0057.outbound.protection.outlook.com ([104.47.36.57]:2211
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993168AbcKVToPQX-Ov (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 22 Nov 2016 20:44:15 +0100
Subject: [PATCH 2/5] MIPS: Fix vmlinux.64 target for CONFIG_RELOCATABLE
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <6f8e21bd-ca22-5866-83dc-d70e4e10842b@cavium.com>
Date: Tue, 22 Nov 2016 13:44:01 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@cavium.com>
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
Cc: ralf@linux-mips.org
Message-ID: <20161122194401.3T0Ah3HyoYn1AKsS69QEWogQINlS4IKFjmoNTMcutHc@z>

The vmlinux.64 target was broken when building a relocatable
kernel. Fix calling of the correct tool.

Signed-off-by: Steven J. Hill <Steven.Hill@cavium.com>
---
 arch/mips/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 1a6bac7..61568df 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -353,6 +353,11 @@ endif
 quiet_cmd_64 = OBJCOPY $@
 	cmd_64 = $(OBJCOPY) -O $(64bit-bfd) $(OBJCOPYFLAGS) $< $@
 vmlinux.64: vmlinux
+ifeq ($(CONFIG_RELOCATABLE)$(CONFIG_64BIT),yy)
+# Currently, objcopy fails to handle the relocations in the elf64
+# So the relocs tool must be run here to remove them first
+	$(call cmd,relocs)
+endif
 	$(call cmd,64)

 all:	$(all-y)
-- 
1.9.1
