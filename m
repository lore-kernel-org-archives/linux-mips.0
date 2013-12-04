Received: from multi.imgtec.com ([194.200.65.239]:9188 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6867293Ab3LDQAYH0a8R (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 4 Dec 2013 17:00:24 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH] crash_dump: fix compilation error (on MIPS at least)
Date: Wed, 4 Dec 2013 15:58:22 +0000
Message-ID: <1386172702-31266-1-git-send-email-qais.yousef@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-Path: <Qais.Yousef@imgtec.com>
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
Cc: Qais Yousef <qais.yousef@imgtec.com>, Andrew Morton <akpm@linux-foundation.org>, Michael Holzheu <holzheu@linux.vnet.ibm.com>, Vivek Goyal <vgoyal@redhat.com>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20131204155822.d3UdVjqmVtIfLU7YECYuL5FOe1PWj6ldRE_NSZFfzyc@z>

  In file included from kernel/crash_dump.c:2:0:
  include/linux/crash_dump.h:22:27: error: unknown type name ‘pgprot_t’

when CONFIG_CRASH_DUMP=y

The error was traced back to this commit:

  9cb218131de1 vmcore: introduce remap_oldmem_pfn_range()

include <asm/pgtable.h> to get the missing definition

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michael Holzheu <holzheu@linux.vnet.ibm.com>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: <linux-mips@linux-mips.org>
Cc: <stable@vger.kernel.org> # 3.12
Reviewed-by: James Hogan <james.hogan@imgtec.com>
Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
I haven't tried any other architecture except mips.
If OK this should be considered for stable 3.12 (CCed).

 include/linux/crash_dump.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/include/linux/crash_dump.h b/include/linux/crash_dump.h
index fe68a5a..7032518 100644
--- a/include/linux/crash_dump.h
+++ b/include/linux/crash_dump.h
@@ -6,6 +6,8 @@
 #include <linux/proc_fs.h>
 #include <linux/elf.h>
 
+#include <asm/pgtable.h> /* for pgprot_t */
+
 #define ELFCORE_ADDR_MAX	(-1ULL)
 #define ELFCORE_ADDR_ERR	(-2ULL)
 
-- 
1.7.1
