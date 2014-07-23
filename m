Received: from mail-wg0-f51.google.com ([74.125.82.51]:41042 "EHLO
        mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6831986AbaGWNnXa57HU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Jul 2014 15:43:23 +0200
Received: by mail-wg0-f51.google.com with SMTP id b13so1181735wgh.22
        for <linux-mips@linux-mips.org>; Wed, 23 Jul 2014 06:43:16 -0700 (PDT)
From: Alex Smith <alex@alex-smith.me.uk>
Subject: [PATCH v2 06/11] MIPS: O32/32-bit: Fix bug which can cause incorrect system call restarts
Date: Wed, 23 Jul 2014 14:40:11 +0100
Message-ID: <1406122816-2424-7-git-send-email-alex@alex-smith.me.uk>
In-Reply-To: <1406122816-2424-1-git-send-email-alex@alex-smith.me.uk>
References: <1406122816-2424-1-git-send-email-alex@alex-smith.me.uk>
Return-Path: <alex@alex-smith.me.uk>
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
Cc: Alex Smith <alex.smith@imgtec.com>, stable@vger.kernel.org
Message-ID: <20140723134011.US5kKeZUGSR0lK-GYtc9sOz6cy5Ef65s_qQv_5Ty9SA@z>

From: Alex Smith <alex.smith@imgtec.com>

On 32-bit/O32, pt_regs has a padding area at the beginning into which the
syscall arguments passed via the user stack are copied. 4 arguments
totalling 16 bytes are copied to offset 16 bytes into this area, however
the area is only 24 bytes long. This means the last 2 arguments overwrite
pt_regs->regs[{0,1}].

If a syscall function returns an error, handle_sys stores the original
syscall number in pt_regs->regs[0] for syscall restart. signal.c checks
whether regs[0] is non-zero, if it is it will check whether the syscall
return value is one of the ERESTART* codes to see if it must be
restarted.

Should a syscall be made that results in a non-zero value being copied
off the user stack into regs[0], and then returns a positive (non-error)
value that matches one of the ERESTART* error codes, this can be mistaken
for requiring a syscall restart.

While the possibility for this to occur has always existed, it is made
much more likely to occur by commit 46e12c07b3b9 ("MIPS: O32 / 32-bit:
Always copy 4 stack arguments."), since now every syscall will copy 4
arguments and overwrite regs[0], rather than just those with 7 or 8
arguments.

Since that commit, booting Debian under a 32-bit MIPS kernel almost
always results in a hang early in boot, due to a wait4 syscall returning
a PID that matches one of the ERESTART* codes, which then causes an
incorrect restart of the syscall.

The problem is fixed by increasing the size of the padding area so that
arguments copied off the stack will not overwrite pt_regs->regs[{0,1}].

Signed-off-by: Alex Smith <alex.smith@imgtec.com>
Cc: <stable@vger.kernel.org> # v3.13+
---
Changes in v2:
 - Rebase on current upstream.
 - Split comment change into a separate commit.

I've rebased this patch on top of current mips-for-linux-next. However,
for it to be applied to stable it needs an additional change to the
PT_PADSLOT* definitions in arch/mips/kernel/smtc-asm.S to account for
the changed pt_regs offsets. This file no longer exists since SMTC has
been dropped.

I'm not sure what the correct way to deal with this is - can an
alternate version of the patch be submitted for stable?
---
 arch/mips/include/asm/ptrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/ptrace.h b/arch/mips/include/asm/ptrace.h
index 7e6e682..c301fa9 100644
--- a/arch/mips/include/asm/ptrace.h
+++ b/arch/mips/include/asm/ptrace.h
@@ -23,7 +23,7 @@
 struct pt_regs {
 #ifdef CONFIG_32BIT
 	/* Pad bytes for argument save space on the stack. */
-	unsigned long pad0[6];
+	unsigned long pad0[8];
 #endif
 
 	/* Saved main processor registers. */
-- 
1.9.1
