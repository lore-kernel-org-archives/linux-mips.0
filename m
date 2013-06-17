Received: from multi.imgtec.com ([194.200.65.239]:32323 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6835843Ab3FQOBeSiz4m (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 17 Jun 2013 16:01:34 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 2/7] MIPS: sibyte: Declare the cfe_write() buffer as constant
Date: Mon, 17 Jun 2013 15:00:36 +0100
Message-ID: <1371477641-7989-3-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1371477641-7989-1-git-send-email-markos.chandras@imgtec.com>
References: <1371477641-7989-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, sibyte-users@bitmover.com
Message-ID: <20130617140036.kBawpNnt7zAFw-LQS2-TypQuaZ7PGMbpkJvKu6V-QEs@z>

The write() prototype expects a const char * as argument so declare
it as such.

Fixes the following build problem:

arch/mips/sibyte/common/cfe_console.c:23:5: error: passing argument 2 of
'cfe_write' discards 'const' qualifier from pointer target type [-Werror]
arch/mips/sibyte/common/cfe_console.c:34:4: error: passing argument 2 of
'cfe_write' makes pointer from integer without a cast [-Werror]

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Acked-by: Steven J. Hill <Steven.Hill@imgtec.com>
Cc: sibyte-users@bitmover.com
---
 arch/mips/fw/cfe/cfe_api.c             | 4 ++--
 arch/mips/include/asm/fw/cfe/cfe_api.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/fw/cfe/cfe_api.c b/arch/mips/fw/cfe/cfe_api.c
index d06dc5a6..cf84f01 100644
--- a/arch/mips/fw/cfe/cfe_api.c
+++ b/arch/mips/fw/cfe/cfe_api.c
@@ -406,12 +406,12 @@ int cfe_setenv(char *name, char *val)
 	return xiocb.xiocb_status;
 }
 
-int cfe_write(int handle, unsigned char *buffer, int length)
+int cfe_write(int handle, const char *buffer, int length)
 {
 	return cfe_writeblk(handle, 0, buffer, length);
 }
 
-int cfe_writeblk(int handle, s64 offset, unsigned char *buffer, int length)
+int cfe_writeblk(int handle, s64 offset, const char *buffer, int length)
 {
 	struct cfe_xiocb xiocb;
 
diff --git a/arch/mips/include/asm/fw/cfe/cfe_api.h b/arch/mips/include/asm/fw/cfe/cfe_api.h
index 1734755..a0ea69e 100644
--- a/arch/mips/include/asm/fw/cfe/cfe_api.h
+++ b/arch/mips/include/asm/fw/cfe/cfe_api.h
@@ -115,8 +115,8 @@ int cfe_read(int handle, unsigned char *buffer, int length);
 int cfe_readblk(int handle, int64_t offset, unsigned char *buffer,
 		int length);
 int cfe_setenv(char *name, char *val);
-int cfe_write(int handle, unsigned char *buffer, int length);
-int cfe_writeblk(int handle, int64_t offset, unsigned char *buffer,
+int cfe_write(int handle, const char *buffer, int length);
+int cfe_writeblk(int handle, int64_t offset, const char *buffer,
 		 int length);
 
 #endif				/* CFE_API_H */
-- 
1.8.2.1
