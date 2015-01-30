Received: from mailapp01.imgtec.com ([195.59.15.196]:41469 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012311AbbA3Oo3DjoBG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 30 Jan 2015 15:44:29 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id D54CBB7D56ED6
        for <linux-mips@linux-mips.org>; Fri, 30 Jan 2015 14:44:20 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 2/2] MIPS: Makefile: Set default ISA level
Date: Fri, 30 Jan 2015 14:44:16 +0000
Message-ID: <1422629056-27715-2-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1422629056-27715-1-git-send-email-markos.chandras@imgtec.com>
References: <1422629056-27715-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, Matthew Fortune <Matthew.Fortune@imgtec.com>
Message-ID: <20150130144416.4cf7nWw-N5AbRr9lUsnXW6ff0lFUklz_jjC-N_2a_Os@z>

When we configure the toolchain, we can set the default
ISA level to be used when none is set in the command line.
This, however, has some undesired consequences when the parameters
used in the command line are incompatible with the built-in ISA
level of the toolchain. In order to minimize such problems, we set
a good default ISA level if the Makefile hasn't set one for the
selected processor.

Cc: Matthew Fortune <Matthew.Fortune@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 0608ec524d3d..a244fb311a37 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -226,6 +226,15 @@ cflags-y			+= -I$(srctree)/arch/mips/include/asm/mach-generic
 drivers-$(CONFIG_PCI)		+= arch/mips/pci/
 
 #
+# Don't trust the toolchain defaults. Use a sensible -march
+# option but only if we don't have one already.
+#
+ifeq (,$(findstring march=, $(cflags-y)))
+cflags-$(CONFIG_32BIT)			+= -march=mips32
+cflags-$(CONFIG_64BIT)			+= -march=mips64
+endif
+
+#
 # Automatically detect the build format. By default we choose
 # the elf format according to the load address.
 # We can always force a build with a 64-bits symbol format by
-- 
2.2.2
