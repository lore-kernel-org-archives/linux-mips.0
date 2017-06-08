Received: from mailapp01.imgtec.com ([195.59.15.196]:36393 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993865AbdFHNUnGDllQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 8 Jun 2017 15:20:43 +0200
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH] mips/kprobes: flush_insn_slot should flush only if probe initialised
Date: Thu, 8 Jun 2017 15:20:32 +0200
Message-ID: <1496928032-561-1-git-send-email-marcin.nowakowski@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <20170608132032.Nq4KXyNDNhv3pXTdfjGwPKNjWN9P33N0LKQZzOf2fiw@z>

When ftrace is used with kprobes, it is possible for a kprobe to contain
an invalid location (ie. only initialised to 0 and not to a specific
location in the code). Trying to perform a cache flush on such location
leads to a crash r4k_flush_icache_range().

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 arch/mips/include/asm/kprobes.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/kprobes.h b/arch/mips/include/asm/kprobes.h
index 291846d..ad1a999 100644
--- a/arch/mips/include/asm/kprobes.h
+++ b/arch/mips/include/asm/kprobes.h
@@ -43,7 +43,8 @@ typedef union mips_instruction kprobe_opcode_t;
 
 #define flush_insn_slot(p)						\
 do {									\
-	flush_icache_range((unsigned long)p->addr,			\
+	if (p->addr)							\
+		flush_icache_range((unsigned long)p->addr,		\
 			   (unsigned long)p->addr +			\
 			   (MAX_INSN_SIZE * sizeof(kprobe_opcode_t)));	\
 } while (0)
-- 
2.7.4
