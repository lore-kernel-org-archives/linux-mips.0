Received: from mailapp01.imgtec.com ([195.59.15.196]:33512 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992437AbcKUM0BskHIu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 21 Nov 2016 13:26:01 +0100
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH] elfcore.h: add trailing semi-colon in elf_core_copy_regs()
Date: Mon, 21 Nov 2016 13:25:52 +0100
Message-ID: <1479731152-676-1-git-send-email-marcin.nowakowski@imgtec.com>
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
To: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org
Message-ID: <20161121122552.JyMMyiP2LY2vQQwNd-jQY7iwj12st8cflH6cRaQ57qo@z>

Invocation of ELF_CORE_COPY_REGS macro is missing a trailing semi-colon
thus requiring all macro implementations to include one, which is
contrary to the typical kernel coding style and checkpatch.pl
complains about such macro definitions.
This makes it also consistent with all other ELF_CORE_* macro
invocations throughout this file.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 include/linux/elfcore.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/elfcore.h b/include/linux/elfcore.h
index 698d51a..be55557 100644
--- a/include/linux/elfcore.h
+++ b/include/linux/elfcore.h
@@ -11,7 +11,7 @@ struct coredump_params;
 static inline void elf_core_copy_regs(elf_gregset_t *elfregs, struct pt_regs *regs)
 {
 #ifdef ELF_CORE_COPY_REGS
-	ELF_CORE_COPY_REGS((*elfregs), regs)
+	ELF_CORE_COPY_REGS((*elfregs), regs);
 #else
 	BUG_ON(sizeof(*elfregs) != sizeof(*regs));
 	*(struct pt_regs *)elfregs = *regs;
-- 
2.7.4
