Received: from mail-pb0-f49.google.com ([209.85.160.49]:63013 "EHLO
        mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6829664Ab2K3CDYpIlDZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 30 Nov 2012 03:03:24 +0100
Received: by mail-pb0-f49.google.com with SMTP id un15so60007pbc.36
        for <linux-mips@linux-mips.org>; Thu, 29 Nov 2012 18:03:15 -0800 (PST)
Subject: Patch "MPI: Fix compilation on MIPS with GCC 4.4 and newer" has been added to the 3.4-stable tree
From: <gregkh@linuxfoundation.org>
Date: Thu, 29 Nov 2012 18:03:03 -0800
Message-ID: <13542409833804@kroah.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ASCII
Content-Transfer-Encoding: 8bit
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
To: manuel.lauss@gmail.com, dmitry.kasatkin@intel.com, gregkh@linuxfoundation.org, jmorris@namei.org, linux-mips@linux-mips.org, ralf@linux-mips.org, shuah.khan@hp.com
Cc: stable@vger.kernel.org, stable-commits@vger.kernel.org
Message-ID: <20121130020303.75s06ZO3z-G_xFvJB6fTFX5ElT1y6NsbLvjhxQ1rNK4@z>


This is a note to let you know that I've just added the patch titled

    MPI: Fix compilation on MIPS with GCC 4.4 and newer

to the 3.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mpi-fix-compilation-on-mips-with-gcc-4.4-and-newer.patch
and it can be found in the queue-3.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From a3cea9894157c20a5b1ec08b7e0b5f2019740c10 Mon Sep 17 00:00:00 2001
From: Manuel Lauss <manuel.lauss@gmail.com>
Date: Thu, 22 Nov 2012 11:58:22 +0100
Subject: MPI: Fix compilation on MIPS with GCC 4.4 and newer

From: Manuel Lauss <manuel.lauss@gmail.com>

commit a3cea9894157c20a5b1ec08b7e0b5f2019740c10 upstream.

Since 4.4 GCC on MIPS no longer recognizes the "h" constraint,
leading to this build failure:

  CC      lib/mpi/generic_mpih-mul1.o
lib/mpi/generic_mpih-mul1.c: In function 'mpihelp_mul_1':
lib/mpi/generic_mpih-mul1.c:50:3: error: impossible constraint in 'asm'

This patch updates MPI with the latest umul_ppm implementations for MIPS.

Signed-off-by: Manuel Lauss <manuel.lauss@gmail.com>
Cc: Linux-MIPS <linux-mips@linux-mips.org>
Cc: Dmitry Kasatkin <dmitry.kasatkin@intel.com>
Cc: James Morris <jmorris@namei.org>
Patchwork: https://patchwork.linux-mips.org/patch/4612/
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Cc: Shuah Khan <shuah.khan@hp.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 lib/mpi/longlong.h |   19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

--- a/lib/mpi/longlong.h
+++ b/lib/mpi/longlong.h
@@ -703,7 +703,14 @@ do { \
 	**************  MIPS  *****************
 	***************************************/
 #if defined(__mips__) && W_TYPE_SIZE == 32
-#if __GNUC__ > 2 || __GNUC_MINOR__ >= 7
+#if __GNUC__ >= 4 && __GNUC_MINOR__ >= 4
+#define umul_ppmm(w1, w0, u, v)			\
+do {						\
+	UDItype __ll = (UDItype)(u) * (v);	\
+	w1 = __ll >> 32;			\
+	w0 = __ll;				\
+} while (0)
+#elif __GNUC__ > 2 || __GNUC_MINOR__ >= 7
 #define umul_ppmm(w1, w0, u, v) \
 	__asm__ ("multu %2,%3" \
 	: "=l" ((USItype)(w0)), \
@@ -728,7 +735,15 @@ do { \
 	**************  MIPS/64  **************
 	***************************************/
 #if (defined(__mips) && __mips >= 3) && W_TYPE_SIZE == 64
-#if __GNUC__ > 2 || __GNUC_MINOR__ >= 7
+#if __GNUC__ >= 4 && __GNUC_MINOR__ >= 4
+#define umul_ppmm(w1, w0, u, v) \
+do {									\
+	typedef unsigned int __ll_UTItype __attribute__((mode(TI)));	\
+	__ll_UTItype __ll = (__ll_UTItype)(u) * (v);			\
+	w1 = __ll >> 64;						\
+	w0 = __ll;							\
+} while (0)
+#elif __GNUC__ > 2 || __GNUC_MINOR__ >= 7
 #define umul_ppmm(w1, w0, u, v) \
 	__asm__ ("dmultu %2,%3" \
 	: "=l" ((UDItype)(w0)), \


Patches currently in stable-queue which might be from manuel.lauss@gmail.com are

queue-3.4/mpi-fix-compilation-on-mips-with-gcc-4.4-and-newer.patch
