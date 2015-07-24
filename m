Received: from mailapp01.imgtec.com ([195.59.15.196]:45077 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009989AbbGXPQ11UsgG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 24 Jul 2015 17:16:27 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 8A47F7A2A9CD5
        for <linux-mips@linux-mips.org>; Fri, 24 Jul 2015 16:16:18 +0100 (IST)
From: Alex Smith <alex.smith@imgtec.com>
Subject: [PATCH 1/3] MIPS: Fix definition of pgprot_writecombine()
Date: Fri, 24 Jul 2015 16:16:10 +0100
Message-ID: <1437750972-3659-1-git-send-email-alex.smith@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Alex.Smith@imgtec.com>
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
Cc: Alex Smith <alex.smith@imgtec.com>
Message-ID: <20150724151610.BFZ7mQ39GG__v88bbtwLvaWBzc0Cd2M9ltrZbtB8Yk8@z>

If pgprot_writecombine is not #defined, asm-generic/pgtable.h will try
to provide a default implementation by #defining it to pgprot_noncached.
However our implementation is an inline function rather than a #define,
so it was never actually used because of the #define in generic code.

Add "#define pgprot_writecombine pgprot_writecombine" to prevent generic
code from re-defining it.

Signed-off-by: Alex Smith <alex.smith@imgtec.com>
---
 arch/mips/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 9d8106758142..4668e798a857 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -362,6 +362,8 @@ static inline pgprot_t pgprot_noncached(pgprot_t _prot)
 	return __pgprot(prot);
 }
 
+#define pgprot_writecombine pgprot_writecombine
+
 static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
 {
 	unsigned long prot = pgprot_val(_prot);
-- 
2.4.6
