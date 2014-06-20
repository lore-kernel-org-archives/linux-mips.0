Received: from mail-by2lp0237.outbound.protection.outlook.com ([207.46.163.237]:53525
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6859947AbaFTLX55ImW9 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 20 Jun 2014 13:23:57 +0200
From: Sorin Dumitru <sdumitru@ixiacom.com>
Subject: [PATCH v2] mips: n32: use compat getsockopt syscall
Date: Fri, 20 Jun 2014 14:23:35 +0300
Message-ID: <1403263415-15765-1-git-send-email-sdumitru@ixiacom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <sdumitru@ixiacom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Cc: ralf@linux-mips.org, sdumitru@ixiacom.com
Message-ID: <20140620112335.TfyD5szO4FSTvX_bgPIgiLq47ANaCkgzW3dbEz-o62U@z>

The IP_PKTOPTIONS sockopt puts control messages
in option_values, these need to be handled
differently in the compat case. This is already
done through the MSG_CMSG_COMPAT flag, we just
need to use compat_sys_getsockopt which sets that
flag.

Signed-off-by: Sorin Dumitru <sdumitru@ixiacom.com>
---
 arch/mips/kernel/scall64-n32.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/scall64-n32.S b/arch/mips/kernel/scall64-n32.S
index c1dbcda..e543861 100644
--- a/arch/mips/kernel/scall64-n32.S
+++ b/arch/mips/kernel/scall64-n32.S
@@ -162,7 +162,7 @@ EXPORT(sysn32_call_table)
 	PTR	sys_getpeername
 	PTR	sys_socketpair
 	PTR	compat_sys_setsockopt
-	PTR	sys_getsockopt
+	PTR	compat_sys_getsockopt
 	PTR	__sys_clone			/* 6055 */
 	PTR	__sys_fork
 	PTR	compat_sys_execve
-- 
2.0.0
