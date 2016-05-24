Received: from mailapp01.imgtec.com ([195.59.15.196]:45945 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27033565AbcEXIfbLso2X (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 May 2016 10:35:31 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 2/2] MIPS: Build microMIPS VDSO for microMIPS kernels
Date: Tue, 24 May 2016 09:35:11 +0100
Message-ID: <1464078911-21468-3-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1464078911-21468-1-git-send-email-james.hogan@imgtec.com>
References: <1464078911-21468-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20160524083511.nZGGYiCQitI04RFEyr5gj4UMnv3JKV0pCUVrbJzuXVE@z>

MicroMIPS kernels may be expected to run on microMIPS only cores which
don't support the normal MIPS instruction set, so be sure to pass the
-mmicromips flag through to the VDSO cflags.

Fixes: ebb5e78cc634 ("MIPS: Initial implementation of a VDSO")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org> # 4.4.x-
---
 arch/mips/vdso/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index b369509e9753..a5ec3e5274c4 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -5,6 +5,7 @@ obj-vdso-y := elf.o gettimeofday.o sigreturn.o
 ccflags-vdso := \
 	$(filter -I%,$(KBUILD_CFLAGS)) \
 	$(filter -E%,$(KBUILD_CFLAGS)) \
+	$(filter -mmicromips,$(KBUILD_CFLAGS)) \
 	$(filter -march=%,$(KBUILD_CFLAGS))
 cflags-vdso := $(ccflags-vdso) \
 	$(filter -W%,$(filter-out -Wa$(comma)%,$(KBUILD_CFLAGS))) \
-- 
2.4.10
