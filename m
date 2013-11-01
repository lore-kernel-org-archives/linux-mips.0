Received: from relay1.mentorg.com ([192.94.38.131]:43545 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6822679Ab3KAXrWTIWBh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 2 Nov 2013 00:47:22 +0100
Date: Fri, 1 Nov 2013 23:47:05 +0000
From: "Maciej W. Rozycki" <macro@codesourcery.com>
Subject: [PATCH] MIPS: Random whitespace clean-ups
Message-ID: <alpine.DEB.1.10.1311012342550.12843@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej_Rozycki@mentor.com>
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
Cc: linux-mips@linux-mips.org
Message-ID: <20131101234705.XNjsTzR3rft6bmgvqvse4Vf6dnh3eSr4ZfxEFx3ik1k@z>

Another whitespace clean-up, this removes tabs from between sentences in 
some comments.

Signed-off-by: Maciej W. Rozycki <macro@codesourcery.com>
---
linux-space.diff
Index: linux/arch/mips/include/asm/addrspace.h
===================================================================
--- linux.orig/arch/mips/include/asm/addrspace.h
+++ linux/arch/mips/include/asm/addrspace.h
@@ -58,7 +58,7 @@
 
 /*
  * Memory segments (64bit kernel mode addresses)
- * The compatibility segments use the full 64-bit sign extended value.	Note
+ * The compatibility segments use the full 64-bit sign extended value.  Note
  * the R8000 doesn't have them so don't reference these in generic MIPS code.
  */
 #define XKUSEG			_CONST64_(0x0000000000000000)
@@ -131,7 +131,7 @@
 
 /*
  * The ultimate limited of the 64-bit MIPS architecture:  2 bits for selecting
- * the region, 3 bits for the CCA mode.	 This leaves 59 bits of which the
+ * the region, 3 bits for the CCA mode.  This leaves 59 bits of which the
  * R8000 implements most with its 48-bit physical address space.
  */
 #define TO_PHYS_MASK	_CONST64_(0x07ffffffffffffff)	/* 2^^59 - 1 */
Index: linux/arch/mips/include/asm/atomic.h
===================================================================
--- linux.orig/arch/mips/include/asm/atomic.h
+++ linux/arch/mips/include/asm/atomic.h
@@ -1,5 +1,5 @@
 /*
- * Atomic operations that C can't guarantee us.	 Useful for
+ * Atomic operations that C can't guarantee us.  Useful for
  * resource counting etc..
  *
  * But use these as seldom as possible since they are much more slower
Index: linux/arch/mips/include/asm/barrier.h
===================================================================
--- linux.orig/arch/mips/include/asm/barrier.h
+++ linux/arch/mips/include/asm/barrier.h
@@ -18,7 +18,7 @@
  * over this barrier.  All reads preceding this primitive are guaranteed
  * to access memory (but not necessarily other CPUs' caches) before any
  * reads following this primitive that depend on the data return by
- * any of the preceding reads.	This primitive is much lighter weight than
+ * any of the preceding reads.  This primitive is much lighter weight than
  * rmb() on most CPUs, and is never heavier weight than is
  * rmb().
  *
@@ -43,7 +43,7 @@
  * </programlisting>
  *
  * because the read of "*q" depends on the read of "p" and these
- * two reads are separated by a read_barrier_depends().	 However,
+ * two reads are separated by a read_barrier_depends().  However,
  * the following code, with the same initial values for "a" and "b":
  *
  * <programlisting>
@@ -57,7 +57,7 @@
  * </programlisting>
  *
  * does not enforce ordering, since there is no data dependency between
- * the read of "a" and the read of "b".	 Therefore, on some CPUs, such
+ * the read of "a" and the read of "b".  Therefore, on some CPUs, such
  * as Alpha, "y" could be set to 3 and "x" to 0.  Use rmb()
  * in cases like this where there are no data dependencies.
  */
