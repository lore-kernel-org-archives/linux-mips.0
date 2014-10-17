Received: from mailapp01.imgtec.com ([195.59.15.196]:34609 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011673AbaJQJtt1rMup (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 17 Oct 2014 11:49:49 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 0FC34DEFB1C2E
        for <linux-mips@linux-mips.org>; Fri, 17 Oct 2014 10:49:40 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: sibyte: Include the swarm subdir to the sb1250 LittleSur builds
Date: Fri, 17 Oct 2014 10:49:38 +0100
Message-ID: <1413539378-4107-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20141017094938.w-dyeDOVSKT1kbAhqWUTfow2GoZzYoJuBx2NE12L_7c@z>

Fixes the following randconfig build problem:

arch/mips/built-in.o: In function `show_cpuinfo':
proc.c:(.text+0xde84): undefined reference to `get_system_type'
arch/mips/built-in.o: In function `sb1250_setup':
(.init.text+0x428): undefined reference to `get_system_type'
arch/mips/built-in.o: In function `setup_arch':
(.init.text+0x178c): undefined reference to `plat_mem_setup'
Makefile:930: recipe for target 'vmlinux' failed

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
Only compile tested.
---
 arch/mips/sibyte/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/sibyte/Makefile b/arch/mips/sibyte/Makefile
index c8ed2c807e69..455c40d6d625 100644
--- a/arch/mips/sibyte/Makefile
+++ b/arch/mips/sibyte/Makefile
@@ -25,3 +25,4 @@ obj-$(CONFIG_SIBYTE_RHONE)	+= swarm/
 obj-$(CONFIG_SIBYTE_SENTOSA)	+= swarm/
 obj-$(CONFIG_SIBYTE_SWARM)	+= swarm/
 obj-$(CONFIG_SIBYTE_BIGSUR)	+= swarm/
+obj-$(CONFIG_SIBYTE_LITTLESUR)	+= swarm/
-- 
2.1.2
