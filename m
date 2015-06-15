Received: from mail.windriver.com ([147.11.1.11]:34599 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007505AbbFOWL7IPsjK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 16 Jun 2015 00:11:59 +0200
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] mips: add module.h to cobalt/mtd.c to avoid compile fail
Date: Mon, 15 Jun 2015 18:11:21 -0400
Message-ID: <1434406281-32168-1-git-send-email-paul.gortmaker@windriver.com>
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
Message-ID: <20150615221121.ZR6CViuLMAWEzFMJGzliMzoZA3vIqpvzKIKK_4cXtcM@z>

This file is built off of a tristate Kconfig option and also contains
modular function calls so it should explicitly include module.h to
avoid compile breakage during header shuffles done in the future.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[
 To be appended to the branch with content originally sent here:
 "Fix implicit includes of <module.h> that will break."
 https://lkml.kernel.org/r/1430444867-22342-1-git-send-email-paul.gortmaker@windriver.com
]

 arch/mips/cobalt/mtd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/cobalt/mtd.c b/arch/mips/cobalt/mtd.c
index 8db7b5d81560..1c38e757f238 100644
--- a/arch/mips/cobalt/mtd.c
+++ b/arch/mips/cobalt/mtd.c
@@ -17,7 +17,7 @@
  *  along with this program; if not, write to the Free Software
  *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
  */
-#include <linux/init.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
-- 
2.2.1
