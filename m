Received: from mail-by2on0101.outbound.protection.outlook.com ([207.46.100.101]:6269
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6841768AbaEMJGCkcizk (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 13 May 2014 11:06:02 +0200
From: Ley Foon Tan <lftan@altera.com>
Subject: [PATCH 14/25] mips: Add 32 bit time_t and clock_t
Date: Tue, 13 May 2014 17:05:29 +0800
Message-ID: <1399971929-4487-1-git-send-email-lftan@altera.com>
In-Reply-To: <1399971456-3941-1-git-send-email-lftan@altera.com>
References: <1399971456-3941-1-git-send-email-lftan@altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <lftan@altera.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ley Foon Tan <lftan@altera.com>, lftan.linux@gmail.com, cltang@codesourcery.com, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20140513090529.2RSyXqGZIFVFjKzffW2poTwXOC7VFsxBQsFKdRG4k0o@z>

Override time_t and clock_t in include/uapi/asm-generic.

Signed-off-by: Ley Foon Tan <lftan@altera.com>
---
 arch/mips/include/uapi/asm/posix_types.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/include/uapi/asm/posix_types.h b/arch/mips/include/uapi/asm/posix_types.h
index fa03ec3..e9ca921 100644
--- a/arch/mips/include/uapi/asm/posix_types.h
+++ b/arch/mips/include/uapi/asm/posix_types.h
@@ -25,6 +25,12 @@ typedef struct {
 	long	val[2];
 } __kernel_fsid_t;
 #define __kernel_fsid_t __kernel_fsid_t
+
+typedef long	__kernel_time_t;
+#define __kernel_time_t __kernel_time_t
+
+typedef long	__kernel_clock_t;
+#define __kernel_clock_t __kernel_clock_t
 #endif
 
 #include <asm-generic/posix_types.h>
-- 
1.8.2.1
