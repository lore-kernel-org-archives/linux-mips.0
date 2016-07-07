Received: from mailapp01.imgtec.com ([195.59.15.196]:34489 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992247AbcGGPAlfW5Ag (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 7 Jul 2016 17:00:41 +0200
From: James Hartley <james.hartley@imgtec.com>
Subject: [PATCH] MAINTAINERS: Add pistachio SoC Support
Date: Thu, 7 Jul 2016 16:00:21 +0100
Message-ID: <1467903621-3175-1-git-send-email-james.hartley@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hartley@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: davem@davemloft.net
Cc: geert@linux-m68k.org, gregkh@linuxfoundation.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, ralf@linux-mips.org, ionela.voinescu@imgtec.com, James Hartley <james.hartley@imgtec.com>
Message-ID: <20160707150021.AnPIsQd6dTgw1UbicgPE8H2gIxwvsULIhCsjQOPxAz4@z>

The Pistachio SoC from Imagination Technologies currently has no
entry in the MAINTAINERS file, so add one.

Signed-off-by: James Hartley <james.hartley@imgtec.com>
Reviewed-by: Ionela Voinescu <ionela.voinescu@imgtec.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b532c8d..ba20ad8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9188,6 +9188,16 @@ W:	http://www.st.com/spear
 S:	Maintained
 F:	drivers/pinctrl/spear/
 
+PISTACHIO SOC SUPPORT
+M:      James Hartley <james.hartley@imgtec.com>
+M:      Ionela Voinescu <ionela.voinescu@imgtec.com>
+L:      linux-mips@linux-mips.org
+S:      Maintained
+F:      arch/mips/pistachio/
+F:      arch/mips/include/asm/mach-pistachio/
+F:      arch/mips/boot/dts/pistachio/
+F:      arch/mips/configs/pistachio*_defconfig
+
 PKTCDVD DRIVER
 M:	Jiri Kosina <jikos@kernel.org>
 S:	Maintained
-- 
2.7.4
