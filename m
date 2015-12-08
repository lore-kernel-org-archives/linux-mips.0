Received: from mailapp01.imgtec.com ([195.59.15.196]:26261 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006859AbbLHKMErPtB2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Dec 2015 11:12:04 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH] MIPS: VDSO: Fix build error
Date: Tue, 8 Dec 2015 10:11:43 +0000
Message-ID: <1449569503-1611-1-git-send-email-qais.yousef@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Qais.Yousef@imgtec.com>
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
Cc: alex@alex-smith.me.uk, linux-kernel@vger.kernel.org, ralf@linux-mips.org, Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <20151208101143.9RJ1ZTOwHR3GaCRCMBnkOhrcq37V_hq4Ws6i6OoNiGg@z>

Commit ebb5e78cc634 (MIPS: Initial implementation of a VDSO) introduced a build
error.

For MIPS VDSO to be compiled it requires binutils version 2.25 or above but the
check in the Makefile had inverted logic causing it to be compiled in if binutils
is below 2.25.

This fixes the following compilation error:

CC      arch/mips/vdso/gettimeofday.o
/tmp/ccsExcUd.s: Assembler messages:
/tmp/ccsExcUd.s:62: Error: can't resolve `_start' {*UND* section} - `L0' {.text section}
/tmp/ccsExcUd.s:467: Error: can't resolve `_start' {*UND* section} - `L0' {.text section}
make[2]: *** [arch/mips/vdso/gettimeofday.o] Error 1
make[1]: *** [arch/mips/vdso] Error 2
make: *** [arch/mips] Error 2

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 arch/mips/vdso/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index ef5f348f386a..018f8c7b94f2 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -26,8 +26,8 @@ aflags-vdso := $(ccflags-vdso) \
 # the comments on that file.
 #
 ifndef CONFIG_CPU_MIPSR6
-  ifeq ($(call ld-ifversion, -gt, 22400000, y),)
-    $(warning MIPS VDSO requires binutils > 2.24)
+  ifeq ($(call ld-ifversion, -lt, 22500000, y),)
+    $(warning MIPS VDSO requires binutils >= 2.25)
     obj-vdso-y := $(filter-out gettimeofday.o, $(obj-vdso-y))
     ccflags-vdso += -DDISABLE_MIPS_VDSO
   endif
-- 
2.1.0
