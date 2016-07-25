Received: from mailapp01.imgtec.com ([195.59.15.196]:11959 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992170AbcGYQAXy9rXE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 25 Jul 2016 18:00:23 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 1/5] MIPS: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
Date: Mon, 25 Jul 2016 16:59:50 +0100
Message-ID: <1469462394-8970-2-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1469462394-8970-1-git-send-email-james.hogan@imgtec.com>
References: <1469462394-8970-1-git-send-email-james.hogan@imgtec.com>
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
To: linux-arch@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20160725155950.p_VWde3zvUkHdCJ66DqIhBV1MJKUC2qNwOnMjx5FqiU@z>

AT_VECTOR_SIZE_ARCH should be defined with the maximum number of
NEW_AUX_ENT entries that ARCH_DLINFO can contain, but it wasn't defined
for MIPS at all even though ARCH_DLINFO will contain one NEW_AUX_ENT for
the VDSO address.

This shouldn't be a problem as AT_VECTOR_SIZE_BASE includes space for
AT_BASE_PLATFORM which MIPS doesn't use, but lets define it now and add
the comment above ARCH_DLINFO as found in several other architectures to
remind future modifiers of ARCH_DLINFO to keep AT_VECTOR_SIZE_ARCH up to
date.

Fixes: ebb5e78cc634 ("MIPS: Initial implementation of a VDSO")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/include/asm/elf.h         | 1 +
 arch/mips/include/uapi/asm/auxvec.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/mips/include/asm/elf.h b/arch/mips/include/asm/elf.h
index f5f45717968e..ede8c4ff56f7 100644
--- a/arch/mips/include/asm/elf.h
+++ b/arch/mips/include/asm/elf.h
@@ -458,6 +458,7 @@ extern const char *__elf_platform;
 #define ELF_ET_DYN_BASE		(TASK_SIZE / 3 * 2)
 #endif
 
+/* update AT_VECTOR_SIZE_ARCH if the number of NEW_AUX_ENT entries changes */
 #define ARCH_DLINFO							\
 do {									\
 	NEW_AUX_ENT(AT_SYSINFO_EHDR,					\
diff --git a/arch/mips/include/uapi/asm/auxvec.h b/arch/mips/include/uapi/asm/auxvec.h
index c9c7195272c4..45ba259a3618 100644
--- a/arch/mips/include/uapi/asm/auxvec.h
+++ b/arch/mips/include/uapi/asm/auxvec.h
@@ -14,4 +14,6 @@
 /* Location of VDSO image. */
 #define AT_SYSINFO_EHDR		33
 
+#define AT_VECTOR_SIZE_ARCH 1 /* entries in ARCH_DLINFO */
+
 #endif /* __ASM_AUXVEC_H */
-- 
2.4.10
