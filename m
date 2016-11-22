Received: from mail-bl2nam02on0059.outbound.protection.outlook.com ([104.47.38.59]:61880
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993150AbcKVToFb-2Ev (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 22 Nov 2016 20:44:05 +0100
Subject: [PATCH 1/5] MIPS: FW: Make fw_init_cmdline() to be __weak.
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <b14ef49d-f39c-4e13-2da8-ab94804395a2@cavium.com>
Date: Tue, 22 Nov 2016 13:43:54 -0600
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
Message-ID: <20161122194354.IskBSQQKSiyFsowjxQuwGpZqMhP2zSjV9DhBprxf1GU@z>

Some bootloaders pass the kernel parameters in different registers.
Allow for platform-specific initialization of the command line.

Signed-off-by: Steven J. Hill <Steven.Hill@cavium.com>
---
 arch/mips/include/asm/fw/fw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/fw/fw.h b/arch/mips/include/asm/fw/fw.h
index d0ef8b4..0fcd63e 100644
--- a/arch/mips/include/asm/fw/fw.h
+++ b/arch/mips/include/asm/fw/fw.h
@@ -21,7 +21,7 @@
 #define fw_argv(index)		((char *)(long)_fw_argv[(index)])
 #define fw_envp(index)		((char *)(long)_fw_envp[(index)])

-extern void fw_init_cmdline(void);
+extern void __weak fw_init_cmdline(void);
 extern char *fw_getcmdline(void);
 extern void fw_meminit(void);
 extern char *fw_getenv(char *name);
-- 
1.9.1
