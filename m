Received: from mailapp01.imgtec.com ([195.59.15.196]:12838 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007119AbbBXPDRYb9Ws (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Feb 2015 16:03:17 +0100
From: Daniel Sanders <daniel.sanders@imgtec.com>
Subject: [PATCH v3] MIPS: Changed current_thread_info() to an equivalent supported by both clang and GCC
Date: Tue, 24 Feb 2015 15:02:57 +0000
Message-ID: <1424790177-10089-1-git-send-email-daniel.sanders@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Daniel.Sanders@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Cc: Daniel Sanders <daniel.sanders@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org, Behan Webster <behanw@converseincode.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, David Daney <ddaney.cavm@gmail.com>
Message-ID: <20150224150257.APH1ClxExxFjnNRpfEOPYxbKpNoB9wCWh6AaB6OWE8g@z>

Without this, a 'break' instruction is executed very early in the boot and
the boot hangs.

The problem is that clang doesn't honour named registers on local variables
and silently treats them as normal uninitialized variables. However, it
does honour them on global variables.

Signed-off-by: Daniel Sanders <daniel.sanders@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Markos Chandras <markos.chandras@imgtec.com>
Cc: James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org
Cc: Behan Webster <behanw@converseincode.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: David Daney <ddaney.cavm@gmail.com>
---
v2 of this patch has been updated following David Daney's request to preserve
the name of the original named register local.

v3 of this patch just rebases to master and adds some background discussion from
the previous threads.

For reference, a similar patch for ARM's stack pointer has already been merged:
  0abc08b ARM: 8170/1: Add global named register current_stack_pointer for ARM

LLVM is unlikely to support uninitialized reads of named register locals in the
foreseeable future. There are some significant implementation difficulties and
there were objections based on the future direction of LLVM. The thread is at
http://lists.cs.uiuc.edu/pipermail/llvmdev/2014-March/071555.html. I've linked
to the bit where the issues started to be discussed rather than the start of
the thread.

Difficulty and objections aside, it's also a very large amount of work to
support a single (as far as I know) user of named register locals, especially
when the kernel has already accepted patches to switch named register locals to
named register globals in the arm and arm64/aarch64 arches.

 arch/mips/include/asm/thread_info.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/thread_info.h b/arch/mips/include/asm/thread_info.h
index 55ed660..2f0dba3 100644
--- a/arch/mips/include/asm/thread_info.h
+++ b/arch/mips/include/asm/thread_info.h
@@ -55,10 +55,10 @@ struct thread_info {
 #define init_stack		(init_thread_union.stack)
 
 /* How to get the thread information struct from C.  */
+register struct thread_info *__current_thread_info __asm__("$28");
+
 static inline struct thread_info *current_thread_info(void)
 {
-	register struct thread_info *__current_thread_info __asm__("$28");
-
 	return __current_thread_info;
 }
 
-- 
2.1.4
