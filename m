Received: from mailapp01.imgtec.com ([195.59.15.196]:61561 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026158AbbD0OHjN8PSV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 27 Apr 2015 16:07:39 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 1/4] MIPS: Fix KVM guest fixmap address
Date: Mon, 27 Apr 2015 15:07:16 +0100
Message-ID: <1430143639-22580-2-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1430143639-22580-1-git-send-email-james.hogan@imgtec.com>
References: <1430143639-22580-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, stable@vger.kernel.org
Message-ID: <20150427140716.lYwmkuVl3Gs-xpltlGS7vNaquU9uZgCju8k8m9ZSDd0@z>

KVM guest kernels for trap & emulate run in user mode, with a modified
set of kernel memory segments. However the fixmap address is still in
the normal KSeg3 region at 0xfffe0000 regardless, causing problems when
cache alias handling makes use of them when handling copy on write.

Therefore define FIXADDR_TOP as 0x7ffe0000 in the guest kernel mapped
region when CONFIG_KVM_GUEST is defined.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org> # v3.10+
---
 arch/mips/include/asm/mach-generic/spaces.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/include/asm/mach-generic/spaces.h b/arch/mips/include/asm/mach-generic/spaces.h
index 9488fa5f8866..afc96ecb9004 100644
--- a/arch/mips/include/asm/mach-generic/spaces.h
+++ b/arch/mips/include/asm/mach-generic/spaces.h
@@ -94,7 +94,11 @@
 #endif
 
 #ifndef FIXADDR_TOP
+#ifdef CONFIG_KVM_GUEST
+#define FIXADDR_TOP		((unsigned long)(long)(int)0x7ffe0000)
+#else
 #define FIXADDR_TOP		((unsigned long)(long)(int)0xfffe0000)
 #endif
+#endif
 
 #endif /* __ASM_MACH_GENERIC_SPACES_H */
-- 
2.0.5
