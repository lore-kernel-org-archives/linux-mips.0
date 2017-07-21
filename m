Received: from mailapp01.imgtec.com ([195.59.15.196]:49998 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992466AbdGUOFbyyRXG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 21 Jul 2017 16:05:31 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [RFC PATCH] exec: Avoid recursive modprobe for binary format handlers
Date: Fri, 21 Jul 2017 15:05:20 +0100
Message-ID: <1500645920-28490-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: "Luis R . Rodriguez" <mcgrof@kernel.org>, linux-mips@linux-mips.org, Petr Mladek <pmladek@suse.com>, Matt Redfearn <matt.redfearn@imgtec.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

When the kernel does not have a binary format handler for an executable
it is attempting to load, when CONFIG_MODULES is enabled it will attempt
to load a module for that format. If the kernel does not have a binary
format handler for the modprobe executable, this will trigger another
module load. Previously this recursive module loading was caught and an
error message printed informing the user that the executable could not
be executed:

request_module: runaway loop modprobe binfmt-464c
Starting init:/sbin/init exists but couldn't execute it (error -8)

Commit 6d7964a722af ("kmod: throttle kmod thread limit") which was
merged in v4.13-rc1 broke this behaviour since the recursive modprobe is
no longer caught, it just ends up waiting indefinitely for the kmod_wq
wait queue. Hence the kernel appears to hang silently when starting
userspace.

This problem was observed when the binfmt handler for MIPS o32 binaries
is not built in to a 64bit kernel and the root filesystem is o32 ABI.

Catch this by adding a guard to search_binary_handler(). If there is no
binary format handler available to load an exectuable, and the
executable matches modprobe_path, i.e. the userspace helper that would
be executed to load a module, then do not attempt to load the module
since it will just end up here again when it fails to execute. This
actually improves the original behaviour since the "runaway loop"
warning is no longer printed, and we simply get:

Starting init:/sbin/init exists but couldn't execute it (error -8)

Fixes: 6d7964a722af ("kmod: throttle kmod thread limit")
Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

What we really need to detect is that exec'ing modprobe failed, but
currently it does not get as far as an actual error since it just ends
up stuck waiting for the modprobes to complete, which they never will.
Open to suggestions of a different / better way to fix this.

Thanks,
Matt

---
 fs/exec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/exec.c b/fs/exec.c
index 62175cbcc801..004bb50a01fe 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1644,6 +1644,9 @@ int search_binary_handler(struct linux_binprm *bprm)
 		if (printable(bprm->buf[0]) && printable(bprm->buf[1]) &&
 		    printable(bprm->buf[2]) && printable(bprm->buf[3]))
 			return retval;
+		/* Game over if we need to load a module to execute modprobe */
+		if (strcmp(bprm->filename, modprobe_path) == 0)
+			return retval;
 		if (request_module("binfmt-%04x", *(ushort *)(bprm->buf + 2)) < 0)
 			return retval;
 		need_retry = false;
-- 
2.7.4
