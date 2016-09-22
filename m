Received: from mailapp02.imgtec.com ([217.156.133.132]:6682 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992196AbcIVNis4Oetr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 22 Sep 2016 15:38:48 +0200
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH 1/3] MIPS: fix uretprobe implementation
Date: Thu, 22 Sep 2016 15:38:31 +0200
Message-ID: <1474551513-30647-2-git-send-email-marcin.nowakowski@imgtec.com>
In-Reply-To: <1474551513-30647-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1474551513-30647-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <20160922133831.ZO0jhhyBJWSUiYAczvRciFPLw0M-7QhCoGYgzBV7rB0@z>

arch_uretprobe_hijack_return_addr should replace the return address for
a call with a trampoline address.

Fixes: 40e084a506eb ('MIPS: Add uprobes support.')
Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 arch/mips/kernel/uprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/uprobes.c b/arch/mips/kernel/uprobes.c
index 1149b30..cd8a689 100644
--- a/arch/mips/kernel/uprobes.c
+++ b/arch/mips/kernel/uprobes.c
@@ -257,7 +257,7 @@ unsigned long arch_uretprobe_hijack_return_addr(
 	ra = regs->regs[31];
 
 	/* Replace the return address with the trampoline address */
-	regs->regs[31] = ra;
+	regs->regs[31] = trampoline_vaddr;
 
 	return ra;
 }
-- 
2.7.4
