Received: from mx1.redhat.com ([209.132.183.28]:22346 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6834888Ab3CSPA7nR5s5 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 19 Mar 2013 16:00:59 +0100
Subject: [PATCH] Fix breakage in MIPS siginfo handling
From: David Howells <dhowells@redhat.com>
Date: Tue, 19 Mar 2013 15:00:53 +0000
Message-ID: <20130319150053.32135.61438.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Return-Path: <linux-mips-bounce@linux-mips.org>
To: viro@ZenIV.linux.org.uk
Cc: linux-mips@linux-mips.org, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20130319150053.pjs6eD3MP0MWtIsGaQXbiD3l1mhctn70YC-4--EZbhY@z>

MIPS's siginfo handling has been broken since this commit:

	commit 574c4866e33d648520a8bd5bf6f573ea6e554e88
	Author: Al Viro <viro@zeniv.linux.org.uk>
	Date:   Sun Nov 25 22:24:19 2012 -0500
	consolidate kernel-side struct sigaction declarations

for 64-bit BE MIPS CPUs.

The UAPI variant looks like this:

	struct sigaction {
		unsigned int	sa_flags;
		__sighandler_t	sa_handler;
		sigset_t	sa_mask;
	};

but the core kernel's variant looks like this:

	struct sigaction {
	#ifndef __ARCH_HAS_ODD_SIGACTION
		__sighandler_t	sa_handler;
		unsigned long	sa_flags;
	#else
		unsigned long	sa_flags;
		__sighandler_t	sa_handler;
	#endif
	#ifdef __ARCH_HAS_SA_RESTORER
		__sigrestore_t sa_restorer;
	#endif
		sigset_t	sa_mask;
	};

The problem is that sa_flags has been changed from an unsigned int to an
unsigned long.

Fix this by making sa_flags unsigned int if __ARCH_HAS_ODD_SIGACTION is
defined.

Whilst we're at it, rename __ARCH_HAS_ODD_SIGACTION to
__ARCH_HAS_IRIX_SIGACTION.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Al Viro <viro@ZenIV.linux.org.uk>
cc: Ralf Baechle <ralf@linux-mips.org>
cc: linux-mips@linux-mips.org
cc: stable@vger.kernel.org
---

 arch/mips/include/asm/signal.h |    2 +-
 include/linux/compat.h         |    4 ++--
 include/linux/signal.h         |    4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/signal.h b/arch/mips/include/asm/signal.h
index 197f636..8efe5a9 100644
--- a/arch/mips/include/asm/signal.h
+++ b/arch/mips/include/asm/signal.h
@@ -21,6 +21,6 @@
 #include <asm/sigcontext.h>
 #include <asm/siginfo.h>
 
-#define __ARCH_HAS_ODD_SIGACTION
+#define __ARCH_HAS_IRIX_SIGACTION
 
 #endif /* _ASM_SIGNAL_H */
diff --git a/include/linux/compat.h b/include/linux/compat.h
index 76a87fb..377cd8c 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -141,11 +141,11 @@ typedef struct {
 } compat_sigset_t;
 
 struct compat_sigaction {
-#ifndef __ARCH_HAS_ODD_SIGACTION
+#ifndef __ARCH_HAS_IRIX_SIGACTION
 	compat_uptr_t			sa_handler;
 	compat_ulong_t			sa_flags;
 #else
-	compat_ulong_t			sa_flags;
+	compat_uint_t			sa_flags;
 	compat_uptr_t			sa_handler;
 #endif
 #ifdef __ARCH_HAS_SA_RESTORER
diff --git a/include/linux/signal.h b/include/linux/signal.h
index a2dcb94..9475c5c 100644
--- a/include/linux/signal.h
+++ b/include/linux/signal.h
@@ -250,11 +250,11 @@ extern int show_unhandled_signals;
 extern int sigsuspend(sigset_t *);
 
 struct sigaction {
-#ifndef __ARCH_HAS_ODD_SIGACTION
+#ifndef __ARCH_HAS_IRIX_SIGACTION
 	__sighandler_t	sa_handler;
 	unsigned long	sa_flags;
 #else
-	unsigned long	sa_flags;
+	unsigned int	sa_flags;
 	__sighandler_t	sa_handler;
 #endif
 #ifdef __ARCH_HAS_SA_RESTORER
