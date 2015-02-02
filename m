Received: from mailapp01.imgtec.com ([195.59.15.196]:37025 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010792AbbBBJDo0WxwM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 2 Feb 2015 10:03:44 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id EBF7189D6DDCF
        for <linux-mips@linux-mips.org>; Mon,  2 Feb 2015 09:03:36 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: boot: elf2ecoff: Ignore the PT_MIPS_ABIFLAGS section
Date: Mon, 2 Feb 2015 09:03:31 +0000
Message-ID: <1422867811-28531-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150202090331.iDsyZkHpAOGk08q78AS2M5oMsUZkpLqlFYHb6XvuROQ@z>

The latest MIPS tools generate a PT_MIPS_ABIFLAGS section in the
ELF files. Support for this section has been added in 6cd962292d9eb3b
"MIPS: ELF: Add definition for the .MIPS.abiflags section".
The elf2ecoff utility has no knowledge of that section and that breaks
the rm200 build

ECOFF   arch/mips/boot/vmlinux.ecoff
Program header 3 type 1879048195 can't be converted.
arch/mips/boot/Makefile:30: recipe for target 'arch/mips/boot/vmlinux.ecoff'
failed
make[1]: *** [arch/mips/boot/vmlinux.ecoff] Error 1

So we add this section to the ones we should ignore.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/boot/elf2ecoff.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/elf2ecoff.c b/arch/mips/boot/elf2ecoff.c
index 8585078ae50e..12568a2ad62e 100644
--- a/arch/mips/boot/elf2ecoff.c
+++ b/arch/mips/boot/elf2ecoff.c
@@ -50,6 +50,7 @@
  * Some extra ELF definitions
  */
 #define PT_MIPS_REGINFO 0x70000000	/* Register usage information */
+#define PT_MIPS_ABIFLAGS 0x70000003
 
 /* -------------------------------------------------------------------- */
 
@@ -351,7 +352,8 @@ int main(int argc, char *argv[])
 		/* Section types we can ignore... */
 		if (ph[i].p_type == PT_NULL || ph[i].p_type == PT_NOTE ||
 		    ph[i].p_type == PT_PHDR
-		    || ph[i].p_type == PT_MIPS_REGINFO)
+		    || ph[i].p_type == PT_MIPS_REGINFO
+		    || ph[i].p_type == PT_MIPS_ABIFLAGS)
 			continue;
 		/* Section types we can't handle... */
 		else if (ph[i].p_type != PT_LOAD) {
-- 
2.2.2
