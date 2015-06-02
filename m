Received: from mail.windriver.com ([147.11.1.11]:35531 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007106AbbFBUQiy8zGc (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 2 Jun 2015 22:16:38 +0200
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 3/4] mips: make loongsoon serial driver explicitly modular
Date: Tue, 2 Jun 2015 16:16:07 -0400
Message-ID: <1433276168-21550-4-git-send-email-paul.gortmaker@windriver.com>
In-Reply-To: <1433276168-21550-1-git-send-email-paul.gortmaker@windriver.com>
References: <1433276168-21550-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Gortmaker@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20150602201607.2CfJFXxiXZGtRkQPNRL-j9slyvYBAGdmwjYRNcRzXUw@z>

The file looks as if it is non-modular, but it piggy-backs
off CONFIG_SERIAL_8250 which is tristate.  If set to "=m"
we will get this after the init/module header cleanup:

arch/mips/loongson/common/serial.c:76:1: error: data definition has no type or storage class [-Werror]
arch/mips/loongson/common/serial.c:76:1: error: type defaults to 'int' in declaration of 'device_initcall' [-Werror=implicit-int]
arch/mips/loongson/common/serial.c:76:1: error: parameter names (without types) in function declaration [-Werror]
arch/mips/loongson/common/serial.c:58:19: error: 'serial_init' defined but not used [-Werror=unused-function]
cc1: all warnings being treated as errors
make[3]: *** [arch/mips/loongson/common/serial.o] Error 1

Make it clearly modular, and add a module_exit function,
so that we avoid the above breakage.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/mips/loongson/common/serial.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/mips/loongson/common/serial.c b/arch/mips/loongson/common/serial.c
index c23fa1373729..ffefc1cb2612 100644
--- a/arch/mips/loongson/common/serial.c
+++ b/arch/mips/loongson/common/serial.c
@@ -11,7 +11,7 @@
  */
 
 #include <linux/io.h>
-#include <linux/init.h>
+#include <linux/module.h>
 #include <linux/serial_8250.h>
 
 #include <asm/bootinfo.h>
@@ -108,5 +108,10 @@ static int __init serial_init(void)
 
 	return platform_device_register(&uart8250_device);
 }
+module_init(serial_init);
 
-device_initcall(serial_init);
+static void __init serial_exit(void)
+{
+	platform_device_unregister(&uart8250_device);
+}
+module_exit(serial_exit);
-- 
2.2.1
